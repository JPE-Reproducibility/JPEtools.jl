
function make_file_list()
    x = String[]
    push!(x,"replication-package/code/Oswald.jl/src/Oswald.jl")
    push!(x,"replication-package/code/Oswald.jl/Project.toml")
    push!(x,"replication-package/code/Oswald.jl/src/makefile")
    push!(x,raw"C:\\Your\\dummy\\path")
    push!(x,raw"D:\\Your\\dummy\\path/with/mixed/separators")
    x
end

function make_test_package()
    pkg_root = mktempdir() 
    pkg_loc = joinpath(pkg_root,"replication-package")
    pkg_data = joinpath(pkg_loc,"data")
    pkg_code = joinpath(pkg_loc,"code")
    mkpath(pkg_data)
    mkpath(pkg_code)

    # make a readme
    open(joinpath(pkg_loc,"README.md"), "w") do io
        println(io, 
        """
        # [TESTING] Replication Package 

        This readme is for my test replication package.

        There is not much to see here.

        Good night, and good luck.

        """
        )
    end

    # create a dataset
    N = 1000
    d = DataFrame(i = 1:N, y = rand(N), telephone = rand(N), lat = rand(N), income = rand(N))
    CSV.write(joinpath(pkg_data,"data.csv"),d)

    # some code
    test_file = joinpath(pkg_code, "test_script.R")
    open(test_file, "w") do io
        println(io, "# Analysis script")
        println(io, "data <- read.csv('file.csv')")
        println(io, "df\$first_name <- clean_text(df\$name)")
        println(io, "model <- lm(y ~ age + email + income)")
        println(io, "summary(model)")
    end

    return pkg_loc

end


