
function make_file_list()
    x = String[]
    push!(x,"replication-package/code/Oswald.jl/src/Oswald.jl")
    push!(x,"replication-package/code/Oswald.jl/Project.toml")
    push!(x,"replication-package/code/Oswald.jl/src/makefile")
    push!(x,raw"C:\\Your\\dummy\\path")
    push!(x,raw"D:\\Your\\dummy\\path/with/mixed/separators")
    x
end
