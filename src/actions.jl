




function run_prechecks(doi)   
 
    # then call dv_download_dataset(doi)
    # then run prechecks on code

end

function commit_generated()
        # then *not* commit data and other large items
    # but commit `generated`

end

function push_back()
    # push back to github repo
    # then alert the replicator!
end

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

"count how many files belong to each of code,data,documentation according to their file ending."
function classify_files(kind::String;which_package = nothing)

     # write to `generated`
     fp = joinpath(root(),"generated")
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

        outfile = joinpath(fp,"data-files.txt")

    elseif kind == "docs"

        extensions = ["pdf","md","docx","doc","pages"]

        nonsensitivenames = ["readme.md","readme.docx","readme.pdf"]

        outfile = joinpath(fp,"documentation-files.txt")

    else 
        error("kind not found: choose `code`, `data`, `docs`")
    end

    pkg = package(which = which_package)

    open(outfile, "w") do io

        for e in extensions
            s = rdir(pkg,"*.$e")
            if length(s) > 0
                for ss in s
                    println(io, ss)
                    push!(files,ss)
                end
            end
        end
        for fu in sensitivenames
            s = findfile(pkg,fu)
            if length(s) > 0
                for ss in s
                    println(io, ss)
                    push!(files,ss)
                end
            end
        end
        for fu in nonsensitivenames
            s = findfile(pkg,lowercase(fu),casesensitive = false)
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
    pat = r"^(?=.*[\w\-:]\\[\w\-])(?:(?!\\\w+{|^\\\w+ |\\\w+ | \\\w+ |[a-zA-Z] \\ [a-zA-Z]|[\<\>\|\?\*]|//).)*$"
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



# Process each file and categorize
function check_file_paths(filepath)
    lines = String[]
    has_windows = false
    has_unix = false
    has_drive = false

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

    return (lines, classification, has_drive)
end

"Check which fraction of file path separators goes into which direction: Windows or Unix?"
function file_paths(files::Array)

    # File path
    fp = joinpath(root(),"generated")

    isdir(fp) || error("execute `get_program_files()` first")

    # program_list_file = joinpath(fp,"program-files.txt")
    output_file = joinpath(fp,"file-paths.md")

    # run
    results = Dict{String, Vector{String}}()
    stats = Dict("windows" => 0, "unix" => 0, "mixed" => 0, "drive" => 0)

    for file in files
        file = strip(file)
        lines, classification, has_drive = check_file_paths(file)
        if !isempty(lines)
            results[file] = lines
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

        println(io, "**Warning**: Our search might incur both type 1 and type 2 errors. We disregard all patterns which contain any of `<>\"|?*`. Those characters are illegal in windows file paths, but they are legal for unix (only `/` cannot be part of the characters in a filepath). We incur type 2 error because we count mathematical expression a la `1/2` as a unix filepath.")

        println(io, "| Total Files | Total Windows Paths | Total Unix Paths | Total Mixed Paths | Total Drive Letters |")
        println(io, "|-------------|---------------------|------------------|-------------------|----------------------|")
        println(io, @sprintf("| %d | %d | %d | %d | %d |\n",
            total_files,
            stats["windows"],
            stats["unix"],
            stats["mixed"],
            stats["drive"]
        ))

        if isempty(results)
            println(io, "✅ No hardcoded file paths found.")
        else
            for (file, lines) in results
                println(io, "### $file")
                for l in lines
                    println(io, "- ", l)
                end
                println(io)
            end
        end
    end
end

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

test_paths_disk() = joinpath(@__DIR__,"..","scripts","test_filepaths.txt")

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



function create_example_package()

    pkg = joinpath(root(),"replication-package")
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
    else

    end
end

