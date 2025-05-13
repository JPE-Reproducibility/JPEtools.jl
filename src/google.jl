# https://duckdb-gsheets.com



function activate(; user = "jpe")
    if user == "jpe"
        haskey(ENV, "JPE_GOOGLE_KEY") || error("No JPE_GOOGLE_KEY found in ENV")
        key = ENV["JPE_GOOGLE_KEY"]
    else 
        error("User not recognized")
    end 
    run(`gcloud auth activate-service-account --key-file $(ENV["JPE_GOOGLE_KEY"])`)
end


function printwalkdir(path)
    for (root,dirs,files) in walkdir(path)
        for dir in dirs
            println("Directories in $root")
            println(joinpath(root,dir))
        end
        println("Files in $root")
        for file in files
            println(joinpath(root, file)) # path to files
        end
    end  
end


gs_arrivals_url() = "https://docs.google.com/spreadsheets/d/1suU5e1Vc9LeVW9MgPFDsctZPSLKKwYn8pSf8LLMfNB8/edit"
gs_jpe() = "1Pa-qShyqE57CdUXHlhHD95wIP9MFPJG9xmlzTVPeGzA"


gs_date(x) = Date(x, dateformat"dd/mm/yyyy")
gs_timestamp(x) = Date(x, dateformat"dd/mm/yyyy H:M:S")
parsebool(x::String) = lowercase(x) == "yes" ? true : false

function google_arrivals()
    x = read_google_arrivals()
    @info "$(nrow(x)) incoming new arrivals"

    y = process_google_arrivals(x)
    store_google_arrivals(y)
end

function read_google_arrivals()

    con = oc()

    DBInterface.execute(con,"CREATE OR REPLACE TABLE tmp_arrivals AS SELECT * FROM read_gsheet('$(gs_arrivals_url())',sheet='new-arrivals')")
    gs_arrivals = DataFrame(DBInterface.execute(con,"SELECT * FROM tmp_arrivals"))

    # write into local arrivals db
    DBInterface.execute(con,"CREATE TABLE IF NOT EXISTS arrivals AS FROM tmp_arrivals WITH NO DATA")
    DBInterface.execute(con,"INSERT INTO arrivals SELECT * FROM tmp_arrivals")

    # create a clean df from gs_arrivals
    df = gs_arrivals |> polish_names |> DataFrame

    cc(con)

    select!(df, Not(r"password"))
    DataFrames.rename!(df,names(df,r"reminder")[1] => "dropbox_reminder")
    DataFrames.rename!(df, 
        "paper_id_(micro_macro)" => "paper_id_micro_macro",
        "first_name(s)_of_author" => "firstname_of_author",
        "email_of_second_author_(if_applicable)" => "email_of_second_author",
        "does_the_das_mention_any_access_restrictions_for_used_data" => "is_confidential"
    )
    return df
end

function google_paperid(df,var::String)
    x = df[!,var]
    if collect(skipmissing(x))[1] isa Number
        passmissing(floor).(Int,x) 
    else
        passmissing(floor).(Int,passmissing(parse).(Float64,x))
    end
end

clean_journalname(j::String) = replace(j, ":" => "-")

function process_google_arrivals(df0::DataFrame)

    df = copy(df0)
    
    df.paper_id .= google_paperid(df,"paper_id")
    df.paper_id_micro_macro .= google_paperid(df,"paper_id_micro_macro")
    
    # fix paper id column
    df.paper_id = ifelse.(df.journal .== "JPE", df.paper_id, df.paper_id_micro_macro)

    # transform to arrival_date_em to date datatype
    df.first_arrival_date .= gs_timestamp.(df.timestamp)
    
    df.is_confidential = parsebool.(df.is_confidential)

    df.dropbox_file_request = Array{Union{Missing, String}}(missing, nrow(df))
 
    # cycle through each row and check what needs to be done in each case.
    @debug "$(nrow(df)) new arrivals to process"
    for ir in eachrow(df)

        @info "processing new arrival $(ir.paper_id) from $(ir.journal)"

        # check that dropbox folder exists and is populated
        pname = join([ir.surname_of_author, ir.paper_id], "-")
        dpath = joinpath(dropbox(), "package-arrivals", replace(ir.journal, ":" => "-"), pname)
        if !isdir(dpath)
            @warn "Dropbox folder does not exist for $(pname)"
        else
            @info "Dropbox does exist:"
            printwalkdir(dpath)
        end
        
        choice = ask(DefaultPrompt(["y", "no"], 1, "Verified dropbox - Good to continue?"))
        if choice == "y"
            println("Continuing with package")
        else
            println("Stopping process")
            return 1
        end

        if ir.is_confidential
            @info "JO says there is confidential data in the package"
            choice = ask(DefaultPrompt(["y", "no"], 1, "send file request upload link?"))
            if choice == "y"
                # create dropbox file request

                # send email to authors with link

            else
                @info "not sending file request link"
            end
        end
    end
    return df
end


function store_google_arrivals(df::DataFrame)
    # write back into google sheet 'recorded' tab
    # want to write back into a 'recorded' tab on the same sheet
    # # check if this is the first row on recorded sheet

    con = oc()

    firsttime = false
    n = try
        DBInterface.execute(con,"FROM read_gsheet('$(gs_arrivals_url())',sheet='recorded')")
    catch e 
        if e isa DuckDB.QueryException
            firsttime = true
        else
            error("Error reading recorded sheet: $e")
        end
    end

    if firsttime
        @info "first time, creating table header"
        DBInterface.execute(con,"copy arrivals to '$(gs_arrivals_url())' WHERE date_recorded IS current_date (format gsheet, sheet 'recorded', range 'A1:Z100', overwrite_range FALSE,overwrite_sheet FALSE,  header TRUE)")
    else
        @info "appending to existing table"
        DBInterface.execute(con,"copy gs_arrivals to '$(gs_arrivals_url())' WHERE date_recorded IS current_date (format gsheet, sheet 'recorded',  range 'A1:Z100', overwrite_range FALSE,overwrite_sheet FALSE,  header FALSE)")
    end

    # add to local database of papers
    a = ask(DefaultPrompt(["y", "no"], 1, "Insert into local database?"))
    if a == "y"
        DBInterface.execute(con,"INSERT INTO papers")

    else

    end



    a = ask(DefaultPrompt(["y", "no"], 1, "delete responses on google sheet?"))
    if a == "y"
        DBInterface.execute(con,"DELETE FROM gs_arrivals")
        DBInterface.execute(con,"copy gs_arrivals to '$(gs_arrivals_url())' (format gsheet, sheet 'responses2', overwrite_sheet TRUE)")
    end

    cc(con)

    @info "done importing."
end


