




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
rdir(dir::AbstractString, pat::AbstractString) = rdir(dir, Glob.FilenameMatch(pat))

"Find one specific file in the tree"
findfile(directory, file) = [joinpath(root, file) for (root, dirs, files) in walkdir(directory) if file in files]


function get_program_files()

    extensions = ["ado","do","r","rmd","qmd","ox","m","py","nb","ipynb","sas","jl","f","f90","c","c++","sh","toml","yaml","yml","fs","fsx"]

    fullnames = ["Makefile"]

    files = String[]

    # write to `generated`
    fp = joinpath(root(),"generated")
    mkpath(fp)

    open(joinpath(fp,"program-files.txt"), "w") do io

        for e in extensions
            # pat = Glob.GlobMatch("*/*.$e")
            # println(pat)
            s = rdir(package(),"*.$e")
            if length(s) > 0
                for ss in s
                    x = split(ss,"../")[2]
                    println(io, x)
                    push!(files,ss)
                end
            end
        end
        for fu in fullnames
            s = findfile(package(),fu)
            if length(s) > 0
                for ss in s
                    x = split(ss,"../")[2]
                    println(io, x)
                    push!(files,ss)
                end
            end
        end
    end

    return files
end

# Detects all relevant patterns in a line
function detect_path_kinds(line::String)
    # Regular expressions for path detection
    WINDOWS_REGEX = r"[a-zA-Z0-9]\\*"
    UNIX_REGEX = r"[^a-zA-Z0-9_/-]/[^a-zA-Z0-9_/-]"
    DRIVE_LETTER_REGEX = r"^[A-Z]:\\\\*"
 
    windows = contains(line,"\\")
    unix = contains(line,"/")
    drive_letter = occursin(DRIVE_LETTER_REGEX, line)
    return (windows, unix, drive_letter)
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
                    push!(lines, @sprintf("Line %d: %s", i, strip(line)))
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
function file_paths(files::Array{String})

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
    return results, stats

    # Write report
    open(output_file, "w") do io
        println(io, "### File Paths Report\n")

        println(io, "_Generated on $(Dates.now())_\n")

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

@testitem "test detect_paths_kind()" begin
    tl = JPEtools.make_test_paths()
    results = [(false,true,false),(false,true,false),(false,true,false),(true,false,true),(true,false,false),(true,true,true)]
    for (i,t) in enumerate(tl)
        x = JPEtools.detect_path_kinds(t)
        @test x == results[i]
    end     
end

@testitem "test check_file_paths()" begin
    tl = JPEtools.get_program_files()
    @test JPEtools.check_file_paths(tl[2])[3] == false
    @test JPEtools.check_file_paths(tl[1])[3] == false

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