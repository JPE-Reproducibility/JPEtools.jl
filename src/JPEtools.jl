module JPEtools


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
using DataFrames
using RCall
using Downloads
using Pkg
using Printf
using Glob
using Infiltrator
using TestItems
using Term.Prompts


# dv token
token() = ENV["JPE_DV"]

include("prechecks.jl")
include("actions.jl")
include("dataverse.jl")

# basic vars
root() = joinpath(@__DIR__,"..")
# package() = joinpath(root(),"replication-package")
function package(;which = nothing)
    if isnothing(which)
        # default
        joinpath(root(),"replication-package")
    else
        test_package_path(which)
    end
end

end # module
