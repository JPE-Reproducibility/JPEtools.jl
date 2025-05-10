
function activate(; user = "jpe")
    if user == "jpe"
        haskey(ENV, "JPE_GOOGLE_KEY") || error("No JPE_GOOGLE_KEY found in ENV")
        key = ENV["JPE_GOOGLE_KEY"]
    else 
        error("User not recognized")
    end 
    run(`gcloud auth activate-service-account --key-file $(ENV["JPE_GOOGLE_KEY"])`)
end


google_arrivals() = "https://docs.google.com/spreadsheets/d/12GIWIJ71CihXk4WTRfaNKhP6sdKWNld7WLWIobAUAZM/edit"


# duckdb 
# load gsheets
# FROM read_gsheet('https://docs.google.com/spreadsheets/d/12GIWIJ71CihXk4WTRfaNKhP6sdKWNld7WLWIobAUAZM/edit');

function getcon()
    con = DBInterface.connect(DuckDB.DB, "$(ENV["JPE_DUCKDB"])")
    DBInterface.execute(con, "load gsheets")
    DBInterface.execute(con, """
        CREATE SECRET (
        TYPE gsheet, 
        PROVIDER key_file, 
        FILEPATH '$(ENV["JPE_GOOGLE_KEY"])'
        );
        """)
    return con
end

function google_arrivals(con)

    DBInterface.execute(con,"CREATE OR REPLACE TABLE gs_arrivals AS SELECT * FROM read_gsheet('$(google_arrivals())',sheet='responses')")

    # # check if this is the first row on recorded sheet
    firsttime = false
    n = try
        DBInterface.execute(con,"FROM read_gsheet('$(google_arrivals())',sheet='recorded')")
    catch e 
        if e isa DuckDB.QueryException
            firsttime = true
        else
            error("Error reading recorded sheet: $e")
        end
    end
    if firsttime
        DBInterface.execute(con,"copy gs_arrivals to '$(google_arrivals())' (format gsheet, sheet 'recorded', range 'A1:Z100', overwrite_range FALSE,overwrite_sheet FALSE,  header TRUE)")
    else
        DBInterface.execute(con,"copy gs_arrivals to '$(google_arrivals())' (format gsheet, sheet 'recorded',  range 'A1:Z100', overwrite_range FALSE,overwrite_sheet FALSE,  header FALSE)")
    end
    
    # copy <table_name> 
# to 'https://docs.google.com/spreadsheets/d/11QdEasMWbETbFVxry-SsD8jVcdYIT1zBQszcF84MdE8/edit' 
# (format gsheet, sheet 'Woot', range 'B2:C10000', overwrite_sheet FALSE, overwrite_range FALSE, header TRUE);


    # # copy to recorded sheet
    # DBInterface.execute(con,"copy arr to '$(google_arrivals())' (format gsheet, sheet 'recorded', range 'B2:C10000', overwrite_sheet FALSE, overwrite_range FALSE, header TRUE);
    # ")
    

    # DBInterface.execute(con,"CREATE OR REPLACE TABLE gs_arrivals AS SELECT * FROM read_gsheet('$(google_arrivals())',sheet='responses') where recorded is not null")
    # DBInterface.execute(con,"FROM read_gsheet('$(google_arrivals())',sheet='responses') where recorded is not null")
end

function google_arrivals(db)
    DataFrameDBInterface.execute(db, "SELECT * FROM gs_arrivals")
end



# dbshow(con) = DBInterface.execute(con, "SHOW ALL TABLES")

