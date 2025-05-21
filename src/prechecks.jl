
# Step 1: Get email with paper, appendix, DOI, and slugs
function get_email_details()
    println("Fetching email details...")
    # Implement logic to fetch email details
    return Dict("paper" => "example_paper", "doi" => "10.1234/example")
end



# Step 2: Download package under DOI
function download_package(doi::String, token::String)
    if is_dv

    else

    end
    println("Downloading package for DOI: $doi with token: $token")
    # Implement logic to download package using the token
    return "/path/to/downloaded/package.zip"
end


# Step 5: Unzip if necessary
function unzip_package(package_path::String, output_dir::String)
    println("Unzipping package...")
    # Implement logic to unzip the package
end

# Step 6: Create folder `generated`
function create_generated_folder(base_path::String)
    generated_path = joinpath(base_path, "generated")
    if !isdir(generated_path)
        mkdir(generated_path)
    end
    println("Created folder: $generated_path")
    return generated_path
end

# Step 7: File sizes and MD5 checksums
function generate_file_sizes_md5(folder_path::String, output_path::String; large_size = 100)
    println("Generating file sizes and MD5 checksums...")

    table = DataFrame(name = [],name_slug = [],  size = [], sizeMB = [], checksum= [])
    
    open(joinpath(output_path,"file-sizes.md"), "w") do io
        # Write Markdown table header
        write(io, "| Filename | Size (MB) | Checksum (MD5) |\n")
        write(io, "|:---------|----------:|:--------------|\n")

        for (root, _, files) in walkdir(folder_path)
            for file in files
                name = file
                file_path = joinpath(root, file)
                file_size = filesize(file_path)
                size_mb = file_size / 1024^2  # Convert bytes to megabytes
                md5_checksum =  open(file_path,"r") do fio
                    bytes2hex(sha1(fio))
                end
                push!(table, (name_slug = name, name = file_path, size = file_size, sizeMB = size_mb, checksum = md5_checksum))
            end
        end
        sort!(table, [:size])
        for ir in eachrow(table)
            write(io, "| $(ir.name) | $(round(ir.sizeMB, digits=2)) | $(ir.checksum) |\n")
        end
    end
    if length(unique(table.checksum)) != nrow(table)
        println("there are duplicate files")

        open(joinpath(output_path,"duplicates.md"), "w") do io
            # Write Markdown table header
            write(io, "| Filename | Size (MB) | Checksum (MD5) |\n")
            write(io, "|:---------|----------:|:--------------|\n")
            for ir in eachrow(table[nonunique(table,:checksum),:])
                write(io, "| $(ir.name) | $(round(ir.sizeMB, digits=2)) | $(ir.checksum) |\n")
            end
        end
        

    end

    if any(table.size .== 0)
        println("there zero byte sized files")
        open(joinpath(output_path,"zero-files.md"), "w") do io
            # Write Markdown table header
            write(io, "| Filename | Size (MB) | Checksum (MD5) |\n")
            write(io, "|:---------|----------:|:--------------|\n")
            for ir in eachrow(table[nonunique(table,:checksum),:])
                write(io, "| $(ir.name) | $(round(ir.size, digits=2)) | $(ir.checksum) |\n")
            end
        end
    end

    # table of large files
    if any(table.sizeMB .>= large_size)
        println("there are files larger than $large_size MB")
        open(joinpath(output_path,"large-files.md"), "w") do io
            # Write Markdown table header
            write(io, "| Filename | Size (MB)  |\n")
            write(io, "|:---------|----------:|\n")
            for ir in eachrow(table[nonunique(table,:checksum),:])
                write(io, "| $(ir.name) | $(round(ir.sizeMB, digits=2))|\n")
            end
        end
    end

    return table
end

# Step 8: Analyze code (cloc, libraries, etc.)
function analyze_code(folder_path::String)
    println("Analyzing code...")
    # Example: Count lines of code using cloc
    cloc_result = run(`cloc --md --out=./generated/cloc.md --sum-one --quiet --ignored=./generated/cloc-ignored.md $(folder_path)`)
    # Implement additional analysis for R, Stata, Python libraries, etc.
end

# Step 9: Write to markdown table
function write_to_markdown_table(data::Any, output_file::String)
    println("Writing data to markdown table...")
    # Implement logic to write data to markdown
end

# Step 10: Generate template report
function generate_template_report(output_path::String)
    println("Generating template report...")
    # Implement logic to generate a report
end

# Step 11: Commit everything that is not data
function commit_changes(repo_path::String)
    println("Committing changes...")
    # Implement logic to commit changes
end

# Step 12: Push to GitHub
function push_to_github(repo_path::String)
    println("Pushing to GitHub...")
    # Implement logic to push to GitHub
end

# Step 13: Notify replicator
function notify_replicator()
    println("Notifying replicator...")
    # Implement logic to notify replicator
end

# Step 14: Log in local database that package has been dispatched
function log_dispatch(details::Dict)
    println("Logging dispatch in database...")
    # Implement logic to log dispatch
end

# Main workflow
function main()
    token = ENV["JPE_DV"]  # Read the API token from the environment variable
    details = get_email_details()
    package_path = download_package(details["doi"], token)
    log_database("pre-processing", details)
    create_repo("/path/to/template", "new_repo")
    unzip_package(package_path, "/path/to/output")
    generated_folder = create_generated_folder("/path/to/output")
    generate_file_sizes_md5(generated_folder, joinpath(generated_folder, "file_sizes.md"))
    analyze_code("/path/to/output")
    generate_template_report("/path/to/report")
    write_gitignore(package_path)
    commit_changes("/path/to/repo")
    push_to_github("/path/to/repo")
    notify_replicator()
    log_dispatch(details)
end

# Run the workflow
# main()



