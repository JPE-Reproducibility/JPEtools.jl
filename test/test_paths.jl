



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


@testitem "test test" begin
    @test true
end
    

@testitem "test detect_paths_kind()" begin
    tl = JPEtools.make_test_paths()
    results = [(false,true,false),(false,true,false),(false,true,false),(true,false,true),(true,false,false),(true,true,true)]
    for (i,t) in enumerate(tl)
        x = JPEtools.detect_path_kinds(t)
        @test x == results[i]
    end     
end

@testitem "test2 detect_paths_kind()" begin
    tl = readlines(JPEtools.test_paths_disk())
    results = [(true,false,true),(true,false,true),(true,true,true),(true,true,false),(false,true,false),(true,false,false)]
    for (i,t) in enumerate(tl)
        x = JPEtools.detect_path_kinds(t)
        @test x == results[i]
    end     
end

@testitem "test check_file_paths()" begin
    tl = JPEtools.classify_files("code", which_package = "ECTA")
    @test JPEtools.check_file_paths(tl[2])[3]
    @test JPEtools.check_file_paths(tl[2])[2] == "windows"
    @test !JPEtools.check_file_paths(tl[1])[3]
end