module DEtools


using FileIO
using Markdown
using Dates
using SHA
# using Glob
# using PackageAnalyzer
using HTTP
using JSON3
using DataStructures
using Dates
using DuckDB
using DataFrames
using Term.Prompts
using Cleaner




include("prechecks.jl")
include("google.jl")
include("db.jl")
include("dropbox.jl")

# IO
dropbox() = ENV["DROPBOX_JPE"]



end
