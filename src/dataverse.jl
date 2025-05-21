# functionality to query dataverse deposits
# - get all JPE papers on datavers
# - with associated status (published, draft, revision) )

dvserver() = "https://dataverse.harvard.edu"

function dv_fetch_all_datasets(token::String; subtree::String="JPE")
    base_url = "$(dvserver())/api/search"
    query_params = "q=*&subtree=$(subtree)&showEntityIds=true&showDrafts=true&type=dataset&per_page=100"
    headers = ["X-Dataverse-key" => token]

    start = 0
    all_items = []

    while true
        url = "$base_url?$query_params&start=$start"

        response = HTTP.get(url, headers)
        if response.status != 200
            error("Failed at start=$start: HTTP $(response.status)")
        end

        data = JSON3.read(String(response.body))
        items = data["data"]["items"]

        isempty(items) && break

        append!(all_items, items)
        start += length(items)
    end

    return all_items
end


function dv_filter_recent_datasets(datasets::Vector{Any}; days_ago::Int=90)
    cutoff_date = Dates.today() - Day(days_ago)

    recent_items = []
    
    for dataset in datasets
        date_str = get(dataset, "updatedAt", nothing)
        if date_str === nothing
            println("Missing 'updatedAt' field for dataset: ", dataset["name"])  # Debugging line
            continue
        end

        # Remove 'Z' if present (Zulu time/UTC)
        date_str = replace(date_str, "Z" => "")

        # Try parsing the timestamp
        date_obj = tryparse(DateTime, date_str, dateformat"yyyy-mm-ddTHH:MM:SS")

        if date_obj === nothing
            println("Failed to parse 'updatedAt' for dataset: ", dataset["name"], " (", date_str, ")")  # Debugging line
            continue
        end

        # Compare the parsed date to the cutoff
        if Date(date_obj) >= cutoff_date
            push!(recent_items, dataset)
        end
    end

    return recent_items
end


function dv_get_dataset_by_doi(doi::String, token::String)
    # Dataverse API URL for retrieving a dataset by its DOI
    url = "$(dvserver())/api/datasets/:persistentId?persistentId=$(doi)"

    # Set the access token in the headers
    headers = Dict("X-Dataverse-key" => token)

    # Send the GET request to fetch the dataset
    response = HTTP.get(url, headers)

    # Parse the JSON response
    dataset = JSON3.read(response.body)

    # Return the dataset (or nothing if not found)
    return dataset["data"]  # Dataset details
end

function dv_download_dataset(api_token::String, persistent_id::String)

    root = joinpath(@__DIR__,"..")
    dest = joinpath(root, "replication-package" )

    # Construct the request URL
    url = "$(dvserver())/api/access/dataset/:persistentId/?persistentId=$(persistent_id)"
    
    # Set the request headers with the Dataverse API key
    headers = Dict("X-Dataverse-key" => api_token)
    
    # Send the GET request to the API
    # d = download(url, headers = headers, output = )
    response = HTTP.get(url, headers)
    
    # Handle the response (assuming the dataset is available for download)
    if response.status == 200
        println("Dataset fetched successfully!")
        # Optionally, save the content to a file
        filename = "dataset_download.zip"  # Adjust this based on the file type you're downloading
        open(filename, "w") do f
            write(f, response.body)
        end
        println("Dataset saved to: $filename")
        # Now unzip the file if it is a .zip file
        run(`unzip $filename -d $dest`)

    else
        println("Failed to fetch dataset. Status code: ", response.status)
    end
end


# Function to get the list of files in the dataset, with sizes
function dv_get_dataset_files(api_token::String, persistent_id::String)
    url = "$(dvserver())/api/datasets/:persistentId?persistentId=$(persistent_id)"
    headers = Dict("X-Dataverse-key" => api_token)
    
    response = HTTP.get(url, headers)
    dataset_metadata = JSON3.read(response.body)

    if haskey(dataset_metadata["data"], "latestVersion") && haskey(dataset_metadata["data"]["latestVersion"], "files")
        files = dataset_metadata["data"]["latestVersion"]["files"]
        
        file_info_list = []

        for file in files
            filename = file["dataFile"]["filename"]
            filesize_bytes = file["dataFile"]["filesize"]

            # Check for checksum and algorithm
            if haskey(file["dataFile"], "checksum")
                checksum = file["dataFile"]["checksum"]["value"]
                algorithm = file["dataFile"]["checksum"]["type"]
            else
                checksum = "N/A"
                algorithm = "N/A"
            end

            push!(file_info_list, (filename=filename, size_bytes=filesize_bytes, checksum=checksum, algorithm=algorithm))
        end

        return file_info_list
    else
        error("No files found in dataset.")
    end
end

function dv_write_file_list_markdown(file_info_list::Vector, output_filename::String)
    open(output_filename, "w") do io
        # Write Markdown table header
        write(io, "| Filename | Size (MB) | Checksum (MD5) |\n")
        write(io, "|:---------|----------:|:--------------|\n")
        
        # Write each file's info
        for (filename, size_bytes, checksum, algorithm) in file_info_list
            size_mb = size_bytes / 1024^2  # Convert bytes to megabytes
            write(io, "| $(filename) | $(round(size_mb, digits=2)) | $(checksum) |\n")
        end
    end
    println("Markdown table written to $output_filename")
end

# Helper function to print file sizes nicely
function dv_print_file_list(file_info_list)
    println("Files in dataset:")
    for (filename, size_bytes) in file_info_list
        size_mb = size_bytes / 1024^2  # Convert bytes to megabytes
        println("- $(filename): $(round(size_mb, digits=2)) MB")
    end
end



# Read your API token
# token = ENV["JPE_DV"]
# doi = "doi:10.7910/DVN/78W8M6"

# dataset = get_dataset_by_doi(doi, token)
