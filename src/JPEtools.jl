module JPEtools


using Dates
using SHA
using HTTP
using JSON3
using DataFrames
using Pkg
using Printf
using Glob
using Infiltrator
using TestItems
using Term.Prompts
using PDFIO
using CSV
using PIIScanner


# dv token
# dvtoken() = haskey(ENV,"JPE_DV") ? ENV["JPE_DV"] : error("You must set ENV var JPE_DV")
dvtoken() = ENV["JPE_DV"]

# include("prechecks.jl")
include("actions.jl")
include("dataverse.jl")



end # module
