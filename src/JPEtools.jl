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
using PDFIO


# dv token
token() = ENV["JPE_DV"]

# include("prechecks.jl")
include("actions.jl")
include("dataverse.jl")

# basic vars
root() = joinpath(@__DIR__,"..")
# package() = joinpath(root(),"replication-package")
function package(;which = nothing)
    if isnothing(which)
        # default
        p = joinpath(root(),"replication-package")
        if !isdir(p) 
            @warn """
            🚨 you need to download and extract as `replication-package` into $(root())!
            
            👉 Will create a dummy package now for test purposes. If you are not testing: call `JPEtools.delete_package()` and download the replication package first.
            
            """

            @info "creating dummy test package"
            create_example_package()
        end
        return p
    else
        test_package_path(which)
    end
end

end # module
