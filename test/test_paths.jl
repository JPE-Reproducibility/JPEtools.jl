



@testitem "find unix paths" begin
    @test JPEtools.is_unix_filepath("/here/we/have/a_/1234/unix-1/path")
    @test JPEtools.is_unix_filepath("here/we/a\\mixed\\path/which/counts")
    @test JPEtools.is_unix_filepath("/Users/man/Dropbox/Academic/THEOP data")
    @test JPEtools.is_unix_filepath("here/we")
    @test JPEtools.is_unix_filepath("/usr/local")
    @test !JPEtools.is_unix_filepath("short && return sumstats #skip the \"pulled in/out\" stuff")
    @test !JPEtools.is_unix_filepath("\"pulled in/out\" stuff")
    @test !JPEtools.is_unix_filepath("outsheet `identifiers' `finaid_shifters' using \"\${workfiles_path}\\toMatlab\\finaid_shifters.csv\", comma replace")
    @test !JPEtools.is_unix_filepath("// STATA 15.1")
    @test !JPEtools.is_unix_filepath("//a stata or C comment")
    @test !JPEtools.is_unix_filepath("// a stata or C comment")
    @test !JPEtools.is_unix_filepath("somecode// a stata or C comment")
    @test !JPEtools.is_unix_filepath("somecode // a stata or C comment")
    @test !JPEtools.is_unix_filepath("a / b")
    @test !JPEtools.is_unix_filepath("1 / 2")
    @test JPEtools.is_unix_filepath("1/2")  # unfortunately cannot avoid that
end

@testitem "find windows paths" begin
    @test  JPEtools.is_windows_filepath("this\\is\\part\\1\\of\\a\\9part\\path")
    @test  JPEtools.is_windows_filepath("this\\is\\part\\1/of/a/mixed/oned")
    @test  JPEtools.is_windows_filepath("here\\1we")
    @test  JPEtools.is_windows_filepath("C:\\A")
    @test  JPEtools.is_windows_filepath("outsheet `identifiers' `finaid_shifters' using \"\${workfiles_path}\\toMatlab\\finaid_shifters.csv\", comma replace")
    @test !JPEtools.is_windows_filepath("some latex \\begin{array}")
    @test !JPEtools.is_windows_filepath("more latex \\cmd{")
    @test !JPEtools.is_windows_filepath("\\cmd at start of a line")
    @test !JPEtools.is_windows_filepath("a \\ b")  # right division
end


@testitem "test detect_paths_kind()" begin
    tl = JPEtools.make_test_paths()
    results = [(false,true,false),(false,true,false),(false,true,false),(true,false,true),(true,false,false),(true,true,true)]
    for (i,t) in enumerate(tl)
        x = JPEtools.detect_path_kinds(t)
        @test x == results[i]
    end     
end

@testitem "precheck dummy package" begin
    using DataFrames, CSV
    include(joinpath(@__DIR__,"deps.jl"))

    loc = make_test_package()

    JPEtools.precheck_package(loc)

    @test isdir(joinpath(loc,"..","generated"))
    @test isfile(joinpath(loc,"..","generated","data-files.md"))
    @test isfile(joinpath(loc,"..","generated","report-pii.md"))

    pii = readlines(joinpath(loc,"..","generated","report-pii.md"))
    # get the 16th line of this report
    pii_data = strip.(split(pii[16], "|"))
    @test pii_data[3] == "`test_script.R`"
    @test pii_data[5] == "first_name, name, email"
    
end

