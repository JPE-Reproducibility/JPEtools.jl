module JPEtools


using Markdown
using Dates
using SHA
# using Glob
# using PackageAnalyzer
using HTTP
using JSON3
using DataStructures
using Dates
using DataFrames
using RCall
using Downloads
using Pkg
using Printf
using Glob
using Infiltrator
using TestItems
using Term.Prompts
using PDFIO
using ProgressMeter
using CSV


# dv token
# dvtoken() = haskey(ENV,"JPE_DV") ? ENV["JPE_DV"] : error("You must set ENV var JPE_DV")
dvtoken() = ENV["JPE_DV"]

# include("prechecks.jl")
include("actions.jl")
include("dataverse.jl")



end # module
