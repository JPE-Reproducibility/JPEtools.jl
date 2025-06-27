## Potential Personal Identifiable Information (PII)


We found the following instances of potentially personally identifying information. This may be completely legitimate but might be worth checking. *As a reminder, privacy legislation in many countries (e.g. GDPR in EU) prohibits the dissemination of personal identifiable information without prior (and documented) consent of individuals.* If indeed you want to publish such information with your replication package, you should probably have obtained IRB approval for this - please check!

**/code/setup/new_descriptive_setup.do**

- Line 26, : rename q50barrons barrons
- Line 25, : reshape long q50barrons, i(ii) j(collegeID)
- Line 54, : drop if collegeID == 2 // community colleges
- Line 12, : replace SATmean_s = _SATmean_alt if SATmean_s < 10 // this fixes one weird outlier high school

**/code/analysis/reversemodegradient_2024.jl**

- Line 10, : lik[ii],aid[ii] = dobj_i_new(dθ[ii],-likwt[ii],0.0,θ,CC,ii,IW[ii])
- Line 27, : _,_ = dobj_i_new(dθ[ii],-likwt[ii],d_aid,θ,CC,ii,IW[ii])
- Line 35, : function dobj_i_new(d_loglik,d_avgaid,θ,CC,ii,iw=ii)
- Line 37, : lik_i,aid_i = dobj_i_new(dθ,d_loglik,d_avgaid,θ,CC,ii,iw)
- Line 41, : function dobj_i_new(d_θ,d_loglik,d_avgaid,θ,CC,ii,iw=ii)
- Line 58, : λ = 1/(1+exp(-θ[J+nz+7])) #correlation parameter for final-period shocks
- Line 87, : d_λ = 0.0 #λ = 1/(1+exp(-θ[J+nz+7])) #correlation parameter for final-period shocks
- Line 129, : #admissions block
- Line 138, : # reverse sweep of admissions block starts here
- Line 156, : #app decision, no allocations up to here
- Line 173, : #no allocations up to here
- Line 79, : zγ = ws.zγ; mul!(zγ,CC.zi[ii],γadmit)  #all schools

**/code/analysis/describe_extensions.jl**

- Line 157, : vnames_gamma_other = ["Constant","SAT","Class Rank","SAT Ratio","Poverty","URM","Caliber (q)"]
- Line 161, : function print_results_means(varnames,dfmeans,titles; f=stdout, supertitles=[])
- Line 169, : for r=1:length(varnames)
- Line 170, : println(f,varnames[r] * " & "*join(myround.(Vector( dfmeans[r,:])), " & ") * " \\\\")
- Line 177, : print_results_means(vnames_gamma_other,dfpersist_other,["Non-Flagship Public","Private"], f=f)
- Line 144, : barplot(fig[3,1], 1:4, yvals, axis = (xticks=(1:4,xs), limits=(nothing,nothing,ll,ul), title = "E. Affluent Schools"), bar_labels = ["$(round(y,digits=1))%" for y in yvals], )

**/Manifest.toml**

- Line 67, : ArrayInterfaceBlockBandedMatricesExt = "BlockBandedMatrices"
- Line 79, : BlockBandedMatrices = "ffab5731-97b5-5995-9138-79e8c1846df0"
- Line 119, : [[deps.Bzip2_jll]]
- Line 158, : deps = ["Artifacts", "Bzip2_jll", "CompilerSupportLibraries_jll", "Fontconfig_jll", "FreeType2_jll", "Glib_jll", "JLLWrappers", "LZO_jll", "Libdl", "Pixman_jll", "Xorg_libXext_jll", "Xorg_libXrender_jll", "Zlib_jll", "libpng_jll"]
- Line 281, : [[deps.DelaunayTriangulation]]
- Line 365, : deps = ["Artifacts", "Bzip2_jll", "FreeType2_jll", "FriBidi_jll", "JLLWrappers", "LAME_jll", "Libdl", "Ogg_jll", "OpenSSL_jll", "Opus_jll", "PCRE2_jll", "Zlib_jll", "libaom_jll", "libass_jll", "libfdk_aac_jll", "libvorbis_jll", "x264_jll", "x265_jll"]
- Line 434, : FiniteDiffBlockBandedMatricesExt = "BlockBandedMatrices"
- Line 439, : BlockBandedMatrices = "ffab5731-97b5-5995-9138-79e8c1846df0"
- Line 449, : deps = ["Artifacts", "Bzip2_jll", "Expat_jll", "FreeType2_jll", "JLLWrappers", "Libdl", "Libuuid_jll", "Zlib_jll"]
- Line 476, : deps = ["Artifacts", "Bzip2_jll", "JLLWrappers", "Libdl", "Zlib_jll"]
- Line 626, : [[deps.Inflate]]
- Line 654, : [[deps.Interpolations]]
- Line 661, : [deps.Interpolations.extensions]
- Line 662, : InterpolationsUnitfulExt = "Unitful"
- Line 665, : deps = ["CRlibm_jll", "MacroTools", "RoundingEmulator"]
- Line 772, : deps = ["Distributions", "DocStringExtensions", "FFTW", "Interpolations", "StatsBase"]
- Line 813, : [[deps.LaTeXStrings]]
- Line 932, : deps = ["Animations", "Base64", "CRC32c", "ColorBrewer", "ColorSchemes", "ColorTypes", "Colors", "Contour", "Dates", "DelaunayTriangulation", "Distributions", "DocStringExtensions", "Downloads", "FFMPEG_jll", "FileIO", "FilePaths", "FixedPointNumbers", "Format", "FreeType", "FreeTypeAbstraction", "GeometryBasics", "GridLayoutBase", "ImageBase", "ImageIO", "InteractiveUtils", "Interpolations", "IntervalSets", "Isoband", "KernelDensity", "LaTeXStrings", "LinearAlgebra", "MacroTools", "MakieCore", "Markdown", "MathTeXEngine", "Observables", "OffsetArrays", "Packing", "PlotUtils", "PolygonOps", "PrecompileTools", "Printf", "REPL", "Random", "RelocatableFolders", "Scratch", "ShaderAbstractions", "Showoff", "SignedDistanceFields", "SparseArrays", "Statistics", "StatsBase", "StatsFuns", "StructArrays", "TriplotBase", "UnicodeFun", "Unitful"]
- Line 953, : deps = ["AbstractTrees", "Automa", "DataStructures", "FreeTypeAbstraction", "GeometryBasics", "LaTeXStrings", "REPL", "RelocatableFolders", "UnicodeFun"]
- Line 1175, : deps = ["Artifacts", "Dates", "Downloads", "FileWatching", "LibGit2", "Libdl", "Logging", "Markdown", "Printf", "REPL", "Random", "SHA", "Serialization", "TOML", "Tar", "UUIDs", "p7zip_jll"]
- Line 1221, : deps = ["Crayons", "LaTeXStrings", "Markdown", "PrecompileTools", "Printf", "Reexport", "StringManipulation", "Tables"]
- Line 1299, : [[deps.RelocatableFolders]]
- Line 1323, : [[deps.RoundingEmulator]]
- Line 1481, : [[deps.StringManipulation]]
- Line 1542, : deps = ["ColorTypes", "DataStructures", "DocStringExtensions", "FileIO", "FixedPointNumbers", "IndirectArrays", "Inflate", "Mmap", "OffsetArrays", "PkgVersion", "ProgressMeter", "SIMD", "UUIDs"]
- Line 1695, : deps = ["Artifacts", "Bzip2_jll", "FreeType2_jll", "FriBidi_jll", "HarfBuzz_jll", "JLLWrappers", "Libdl", "Zlib_jll"]
- Line 1740, : [[deps.p7zip_jll]]
- Line 36, : AdaptStaticArraysExt = "StaticArrays"
- Line 66, : ArrayInterfaceBandedMatricesExt = "BandedMatrices"
- Line 67, : ArrayInterfaceBlockBandedMatricesExt = "BlockBandedMatrices"
- Line 69, : ArrayInterfaceCUDSSExt = "CUDSS"
- Line 70, : ArrayInterfaceChainRulesExt = "ChainRules"
- Line 73, : ArrayInterfaceSparseArraysExt = "SparseArrays"
- Line 171, : ChainRulesCoreSparseArraysExt = "SparseArrays"
- Line 180, : deps = ["Colors", "JSON", "Test"]
- Line 205, : SpecialFunctionsExt = "SpecialFunctions"
- Line 241, : ConstructionBaseIntervalSetsExt = "IntervalSets"
- Line 243, : ConstructionBaseStaticArraysExt = "StaticArrays"
- Line 326, : deps = ["ANSIColoredPrinters", "Base64", "Dates", "DocStringExtensions", "IOCapture", "InteractiveUtils", "JSON", "LibGit2", "Logging", "Markdown", "REPL", "Test", "Unicode"]
- Line 332, : deps = ["ArgTools", "FileWatching", "LibCURL", "NetworkOptions"]
- Line 422, : FillArraysPDMatsExt = "PDMats"
- Line 423, : FillArraysSparseArraysExt = "SparseArrays"
- Line 424, : FillArraysStatisticsExt = "Statistics"
- Line 433, : FiniteDiffBandedMatricesExt = "BandedMatrices"
- Line 434, : FiniteDiffBlockBandedMatricesExt = "BlockBandedMatrices"
- Line 435, : FiniteDiffStaticArraysExt = "StaticArrays"
- Line 467, : ForwardDiffStaticArraysExt = "StaticArrays"
- Line 637, : ArrowTypesExt = "ArrowTypes"
- Line 638, : ParsersExt = "Parsers"
- Line 671, : IntervalArithmeticDiffRulesExt = "DiffRules"
- Line 673, : IntervalArithmeticIntervalSetsExt = "IntervalSets"
- Line 692, : IntervalSetsStatisticsExt = "Statistics"
- Line 737, : [[deps.JSON]]
- Line 764, : SparseArraysExt = "SparseArrays"
- Line 790, : BFloat16sExt = "BFloat16s"
- Line 827, : [[deps.LibCURL]]
- Line 828, : deps = ["LibCURL_jll", "MozillaCACerts_jll"]
- Line 832, : [[deps.LibCURL_jll]]
- Line 838, : deps = ["Base64", "LibGit2_jll", "NetworkOptions", "Printf", "SHA"]
- Line 908, : LogExpFunctionsChangesOfVariablesExt = "ChangesOfVariables"
- Line 909, : LogExpFunctionsInverseFunctionsExt = "InverseFunctions"
- Line 1040, : [[deps.NetworkOptions]]
- Line 1280, : RatiosFixedPointNumbersExt = "FixedPointNumbers"
- Line 1437, : StaticArraysStatisticsExt = "Statistics"
- Line 1469, : StatsFunsInverseFunctionsExt = "InverseFunctions"
- Line 1497, : StructArraysSparseArraysExt = "SparseArrays"
- Line 1498, : StructArraysStaticArraysExt = "StaticArrays"

**/data/raw/IPEDS_200304/ic2003.do**

- Line 62, : label variable regaccrd "Name of regional accrediting agency"
- Line 18, : * calculations for missing values.
- Line 26, : * For long lists of value labels, the titles may be
- Line 40, : label variable peo6istr "Secondary (high school)"
- Line 43, : label variable pubsecon "Secondary public control"
- Line 47, : label variable level3 "Associate^s degree"
- Line 49, : label variable level5 "Bachelor^s degree"
- Line 51, : label variable level7 "Master^s degree"
- Line 53, : label variable level9 "Doctor^s degree"
- Line 54, : label variable level10 "First-professional degree"
- Line 56, : label variable level12 "Other degree"
- Line 67, : label variable admcon1 "Secondary school GPA"
- Line 68, : label variable admcon2 "Secondary school rank"
- Line 69, : label variable admcon3 "Secondary school record"
- Line 93, : label variable xsatnum "Imputation field for SATNUM - Number of first-time degree/certificate-seeking students submitting SAT scores"
- Line 94, : label variable satnum "Number of first-time degree/certificate-seeking students submitting SAT scores"
- Line 95, : label variable xsatpct "Imputation field for SATPCT - Percent of first-time degree/certificate-seeking students submitting SAT scores"
- Line 96, : label variable satpct "Percent of first-time degree/certificate-seeking students submitting SAT scores"
- Line 97, : label variable xactnum "Imputation field for ACTNUM -  Number of first-time degree/certificate-seeking students submitting ACT scores"
- Line 98, : label variable actnum "Number of first-time degree/certificate-seeking students submitting ACT scores"
- Line 99, : label variable xactpct "Imputation field for ACTPCT - Percent of first-time degree/certificate-seeking students submitting ACT scores"
- Line 100, : label variable actpct "Percent of first-time degree/certificate-seeking students submitting ACT scores"
- Line 135, : label variable slo8 "Teacher certification (below the postsecondary level)"
- Line 161, : label variable sport4 "NCAA/NAIA member for cross country/track"
- Line 164, : label variable pctpost "Percentage of students enrolled in postsecondary programs"
- Line 174, : label variable ft_ftug "Full time first-time degree/certificate-seeking undergraduate students enrolled"
- Line 178, : label variable pt_ftug "Part time first-time degree/certificate-seeking undergraduate students enrolled"
- Line 180, : label variable tuitvary "Tuition charge varies for in-district, in-state, out-of-state students"
- Line 182, : label variable xroomcap "Imputation field for ROOMCAP - Total dormitory capacity"
- Line 183, : label variable roomcap "Total dormitory capacity"
- Line 234, : label define label_pubprime 4 "School district", add
- Line 237, : label define label_pubprime 7 "City", add
- Line 238, : label define label_pubprime 8 "Special district", add
- Line 244, : label define label_pubsecon 4 "School district", add
- Line 247, : label define label_pubsecon 7 "City", add
- Line 248, : label define label_pubsecon 8 "Special district", add
- Line 303, : label define label_relaffil 82 "Reorganized Latter Day Saints Church", add
- Line 312, : label define label_relaffil 94 "Latter Day Saints (Mormon Church)", add
- Line 411, : label define label_regaccrd 9 "Western Assoc. of Schools and Colleges, Community & Jr. Colleges", add
- Line 988, : label define label_confno1 110 "Colonial Athletic Association", add
- Line 1023, : label define label_confno1 147 "Lone Star Conference", add
- Line 1039, : label define label_confno1 166 "City University of New York Ath Conf", add
- Line 1143, : label define label_confno2 110 "Colonial Athletic Association", add
- Line 1178, : label define label_confno2 147 "Lone Star Conference", add
- Line 1194, : label define label_confno2 166 "City University of New York Ath Conf", add
- Line 1298, : label define label_confno3 110 "Colonial Athletic Association", add
- Line 1333, : label define label_confno3 147 "Lone Star Conference", add
- Line 1349, : label define label_confno3 166 "City University of New York Ath Conf", add
- Line 1453, : label define label_confno4 110 "Colonial Athletic Association", add
- Line 1488, : label define label_confno4 147 "Lone Star Conference", add
- Line 1504, : label define label_confno4 166 "City University of New York Ath Conf", add
- Line 39, : label variable peo5istr "Adult basic remedial or high school equivalent"
- Line 40, : label variable peo6istr "Secondary (high school)"
- Line 67, : label variable admcon1 "Secondary school GPA"
- Line 68, : label variable admcon2 "Secondary school rank"
- Line 69, : label variable admcon3 "Secondary school record"
- Line 145, : label variable stusrv8 "On-campus day care for students^ children"
- Line 234, : label define label_pubprime 4 "School district", add
- Line 244, : label define label_pubsecon 4 "School district", add
- Line 402, : label define label_regaccrd 1 "Middle States Assoc. of Colleges and Schools, Comm. on Higher Ed."
- Line 403, : label define label_regaccrd 10 "Western Assoc. of Schools and Colleges, Comm. for Schools", add
- Line 404, : label define label_regaccrd 11 "Western Assoc. of Schools and Colleges, Comm. for Sr. Coll & Univ", add
- Line 405, : label define label_regaccrd 3 "New England Assoc. of Schools and Colleges, Inst. of Higher Ed.", add
- Line 406, : label define label_regaccrd 4 "New England Assoc. of Schools and Colleges, Tech. and Career Inst.", add
- Line 407, : label define label_regaccrd 5 "North Central Assoc. of Colleges and Schools, Higher Learning Comm.", add
- Line 408, : label define label_regaccrd 6 "North Central Assoc. Comm. on Accreditation and School Improvement", add
- Line 409, : label define label_regaccrd 7 "Northwest Assoc. of Schools and of Colleges and Univ.", add
- Line 410, : label define label_regaccrd 8 "Southern Association of Colleges and Schools, Comm. on Colleges", add
- Line 411, : label define label_regaccrd 9 "Western Assoc. of Schools and Colleges, Community & Jr. Colleges", add
- Line 493, : label define label_xapplcnm 24 "Ratio adjustment based on enrollment  by race and gender (part A)", add
- Line 507, : label define label_xapplcnw 24 "Ratio adjustment based on enrollment  by race and gender (part A)", add
- Line 521, : label define label_xadmssnm 24 "Ratio adjustment based on enrollment  by race and gender (part A)", add
- Line 535, : label define label_xadmssnw 24 "Ratio adjustment based on enrollment  by race and gender (part A)", add
- Line 549, : label define label_xenrlftm 24 "Ratio adjustment based on enrollment  by race and gender (part A)", add
- Line 563, : label define label_xenrlftw 24 "Ratio adjustment based on enrollment  by race and gender (part A)", add
- Line 577, : label define label_xenrlptm 24 "Ratio adjustment based on enrollment  by race and gender (part A)", add
- Line 591, : label define label_xenrlptw 24 "Ratio adjustment based on enrollment  by race and gender (part A)", add
- Line 611, : label define label_xsatnum 24 "Ratio adjustment based on enrollment  by race and gender (part A)", add
- Line 625, : label define label_xsatpct 24 "Ratio adjustment based on enrollment  by race and gender (part A)", add
- Line 639, : label define label_xactnum 24 "Ratio adjustment based on enrollment  by race and gender (part A)", add
- Line 653, : label define label_xactpct 24 "Ratio adjustment based on enrollment  by race and gender (part A)", add
- Line 667, : label define label_xsatvr25 24 "Ratio adjustment based on enrollment  by race and gender (part A)", add
- Line 681, : label define label_xsatvr75 24 "Ratio adjustment based on enrollment  by race and gender (part A)", add
- Line 695, : label define label_xsatmt25 24 "Ratio adjustment based on enrollment  by race and gender (part A)", add
- Line 709, : label define label_xsatmt75 24 "Ratio adjustment based on enrollment  by race and gender (part A)", add
- Line 723, : label define label_xactcm25 24 "Ratio adjustment based on enrollment  by race and gender (part A)", add
- Line 737, : label define label_xactcm75 24 "Ratio adjustment based on enrollment  by race and gender (part A)", add
- Line 751, : label define label_xacten25 24 "Ratio adjustment based on enrollment  by race and gender (part A)", add
- Line 765, : label define label_xacten75 24 "Ratio adjustment based on enrollment  by race and gender (part A)", add
- Line 779, : label define label_xactmt25 24 "Ratio adjustment based on enrollment  by race and gender (part A)", add
- Line 793, : label define label_xactmt75 24 "Ratio adjustment based on enrollment  by race and gender (part A)", add
- Line 1625, : label define label_xappfeeu 24 "Ratio adjustment based on enrollment  by race and gender (part A)", add
- Line 1639, : label define label_xappfeeg 24 "Ratio adjustment based on enrollment  by race and gender (part A)", add
- Line 1653, : label define label_xappfeep 24 "Ratio adjustment based on enrollment  by race and gender (part A)", add
- Line 1696, : label define label_xroomcap 24 "Ratio adjustment based on enrollment  by race and gender (part A)", add
- Line 1715, : label define label_xmealswk 24 "Ratio adjustment based on enrollment  by race and gender (part A)", add
- Line 1729, : label define label_xroomamt 24 "Ratio adjustment based on enrollment  by race and gender (part A)", add
- Line 1743, : label define label_xbordamt 24 "Ratio adjustment based on enrollment  by race and gender (part A)", add
- Line 1757, : label define label_xrmbdamt 24 "Ratio adjustment based on enrollment  by race and gender (part A)", add
- Line 1771, : label define label_xenrlm 24 "Ratio adjustment based on enrollment  by race and gender (part A)", add
- Line 1785, : label define label_xenrlw 24 "Ratio adjustment based on enrollment  by race and gender (part A)", add
- Line 1799, : label define label_xenrlt 24 "Ratio adjustment based on enrollment  by race and gender (part A)", add
- Line 1813, : label define label_xapplcn 24 "Ratio adjustment based on enrollment  by race and gender (part A)", add
- Line 1827, : label define label_xadmssn 24 "Ratio adjustment based on enrollment  by race and gender (part A)", add
- Line 1841, : label define label_xenrlft 24 "Ratio adjustment based on enrollment  by race and gender (part A)", add
- Line 1855, : label define label_xenrlpt 24 "Ratio adjustment based on enrollment  by race and gender (part A)", add

**/code/analysis/fitOutcomeModels2024.jl**

- Line 18, : ww_UTA =  hcat( [[1.0; CC.zi[ii][7,J+1:end]; ttt[ii]*1.0; longhorn[ii]; century[ii]; ziRaw[ii,:classrank].^2; ziRaw[ii,:classrank].^3] for ii=1:II]...) |> transpose |> collect
- Line 49, : zq_UTA = hcat( [ [1.0; CC.zi[ii][7,J+1:end]; longhorn[ii]; Eq[:eqbm][7,ii]; Ev[:eqbm][7,ii]] for ii=1:II]...) |> transpose |> collect
- Line 53, : zq_UTA = hcat( [ [1.0; CC.zi[ii][7,J+1:end]; longhorn[ii]; Eq[:eqbm][7,ii]] for ii=1:II]...) |> transpose |> collect

**/code/setup/sample_balance_appendix.do**

- Line 5, : label variable longhorn "LOS"
- Line 9, : label variable latino "Hispanic"
- Line 22, : global lhsvars "longhorn wv2 ttt"
- Line 23, : global outcomes "female black latino white asian SATr SATratio econdisadv apply_anywhere numapps Aij Ap_finaid_schol Bij"
- Line 27, : local cons=_b[_cons]
- Line 29, : local `var'_control = `cons'
- Line 30, : local `var'_treat = `cons' + _b[`treatvar']
- Line 31, : local diff_`var' = _b[`treatvar']
- Line 34, : local N`var'=N
- Line 35, : local N`var': di %12.0gc `N`var''
- Line 37, : local `var'_treat: di %6.2fc ``var'_treat'
- Line 38, : local `var'_control: di %12.2fc ``var'_control'
- Line 39, : local diff_`var': di %6.2fc `diff_`var''
- Line 51, : reg `treatvar' female black latino white SATr SATratio econdisadv
- Line 68, : *tex \multicolumn{5}{p{1\textwidth}}{\scriptsize  Notes: All data from HUD, with the exception of intention to move within three months and moving for schools, which are derived from baseline survey data on GoSection8. "HH" stands for Head of Household. Differences estimated from a regression of the baseline variable on a `treatvar' indicator. Robust standard errors.} \\
- Line 68, : *tex \multicolumn{5}{p{1\textwidth}}{\scriptsize  Notes: All data from HUD, with the exception of intention to move within three months and moving for schools, which are derived from baseline survey data on GoSection8. "HH" stands for Head of Household. Differences estimated from a regression of the baseline variable on a `treatvar' indicator. Robust standard errors.} \\

**/code/analysis/describeFit2024.jl**

- Line 33, : # use_old_simdata_approach || @assert sum(sum(myinds)) .== II   #in real data we have to get every obs; in simulations we have some GPA==1.0 which we can ignore here.
- Line 175, : for (m,ix_surv,mytag) in zip(1:2,[1:7,findall(JTXpublic)],["All 4-year", "All Public"])

**/code/setup/sumstats2.do**

- Line 22, : drop if college=="NAME OF R DELETED"
- Line 5, : use "${workfiles_path}\seniorsvy_long_disaggregated", clear
- Line 15, : levelsof college if collegeID==`i', local(collegetype)
- Line 43, : use "${workfiles_path}\seniorsvy_long_disaggregated", clear
- Line 3, : called by mergeIPEDSexport.do
- Line 56, : hist gradrate, title("Graduation rate among surveyed seniors, by high school") width(.01) start(.9)

**/code/analysis/describeNumbers.jl**

- Line 3, : meas_ttt_boot = [sum(pwt[CC.ttt[ibt]]) for (pwt,ibt) in zip(popwts_boot,inds_boot)]

**/code/setup/sumstats4.do**

- Line 16, : topfile(topf.tex) bottomfile(botf2.tex) style(tex) replace rename(_cons cons) drop(J_* o.* cons)
- Line 22, : topfile(topf.tex) bottomfile(botf2.tex) style(tex) replace rename(_cons cons) /* drop(_cons) */
- Line 31, : topfile(topf.tex) bottomfile(botf2.tex) style(tex) replace rename(_cons cons) /* drop(_cons) */
- Line 19, : probit Aij distance classrank SATr fracOwnRace minority longhorn century econdisad if collegeID==228778 // UTA
- Line 24, : lincom longhorn-century // expect this to be positive
- Line 28, : probit Aij distance classrank SATr fracOwnRace minority longhorn century econdisad if collegeID==228723 // TAMU
- Line 33, : lincom longhorn-century // expect this to be negative

**/code/setup/ExportCollegeNames.do**

- Line 8, : outsheet collegeID college using "${workfiles_path}\toMatlab\collegeNames.txt", replace noquote

**/code/analysis/describeParameters2024.jl**

- Line 4, : function print_results(varnames,dfmeans,dfsd,titles; f=stdout, supertitles=[])
- Line 12, : for r=1:length(varnames)
- Line 13, : println(f,varnames[r] * " & "*join(myround.(Vector( dfmeans[r,:])), " & ") * " \\\\")
- Line 55, : vnames_gamma = ["Constant","SAT","Class Rank","SAT Ratio","Poverty","URM","Scholarship","Caliber (q)"]
- Line 67, : print_results(vnames_gamma,df_γ_mean[:,inds_noprobit],
- Line 72, : print_results(vnames_gamma,df_γ_mean[:,inds_probit],
- Line 77, : print_results(vnames_gamma,df_γ_mean,df_γ_sd,titles_gamma, f=f, supertitles=supertitles_gamma )
- Line 84, : vnames_info = ["Constant","Poverty","URM"]
- Line 102, : print_results(vnames_info,df_info_mean,df_info_sd,titles_info, f=f )
- Line 498, : # for (res,name) in zip([enroll_top10_all,enroll_rest_all,enroll_urm_all,enroll_theil_all],
- Line 501, : #     plt = waterfall(1:4,[ys[1]; ys[2:end].-ys[1:end-1]],axis = (xticks = (1:4, xlabels), title="$name Total Enrollment"),)
- Line 554, : name_x = ["Dist < 25","Distance","URM","URM X UTA", "URM X TAMU", "Poverty","Poverty X UTA", "Poverty X TAMU", "LOS X UTA", "Century X TAMU", "SAT", "Class Rank", "SAT / HS Mean SAT", "SAT X TAMU", "SAT X UTA", "SAT X Private"]
- Line 555, : name_z = ["SAT","Class Rank", "SAT/HS mean SAT","Poverty","URM"]
- Line 556, : name_J = ["In-State Public","Private","Out-of-State Public","Relig.","Elite Private","Texas A\\&M", "UT Austin"]
- Line 557, : name_rc = ["Distance","S/F Ratio","UTA vs TAMU"]
- Line 558, : name_zinfo = ["Const","Poverty","URM"]
- Line 560, : paramnames = [
- Line 561, : ["\$\\underline\\pi\$ Eqbm. ($(z))" for z in name_J];
- Line 562, : ["\$\\gamma\$ ($z)" for z in name_z];
- Line 563, : ["\$\\gamma^s\$ ($z)" for z in name_zinfo];
- Line 564, : ["\$\\gamma^{q|s}\$ ($z)" for z in name_zinfo];
- Line 566, : ["\$\\gamma^{fixed}\$ ($z)" for z in name_zinfo];
- Line 567, : ["\$\\gamma^{var}\$ ($z)" for z in name_zinfo];
- Line 568, : ["\$\\gamma^{shock}\$ ($z)" for z in name_zinfo[1:1]];
- Line 570, : ["\$\\beta^{(w,x,z)}\$ ($x)" for x in name_J];
- Line 571, : ["\$\\beta^{(w,x,z)}\$ ($x)" for x in name_x];
- Line 572, : ["\$\\log(\\sigma^{rc})\$ ($x)" for x in name_rc];
- Line 573, : ["\$\\beta^{aware}\$ ($x)" for x in name_J];
- Line 574, : ["\$\\beta^{aware}\$ ($x)" for x in name_x];
- Line 577, : ["\$\\alpha^{aid}\$ ($z)" for z in name_J];
- Line 578, : ["\$\\log(\\sigma^{e})\$ ($x)" for x in name_J];
- Line 579, : ["\$\\gamma^{shock}\$ ($z)" for z in name_zinfo[2:3]];
- Line 587, : df_out = DataFrame(ind=1:length(θ),paramnames=paramnames,estimate=θ,se=se,p5=p5,p95=p95)
- Line 625, : mynames = ["TTP", "Aid Awareness Only", "Aid Awareness + TTP", "Top 5\\% zg", "Top 10\\% zg", "Top 15\\% zg", "Top 20\\% zg"]
- Line 627, : DataFrame(Policy = mynames, UTA = myfun(7), TAMU = myfun(6), otherpublic = myfun(1))
- Line 86, : "Var. Shocks \$ \\gamma^{\\varepsilon_\\text{app}} \$"]
- Line 183, : for (_ss,ws) in zip(Qnodes,Qweights)
- Line 185, : for (_qq,wq) in zip(Qnodes,Qweights)
- Line 199, : zg_eqbm_uta = zg_eqbm[loc_UTA,:]
- Line 221, : zg_eqbm_uta = zg_eqbm[loc_UTA,:]
- Line 297, : for (qq,ww) in zip(Qnodes,Qweights)
- Line 498, : # for (res,name) in zip([enroll_top10_all,enroll_rest_all,enroll_urm_all,enroll_theil_all],

**/code/analysis/TTTestimate_noallocation.jl**

- Line 215, : const nRC = length(getVarnames(Val{:unpackThetaA}())[:beta_rc])
- Line 431, : namesA =  getVarnames(Val{:unpackThetaA}())
- Line 432, : namesB =  getVarnames(Val{:unpackThetaB}())
- Line 433, : const ind_aid_vij = namesA[:beta_aid_vij]
- Line 434, : const ind_aid_j = namesA[:beta_aid_j]
- Line 435, : const ind_aid_y = namesA[:beta_aid_y]
- Line 436, : const ind_c0 = namesA[:gamma_c0]
- Line 437, : const ind_c1 = namesA[:gamma_c1]
- Line 438, : const ind_lam_in = namesA[:lam_in]
- Line 439, : const ind_lam_smooth = namesA[:lam_smooth]
- Line 440, : const ind_gamma_info_sigS = namesA[:gamma_info_sigS]
- Line 441, : const ind_piBar = namesB[:piBar]
- Line 442, : const ind_gamma = namesB[:gamma]
- Line 443, : const ind_gamma_sigq_resid = namesB[:gamma_info_sigq_resid]
- Line 98, : const pr_template = similar(Wvec[1].TT); pr_template.nzval .= 1.0
- Line 267, : # if ii.characteristics.Century && (ii.Aware[loc_TAMU,mm] .> 0)
- Line 268, : # 	aid_amount[id][loc_TAMU] = max(maxprice[loc_TAMU], aid_amount[id][loc_TAMU])
- Line 269, : # 	fullneed[id][loc_TAMU] = 1.0
- Line 271, : # if ii.characteristics.los && (ii.Aware[loc_UTA,mm] .> 0)
- Line 272, : # 	aid_amount[id][loc_UTA] = max(maxprice[loc_UTA], aid_amount[id][loc_UTA])
- Line 273, : # 	fullneed[id][loc_UTA] = 1.0
- Line 344, : # allocation occurs below
- Line 353, : # allocation occurs above
- Line 355, : ii.characteristics.Century && (ii.Aware[loc_TAMU,mm] .> 0) && (maxprice[loc_TAMU] == aid_amount[id][loc_TAMU]) && (daid_amount[id][loc_TAMU]=0.0; dfullneed[id][loc_TAMU]=0.0) #dmaxprice[loc_TAMU] += daid_amount[id][loc_TAMU];
- Line 356, : ii.characteristics.los && (ii.Aware[loc_UTA,mm] .> 0) && (maxprice[loc_UTA] == aid_amount[id][loc_UTA]) && (daid_amount[id][loc_UTA]=0.0; dfullneed[id][loc_UTA]=0.0) #dmaxprice[loc_UTA] += daid_amount[id][loc_UTA];
- Line 406, : for (ff,w) in zip(GH_nodes, GH_weights)
- Line 461, : # #  recalculate logPrAwareObs in case it was messed up (not sure if needed)
- Line 476, : for (ff,w) in zip(GH_nodes,GH_weights)
- Line 149, : function getlikelihood_s(W,ii::Person,ss,thetaA, thetaAid, id; prAwareObsGiven=false,ind=0)
- Line 252, : function dGetUnew_fast!(thetaA,thetaAid,ii::Person, mm, aux, Xj, fwd_only=Val{true}(), id::Int=1)
- Line 387, : function getobj_i_fast(ii::Int,thetaA,thetaAid,thetaB, id, persons=persons; prAwareObsGiven = false)
- Line 388, : #println("getobj_i: person $ii, thread $id")
- Line 394, : ttti = persons[ii].characteristics.ttt
- Line 395, : zg = persons[ii].zi'*gamma
- Line 396, : c0 = gamma_c0'*persons[ii].costi
- Line 397, : c1 = gamma_c1'*persons[ii].costi
- Line 398, : sig_s = log1pexp(dot(persons[ii].infoi,gamma_info_sigS))
- Line 399, : sigq_resid = log1pexp(dot(persons[ii].infoi,gamma_info_sigq_resid))
- Line 402, : dGetUnew_fast!(thetaA,thetaAid,persons[ii], mm, aux, Xj, Val{true}(),id)
- Line 413, : lik += w*getlikelihood_s(W,persons[ii],ss,thetaA, thetaAid, id, prAwareObsGiven=prAwareObsGiven,ind=ii)::Float64
- Line 445, : #println("dgetobj_i: person $ii, thread $id")
- Line 450, : ttti = persons[ii].characteristics.ttt
- Line 451, : zg = persons[ii].zi'*gamma
- Line 452, : c0 = gamma_c0'*persons[ii].costi
- Line 453, : c1 = gamma_c1'*persons[ii].costi
- Line 454, : sig_s = log1pexp(dot(persons[ii].infoi,gamma_info_sigS))
- Line 455, : sigq_resid = log1pexp(dot(persons[ii].infoi,gamma_info_sigq_resid))
- Line 462, : # prAware[id] .= logistic.( persons[ii].vij_rc*beta_aid_vijrc .+ beta_aid_y .* persons[ii].Y' .+ beta_aid_0)
- Line 463, : # prAwareObsMat[id] .= eps() .+ prAware[id] .* (persons[ii].Aware .> 0) .+ (1.0 .- prAware[id]) .* (persons[ii].Aware .== 0)
- Line 464, : # logPrAwareObs[id] .= vec(sum(log.(prAwareObsMat[id]),dims=1)) .- log.( (persons[ii].pr0Aware./sum(persons[ii].pr0Aware)))
- Line 471, : dGetUnew_fast!(thetaA,thetaAid,persons[ii], mm, aux, Xj, Val{true}(),id)
- Line 485, : lik = w*getlikelihood_s(Wvec[id],persons[ii],zg+ss,thetaA,thetaAid,id)
- Line 509, : dbeta_aid_vij, dbeta_aid_y, dbeta_aid_j = dgetlikelihood_s(W,persons[ii],zg+ss,dlik_s,id)
- Line 515, : dthetaA[ind_c0] .+= dc0.*persons[ii].costi
- Line 516, : dthetaA[ind_c1] .+= dc1.*persons[ii].costi
- Line 521, : dthetaA[ind_gamma_info_sigS] .+= dsig_s .* ((exp(sig_s)-1)/exp(sig_s)) .* persons[ii].infoi
- Line 523, : dthetaB[ind_gamma] .+= dzgs.*persons[ii].zi
- Line 524, : dthetaB[ind_gamma_sigq_resid] .+= dsigq_resid .* ((exp(sigq_resid)-1)/exp(sigq_resid)) .* persons[ii].infoi
- Line 529, : _dthetaA, _dthetaAid = dGetUnew_fast!(thetaA,thetaAid,persons[ii], mm, aux, Xj, Val{false}(),id)
- Line 540, : function getobj(thetaA,thetaAid,thetaB, myrange=1:length(persons), weight_moments=1.0, aid_data=aid_data; val_only=false, persons=persons, fullneed_data=fullneed_data, prAwareObsGiven=false)
- Line 549, : loglik_i, aid_i, c_i, fullneed_i = getobj_i_fast(ii,thetaA,thetaAid,thetaB,id,persons,prAwareObsGiven=prAwareObsGiven)
- Line 551, : aids[:,ix] .= aid_i .* persons[ii].characteristics.weight
- Line 552, : prC[:,ix] .= c_i .* persons[ii].characteristics.weight
- Line 553, : fullneeds[:,ix] .= fullneed_i .* persons[ii].characteristics.weight
- Line 581, : daid_i = dsumaids .* persons[ii].characteristics.weight
- Line 582, : dfullneed_i = dsumfullneeds .* persons[ii].characteristics.weight
- Line 583, : dc_i = dsumprC .* persons[ii].characteristics.weight
- Line 599, : function getOmega(thetaA,thetaAid,thetaB,myrange=1:length(persons), weight_moments=1.0, aid_data=aid_data)

**/code/setup/sumstats1.do**

- Line 114, : rename students n
- Line 26, : local apps = "a b c d e"
- Line 27, : foreach i of local apps {
- Line 113, : gen schools = 1
- Line 116, : sum c(sum schools mean n mean topten mean numapps mean num_admit mean apply_anywhere mean admit_anywhere) ///
- Line 130, : // to add: SAT-taking?  Evidence of "mismatch" -- e.g. do students from worse schools go to worse colleges?  Ratio of SAT scores??

**/code/analysis/startvals.jl**

- Line 11, : for k in keys(varnamesB)
- Line 12, : println("$k = $(round.([thetaB[varnamesB[k]]...],digits=3))")
- Line 31, : for k in keys(varnamesA)
- Line 32, : println("$k = $(round.([thetaA[varnamesA[k]]...],digits=3))")
- Line 2, : JLD2.@load "$filepath/results_cfctls.jld2" persons thetaA thetaAid thetaB
- Line 4, : # for person in persons
- Line 5, : # 	updateFinaidAwarenessDraws!(thetaA, person, aux)
- Line 9, : #res = getThetaB(zeros(J+6),weights_msi,aux,persons)
- Line 54, : for person in persons
- Line 55, : updateFinaidAwarenessDraws!(thetaA, person, aux)

**/code/analysis/makeUnpackerTTT.jl**

- Line 1, : macro makeUnpacker(mname, args...)
- Line 5, : varnames = OrderedDict()
- Line 11, : #get indices and names of variables
- Line 25, : varname = var.args[2]
- Line 26, : rhs = Expr(:(=),varname, ref)
- Line 30, : varname = var.args[2].args[2]
- Line 31, : rhs = Expr(:(=),varname, Expr(:.,fun,Expr(:tuple,ref)))
- Line 34, : #names of variables
- Line 35, : push!(varnames,varname=>indices)
- Line 36, : push!(varfuns,varname=>fun)
- Line 38, : mnamequot = Expr(:quote,mname)
- Line 39, : println("makeUnpacker: making @$mname: $counter variables")
- Line 43, : function getSE(theta,se_vec, ::Val{$mnamequot})
- Line 44, : varnames = $varnames
- Line 52, : for (k,inds) in varnames
- Line 59, : function getVals(theta, ::Val{$mnamequot})
- Line 60, : varnames = $varnames
- Line 68, : for (k,inds) in varnames
- Line 75, : function getVarnames(::Val{$mnamequot})
- Line 76, : $varnames
- Line 79, : Expr(:macro, Expr(:call,mname,theta),
- Line 40, : esc(Expr(:block,
- Line 80, : Expr(:block, Expr(:call,:esc, Expr(:call,:Expr, Expr(:quote,:block), newargs...))))))
- Line 15, : ref = Expr(:ref, Expr(:$,theta), Expr(:call, Expr(:curly,:SVector,varlength), varinds.args...))

**/code/analysis/TTTnew.jl**

- Line 29, : #fname = "$filepath/results.csv"
- Line 6, : const simulate_data = false
- Line 13, : const load_saved_boot_cutoffs_step2 = false #in bootstrap step 2, reuse previously-calculated cutoffs
- Line 23, : const simulated_data_path = "$mypath/data/simulated"
- Line 24, : const true_data_path = "$mypath/data/workfiles/toMatlab" #simulated data! "C:/Users/akapor/Documents/JMP_data/Replication/Workfiles/toMatlab" #not available
- Line 25, : const datapath = use_old_simdata_approach ? simulated_data_path : true_data_path
- Line 26, : const publicTHEOPdatapath = "$mypath/data/raw/THEOP_public_simulated" #"C:/Users/akapor/Documents/JMP_data/Workfiles/toMatlab" #location of public-use THEOP admin data files; used for robustness in Appendix
- Line 34, : const loc_UTA = 7
- Line 35, : const loc_TAMU = 6
- Line 45, : include("$codepath/loadSimulatedData.jl")
- Line 54, : include("$codepath/TTTestimate_noallocation.jl")
- Line 88, : simulate_data && include("$codepath/simulateData.jl")
- Line 90, : Random.seed!(1234567) #seed gets set when simulating data; make sure rest of code doesn't depend on whether we did the simulate data step
- Line 91, : include("$codepath/fitOutcomeModels2024.jl") #second-stage estimation
- Line 107, : zg_uta = zg[loc_UTA,:]
- Line 122, : include("$codepath/describe_extensions.jl") #other things to calculate
- Line 66, : getFinaidAwarenessDraws!(zeros(nx),0.0,0.0,CC,ii) #need this, otherwise may be wrong about schools applied to

**/code/analysis/TTTsetupEverywhere.jl**

- Line 152, : collegeNames = CSV.read("$datapath/CollegeNames.txt",DataFrame,delim='\t',header=1)#[[1:5; 11; 12],:]
- Line 154, : XjRaw = leftjoin(collegeNames,XjRaw,on=:collegeID)
- Line 237, : #calculate subset of portfolios, and outcomes
- Line 86, : struct PersonCharacteristics
- Line 94, : struct Person{T,S}
- Line 106, : characteristics::PersonCharacteristics
- Line 184, : function updateFinaidAwarenessDraws!(thetaA, ii::Person, aux::Aux) # Apps_i, Finaid_apps_i, pr0, J=J, M=32)

**/code/setup/descriptive_AdminVSurvey.do**

- Line 7, : rename econdisadv hsecon
- Line 8, : rename SATmean_s SATmean
- Line 9, : rename B_unknown Unknown
- Line 19, : *tabulate source, summarize(SATr satRatio) // if Aij & (collegeID==228778)
- Line 27, : (2) matriculation */

**/code/setup/aggregateMultiApps.do**

- Line 10, : levelsof collegeID, local(colleges)
- Line 1, : // drop duplicate "minor schools", but aggregate number of apps and admissions

**/code/analysis/tests_2024.jl**

- Line 16, : @time dobj_i_new(dθ, d_loglik,d_avgaid,θ0,CC,2)
- Line 24, : ll0,aid0 = dobj_i_new(d_θ,d_loglik,d_avgaid,θ0,CC,ii)
- Line 53, : ll0,aid0,d_θ = dobj_i_new(d_loglik,d_avgaid,θ,CC,ii)
- Line 3, : #timing and allocation, objective
- Line 9, : @assert @allocated(obj_i_new(θ0,CC,2)) <= 32
- Line 297, : @assert (@allocated d_getvaladmit(d_ui,d_valadmit,ui,λ,ws,dws,CC)) <= 16
- Line 36, : bad_fit && println("person $ii, param $xx: numeric=$numeric, analytic=$(d_θ[xx]) xxx")
- Line 54, : any(isnan,d_θ) && error("nan derivative, person $ii")
- Line 55, : any(isinf,d_θ) && error("inf derivative, person $ii")

**/code/analysis/bootstrapFunctions2024.jl**

- Line 1, : function resample_CC(CC=CC,hsid=vijRaw[!,:hsid_c],block=false)
- Line 2, : #get new indices and pop. weights by block resampling
- Line 3, : if block
- Line 69, : ww_UTA_t =  hcat( [[1.0; CC.zi[ii][7,J+1:end]; CC.ttt[ii]*1.0; longhorn[ii]; century[ii]; ziRaw[ii,:classrank].^2; ziRaw[ii,:classrank].^3] for ii=newinds]...) |> transpose |> collect
- Line 73, : zq_UTA_t = hcat( [ [1.0; CC.zi[ii][7,J+1:end]; longhorn[ii]; Eq_eqbm_t[7,ix]; Ev_eqbm_t[7,ix]] for (ix,ii)=enumerate(newinds)]...) |> transpose |> collect
- Line 77, : zq_UTA_t = hcat( [ [1.0; CC.zi[ii][7,J+1:end]; longhorn[ii]; Eq_eqbm_t[7,ix]] for (ix,ii)=enumerate(newinds)]...) |> transpose |> collect
- Line 83, : for (coefs_admin,vcov_admin,zq_t,ww_t,indJ,symb) in zip(
- Line 88, : repeat([loc_UTA,loc_TAMU],inner=3),
- Line 223, : zg_uta = zg[loc_UTA,:]
- Line 279, : zg_uta = zg[loc_UTA,:]
- Line 348, : for (coefs_admin,vcov_admin) in zip(
- Line 387, : zg_uta = zg[loc_UTA,:]
- Line 45, : y = persons[ii].Y,
- Line 46, : efc = persons[ii].EFC,

**/code/setup/crosswalk.do**

- Line 9, : rename act ACT
- Line 14, : use "${workfiles_path}\_temp_long"
- Line 3, : called by mergeIPEDSexport.do

**/code/analysis/describeResultsFunctions2024.jl**

- Line 156, : cfname = "($(m+2)) Aligned Rules"
- Line 164, : push!(dfrows, (cf=cfname, treatedgroup=trg, meas_group=meas_group, base=base, direct=direct, info=info, eqbm=sse[Symbol("by_zg_$q")]/meas_group))
- Line 168, : cfname = "($(m+6)) $(q) Acad. Index"
- Line 169, : basename = Symbol("baseline_reweightAcadIndex_$m")
- Line 170, : push!(dfrows, (cf = cfname, treatedgroup = "Top 10\\% (Rank)", meas_group=sum_wt, base=sse[basename]/sum_wt, direct=sse[:direct]/sum_wt, info=sse[:info]/sum_wt, eqbm=sse[:eqbm]/sum_wt))
- Line 55, : # zq_UTA = hcat( [ [1.0; CC.zi[ix][7,J+1:end]; longhorn[ii]; Eq[:eqbm][7,ix]] for (ix,ii) in enumerate(inds)]...) |> transpose |> collect
- Line 64, : zq_UTA = hcat( [ [1.0; CC.zi[ix][7,J+1:end]; longhorn[ii]; NaN] for (ix,ii) in enumerate(inds)]...) |> transpose |> collect
- Line 68, : zq_UTA = hcat( [ [1.0; CC.zi[ix][7,J+1:end]; longhorn[ii]; NaN; NaN] for (ix,ii) in enumerate(inds)]...) |> transpose |> collect
- Line 78, : zg_uta = zg[loc_UTA,:]
- Line 92, : sumstats[:gpa_uta] = OrderedDict(k=>mean(outcome_hat(zq_UTA,θGPA_UTA,k,loc_UTA,Eq,Ev), Weights(v[loc_UTA,:])) for (k,v) in shares)
- Line 93, : sumstats[:gpa_tamu] = OrderedDict(k=>mean(outcome_hat(zq_TAMU,θGPA_TAMU,k,loc_TAMU,Eq,Ev), Weights(v[loc_TAMU,:])) for (k,v) in shares)
- Line 94, : sumstats[:gpa_flagship] = OrderedDict(k=>(dot(outcome_hat(zq_UTA,θGPA_UTA,k,loc_UTA,Eq,Ev),v[loc_UTA,:])+dot(outcome_hat(zq_TAMU,θGPA_TAMU,k,loc_TAMU,Eq,Ev),v[loc_TAMU,:]))/sum(v[loc_TAMU:loc_UTA,:]) for (k,v) in shares)
- Line 95, : sumstats[:persist_uta] = OrderedDict(k=>mean(outcome_hat(zq_UTA,θpersist_UTA,k,loc_UTA,Eq,Ev), Weights(v[loc_UTA,:])) for (k,v) in shares)
- Line 96, : sumstats[:persist_tamu] = OrderedDict(k=>mean(outcome_hat(zq_TAMU,θpersist_TAMU,k,loc_TAMU,Eq,Ev), Weights(v[loc_TAMU,:])) for (k,v) in shares)
- Line 97, : sumstats[:persist_flagship] = OrderedDict(k=>(dot(outcome_hat(zq_UTA,θpersist_UTA,k,loc_UTA,Eq,Ev),v[loc_UTA,:])+dot(outcome_hat(zq_TAMU,θpersist_TAMU,k,loc_TAMU,Eq,Ev),v[loc_TAMU,:]))/sum(v[loc_TAMU:loc_UTA,:]) for (k,v) in shares)
- Line 98, : sumstats[:stem_uta] = OrderedDict(k=>mean(outcome_hat(zq_UTA,θstem_UTA,k,loc_UTA,Eq,Ev), Weights(v[loc_UTA,:])) for (k,v) in shares)
- Line 99, : sumstats[:stem_tamu] = OrderedDict(k=>mean(outcome_hat(zq_TAMU,θstem_TAMU,k,loc_TAMU,Eq,Ev), Weights(v[loc_TAMU,:])) for (k,v) in shares)
- Line 100, : sumstats[:stem_flagship] = OrderedDict(k=>(dot(outcome_hat(zq_UTA,θstem_UTA,k,loc_UTA,Eq,Ev),v[loc_UTA,:])+dot(outcome_hat(zq_TAMU,θstem_TAMU,k,loc_TAMU,Eq,Ev),v[loc_TAMU,:]))/sum(v[loc_TAMU:loc_UTA,:]) for (k,v) in shares)
- Line 108, : sumstats[:E_pi_UTA] = OrderedDict(k=>mean(zg[loc_UTA,:] + Eshock[k][loc_UTA,:] , Weights(v[loc_UTA,:])) for (k,v) in shares)
- Line 109, : sumstats[:E_pi_TAMU] = OrderedDict(k=>mean(zg[loc_TAMU,:] + Eshock[k][loc_TAMU,:] , Weights(v[loc_TAMU,:])) for (k,v) in shares)
- Line 110, : sumstats[:E_pi_flagship] = OrderedDict(k=>mean(vec( zg[loc_TAMU:loc_UTA,:] + Eshock[k][loc_TAMU:loc_UTA,:]) , Weights(vec( v[loc_TAMU:loc_UTA,:]))) for (k,v) in shares)
- Line 112, : sumstats[:E_caliber_UTA] = OrderedDict(k=>mean(Eq[k][loc_UTA,:] , Weights(v[loc_UTA,:])) for (k,v) in shares)
- Line 113, : sumstats[:E_caliber_TAMU] = OrderedDict(k=>mean(Eq[k][loc_TAMU,:] , Weights(v[loc_TAMU,:])) for (k,v) in shares)
- Line 114, : sumstats[:E_caliber_flagship] = OrderedDict(k=>mean(vec( Eq[k][loc_TAMU:loc_UTA,:]) , Weights(vec( v[loc_TAMU:loc_UTA,:]))) for (k,v) in shares)
- Line 182, : dfr[!,:dgpa] = dfr[!,:meas_group] .* [(sumstats[:gpa_flagship][k1] - sumstats[:gpa_flagship][k0]) for (k1,k0) in zip(withTTT,withoutTTT)] ./ denom
- Line 183, : dfr[!,:dpersist] = 100 .* dfr[!,:meas_group] .* [(sumstats[:persist_flagship][k1] - sumstats[:persist_flagship][k0]) for (k1,k0) in zip(withTTT,withoutTTT)] ./ denom
- Line 184, : dfr[!,:dstem] = 100 .* dfr[!,:meas_group] .* [(sumstats[:stem_flagship][k1] - sumstats[:stem_flagship][k0]) for (k1,k0) in zip(withTTT,withoutTTT)] ./ denom
- Line 185, : dfr[!,:dpayoff] = dfr[!,:meas_group] .* [(sumstats[:E_pi_flagship][k1] - sumstats[:E_pi_flagship][k0]) for (k1,k0) in zip(withTTT,withoutTTT)] ./ denom
- Line 186, : dfr[!,:dcaliber] = [(sumstats[:E_caliber_flagship][k1] - sumstats[:E_caliber_flagship][k0]) for (k1,k0) in zip(withTTT,withoutTTT)] ./ denom
- Line 207, : for (r,m) in zip(7:9,["\$4\\times\$","\$2\\times\$",])

**/code/analysis/describeResults2024.jl**

- Line 80, : names_fig1 = ["A. Flagship Enrollment: Top Decile (% Change, Baseline=$(basevals[1]))", "B. Flagship Enrollment: URM (% Change, Baseline=$(basevals[2]))", "C. Flagship Enrollment: High-Poverty HS (Baseline=$(basevals[3]))", "D. Flagship Enrollment: Affluent HS (Baseline=$(basevals[4]))", "E. Flagship Enrollment: HS Concentration (Theil Index, Baseline=$(basevals[5]))"]
- Line 84, : for (nn,_res,name) in zip(1:5, stats_fig1, names_fig1)
- Line 150, : _ax,_wf = waterfall(pos, x, yvals ,axis = (xticks = (x, xlab), title="$(name)", limits = (nothing,nothing,ll,ul)),
- Line 180, : for (nn,_res,name) in zip(1:4,[:gpa_flagship,:persist_flagship,:stem_flagship,:E_pi_flagship,],
- Line 203, : barplot(pos, x, yvals ,axis = (xticks = (x, xlab), title="$name",
- Line 220, : # for (res,name) in zip([enroll_top10,enroll_rest,enroll_urm,enroll_theil,gpa_flagship,persist_flagship,stem_flagship,E_pi_flagship],
- Line 223, : #     plt = waterfall(1:5,[ ys[2:end].-ys[1:end-1]; ],axis = (xticks = (1:5, xlab2[2:end]), title="Flagship Enrollment: $name"),)
- Line 234, : for (nn,_res,name) in zip(1:8,[:enroll_top10,:enroll_rest,:enroll_urm,:enroll_theil,:gpa_flagship,:persist_flagship,:stem_flagship,:E_pi_flagship],
- Line 248, : _ax,_wf = waterfall(pos,1:4,yvals,axis = (xticks = (1:4, xlab3[2:end]), title="$name", limits=(nothing,nothing,ll,ul)),
- Line 295, : for nn in names(dfr_point)[2:end]
- Line 337, : names_fig1_alt = [
- Line 345, : Label(fig1_alt[2rr-1,1:4], text=names_fig1_alt[rr], fontsize=16)
- Line 50, : zg[loc_UTA,:]
- Line 84, : for (nn,_res,name) in zip(1:5, stats_fig1, names_fig1)
- Line 180, : for (nn,_res,name) in zip(1:4,[:gpa_flagship,:persist_flagship,:stem_flagship,:E_pi_flagship,],
- Line 220, : # for (res,name) in zip([enroll_top10,enroll_rest,enroll_urm,enroll_theil,gpa_flagship,persist_flagship,stem_flagship,E_pi_flagship],
- Line 234, : for (nn,_res,name) in zip(1:8,[:enroll_top10,:enroll_rest,:enroll_urm,:enroll_theil,:gpa_flagship,:persist_flagship,:stem_flagship,:E_pi_flagship],
- Line 13, : #theil index of high schools
- Line 339, : "B. Flagship Enrollment %: High-Poverty High Schools (Baseline=$(basevals[3])%)",
- Line 340, : "C. Flagship Enrollment %: Affluent High Schools (Baseline=$(basevals[4])%)",
- Line 341, : "D. Flagship Enrollment: High School Concentration (Theil Index, Baseline=$(basevals[5]))"]

**/code/analysis/TTTsetupNew.jl**

- Line 20, : popwt_wv2 = _weight_wv2 ./ sum(_weight_wv2) #population weights
- Line 22, : longhorn = ziRaw[!,:longhorn]
- Line 72, : personCharacteristics = PersonCharacteristics(wv2[ii],ttt[ii],longhorn[ii].>0, century[ii].>0,popwt[ii])
- Line 79, : vec_uta = zeros(J); vec_uta[loc_UTA] = 1
- Line 80, : vec_tamu = zeros(J); vec_tamu[loc_TAMU] = 1
- Line 82, : los = longhorn[ii].>0
- Line 89, : pref_UTA = zeros(J); pref_UTA[loc_UTA] = 1.0
- Line 90, : pref_TAMU = zeros(J); pref_TAMU[loc_TAMU] = 1.0
- Line 96, : xgrades_i = [[1.0; zi[ii,:]; longhorn[ii]],  [1.0; zi[ii,:]; century[ii]]]
- Line 97, : wgrades_i = [1.0; zi[ii,:]; ttt[ii]*1.0; longhorn[ii]; century[ii]; ziRaw[ii,:classrank].^2; ziRaw[ii,:classrank].^3]
- Line 40, : deltaBij = max.(Bij,Ci) - Bij  #if you went to school j, you must have been admitted
- Line 47, : Aij = max.(Aij,Bij) #if you got in to school j, you must have applied
- Line 54, : Bij[ttt, JTXpublic] .= Aij[ttt,JTXpublic] #if you have TTT, you got into public schools you applied to
- Line 63, : function encodePerson!(persons,ii)
- Line 72, : personCharacteristics = PersonCharacteristics(wv2[ii],ttt[ii],longhorn[ii].>0, century[ii].>0,popwt[ii])
- Line 100, : person = Person{SMatrix{7,nVij},SMatrix{7,4}}(vij_i, vij_rc_i, SVector{5}(zi[ii,:]...), infoi, costi, xgrades_i, [wgrades_i, wgrades_i], Yi, EFCi, Awarei, pr0Awarei, personCharacteristics, outcome)
- Line 101, : persons[ii] = person
- Line 115, : persons = Array{Person,1}(undef,II)
- Line 116, : println("encoding person:")
- Line 118, : encodePerson!(persons,ii)
- Line 159, : #tttImpossible[aa,bb] is true iff bb involves rejection from schools in aa with ttt guarantee
- Line 175, : const wts = [ii.characteristics.weight for ii in persons]

**/code/analysis/reversemodegradientfunctions_2024.jl**

- Line 275, : for (qq,ww) in zip(Qnodes,Qweights)

**/code/analysis/simulateDataFunctions.jl**

- Line 14, : function simulateHistory_i(ii, CC=CC, ttti_app=CC.ttt[ii], ttti_admit=CC.ttt[ii], θ=θstar, γq=1.0)
- Line 23, : λ = 1/(1+exp(-θ[J+nz+7])) #correlation parameter for final-period shocks
- Line 55, : #draw latent financial aid awareness
- Line 48, : zγ = ws.zγ; mul!(zγ,CC.zi[ii],γadmit)  #all schools

**/code/analysis/runCounterfactuals2024.jl**

- Line 159, : zg_uta = zg[loc_UTA,:]
- Line 165, : #second option: rank everyone  by zg, within high schools; admit top x% automatically
- Line 181, : #     mysymb = Symbol("by_zg_local_$(Int.(100*q))")
- Line 165, : #second option: rank everyone  by zg, within high schools; admit top x% automatically
- Line 166, : function get_top_zg_byschool(qu)
- Line 173, : ttt2 = [get_top_zg_byschool(qu) for qu in myquantiles]
- Line 177, : #     tttnew = get_top_zg_byschool(q)
- Line 280, : jldsave("$filepath/cf_state_cutoffsonly.jld2"; Δcutoff = Δcutoff,)

**/code/analysis/counterfactuals_2024.jl**

- Line 77, : λ = 1/(1+exp(-θ[J+nz+7])) #correlation parameter for final-period shocks
- Line 217, : λ = 1/(1+exp(-θ[J+nz+7])) #correlation parameter for final-period shocks
- Line 268, : for (_qq,wq,Pqq) in zip(Qnodes,Qweights,Pq)
- Line 102, : zγ = ws.zγ; mul!(zγ,CC.zi[ii],γadmit)  #all schools
- Line 242, : zγ = ws.zγ; mul!(zγ,CC.zi[ii],γadmit)  #all schools
- Line 315, : γpersonal = γadmit0[J+1:end] - γacademic
- Line 316, : γadmit_new = [γadmit0[1:J];  γpersonal .+ w .* γacademic; ]

**/code/setup/sumstats3.do**

- Line 2, : drop if college=="NAME OF R DELETED"
- Line 9, : des q73prest // occupational prestige, 1989 us census
- Line 16, : // table 2: multiapps to "aggregate" schools

**/code/setup/new_descriptive.do**

- Line 5, : local prefvars = "distance classrank SATr fracOwnRace minority longhorn century econdisad"
- Line 51, : label variable longhorn "Participates in Longhorn Opp. Scholars Program"
- Line 67, : label variable latino "Latino"
- Line 76, : //mean century longhorn white black latino asian female nguardians ftotval classrank SATr ///
- Line 79, : sutex century longhorn white black latino asian female nguardians classrank SATr SATmean_s SATratio econdisadv ///
- Line 83, : replace adjwt = 0 if adjwt < 0 // never happens in real data; could happen in simulated data for rep package since a Normal was used
- Line 84, : sutex century longhorn white black latino asian female nguardians classrank SATr SATmean_s SATratio econdisadv ///
- Line 104, : outreg using "${tables_path}/means_applevel.tex", bdec(2) merge tex frag varlabels nostar stats(b) ctitles("" "Matriculations") basefont(scriptsize)
- Line 110, : gen urm = max(black,latino)
- Line 112, : reg SATr longhorn if poor & obs_tag
- Line 113, : reg classrank longhorn if poor & obs_tag
- Line 114, : reg SATratio longhorn if poor & obs_tag
- Line 115, : reg econdisadv longhorn if poor & obs_tag
- Line 116, : reg urm longhorn if poor & obs_tag
- Line 118, : reg black longhorn if poor & obs_tag
- Line 119, : reg latino longhorn if poor & obs_tag
- Line 121, : reg century longhorn if poor & obs_tag
- Line 122, : reg female longhorn if poor & obs_tag
- Line 124, : reg numapps_surv longhorn if poor & obs_tag
- Line 125, : reg nB longhorn if poor & obs_tag
- Line 126, : reg nApAid longhorn if poor & obs_tag
- Line 127, : reg nC longhorn if poor & obs_tag & !notwv2
- Line 129, : // reg nB longhorn poor numapps_surv if obs_tag
- Line 18, : // person "accepts" outside option iff they don't accept any inside option

**/code/analysis/estimate_2024.jl**

- Line 31, : λ = 1/(1+exp(-θ[J+nz+7])) #correlation parameter for final-period shocks
- Line 91, : #final matriculation decision
- Line 270, : for (qq,ww) in zip(Qnodes,Qweights)
- Line 295, : #     for (qq,ww) in zip(Qnodes,Qweights)
- Line 55, : zγ = ws.zγ; mul!(zγ,CC.zi[ii],γadmit)  #all schools

**/code/setup/cleanRawSurvey.do**

- Line 5, : local letters = "a b c d e"
- Line 6, : local suffixes = "sch stat"
- Line 7, : drop q50*schtype q50*city
- Line 8, : foreach letter of local letters {
- Line 9, : foreach suffix of local suffixes {
- Line 22, : drop if noResponse  // conflicts are q50sch q50stat q50city

**/code/analysis/startvals_2024.jl**

- Line 95, : for (qq,ww) in zip(Qnodes,Qweights)

**/code/setup/Master.do**

- Line 7, : global rawdata_path = "C:\Users\akapor\Documents\GitHub\TexasTopTen\replication_package\data\raw\ICPSR_29841_simulated" // point to SIMULATED raw datasets

**/code/analysis/loadSimulatedData.jl**

- Line 18, : for k in names(vcovs)
- Line 2, : # replication package: load simulated data
- Line 6, : coefs = CSV.read("$simulated_data_path/OutcomeDataCoefficients.csv",DataFrame)
- Line 7, : vcovs = CSV.read("$simulated_data_path/OutcomeDataVCVs.csv",DataFrame)
- Line 30, : Xj = CSV.read("$simulated_data_path/CollegeCharacteristics.csv",DataFrame)
- Line 32, : #step 3: load simulated individual-level data
- Line 33, : ziRaw = CSV.read("$simulated_data_path/zi.csv",DataFrame)
- Line 34, : vijRaw = CSV.read("$simulated_data_path/vij.csv",DataFrame)
- Line 35, : outcomesRaw = CSV.read("$simulated_data_path/outcomes.csv",DataFrame)
- Line 36, : finaidRaw = CSV.read("$simulated_data_path/finaid_shifters.csv",DataFrame)
- Line 37, : incomeDistRaw = CSV.read("$simulated_data_path/income_CPS.csv",DataFrame)

**/code/analysis/describeNoLOS2024.jl**

- Line 4, : LOS = BitArray(longhorn)
- Line 34, : #gain relative to baseline
- Line 48, : #restrict to URM students: what share of growth at UT Austin accounted for by LOS schools
- Line 55, : pos = Axis(fig_los[1,1], title = "A. Growth in URM Enrollment at UT-Austin", xticks=(1:2,["LOS schools","Other Schools"]), yticks=(0:.05:.6,["$(x)%" for x=0:5:60]), )
- Line 59, : pos = Axis(fig_los[1,2], title = "B. Share of Students from LOS Schools Attending UT-Austin", xticks=(1:2,["As Estimated","Remove LOS"]), yticks=(0:1:15,["$(x)%" for x=0:1:15]), )
- Line 76, : #d7 share of minorities at UTA who would come from LOS schools at baseline!

**/README.tex**

- Line 27, : \@ifundefined{KOMAClassName}{% if non-KOMA class
- Line 41, : pdfcreator={LaTeX via pandoc}}
- Line 43, : \usepackage{longtable,booktabs}
- Line 47, : \patchcmd\longtable{\par}{\if@noskipsec\mbox{}\fi\par}{}{}
- Line 49, : % Allow footnotes in longtable head/foot
- Line 51, : \makesavenoteenv{longtable}
- Line 62, : \hypertarget{template-readme-and-guidance}{%
- Line 73, : then uses these files to estimate the model described in ``Transparency and Percent Plans'', simulate counterfactuals,
- Line 81, : The user should expect this code to run for a few minutes.
- Line 88, : Simulated datasets are provided.
- Line 94, : This paper involves secondary use of data.
- Line 105, : \item THEOP public-use data (Tienda and Sullivan (2011)): accessed via theop.princeton.edu in 2012. This website is no longer operative, but public-use files may be obtained via https://oprdata.princeton.edu/archive/theop/.  %[Note: this dataset is also not included in the replication package, as it requires an agreement to share.]
- Line 114, : \item Geographic locations of colleges: constructed by the author in 2012, using the Google Maps API at the time.
- Line 121, : % INSTRUCTIONS: - When the authors are \textbf{secondary data users} (they
- Line 146, : % For instance, if using GDP deflators, the source of the deflators
- Line 235, : \item THEOP restricted-use files (THEOP): Not available; simulated data provided.
- Line 236, : \item THEOP public-use files (THEOP-Public): Not available; simulated data provided.
- Line 241, : \item Integrated Postsecondary Education Data System (IPEDS):
- Line 246, : \item Geocoded locations of IPEDS institutions, (based on author's use of Google Maps API in 2012):
- Line 262, : % simulated versions are made available in ``replication\_package/data/simulated''.
- Line 268, : % While I cannot share the raw data, the parameters and covariance matrices are provided in ``replication\_package/data/simulated/OutcomeDataCoefficients.csv'' and ``replication\_package/data/simulated/OutcomeDataVSVs.csv'', respectively.
- Line 274, : \begin{longtable}[]{@{}llll@{}}
- Line 418, : \end{longtable}
- Line 421, : Due to a recent change in the Google Maps API, this code no longer runs as written. I provide the original output, as produced in October 2012.
- Line 424, : \hypertarget{simulated-dataset-list}{%
- Line 425, : \subsection{Simulated datasets provided}\label{simulated-dataset-list}}
- Line 428, : \begin{longtable}[]{@{}llll@{}}
- Line 439, : \texttt{data/raw/ICPSR\_29841\_simulated/DS0001/29841-0001-Data-REST.dta}\strut
- Line 445, : \texttt{data/raw/ICPSR\_29841\_simulated/DS0002/29841-0002-Data-REST.dta}\strut
- Line 451, : \texttt{data/raw/ICPSR\_29841\_simulated/DS0005/29841-0005-Data-REST.dta}\strut
- Line 457, : \texttt{data/raw/ICPSR\_29841\_simulated/DS0006/29841-0006-Data-REST.dta}\strut
- Line 463, : \texttt{data/raw/ICPSR\_29841\_simulated/DS0007/29841-0007-Data-REST.dta}\strut
- Line 469, : \texttt{data/raw/ICPSR\_29841\_simulated/DS0008/29841-0008-Data-REST.dta}\strut
- Line 475, : \texttt{data/raw/THEOP\_public\_simulated/\{pa,amk,tt,ri,sm\}.csv}\strut
- Line 481, : \end{longtable}
- Line 499, : % \href{https://github.com/gslab-econ/template/blob/master/config/config_stata.do}{Stata},
- Line 500, : % \href{https://github.com/labordynamicsinstitute/paper-template/blob/master/programs/global-libraries.R}{R},
- Line 501, : % \href{https://github.com/labordynamicsinstitute/paper-template/blob/master/programs/packages.jl}{Julia}
- Line 519, : \item The Stata code uses \textit{estout}, \textit{sutex}, \textit{tabout}, and \textit{geodist}. The latest versions (as of October 8, 2024) were used.
- Line 528, : Note: due to the long run-time, the code saves intermediate results at several points, and provides options to run parts of the code in blocks, e.g. to load previously-saved parameter estimates and run counterfactuals without re-running the estimation routine.
- Line 530, : Accordingly, random seeds are set in multiple places to ensure that each block, e.g. starting values, estimation, and counterfactuals, produce identical results, regardless of which blocks have been run in the particular session that is open.
- Line 548, : The Stata code runs in about a minute and has low memory needs.
- Line 577, : \item Open Stata 15.1. Install the needed packages. Change the paths in code/setup/Master.do, lines 7-12, to the appropriate locations. Run code/setup/master.do.
- Line 580, : \item Open code/analysis/TTTnew.jl. There are sevaral options in lines 5--16. Make sure that ``use\old\_simdata\_approach'', ``simulate\_data'', ``run\_tests'', and ``load\_saved\_boot\_cutoffs\_step2''  are set to \textbf{false}. Make sure that the remaining options are set to \textbf{true}.
- Line 581, : \item  Change \textit{mypath} (line 20 of TTTnew.jl) to the path to the replication package on your system. In addition, make sure that ``true\_data\_path'' and ``publicTHEOPdatapath'' (lines 24 and 26) are set to the appropriate locations.
- Line 593, : % Replicators without original data who wish to construct a version of Table 1 using simulated data may do so via the following steps:
- Line 600, : %     global workfiles_path = "your_path/replication_package/data/simulated" \end{verbatim}
- Line 609, : However, because simulated data is used, the exact values cannot be reproduced.
- Line 661, : National Center for Education Statistics. 2005. \textit{Integrated Postsecondary Education Data System.}
- Line 666, : U.S. Census Bureau and U.S. Bureau of Labor Statistics. n.d. \textit{March 2003 Current Population Survey Public-Use Data.} IPUMS [distributor]. \\
- Line 3, : \PassOptionsToPackage{hyphens}{url}
- Line 37, : \IfFileExists{xurl.sty}{\usepackage{xurl}}{} % add URL line breaks if available
- Line 42, : \urlstyle{same} % disable monospaced font for URLs
- Line 97, : Restricted-use files may be obtained via the Inter-University Consortium for Political and Social Research (ICPSR; icpsr.umich.edu).
- Line 106, : \item March CPS data on occupation, education, and income (Census Bureau and BLS (2003)), accessed via IPUMS (https://cps.ipums.org/cps/), July 2012.
- Line 152, : % \href{https://social-science-data-editors.github.io/guidance/Requested_information_dcas.html}{here},
- Line 162, : % \href{https://social-science-data-editors.github.io/guidance/Data_citation_guidance.html}{Guidance}).
- Line 200, : % \href{https://social-science-data-editors.github.io/guidance/Licensing_guidance.html}{here}.
- Line 657, : Tienda, Marta, and Sullivan, Teresa A. 2011. \textit{Texas Higher Education Opportunity Project.} Inter-university Consortium for Political and Social Research [distributor], 2011-06-02. \\ https://doi.org/10.3886/ICPSR29841.v1
- Line 666, : U.S. Census Bureau and U.S. Bureau of Labor Statistics. n.d. \textit{March 2003 Current Population Survey Public-Use Data.} IPUMS [distributor]. \\

**/code/setup/UTA_TAMU_Admin.do**

- Line 105, : rename gender male
- Line 1, : *cd "R:\THEOP Code (local)\Data_prep"
- Line 4, : local univs = "TAMU UTA"
- Line 5, : local UTA_rawdata = "${rawdata_path}\DS0005\29841-0005-Data-REST"
- Line 6, : local UTA_transcripts = "${rawdata_path}\DS0006\29841-0006-Data-REST"
- Line 7, : local TAMU_rawdata = "${rawdata_path}\DS0007\29841-0007-Data-REST"
- Line 8, : local TAMU_transcripts = "${rawdata_path}\DS0008\29841-0008-Data-REST"
- Line 9, : local UTA_collegeID = 228778
- Line 10, : local TAMU_collegeID = 228723
- Line 11, : local UTA_q50sch = "THE UNIVERSITY OF TEXAS AT AUSTIN"
- Line 12, : local TAMU_q50sch = "TEXAS A & M UNIVERSITY"
- Line 14, : foreach univ of local univs {
- Line 60, : gen latino = ethnic==2
- Line 84, : // 1.) tag some stuff as "admin", in order to merge w/ survey later and export summary stats
- Line 115, : local zi_finaid_vars = "edu"
- Line 116, : local zi_outcome_vars = "Aij Bij Ci cgpa nterm semgpa firstsemgpa termdiv1_c termdeptdiv1_c"
- Line 117, : local zi_vars = "SATr SATmean_s satRatio classrank male econdisadv minority los_c century_c" // black latino native asian white
- Line 118, : local identifiers = "sid_c hscode_c instate_c hspubpriv_c yeardes"
- Line 119, : local id_vars = "source collegeID q50sch"
- Line 105, : rename gender male

**/code/setup/sumstats5.do**

- Line 8, : // cd "R:\THEOP Code (local)\Data_prep"
- Line 17, : latabstat SATr classrank SATmean_s if collegeID==0, statistics(N mean sd min max) columns(statistics) save tf("tables_path/table1_new_cts.tex") replace
- Line 20, : summ male black latino white asian  nguardians if collegeID==0 // binary vars
- Line 21, : latabstat male black latino white asian nguardians if collegeID==0, statistics(N mean min max) columns(statistics) save tf("tables_path/table1_new_bin.tex") replace

**/code/setup/finaidvars.do**

- Line 11, : local finaid_shifters = "Ed_f workedlastmonth_f prest_f Ed_m workedlastmonth_m prest_m"
- Line 12, : local finaid_other = "occup_*"
- Line 71, : replace `var'=468 if OCC1990_HEAD==466 // INC FAMILY CHILD CARE IN CHILD CA
- Line 72, : replace `var'=468 if OCC1990_HEAD==467 // INC EARLY CHILD CARE IN CHILD CAR

**/code/setup/geocode_colleges.do**

- Line 1, : /* code locations of colleges, using address and google maps API */
- Line 4, : gen address = addr + ", " + city + " " + stabbr + " " + zip
- Line 5, : keep unitid address instnm
- Line 7, : save "${workfiles_path}\college_addresses", replace
- Line 9, : use "${workfiles_path}\seniorsvy_long_disaggregated", clear
- Line 12, : merge unitid using "${workfiles_path}\college_addresses"
- Line 16, : keep unitid address
- Line 19, : geocode, fulladdr(address)

**/code/setup/aggregatecols.do**

- Line 66, : drop if college == "NAME OF R DELETED"
- Line 116, : q50asch         str50  %50s                   Name of first preference school
- Line 143, : rename q50code _Ci_code
- Line 144, : rename collegeID _Ci_CollegeID // CollegeID of school to which i matriculates
- Line 31, : // TO FIX LATER: also use ACT scores, and use ACT-SAT crosswalk!
- Line 44, : local minsize = 600
- Line 59, : replace collegeID = 2 if college=="COMMUNITY COLLEGE"
- Line 60, : replace college = "TX PUBLIC 2-YEAR" if college=="COMMUNITY COLLEGE"
- Line 136, : // aggregate matriculation colleges Ci
- Line 144, : rename collegeID _Ci_CollegeID // CollegeID of school to which i matriculates
- Line 26, : // drop if _merge==1 // drop schools that no one in the sample mentioned
- Line 37, : drop if cntlaffi==2 // drop for-profit schools.  23 of these in data
- Line 45, : replace cntlaffi=1 if collegeID==190433 // treat Cornell's public schools as public
- Line 108, : q50a            int    %14.0g      q50a       Do you have a first preference school?
- Line 109, : q50a1           int    %14.0g      q50a1      Did you apply to first choice school?
- Line 110, : q50a2           int    %14.0g      q50a1      Were you accepted to first choice school?
- Line 115, : q50acode        str6   %6s                    University code of first preference school
- Line 116, : q50asch         str50  %50s                   Name of first preference school
- Line 144, : rename collegeID _Ci_CollegeID // CollegeID of school to which i matriculates

**/data/raw/IPEDS_200304/sfa0203.do**

- Line 18, : * calculations for missing values.
- Line 26, : * For long lists of value labels, the titles may be
- Line 36, : label variable xscfa11n "Imputation field for SCFA11N - Number of students in cohort who are in-district"
- Line 37, : label variable scfa11n "Number of students in cohort who are in-district"
- Line 38, : label variable xscfa11p "Imputation field for SCFA11P - Percentage of students in cohort who are in-district"
- Line 39, : label variable scfa11p "Percentage of students in cohort who are in-district"
- Line 70, : label variable xsgrnt_n "Imputation field for SGRNT_N - Number receiving state/local grant aid"
- Line 71, : label variable sgrnt_n "Number receiving state/local grant aid"
- Line 72, : label variable xsgrnt_p "Imputation field for SGRNT_P - Percentage receiving state/local grant aid"
- Line 73, : label variable sgrnt_p "Percentage receiving state/local grant aid"
- Line 74, : label variable xsgrnt_a "Imputation field for SGRNT_A - Average amount of state/Local grant aid recieved"
- Line 75, : label variable sgrnt_a "Average amount of state/Local grant aid recieved"
- Line 96, : label define label_xscfa1n 24 "Ratio adjustment based on enrollment  by race and gender (part A)", add
- Line 103, : label define label_xscfa1n 52 "Value not derived - parent/child differs across components", add
- Line 113, : label define label_xscfa1p 24 "Ratio adjustment based on enrollment  by race and gender (part A)", add
- Line 120, : label define label_xscfa1p 52 "Value not derived - parent/child differs across components", add
- Line 130, : label define label_xscfa11n 24 "Ratio adjustment based on enrollment  by race and gender (part A)", add
- Line 137, : label define label_xscfa11n 52 "Value not derived - parent/child differs across components", add
- Line 147, : label define label_xscfa11p 24 "Ratio adjustment based on enrollment  by race and gender (part A)", add
- Line 154, : label define label_xscfa11p 52 "Value not derived - parent/child differs across components", add
- Line 164, : label define label_xscfa12n 24 "Ratio adjustment based on enrollment  by race and gender (part A)", add
- Line 171, : label define label_xscfa12n 52 "Value not derived - parent/child differs across components", add
- Line 181, : label define label_xscfa12p 24 "Ratio adjustment based on enrollment  by race and gender (part A)", add
- Line 188, : label define label_xscfa12p 52 "Value not derived - parent/child differs across components", add
- Line 198, : label define label_xscfa13n 24 "Ratio adjustment based on enrollment  by race and gender (part A)", add
- Line 205, : label define label_xscfa13n 52 "Value not derived - parent/child differs across components", add
- Line 215, : label define label_xscfa13p 24 "Ratio adjustment based on enrollment  by race and gender (part A)", add
- Line 222, : label define label_xscfa13p 52 "Value not derived - parent/child differs across components", add
- Line 232, : label define label_xscfa14n 24 "Ratio adjustment based on enrollment  by race and gender (part A)", add
- Line 239, : label define label_xscfa14n 52 "Value not derived - parent/child differs across components", add
- Line 249, : label define label_xscfa14p 24 "Ratio adjustment based on enrollment  by race and gender (part A)", add
- Line 256, : label define label_xscfa14p 52 "Value not derived - parent/child differs across components", add
- Line 266, : label define label_xscfa2 24 "Ratio adjustment based on enrollment  by race and gender (part A)", add
- Line 273, : label define label_xscfa2 52 "Value not derived - parent/child differs across components", add
- Line 283, : label define label_xscfy1n 24 "Ratio adjustment based on enrollment  by race and gender (part A)", add
- Line 290, : label define label_xscfy1n 52 "Value not derived - parent/child differs across components", add
- Line 300, : label define label_xscfy1p 24 "Ratio adjustment based on enrollment  by race and gender (part A)", add
- Line 307, : label define label_xscfy1p 52 "Value not derived - parent/child differs across components", add
- Line 317, : label define label_xscfy2 24 "Ratio adjustment based on enrollment  by race and gender (part A)", add
- Line 324, : label define label_xscfy2 52 "Value not derived - parent/child differs across components", add
- Line 334, : label define label_xanyaidn 24 "Ratio adjustment based on enrollment  by race and gender (part A)", add
- Line 341, : label define label_xanyaidn 52 "Value not derived - parent/child differs across components", add
- Line 351, : label define label_xanyaidp 24 "Ratio adjustment based on enrollment  by race and gender (part A)", add
- Line 358, : label define label_xanyaidp 52 "Value not derived - parent/child differs across components", add
- Line 368, : label define label_xfgrnt_n 24 "Ratio adjustment based on enrollment  by race and gender (part A)", add
- Line 375, : label define label_xfgrnt_n 52 "Value not derived - parent/child differs across components", add
- Line 385, : label define label_xfgrnt_p 24 "Ratio adjustment based on enrollment  by race and gender (part A)", add
- Line 392, : label define label_xfgrnt_p 52 "Value not derived - parent/child differs across components", add
- Line 402, : label define label_xfgrnt_a 24 "Ratio adjustment based on enrollment  by race and gender (part A)", add
- Line 409, : label define label_xfgrnt_a 52 "Value not derived - parent/child differs across components", add
- Line 419, : label define label_xsgrnt_n 24 "Ratio adjustment based on enrollment  by race and gender (part A)", add
- Line 426, : label define label_xsgrnt_n 52 "Value not derived - parent/child differs across components", add
- Line 436, : label define label_xsgrnt_p 24 "Ratio adjustment based on enrollment  by race and gender (part A)", add
- Line 443, : label define label_xsgrnt_p 52 "Value not derived - parent/child differs across components", add
- Line 453, : label define label_xsgrnt_a 24 "Ratio adjustment based on enrollment  by race and gender (part A)", add
- Line 460, : label define label_xsgrnt_a 52 "Value not derived - parent/child differs across components", add
- Line 470, : label define label_xigrnt_n 24 "Ratio adjustment based on enrollment  by race and gender (part A)", add
- Line 477, : label define label_xigrnt_n 52 "Value not derived - parent/child differs across components", add
- Line 487, : label define label_xigrnt_p 24 "Ratio adjustment based on enrollment  by race and gender (part A)", add
- Line 494, : label define label_xigrnt_p 52 "Value not derived - parent/child differs across components", add
- Line 504, : label define label_xigrnt_a 24 "Ratio adjustment based on enrollment  by race and gender (part A)", add
- Line 511, : label define label_xigrnt_a 52 "Value not derived - parent/child differs across components", add
- Line 521, : label define label_xloan_n 24 "Ratio adjustment based on enrollment  by race and gender (part A)", add
- Line 528, : label define label_xloan_n 52 "Value not derived - parent/child differs across components", add
- Line 538, : label define label_xloan_p 24 "Ratio adjustment based on enrollment  by race and gender (part A)", add
- Line 545, : label define label_xloan_p 52 "Value not derived - parent/child differs across components", add
- Line 555, : label define label_xloan_a 24 "Ratio adjustment based on enrollment  by race and gender (part A)", add
- Line 562, : label define label_xloan_a 52 "Value not derived - parent/child differs across components", add

**/data/raw/IPEDS_200304/hd2003.do**

- Line 39, : label variable chfnm "Name of chief administrator"
- Line 148, : label variable f1sysnam "Name of System"
- Line 18, : * calculations for missing values.
- Line 26, : * For long lists of value labels, the titles may be
- Line 33, : label variable addr "Street address or post office box"
- Line 34, : label variable city "City location of institution"
- Line 36, : label variable zip "ZIP code"
- Line 45, : label variable duns "Dunn and Bradstreet identification number"
- Line 46, : label variable opeid "Office of Postsecondary Education (OPE) ID Number"
- Line 48, : label variable webaddr "Institution^s internet website address"
- Line 56, : label variable hdegoffr "Highest degree offered"
- Line 57, : label variable deggrant "Degree-granting status"
- Line 60, : label variable medical "Institution grants a medical degree"
- Line 63, : label variable locale "Degree of urbanization"
- Line 70, : label variable postsec "Primarily postsecondary indicator"
- Line 71, : label variable pseflag "Postsecondary institution indicator"
- Line 72, : label variable pset4flg "Postsecondary and Title IV institution indicator"
- Line 75, : label variable lock_ic "Status of IC component when institution was migrated"
- Line 77, : label variable lock_c "Status of completions component when institution was migrated"
- Line 83, : label variable lock_ef "Status of Fall Enrollment survey when data collection closed"
- Line 87, : label variable pta99_ef "Status enrollment by race/ethnicity (99.0000 CIP)"
- Line 95, : label variable lock_sa "Status of Faculty Salary survey when data collection closed"
- Line 100, : label variable lock_s "Status of Fall Staff survey when data collection closed"
- Line 105, : label variable lock_eap "Status of EAP survey when data collection closed"
- Line 114, : label variable lock_f "Status of Finance survey when data collection closed"
- Line 124, : label variable lock_sfa "Status of Student Financial Aid Survey when data collection closed"
- Line 129, : label variable lock_gr "Status of Survey when data collection closed"
- Line 139, : label variable sport4 "Athletic aid  cross-country and  track  in cohort year"
- Line 141, : label variable longpgm "Institution has 5-year or 3-year programs"
- Line 152, : label variable twoyrcat "Classification for 2-year postsecondary  institutions"
- Line 170, : label define label_stabbr DC "District of Columbia", add
- Line 224, : label define label_fips 11 "District of Columbia", add
- Line 328, : label define label_hloffer 3 "Associates degree", add
- Line 330, : label define label_hloffer 5 "Bachelors degree", add
- Line 332, : label define label_hloffer 7 "Masters degree", add
- Line 334, : label define label_hloffer 9 "Doctors degree", add
- Line 337, : label define label_ugoffer 1 "Undergraduate degree or certificate offering", add
- Line 341, : label define label_groffer 1 "Graduate degree or certificate offering", add
- Line 345, : label define label_fpoffer 1 "First-professional degree/certificate", add
- Line 349, : label define label_hdegoffr 0 "Non-degree granting", add
- Line 361, : label define label_deggrant 1 "Degree-granting", add
- Line 362, : label define label_deggrant 2 "Nondegree-granting, primarily postsecondary", add
- Line 363, : label define label_deggrant 3 "Nondegree-granting, not  primarily postsecondary", add
- Line 392, : label define label_carnegie 51 "Theological seminaries and other specialized faith-related institutions", add
- Line 403, : label define label_locale -3 "{Not available}"
- Line 404, : label define label_locale 1 "Large city", add
- Line 405, : label define label_locale 2 "Mid-size city", add
- Line 406, : label define label_locale 3 "Urban fringe of large city", add
- Line 407, : label define label_locale 4 "Urban fringe of mid-size city", add
- Line 408, : label define label_locale 5 "Large town", add
- Line 409, : label define label_locale 6 "Small town", add
- Line 410, : label define label_locale 7 "Rural", add
- Line 411, : label define label_locale 9 "Not assigned", add
- Line 412, : label values locale label_locale
- Line 434, : label define label_postsec 1 "Primarily postsecondary institution"
- Line 435, : label define label_postsec 2 "Not primarily postsecondary", add
- Line 437, : label define label_pseflag 1 "Active postsecondary institution"
- Line 438, : label define label_pseflag 2 "Not primarily postsecondary or open to public", add
- Line 441, : label define label_pset4flg 1 "Title IV postsecondary institution"
- Line 442, : label define label_pset4flg 2 "Non-Title IV postsecondary institution", add
- Line 443, : label define label_pset4flg 3 "Title IV NOT primarily postsecondary institution", add
- Line 444, : label define label_pset4flg 4 "Non-Title IV NOT primarily postsecondary institution", add
- Line 445, : label define label_pset4flg 5 "Title IV postsecondary institution that is NOT open to the public", add
- Line 446, : label define label_pset4flg 6 "Non-Title IV postsecondary institution that is NOT open to the public", add
- Line 460, : label define label_lock_ic -2 "{Item not applicable}"
- Line 461, : label define label_lock_ic 0 "No data", add
- Line 462, : label define label_lock_ic 1 "Has entered  data", add
- Line 463, : label define label_lock_ic 3 "Edited", add
- Line 464, : label define label_lock_ic 5 "Clean, perform edits have been cleaned", add
- Line 465, : label define label_lock_ic 7 "Locked, intermediate lock applied", add
- Line 466, : label define label_lock_ic 8 "Complete, final lock applied", add
- Line 467, : label values lock_ic label_lock_ic
- Line 474, : label define label_lock_c -2 "{Item not applicable}"
- Line 475, : label define label_lock_c 0 "No data", add
- Line 476, : label define label_lock_c 1 "Has entered data", add
- Line 477, : label define label_lock_c 3 "Edited", add
- Line 478, : label define label_lock_c 5 "Clean, perform edits have been cleaned", add
- Line 479, : label define label_lock_c 7 "Locked, intermediate lock applied", add
- Line 480, : label define label_lock_c 8 "Complete, final lock applied", add
- Line 481, : label values lock_c label_lock_c
- Line 504, : label define label_lock_ef -2 "{Item not applicable}"
- Line 505, : label define label_lock_ef 0 "No data was entered", add
- Line 506, : label define label_lock_ef 1 "Has data", add
- Line 507, : label define label_lock_ef 3 "Edited, data was edited and some errors/warnings remain", add
- Line 508, : label define label_lock_ef 8 "Complete, final lock applied", add
- Line 509, : label values lock_ef label_lock_ef
- Line 567, : label define label_lock_sa -2 "{Item not applicable}"
- Line 568, : label define label_lock_sa 0 "No data was entered", add
- Line 569, : label define label_lock_sa 1 "Has data, but has not been edited", add
- Line 570, : label define label_lock_sa 3 "Edited, data was edited and some errors/warnings remain", add
- Line 571, : label define label_lock_sa 5 "Clean, data was edited and errors/warnings resolved", add
- Line 572, : label define label_lock_sa 7 "Locked, first or intermediate lock applied", add
- Line 573, : label define label_lock_sa 8 "Complete, final lock applied", add
- Line 574, : label values lock_sa label_lock_sa
- Line 591, : label define label_lock_s -2 "{Item not applicable}"
- Line 592, : label define label_lock_s 0 "No data was entered", add
- Line 593, : label define label_lock_s 1 "Has data, but has not been edited", add
- Line 594, : label define label_lock_s 3 "Edited, data was edited and some errors/warnings remain", add
- Line 595, : label define label_lock_s 5 "Clean, data was edited and errors/warnings resolved", add
- Line 596, : label define label_lock_s 7 "Locked, first or intermediate lock applied", add
- Line 597, : label define label_lock_s 8 "Complete, final lock applied", add
- Line 598, : label values lock_s label_lock_s
- Line 615, : label define label_lock_eap -2 "{Item not applicable}"
- Line 616, : label define label_lock_eap 0 "No data was entered", add
- Line 617, : label define label_lock_eap 1 "Has data", add
- Line 618, : label define label_lock_eap 3 "Edited, data was edited and some errors/warnings remain", add
- Line 619, : label define label_lock_eap 5 "Clean, data was clean but final lock not applied", add
- Line 620, : label define label_lock_eap 8 "Complete, final lock applied", add
- Line 621, : label values lock_eap label_lock_eap
- Line 659, : label define label_lock_f -2 "{Item not applicable}"
- Line 660, : label define label_lock_f 0 "No data entered", add
- Line 661, : label define label_lock_f 1 "Has data", add
- Line 662, : label define label_lock_f 3 "Edited", add
- Line 663, : label define label_lock_f 5 "Clean", add
- Line 664, : label define label_lock_f 7 "Locked", add
- Line 665, : label define label_lock_f 8 "Complete, final lock applied", add
- Line 666, : label values lock_f label_lock_f
- Line 671, : label define label_prch_f 4 "Child record - data included with entity that is not a postsecondary institution", add
- Line 672, : label define label_prch_f 5 "Child record - reports partial data but other data is included  with entity that is not a postsecondary institution", add
- Line 707, : label define label_lock_sfa -2 "{Item not applicable}"
- Line 708, : label define label_lock_sfa 0 "No data entered", add
- Line 709, : label define label_lock_sfa 1 "Has data", add
- Line 710, : label define label_lock_sfa 3 "Edited", add
- Line 711, : label define label_lock_sfa 5 "Clean", add
- Line 712, : label define label_lock_sfa 7 "Locked", add
- Line 713, : label define label_lock_sfa 8 "Complete, final lock applied", add
- Line 714, : label values lock_sfa label_lock_sfa
- Line 730, : label define label_lock_gr -2 "{Item not applicable}"
- Line 731, : label define label_lock_gr 0 "No data submitted", add
- Line 732, : label define label_lock_gr 1 "Has data", add
- Line 733, : label define label_lock_gr 3 "Edited", add
- Line 734, : label define label_lock_gr 8 "Complete", add
- Line 735, : label values lock_gr label_lock_gr
- Line 786, : label define label_longpgm -1 "{Item not reported}"
- Line 787, : label define label_longpgm -2 "{Item not applicable}", add
- Line 788, : label define label_longpgm 1 "Yes", add
- Line 789, : label define label_longpgm 2 "No", add
- Line 790, : label values longpgm label_longpgm
- Line 848, : label define label_twoyrcat 6 "For profit 2-year degree-granting", add
- Line 849, : label define label_twoyrcat 7 "For profit 2-year nondegree-granting", add
- Line 908, : tab locale
- Line 918, : tab lock_ic
- Line 920, : tab lock_c
- Line 925, : tab lock_ef
- Line 936, : tab lock_sa
- Line 940, : tab lock_s
- Line 944, : tab lock_eap
- Line 952, : tab lock_f
- Line 961, : tab lock_sfa
- Line 965, : tab lock_gr
- Line 976, : tab longpgm
- Line 41, : label variable gentele "General information telephone number"
- Line 42, : label variable fintele "Financial aid office telephone number"
- Line 43, : label variable admtele "Admissions office telephone number"
- Line 66, : label variable newid "UNITID for merged schools"
- Line 78, : label variable prch_c "Parent/child indicator for completions"
- Line 84, : label variable prch_ef "Parent/child indicator for Fall enrollment"
- Line 96, : label variable prch_sa "Parent/child  indicator SA"
- Line 101, : label variable prch_s "Parent/child indicator Fall Staff"
- Line 106, : label variable prch_eap "Parent/child indicator EAP"
- Line 115, : label variable prch_f "Parent/child indicator for Finance survey"
- Line 125, : label variable prch_sfa "Parent/child indicator Student Financial Aid survey"
- Line 130, : label variable prch_gr "Parent/child indicator (GRS)"
- Line 282, : label define label_obereg 0 "US Service schools"
- Line 393, : label define label_carnegie 52 "Medical schools and medical centers", add
- Line 394, : label define label_carnegie 53 "Other separate health profession schools", add
- Line 395, : label define label_carnegie 54 "Schools of engineering and technology", add
- Line 396, : label define label_carnegie 55 "Schools of business and management", add
- Line 397, : label define label_carnegie 56 "Schools of art, music, and design", add
- Line 398, : label define label_carnegie 57 "Schools of law", add
- Line 483, : label define label_prch_c 1 "Parent record includes data from child campuses", add
- Line 484, : label define label_prch_c 2 "Child record - all data reported with parent campus", add
- Line 510, : label define label_prch_ef -2 "Not applicable (not parent/child)"
- Line 511, : label define label_prch_ef 1 "Parent record includes data from child campuses", add
- Line 512, : label define label_prch_ef 2 "Child record - data reported with parent campus", add
- Line 576, : label define label_prch_sa 1 "Parent record includes data from child campuses", add
- Line 577, : label define label_prch_sa 2 "Child record - all data reported with parent campus", add
- Line 600, : label define label_prch_s 1 "Parent record includes data from child campuses", add
- Line 601, : label define label_prch_s 2 "Child record - all data reported with parent campus", add
- Line 622, : label define label_prch_eap -2 "Not applicable (not parent/child)"
- Line 623, : label define label_prch_eap 1 "Parent record includes data from child campuses", add
- Line 624, : label define label_prch_eap 2 "Child record - all data reported with parent campus", add
- Line 667, : label define label_prch_f -2 "Not applicable (not parent/child)"
- Line 669, : label define label_prch_f 2 "Child record - data reported with parent campus", add
- Line 670, : label define label_prch_f 3 "Partial child record - reports partial data and other data reported with parent campus", add
- Line 671, : label define label_prch_f 4 "Child record - data included with entity that is not a postsecondary institution", add
- Line 672, : label define label_prch_f 5 "Child record - reports partial data but other data is included  with entity that is not a postsecondary institution", add
- Line 715, : label define label_prch_sfa -2 "Not applicable (not parent/child)"
- Line 717, : label define label_prch_sfa 2 "Child record - data reported with parent campus", add
- Line 737, : label define label_prch_gr 1 "Parent record -  includes data from child campuses", add
- Line 738, : label define label_prch_gr 2 "Child record - data reported at parent campus", add

**/code/analysis/setup_2024.jl**

- Line 91, : # temp storage / preallocation data structure
- Line 5, : const nx = size(persons[1].vij,2) + J
- Line 22, : function get_biA(ii) #vector of admission/rejection outcomes for schools applied to
- Line 38, : myincomes = [(Y=persons[ii].Y, efc=persons[ii].EFC) for ii=1:II]
- Line 56, : xij = [ [diagm(ones(J)) person.vij] for person in persons], #observables entering utility: program indicators, [nearby dist urm.*ones(J) urm.*vec_uta urm.*vec_tamu pov.*ones(J) pov.*vec_uta pov.*vec_tamu los.*vec_uta cen.*vec_tamu sat.*ones(J) classrank.*ones(J) satratio.*ones(J) sat.*vec_tamu sat.*vec_uta sat.*private]
- Line 81, : y = persons[ii].Y,
- Line 82, : efc = persons[ii].EFC,
- Line 115, : aid::Array{T,1} #aid amount at enrolled school
- Line 136, : zeros(T,ndraws), #aid amount at enrolled school (if any)

**/code/analysis/simulateData.jl**

- Line 162, : varname = Symbol("$stub$id")
- Line 163, : outcomesSim[!,varname] = [getfield(h,vv)[jj] for h in histories]
- Line 167, : varname = Symbol("B_unknown$id")
- Line 168, : outcomesSim[!,varname] = fill(0,nStudents)
- Line 171, : varname = Symbol("Receive_finaid_schol$id")
- Line 172, : outcomesSim[!,varname] = (outcomesSim[!,Symbol("Ap_finaid_schol$id")] .> 0) .* outcomesSim[!,Symbol("Bij$id")]
- Line 210, : for v in names(dfmicro)[2:end]
- Line 2, : # replication package: save simulated data
- Line 6, : include("$codepath/simulateDataFunctions.jl")
- Line 39, : CSV.write("$simulated_data_path/OutcomeDataCoefficients.csv",coefs)
- Line 40, : CSV.write("$simulated_data_path/OutcomeDataVCVs.csv",vcovs)
- Line 46, : CSV.write("$simulated_data_path/CollegeCharacteristics.csv",Xj)
- Line 50, : # step 3: simulate and save everything else
- Line 73, : hsmeans.longhorn =  ( rand(nSchools) .< .3 ) .& (hsmeans.econdisadv .> .6)
- Line 85, : #simulate distances in 100mi; same means as real data
- Line 106, : #finaid: household characteristics informative about distribution of income and EFC
- Line 127, : vec_uta = zeros(J); vec_uta[loc_UTA] = 1
- Line 128, : vec_tamu = zeros(J); vec_tamu[loc_TAMU] = 1
- Line 130, : los = longhorn[ii].>0
- Line 157, : histories = [simulateHistory_i(ii,CCbasic) for ii=1:nStudents]
- Line 160, : for (vv,stub) in zip([:A,:B,:C,:Apply_aid], [:Aij,:Bij,:Ci,:Ap_finaid_schol])
- Line 175, : CSV.write("$simulated_data_path/vij.csv",vijSim)
- Line 176, : CSV.write("$simulated_data_path/zi.csv",ziSim)
- Line 177, : CSV.write("$simulated_data_path/outcomes.csv",outcomesSim)
- Line 178, : CSV.write("$simulated_data_path/finaid_shifters.csv",finaidSim)
- Line 179, : CSV.write("$simulated_data_path/income_CPS.csv",incomeDistSim)
- Line 199, : CSV.write("$simulated_data_path/uta.csv",uta_sim)
- Line 200, : CSV.write("$simulated_data_path/tamu.csv",tamu_sim)
- Line 230, : CSV.write(simulated_data_path*"/svy_sumstats_clean.csv",dfmicro)
- Line 53, : nSchools = 100
- Line 58, : #zi: exogenous person-level characteristics
- Line 62, : hsid_c = sample(1:nSchools,nStudents),
- Line 70, : #compute high-school-level poverty, mean SAT scores, LOS and Century participation
- Line 72, : hsmeans.econdisadv = rand(nSchools)
- Line 73, : hsmeans.longhorn =  ( rand(nSchools) .< .3 ) .& (hsmeans.econdisadv .> .6)
- Line 74, : hsmeans.century =  ( rand(nSchools) .< .3 ) .& (hsmeans.econdisadv .> .6)
- Line 87, : xhs = rand(nSchools, 2)

**/code/setup/outputToMatlab.do**

- Line 161, : rename q50firstneed`jj' firstneed`jj'
- Line 162, : rename q50firstmet`jj' firstmet`jj'
- Line 163, : rename q50distance`jj' distance`jj'
- Line 164, : rename q50costofattendance`jj' costofattendance`jj'
- Line 165, : rename q50satlowerbound`jj' sat25`jj'
- Line 166, : rename q50satupperbound`jj' sat75`jj'
- Line 10, : // to do this, first need colleges' locations.
- Line 18, : do encode_locations // loads college addresses, saves "${workfiles_path}\distances_s_J"
- Line 39, : levelsof collegeID, local(JJ)
- Line 60, : local identifiers = "source studentid_c hsid_c wv2 adjwt w2_adjwt"
- Line 61, : local zi_vars = "SATmean_s SATr satRatio classrank minority econdisadv longhorn century black white latino asian"
- Line 62, : local outcome_vars = "Aij* Bij* B_unknown* Ap_finaid_schol* Receive_finaid_schol* finaid_unknown* Ci*"
- Line 63, : local s_vars = "hstype pcteco12 longhorn century pctakap pctpassap totdroprate"
- Line 64, : local vij_Jvars = "SATr q50satlower* q50satupper* q50sfratio* Nj* fracMinority*"
- Line 65, : local vij_interactions = "fracOwnRace* minXFracMin* q50distance* sqrtq50distance* ttt*" // observables that vary by i and j
- Line 66, : local price_vars = "q50firstneed* q50firstmet* q50costofattendance*"
- Line 67, : local othervars_i = "numapps apply_anywhere graduatedHS matriculated enrolled_now male female"
- Line 68, : local sigq_shifters = "hstype econdisadv"
- Line 69, : local finaid_shifters = "Ed OCC80_* Ed_simple_matchUTA nguardians both_parents_employed"
- Line 77, : keep `identifiers' `zi_vars' `outcome_vars' `s_vars' `othervars_i' `sigq_shifters' `finaid_shifters' black latino native white asian collegeID
- Line 84, : // step 3C: calculate (a) % own race
- Line 85, : foreach jj of local JJ {
- Line 86, : gen fracOwnRace`jj' = max(q50black`jj'*black, q50hispanic`jj'*latino, q50white`jj'*white, q50native`jj'*native, q50asian`jj'*asian)/100
- Line 116, : foreach jj of local JJ {
- Line 117, : foreach jr of local JJ {
- Line 160, : foreach jj of local JJ {
- Line 169, : reshape long ///
- Line 8, : // save high-school data
- Line 57, : gen female = gender==2
- Line 100, : // make distance to aggregate schools = mean dist., if missing

**/code/analysis/simulateRawDatasets.jl**

- Line 210, : for col in names(df)
- Line 5, : rdp = "$mypath/data/raw/ICPSR_29841_simulated"
- Line 6, : pdp = "$mypath/data/raw/THEOP_public_simulated"
- Line 46, : dfhs.longhorn = sample(df0.longhorn,nrow(dfhs))
- Line 80, : "1","2","3","4","5","6","code","satlowerbound","satupperbound","sfratio","sch","city","stat"]
- Line 120, : txhsecondispct_c = sample(df0uta1.txhsecondispct_c,nrows),
- Line 31, : q55 = sample(df0.q55,nrow(df0)), #gender; LABELED
- Line 34, : q46ax = sample(df0.q46ax,nrow(df0)), #number of schools applied to (self-report)
- Line 39, : #school-level variables
- Line 124, : gender = sample(df0uta1.gender,nrows),

**/code/setup/seniorsvy.do**

- Line 86, : rename SATrNat SATr
- Line 110, : do ExportCollegeNames
- Line 32, : gen latino = (race==3)|(race==4)
- Line 55, : reshape long q50@sch q50@1 q50@2 q50@3 q50@4 q50@5 q50@6 q50@code q50@zipcode q50@selectivity ///
- Line 69, : //levelsof q50code, local(q50codes)
- Line 71, : save "${workfiles_path}\_temp_long", replace
- Line 93, : gen matriculated = w2_q2e==1
- Line 95, : *replace matriculated = . if matriculated ==888 | matriculated ==889
- Line 97, : save "${workfiles_path}\seniorsvy_long_disaggregated", replace
- Line 127, : longhorn: 1(longhorn schol program)
- Line 36, : gen gender = q55
- Line 118, : hsid_c : high school ID
- Line 120, : high school variables:
- Line 121, : hstype: high school type (economic status): feeder = in top 20 HS's in # sent to UTA, TAMU

**/code/setup/encode_locations.do**

- Line 1, : use "${workfiles_path}\seniorsvy_long_disaggregated", clear
- Line 5, : collapse (sum) Aij, by(q50distance q50sch q50code q50zipcode uta_dist hsid_c college unitid collegeID nearest*)
- Line 18, : keep hsid_c unitid uta_distance q50distance latitude longitude college collegeID md_all q50sch nearest*
- Line 25, : // use coordinates of nearest colleges for latitude and longitude of schools
- Line 30, : egen lat_s = sum(latitude * isMin), by(hsid)  // if a nearby college is sufficiently close, use its coordinates
- Line 31, : egen lon_s = sum(longitude * isMin), by(hsid) // as the school's
- Line 34, : // hard-code very distant HS's based on guess of region and distances via google maps, picking points along highway routes
- Line 35, : replace lat_s = 36.297418 if hsid_c==69
- Line 36, : replace lon_s = -100.076111 if hsid_c==69 // way up north
- Line 38, : replace lat_s = 36.5096 if hsid==68
- Line 39, : replace lon_s = -100.8232 if hsid==68 // way up north
- Line 41, : replace lat_s = 31.5692 if hsid==76
- Line 42, : replace lon_s = -98.1645 if hsid==76 // btwn dallas and austin
- Line 44, : replace lat_s = 31.896 if hsid==77
- Line 45, : replace lon_s = -98.0656 if hsid==77 // btwn dallas and austin
- Line 47, : replace lat_s = 36.4566 if hsid==81
- Line 48, : replace lon_s = -101.39447 if hsid==81 // way up north near panhandle
- Line 50, : replace lat_s = 32.971804 if hsid==28 | hsid==27
- Line 51, : replace lon_s = -101.921814 if hsid==28 | hsid==27 // lamesa, TX -- btwn lubbock and midland/odessa
- Line 55, : scalar lat_uta = 30.28352
- Line 56, : scalar lon_uta = -97.73488
- Line 57, : geodist lat_s lon_s lat_uta lon_uta, miles generate(uta_dist_calc)
- Line 61, : levelsof collegeID if collegeID >10, local(ncol)
- Line 62, : reshape wide q50distance latitude longitude college q50sch, i(hsid_c) j(collegeID)
- Line 64, : foreach col of local ncol {
- Line 65, : levelsof latitude`col', local(lat_temp)
- Line 66, : levelsof longitude`col', local(lon_temp)
- Line 67, : replace latitude`col' = `lat_temp' if missing(latitude`col')
- Line 68, : replace longitude`col' = `lon_temp' if missing(longitude`col')
- Line 69, : geodist lat_s lon_s latitude`col' longitude`col', generate(q50distance`col'_temp) miles
- Line 74, : foreach col of local ncol {
- Line 25, : // use coordinates of nearest colleges for latitude and longitude of schools
- Line 31, : egen lon_s = sum(longitude * isMin), by(hsid) // as the school's

**/code/analysis/describeAdditionalModels.jl**

- Line 19, : vnames_gamma_alt = ["Constant","SAT","Class Rank","SAT Ratio","Poverty","URM","Scholarship","Caliber (q)","Pref. Shock"]
- Line 25, : print_results(vnames_gamma_alt,df_γ_alt,df_γ_alt_sd,titles_gamma_alt, f=stdout, supertitles=supertitles_gamma_alt )
- Line 28, : print_results(vnames_gamma_alt,df_γ_alt,df_γ_alt_sd,titles_gamma_alt, f=f, supertitles=supertitles_gamma_alt )
- Line 69, : for nn in names(dfr_v)[2:end]
- Line 58, : zg[loc_UTA,:]

