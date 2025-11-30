
# push back to `generated` to repo
# https://joht.github.io/johtizen/build/2022/01/20/github-actions-push-into-repository.html#example-1
# - name: GIT commit and push docs
#   env: 
#     CI_COMMIT_MESSAGE: Continuous Integration Build Artifacts
#     CI_COMMIT_AUTHOR: Continuous Integration
#   run: |
#     git config --global user.name "${{ env.CI_COMMIT_AUTHOR }}"
#     git config --global user.email "username@users.noreply.github.com"
#     git add generated
#     git commit -m "${{ env.CI_COMMIT_MESSAGE }}"
#     git push

myfun() = abspath(@__DIR__,"..")

"recursively search a directory tree for match"
function rdir(dir::AbstractString, pat::Glob.FilenameMatch)
    result = String[]
    for (root, dirs, files) in walkdir(dir)
        append!(result, filter!(f -> occursin(pat, f), joinpath.(root, files)))     
    end
    return result
end
rdir(dir::AbstractString, pat::AbstractString) = rdir(dir, Glob.FilenameMatch(pat,"i"))

"Find one specific file in the tree"
function findfile(directory, file; casesensitive = true) 
    if casesensitive
        [joinpath(root, file) for (root, dirs, files) in walkdir(directory) if file in files]
    else
        [joinpath(root, file) for (root, dirs, files) in walkdir(directory) if file in lowercase.(files)]
    end
end

"""
    classify_files(pkg_path::String,kind::String)

* `pkg_path`: path to (extracted) replication package
* `kind`: what kind of classification is desired: `code`, `data`, `docs`

count how many files belong to each of code,data,documentation according to their file ending.

outputs `txt` files into folder `generated/` which will be created inside the repository.
"""
function classify_files(pkg_path::String,kind::String,fp::String; relpath = false)

     # write to `generated`
     mkpath(fp)

    sensitivenames = []
    nonsensitivenames = []
    files = []

    if kind == "code"
        extensions = ["ado","do","r","rmd","qmd","ox","m","py","nb","ipynb","sas","jl","f","f90","c","c++","sh","toml","yaml","yml","fs","fsx","tex","typst"]
        
        outfile = joinpath(fp,"program-files.txt")

        sensitivenames = ["Makefile"]

    elseif kind == "data"
        extensions = ["gpkg","dat","dta","rda","rds","rdata","ods","xls","xlsx","mat","csv","","txt","shp","xml","prj","dbf","sav","pkl","jld","jld2","gz","sas7bdat","rar","zip","7z","tar","tgz","bz2","xz"]

        outfile = joinpath(fp,"data-files.md")

    elseif kind == "docs"

        extensions = ["pdf","md","docx","doc","pages"]

        # nonsensitivenames = ["readme.md","readme.docx","readme.pdf"]

        outfile = joinpath(fp,"documentation-files.txt")

    else 
        error("kind not found: choose `code`, `data`, `docs`")
    end

    open(outfile, "w") do io

        for e in extensions
            s = rdir(pkg_path,"*.$e")
            if length(s) > 0
                for ss in s
                    println(io, ss)

                    push!(files,ss)
                end
            end
        end
        for fu in sensitivenames
            s = findfile(pkg_path,fu)
            if length(s) > 0
                for ss in s
                    println(io, ss)
                    push!(files,ss)
                end
            end
        end
        for fu in nonsensitivenames
            s = findfile(pkg_path,lowercase(fu),casesensitive = false)
            if length(s) > 0
                for ss in s
                    println(io, ss)
                    push!(files,ss)
                end
            end
        end
    end
    return files
end

# Detects all relevant patterns in a line
function detect_path_kinds(line::String)
    windows = is_windows_filepath(line)
    unix = is_unix_filepath(line)
    drive_letter = occursin(r"[A-Z]:\\\\*", line)
    return (windows, unix, drive_letter)
end

"Find a Windows filepath, omitting various comment and command strings"
function is_windows_filepath(line::String)
    # find all patterns like : this\is\123\a\path-yes\1t\is
    # but not 
    # \cmd{ (latex command)
    # a \ b  (right division operator)
    # compute \int 
    # https://stackoverflow.com/a/31976060/1168848
    pat = r"^(?=.*[\w\-:]\\[\w\-]|.*[\w\-:]\\\\[\w\-])(?:(?!\\\w+{|^\\\w+ |\\\w+ | \\\w+ |[a-zA-Z] \\ [a-zA-Z]|[\<\>\|\?\*]|//).)*$"
    contains(line,pat)
end

"Find a Unix filepath, omitting various comment and command strings"
function is_unix_filepath(line::String)
    # find all patterns like : here/we/have/a_/1234/unix-1/path
    # but not 
    # // or /* or */ (stata and C comments)
    # a / b  (left division operator in various forms)
    pat = r"^(?=.*[\w/-]/[\w/-])(?:(?!//|/\*|\*/|[\<\>\"\|\?\*]|\w / \w).)*$"
    contains(line,pat)
end


# PII checker strings
pii_strings_names() = join(["name", "fname", "lname", "first_name", "last_name"],"|")
pii_strings_dates() = join(["birth", "birthday", "bday", "dob"],"|")
pii_strings_locations() = join([
    "district",    "city",    "country",    "subcountry",    "parish",    "loc",    "street",    "village",    "community",    "address",    "gps",    "degree",    "minute",    "second",    "lat",    "lon",    "coord",    "location",    "house",    "compound",    "panchayat",    "territory",    "municipality",    "precinct",    "block",    "zipcode",    "zip"],"|")
pii_strings_other() = join([
    "school",    "social",    "network",    "census",    "gender",    "sex",    "fax",    "email",    "url",    "child",    "beneficiary",    "mother",    "wife",    "father",    "husband",    "phone",    "spouse",    "daughter",    "son"], "|")


# Process each file and categorize
"read each line of code and analyze. looking for file paths and hardcoded numeric constants"
function check_file_paths(filepath)
    lines = String[]
    hardcodes = String[]
    has_windows = false
    has_unix = false
    has_drive = false
    pii_names = String[]
    pii_dates = String[]
    pii_locations = String[]
    pii_other = String[]

    try
        open(filepath, "r") do io
            for (i, line) in enumerate(eachline(io))
                windows, unix, drive = detect_path_kinds(line)
                if windows || unix
                    whichone = if windows & !unix
                            "windows"
                        elseif !windows & unix
                            "unix"
                        elseif windows & unix
                            "mixed"
                        end
                    push!(lines, @sprintf("Line %d, %s : %s",i, whichone, strip(line)))
                end
                has_windows |= windows
                has_unix |= unix
                has_drive |= drive

                if contains(line, hardcode_regex())
                    push!(hardcodes, @sprintf("Line %d, : %s",i,strip(line)))
                end
                if contains(line, Regex("$(pii_strings_other())","i"))
                    push!(pii_other,@sprintf("Line %d, : %s",i,strip(line)))
                end
                if contains(line, Regex("$(pii_strings_names())","i"))
                    push!(pii_names,@sprintf("Line %d, : %s",i,strip(line)))
                end
                if contains(line, Regex("$(pii_strings_dates())","i"))
                    push!(pii_dates,@sprintf("Line %d, : %s",i,strip(line)))
                end
                if contains(line, Regex("$(pii_strings_locations())","i"))
                    push!(pii_locations,@sprintf("Line %d, : %s",i,strip(line)))
                end
            end
        end
    catch e
        push!(lines, "⚠️ Error reading file: $e")
    end

    classification = if has_windows && has_unix
        "mixed"
    elseif has_windows
        "windows"
    elseif has_unix
        "unix"
    else
        "none"
    end

    # collate all piis
    piis = [pii_names...,pii_dates...,pii_locations...,pii_other...]

    # pii = Dict(
    #     :names => pii_names,
    #     :dates => pii_dates,
    #     :locations => pii_locations,
    #     :other => pii_other
    # )

    return (lines, classification, has_drive, hardcodes,piis)
end


hardcode_regex() = r"\d{1,10}\.\d{3,10}"

"""
Takes an array of file paths, reads each associated file and checks its content for the existence of file paths of various kinds: windows `C:\\file\\paths\\like\\this` or unix `/paths/like/that`. Also searches for numeric constants which could be hardcoded results.

Outputs three markdown files into `generated/` with partial reports.
"""
function file_paths(files::Array,fp::String)
    
    isdir(fp) || error("execute `get_program_files()` first")

    # program_list_file = joinpath(fp,"program-files.txt")
    output_file = joinpath(fp,"report-file-paths.md")

    # run
    results = Dict{String, Vector{String}}()
    hardcodes = Dict{String, Vector{String}}()
    piis = Dict{String, Vector{String}}()
    stats = Dict("windows" => 0, "unix" => 0, "mixed" => 0, "drive" => 0)

    for file in files
        file = strip(file)
        lines, classification, has_drive, hardcoded, pii = check_file_paths(file)
        if !isempty(lines)
            results[file] = lines
        end
        if !isempty(hardcoded)
            hardcodes[file] = hardcoded
        end
        if !isempty(pii)
            piis[file] = pii
        end
        if classification != "none"
            stats[classification] += 1
        end
        if has_drive
            stats["drive"] += 1
        end

    end

    total_files = length(files)
    # return results, stats

    # Write report
    open(output_file, "w") do io
        println(io, "### File Paths Report\n")

        println(io, "_Generated on $(Dates.now())_\n")

        println(io, 
        """
        **Warning**: Our search on file path types is imperfect and incurs both type 1 and type 2 errors. We aim to strike a reasonable balance between both. The below table is therefore only indicative. Detailed listings can be found in the appendix to this report.
        
        In this table we analyse all files which contain source code (not data and documentation), and we report the grand total of each type of filepath we encountered. 
        
        Please check and replace any `windows` filepaths with unix compliant paths, insofar as this is possible in your setup. (Notice that `STATA` allows `/` to be a filepath separator on a windows platform, hence this is a requirement for *all* `STATA` applications.)
        
        
        """)

        println(io, "| Files Analyzed | Windows Paths | Unix Paths | Mixed Paths | Drive Letters (`C:\\` etc) |")
        println(io, "|-------------|---------------------|------------------|-------------------|----------------------|")
        println(io, @sprintf("| %d | %d | %d | %d | %d |\n",
            total_files,
            stats["windows"],
            stats["unix"],
            stats["mixed"],
            stats["drive"]
        ))
    end

    splitat = basename(dirname(fp))

    open(joinpath(fp,"report-file-paths-detail.md"),"w") do io
        println(io, "## Filepaths Analysis Details\n")

        if isempty(results)
            println(io, "No file paths found.")
        else
            for (file, lines) in results
                println(io, "**$(path_splitter(file,splitat))**\n")
                for l in lines
                    println(io, "- ", l)
                end
                println(io)
            end
        end
    end

    open(joinpath(fp,"report-hardcoded-numbers.md"),"w") do io
        println(io, "## Potentially Hardcoded Numeric Constants\n")

        if isempty(hardcodes)
            println(io, "✅ No hardcoded numeric constants found.")
        else
            println(io,"\nWe found the following set of hard coded numbers. This may be completely legitimate (parameter input, thresholds for computations, etc), and is hence only for information.\n")
            for (file, lines) in hardcodes
                println(io, "**$(path_splitter(file,splitat))**\n")
                for l in lines
                    println(io, "- ", l)
                end
                println(io)
            end
        end
    end

    open(joinpath(fp,"report-pii.md"),"w") do io
        println(io, "## Potential Personal Identifiable Information (PII)\n")

        if isempty(piis)
            println(io, "✅ No PII found.")
        else
            println(io,"\nWe found the following instances of potentially personally identifying information. This may be completely legitimate but might be worth checking. *As a reminder, privacy legislation in many countries (e.g. GDPR in EU) prohibits the dissemination of personal identifiable information without prior (and documented) consent of individuals.* If indeed you want to publish such information with your replication package, you should probably have obtained IRB approval for this - please check!\n")
            for (file, lines) in piis
                println(io, "**$(path_splitter(file,splitat))**\n")
                for l in lines
                    println(io, "- ", l)
                end
                println(io)
            end
        end
    end

    nothing
end

path_splitter(path::String,at) = split(path, at, limit = 2)[end]

"Read entire package content and tabulate file sizes with file hash to check for duplicates"
function generate_file_sizes_md5(folder_path::String, output_path::String; large_size = 100)


    table = DataFrame(name = [],name_slug = [],  size = [], sizeMB = [], checksum= [])

    # count and analyze all files
    for (root, _, files) in walkdir(folder_path)
        for file in files
            name = file
            file_path = joinpath(root, file)
            short_path = path_splitter(file_path,basename(folder_path))
            file_size = filesize(file_path)
            size_mb = file_size / 1024^2  # Convert bytes to megabytes
            md5_checksum =  open(file_path,"r") do fio
                bytes2hex(sha1(fio))
            end
            push!(table, (name_slug = name, name = short_path, size = file_size, sizeMB = size_mb, checksum = md5_checksum))
        end
    end
    sort!(table, [:size])

    duplicates = nrow(table) - length(unique(table.checksum))
    zeross = sum(table.size .== 0)
    largefs = sum(table.sizeMB .>= large_size)
    
    open(joinpath(output_path,"report-file-sizes.md"), "w") do io

        println(io,"""
        ## File Size and Identity Report

        **Summary:**

        The package contains:

        * $(nrow(table)) files
        """)

        println(io, duplicates > 0 ? "* $(duplicates) Duplicate files" : "* $(duplicates) Duplicate files")
        println(io, largefs > 0 ? "* $(largefs) Files larger than $(large_size)MB" : "* No files larger than $(large_size)MB")
        println(io, zeross > 0 ? "* $(zeross) files of size 0Kb" : "* No zero sized (0Kb) files")


        # Write Markdown table header
        println(io,"\n")
        write(io, "| Filename | Size (MB) | Checksum (MD5) |\n")
        write(io, "|:---------|----------:|:--------------|\n")

        for ir in eachrow(table)
            write(io, "| $(ir.name) | $(round(ir.sizeMB, digits=2)) | $(ir.checksum) |\n")
        end
    end
    open(joinpath(output_path,"report-duplicates.md"), "w") do io

        println(io,"""
        ### Duplicate Files Report
        """)

        if duplicates > 0
            
            println(io, "We found the following duplicate files:\n")

            # Write Markdown table header
            write(io, "| Filename | Size (MB) | Checksum (MD5) |\n")
            write(io, "|:---------|----------:|:--------------|\n")
            for ir in eachrow(table[nonunique(table,:checksum),:])
                write(io, "| $(ir.name) | $(round(ir.sizeMB, digits=2)) | $(ir.checksum) |\n")
            end
        else
            println(io, "We did not find any duplicate files.")
        end
    end

    open(joinpath(output_path,"report-zero-files.md"), "w") do io

        println(io,"""
        ### Zero Size Files Report
        """)

        if zeross > 0
            println(io, "We found the following zero size files:\n")
            # Write Markdown table header
            write(io, "| Filename | Size (MB) | Checksum (MD5) |\n")
            write(io, "|:---------|----------:|:--------------|\n")
            for ir in eachrow(table[table.size .== 0,:])
                write(io, "| $(ir.name) | $(round(ir.size, digits=2)) | $(ir.checksum) |\n")
            end
        else
            println(io, "We did not find any zero sized files.\n")
        end
    end

    # table of large files
    

    open(joinpath(output_path,"report-large-files.md"), "w") do io
        println(io,"""
        ### Large Files Report
        """)
        if largefs > 0
            println(io, "We found the following files larger than $(large_size)MB:\n")

        
            @info "there are files larger than $large_size MB"
            # Write Markdown table header
            write(io, "| Filename | Size (MB)  |\n")
            write(io, "|:---------|----------:|\n")
            for ir in eachrow(table[table.sizeMB .> large_size,:])
                write(io, "| $(ir.name) | $(round(ir.sizeMB, digits=2))|\n")
            end
        else
            println(io, "We did not find any files larger than $(large_size)MB.\n")
        end
    end

    return table
end


"""
Read the README

Find the README in the package and read from either `.md` or `.pdf` format. Then produce a dictionary with the mention of interesting terms, like software used, whether confidential etc.
"""
function read_README(pkg_loc, fp::String)

    doclist = joinpath(fp,"documentation-files.txt")
    isfile(doclist) || error("the file $doclist must exist")

    searches = ["confidential", "proprietary", "not available", "restricted", "HPC", "intensive", "IPUMS", "LEHD", "Statistics Norway", "Census", "IRB", "FDZ", "IAB", "RDC", "Statistics Sweden", "CASD", "VisitINPS", "THEOPS", "experiment", "seed", "identifiable"]
    
    d0 = readlines(doclist)
    is_readmes = occursin.(r"README"i, d0)

    open(joinpath(fp,"report-readme.md"),"w") do io
        println(io, "### `README` Analysis\n")
        if length(d0) == 0 || !any(is_readmes)
            println(io,"🚨 **No `README` found!** 🚨")
            println(io,"The package **must** contain either `README.md` or `README.pdf`. This file needs to be placed at the root of your replication package. Please fix.")
        else
            # take first match
            d = first(d0[is_readmes])
            println(io, """
            👉 We are considering the file at 

            ```
            $d 
            ```
            to be the relevant `README`.\n
            """)

            if dirname(d) != pkg_loc
                println(io, 
                """**Wrong `README` location warning:**
                
                The `README`` file needs to be placed at the root of your replication package. **Please fix.**
                """)
            end

            println(io, """
            #### Keyword search

            👉 We searched the readme for keywords to help the reproducibility team. This is only for internal use. 

            _Replicator_: The line numbers refer to the readme file printed above.

            """)

            if contains(d, r".md"i) 
                open(d, "r") do jo 
                    for s in searches
                        for (i, line) in enumerate(eachline(jo))
                            if occursin(Regex(s,"i"),line)
                                println(io, @sprintf("Line %d : %s",i, strip(line)))
                            end
                        end
                    end
                end
            elseif contains(d, r".pdf"i) 
                tmpfile = joinpath(fp,"temp.txt")
                try
                    z = getPDFText(d,tmpfile)
                catch e
                    println(io,"README.PDF text extraction failed with error $e")
                    return 1
                end
                open(tmpfile, "r") do jo 
                    for (i, line) in enumerate(eachline(jo))
                        for s in searches
                            if occursin(Regex(s,"i"),line)
                                println(io, @sprintf("Line %d : %s",i, strip(line)))
                            end
                        end
                    end
                end
            end
        end
    end
    @info "pdf reader done."
end


## Testing functions

function make_test_paths()
    x = String[]
    push!(x,"replication-package/code/Oswald.jl/src/Oswald.jl")
    push!(x,"replication-package/code/Oswald.jl/Project.toml")
    push!(x,"replication-package/code/Oswald.jl/src/makefile")
    push!(x,raw"C:\Your\dummy\path\one")
    push!(x,raw"Your\dummy\path\two")
    push!(x,raw"D:\Your\dummy\path/with/mixed/separators")
    x
end

function delete_package()
    pkg = joinpath(root(),"replication-package")

    a = ask(DefaultPrompt(["y", "no"], 1, "This will delete the replication package. Sure?"))
    if a == "y"
        rm(pkg,recursive = true)
    end
end

function delete_generated()
    pkg = joinpath(root(),"generated")
    rm(pkg,recursive = true)
end



function create_example_package(at_root::String)

    pkg = joinpath(at_root,"replication-package")
    mkpath(pkg)
    
    mkpath(joinpath(pkg,"data"))
    mkpath(joinpath(pkg,"code"))
    mkpath(joinpath(pkg,"output"))
    

    # create data content
    ipath = joinpath(pkgdir(DataFrames), "docs", "src", "assets", "iris.csv")
    cp(ipath, joinpath(pkg,"data","iris.csv"), force = true)

    # create code content
    Pkg.generate(joinpath(pkg,"code","Oswald.jl"))

    # fill with more stuff
    open(joinpath(pkg,"code","Oswald.jl","src","code.jl"),"w") do io
        println(io, "func2() = raw\"my/file/path\\mixed\"")
        println(io, "func3() = raw\"C:\\my\\file\"")
        println(io, "func4() = 1 + 1 + 14")
    end
    open(joinpath(pkg,"code","Oswald.jl","src","code2.jl"),"w") do io
        println(io, "func4() = 1 + 1 + 14")
        println(io, "func4() = rand()")
        println(io, "func5() = raw\"X:\\my\"")
        println(io, "func6() = \"path/to/file\"")
        println(io, "func4() = 1 + 1 + 14")
    end

    open(joinpath(pkg,"code","Makefile"), "w") do io 
        println(io, "default:")
    end


    # create a readme
    open(joinpath(pkg,"README.md"), "w") do io
        println(io, "# Replication Package - TEST PACKAGE")
        println(io, "\nIn this package you will find code, data and output for the test package. Have fun! ✌️")
        println(io, "\nAs you can see, there is a lot of important info missing. Checkout [our readme](https://www.templatereadme.org) generator and our dedicated [website](https://jpedataeditor.github.io/) for more info.")
    end
    @info "done."

end


function test_package_path(j)
    if j == "ECTA"
        joinpath(ENV["DROPBOX_JPE"],"test-packages","ECTA","replication_package")
    elseif j == "QE"
        joinpath(ENV["DROPBOX_JPE"],"test-packages","QE","ReplicationPackage")
    elseif j == "AER"
        joinpath(ENV["DROPBOX_JPE"],"test-packages","AER","228401-V1")
    else
        error("one of ECTA, QE or AER. no other test package")
    end
end


"""
​```
    getPDFText(src, out) -> Dict 
​```
- src - Input PDF file path from where text is to be extracted
- out - Output TXT file path where the output will be written
return - A dictionary containing metadata of the document
"""
function getPDFText(src, out)
    # handle that can be used for subsequence operations on the document.
    doc = pdDocOpen(src)
    
    # Metadata extracted from the PDF document. 
    # This value is retained and returned as the return from the function. 
    docinfo = pdDocGetInfo(doc) 
    open(out, "w") do io
    
        # Returns number of pages in the document       
        npage = pdDocGetPageCount(doc)

        for i=1:npage
        
            # handle to the specific page given the number index. 
            page = pdDocGetPage(doc, i)
            
            # Extract text from the page and write it to the output file.
            pdPageExtractText(io, page)

        end
    end
    # Close the document handle. 
    # The doc handle should not be used after this call
    pdDocClose(doc)
    return docinfo
end

function runcloc()
    run(`cloc --md --quiet --out=generated/report-cloc.md $(package(which = "ECTA"))`)
end


"""
checks replication package in directory `pkg_loc`

It is assumed that `pkg_loc` is descendant in a directory structure of this kind, i.e. what is implemented in https://github.com/JPE-Reproducibility/JPEtemplate

in this example, `pkg_loc = abspath(replication-package)`

```
.
├── generated
├── images
├── LICENSE
├── replication-package
├── package-output-map.xlsx
├── README.md
└── TEMPLATE.qmd
```
"""
function precheck_package(pkg_loc::String)

    pkg_root = joinpath(pkg_loc,"..")
    @info "Starting precheck of package $(basename(pkg_root))"

    out = joinpath(pkg_root,"generated")
    mkpath(out)

    # make package manifest table
    @info "generate package manifest: all files, sizes, md5 hash"
    generate_file_sizes_md5(pkg_loc,out)

    # classify all files
    @info "Classify each file as code/data/docs"
    codefiles = classify_files(pkg_loc,"code",out)
    datafiles = classify_files(pkg_loc,"data",out)
    docsfiles = classify_files(pkg_loc,"docs",out)

    # run cloc to get line counts
    cloc = read(run(`cloc --md --quiet --out=$(joinpath(out,"report-cloc.md")) $pkg_loc`))
    @info "printing cloc output"

    open(joinpath(out,"report-cloc.md")) do IO
        for i in eachline(IO)
            println(i)
        end
    end

    # check file paths in code files
    @info "Parse code files and search for filepaths"
    file_paths(codefiles,out)

    # parse README
    @info "Read the README file"
    read_README( pkg_loc, out )

    @info "precheck done."

end