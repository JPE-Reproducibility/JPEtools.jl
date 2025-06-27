## Filepaths Analysis Details

**/code/setup/new_descriptive_setup.do**

- Line 43, unix : gen mean_barrons = _tot_barrons/n_apps
- Line 67, unix : replace SATr = SATr/160
- Line 70, unix : replace classrank = classrank/100
- Line 71, unix : replace pcteco12 = pcteco12/100
- Line 72, unix : replace distance=distance/100
- Line 104, unix : replace SATr = SATr/160
- Line 105, unix : replace SATmean_s = SATmean_s/160

**/code/setup/finaidvars.do**

- Line 39, windows : use "${publicdata_path}\cps\cps_00003", clear
- Line 82, windows : outsheet hwtsupp ftotval Ed OCC1980_HEAD using "${workfiles_path}\toMatlab\income_CPS.csv", comma replace

**/code/setup/geocode_colleges.do**

- Line 3, windows : use "${publicdata_path}\IPEDS_200304\IPEDS2003combined.dta", clear

**/code/setup/aggregatecols.do**

- Line 6, windows : use "${publicdata_path}\IPEDS_200304\IPEDS2003combined.dta", clear
- Line 8, windows : merge 1:1 unitid using "${publicdata_path}\IPEDS_200304\dct_sfa0203.dta"
- Line 10, unix : gen yield = enrlt/admssn
- Line 90, unix : gen avg`var' = foo/bar

**/code/setup/new_descriptive.do**

- Line 109, unix : replace SATratio = SATr/SATmean_s

**/code/setup/descriptive_AdminVSurvey.do**

- Line 33, unix : topf(topf.tex) botf(botf.tex) botstr(Apps in wvw/Admin) replace

**/code/analysis/setup_2024.jl**

- Line 22, unix : function get_biA(ii) #vector of admission/rejection outcomes for schools applied to

**/code/setup/sumstats2.do**

- Line 55, unix : gen gradrate = graduatedHS/students

**/code/analysis/describeNumbers.jl**

- Line 5, unix : # aid/info complementarity

**/code/setup/outputToMatlab.do**

- Line 4, unix : last updated 7/Dec/2012, Adam Kapor
- Line 38, windows : outsheet collegeID q50satlower q50satupper q50cost q50firstneed q50firstmet Nj Nminority q50sfratio q50barrons using "${workfiles_path}\toMatlab\Xj.csv", comma replace
- Line 58, unix : gen satRatio = SATr/SATmean_s - 1
- Line 71, unix : recode Ed  1 2=0  3=1 4=2 5 6=3 7=4 8 9 = 5 10/888 = ., generate(Ed_simple_matchUTA)
- Line 135, unix : replace SATr = SATr/160
- Line 136, unix : replace classrank = classrank/100
- Line 137, unix : replace SATmean_s = SATmean_s/160
- Line 141, unix : replace econdisadv = econdisadv/100
- Line 145, windows : outsheet `identifiers' `zi_vars' using "${workfiles_path}\toMatlab\zi.csv", comma nolabel replace
- Line 147, windows : outsheet `identifiers' `vij_Jvars' `vij_interactions' `price_vars' using "${workfiles_path}\toMatlab\vij.csv", comma replace
- Line 149, windows : outsheet `identifiers' `outcome_vars' using "${workfiles_path}\toMatlab\outcomes.csv", comma replace
- Line 151, windows : outsheet `identifiers' `sigq_shifters' using "${workfiles_path}\toMatlab\sigq_shifters.csv", comma replace
- Line 153, windows : outsheet `identifiers' `finaid_shifters' using "${workfiles_path}\toMatlab\finaid_shifters.csv", comma replace
- Line 157, windows : outsheet hsid_c `s_vars' using "${workfiles_path}\toMatlab\HScharacteristics.csv", comma replace

**/code/setup/crosswalk.do**

- Line 7, windows : insheet using "${publicdata_path}\SAT-ACT crosswalk\crosswalk.csv", clear

**/code/analysis/startvals_2024.jl**

- Line 148, unix : ll += lik_m/ndraws

**/code/analysis/describeResultsFunctions2024.jl**

- Line 34, unix : abs( num/denom )
- Line 42, unix : num/denom
- Line 207, windows : for (r,m) in zip(7:9,["\$4\\times\$","\$2\\times\$",])

**/code/setup/seniorsvy.do**

- Line 20, unix : gen w2_adjwt = w2_weight/w2_totweight
- Line 82, unix : replace SAT = SAT/10
- Line 83, unix : replace SATrNat = SATrNat/10
- Line 84, unix : replace SATrUT = SATrUT/10
- Line 85, unix : gen decile = classrank/10

**/code/setup/Master.do**

- Line 11, windows : global tables_path =  "C:\Users\akapor\Documents\GitHub\TexasTopTen\replication_package\output\Tables"
- Line 12, windows : global project_path = "C:\Users\akapor\Documents\GitHub\TexasTopTen"
- Line 14, windows : cd "${project_path}\replication_package\code\setup"
- Line 17, windows : cd "${project_path}\replication_package\code\setup"

**/code/setup/encode_locations.do**

- Line 15, windows : merge m:1 unitid using "${publicdata_path}\geocoded\J_geocoded"

**/README.tex**

- Line 49, unix : % Allow footnotes in longtable head/foot
- Line 79, unix : The Stata code (master file: ``code/setup/Master.do'') constructs analysis files,
- Line 83, unix : The Julia code (master file: ``code/analysis/TTTnew.jl'') then loads analysis files that have been produced by the Stata code,  runs the remaining analyses, and produces the remaining numbers and exhibits.
- Line 108, windows : student financial aid (``sfa0203\_data\_stata.csv''),
- Line 109, windows : and institutional characteristics(``ic2003\_data\_stata.csv''),
- Line 134, unix : % description of any pilot sessions/studies, and computer programs,
- Line 136, unix : % surveys, the whole questionnaire (code or images/PDF) including survey
- Line 178, windows : \item[$\boxed\checkmark$]
- Line 181, windows : \item[$\boxed\checkmark$]
- Line 211, unix : % \emph{Example:} The data are licensed under a Creative Commons/CC-BY-NC
- Line 219, windows : \item[$\boxed\checkmark$]
- Line 229, unix : % from that source here; if providing combined/derived datafiles, list
- Line 239, unix : \item Provided in replication package: ``replication\_package/data/raw/cps/cps\_00003.csv''.
- Line 243, unix : \item Provided in replication package: ``replication\_package/data/raw/IPEDS\_200304''.
- Line 248, unix : \item Provided in replication package: ``replication\_package/data/raw/geocoded/J\_geocoded.\{dta,csv\}''.
- Line 252, unix : \item Provided: ``replication\_package/data/raw/SAT-ACT crosswalk/crosswalk.csv''.
- Line 253, unix : \item See readme in directory ``replication\_package/data/raw/SAT-ACT crosswalk/''
- Line 262, mixed : % simulated versions are made available in ``replication\_package/data/simulated''.
- Line 264, windows : % ``CollegeCharacteristics.csv'', ``finaid\_shifters.csv'', ``income\_CPS.csv'',
- Line 268, mixed : % While I cannot share the raw data, the parameters and covariance matrices are provided in ``replication\_package/data/simulated/OutcomeDataCoefficients.csv'' and ``replication\_package/data/simulated/OutcomeDataVSVs.csv'', respectively.
- Line 277, windows : Data file\strut
- Line 279, windows : Source\strut
- Line 281, windows : Notes\strut
- Line 283, windows : Provided\strut
- Line 288, unix : \texttt{ICPSR\_29841/DS0001/29841-0001-Data-REST.dta}\strut
- Line 290, windows : THEOP\strut
- Line 292, windows : Confidential - Survey Wave 1\strut
- Line 294, windows : No\strut
- Line 298, unix : \texttt{ICPSR\_29841/DS0002/29841-0002-Data-REST.dta}\strut
- Line 300, windows : THEOP\strut
- Line 302, windows : Confidential - Survey Wave 2\strut
- Line 304, windows : No\strut
- Line 308, unix : \texttt{ICPSR\_29841/DS0005/29841-0005-Data-REST.dta}\strut
- Line 310, windows : THEOP\strut
- Line 314, windows : No\strut
- Line 318, unix : \texttt{ICPSR\_29841/DS0006/29841-0006-Data-REST.dta}\strut
- Line 320, windows : THEOP\strut
- Line 324, windows : No\strut
- Line 328, unix : \texttt{ICPSR\_29841/DS0007/29841-0007-Data-REST.dta}\strut
- Line 330, windows : THEOP\strut
- Line 334, windows : No\strut
- Line 338, unix : \texttt{ICPSR\_29841/DS0008/29841-0008-Data-REST.dta}\strut
- Line 340, windows : THEOP\strut
- Line 344, windows : No\strut
- Line 350, windows : THEOP public-use datasets\strut
- Line 354, windows : No\strut
- Line 358, unix : \texttt{data/raw/cps/cps\_00003.csv}\strut
- Line 360, windows : CPS\strut
- Line 364, windows : Yes\strut
- Line 368, unix : \texttt{data/raw/IPEDS\_200304/sfa0203\_data\_stata.csv}\strut
- Line 370, windows : IPEDS\strut
- Line 374, windows : Yes\strut
- Line 378, unix : \texttt{data/raw/IPEDS\_200304/ic2003\_data\_stata.csv}\strut
- Line 380, windows : IPEDS\strut
- Line 384, windows : Yes\strut
- Line 388, unix : \texttt{data/raw/IPEDS\_200304/hd2003\_data\_stata.csv}\strut
- Line 390, windows : IPEDS\strut
- Line 394, windows : Yes\strut
- Line 398, unix : \texttt{data/raw/SAT-ACT crosswalk/crosswalk.csv}\strut
- Line 404, windows : Yes\strut
- Line 408, unix : \texttt{data/raw/geocoded/J\_geocoded.csv}\strut
- Line 410, windows : Author's Own Work\strut
- Line 414, windows : Yes\strut
- Line 420, unix : \textbf{Note: } The code that was used to construct ``J\_geocoded.dta'' and ``J\_geocoded.csv'' is provided in replication\_package/code/setup/geocode\_colleges.do.
- Line 431, windows : Data file\strut
- Line 433, windows : Notes\strut
- Line 439, unix : \texttt{data/raw/ICPSR\_29841\_simulated/DS0001/29841-0001-Data-REST.dta}\strut
- Line 445, unix : \texttt{data/raw/ICPSR\_29841\_simulated/DS0002/29841-0002-Data-REST.dta}\strut
- Line 451, unix : \texttt{data/raw/ICPSR\_29841\_simulated/DS0005/29841-0005-Data-REST.dta}\strut
- Line 457, unix : \texttt{data/raw/ICPSR\_29841\_simulated/DS0006/29841-0006-Data-REST.dta}\strut
- Line 463, unix : \texttt{data/raw/ICPSR\_29841\_simulated/DS0007/29841-0007-Data-REST.dta}\strut
- Line 469, unix : \texttt{data/raw/ICPSR\_29841\_simulated/DS0008/29841-0008-Data-REST.dta}\strut
- Line 475, unix : \texttt{data/raw/THEOP\_public\_simulated/\{pa,amk,tt,ri,sm\}.csv}\strut
- Line 498, unix : % install/set up the environment. Sample scripts for
- Line 556, unix : programs/code}\label{description-of-programscode}}
- Line 561, unix : Programs in \texttt{code/setup} load and clean the raw data, and produce some exhibits. The Stata file
- Line 562, unix : \texttt{code/setup/master.do} will run them all, provided that one has access to the restricted datasets.
- Line 564, unix : Programs in \texttt{code/analysis} generate the remaining figures, tables, and numbers
- Line 565, unix : in the paper. The Julia file \texttt{code/analysis/tttnew.jl} will run them all.
- Line 566, unix : \item Note: after running the Julia code, figures and tables will be saved in \texttt{output/Tables}. Nontrivial numbers will be saved in \texttt{output/Numbers}. These are loaded programatically in the paper's .tex files.
- Line 577, unix : \item Open Stata 15.1. Install the needed packages. Change the paths in code/setup/Master.do, lines 7-12, to the appropriate locations. Run code/setup/master.do.
- Line 580, unix : \item Open code/analysis/TTTnew.jl. There are sevaral options in lines 5--16. Make sure that ``use\old\_simdata\_approach'', ``simulate\_data'', ``run\_tests'', and ``load\_saved\_boot\_cutoffs\_step2''  are set to \textbf{false}. Make sure that the remaining options are set to \textbf{true}.
- Line 592, unix : % Every exhibit and number in the paper and appendix is produced by the Julia code, \emph{except for} Table 1 of the paper. Table 1 is a table of summary statistics produced by the Stata file \textit{code/setup/new\_descriptive.do}.
- Line 601, unix : %   \item Run \textit{code/setup/new\_descriptive.do}
- Line 613, unix : \item Number in abstract (``I estimate that two thirds of the plan's 9.1\% impact''):  Numbers/top10\_impact.tex, produced by describeNumbers.jl, lines 21-23.
- Line 614, unix : \item Numbers in introduction, first paragraph of page 2: Numbers/top10\_impact.tex and Numbers/top10\_impact\_allaware.tex, produced by describeNumbers.jl, lines 21-23 and lines 27-29, respectively.
- Line 617, unix : \item ``I find a 13.8\% increase'' (p28): Numbers/fit\_rdd.tex, produced by describeFit2024.jl.
- Line 618, unix : \item Panel A shows... (p.29, text and footnote 21): Numbers/jump\_prA\_surv.tex, Numbers/jump\_prA\_model.tex, Numbers/prA\_model.tex, Numbers/jump\_prA\_surv\_UTA.tex, Numbers/jump\_prA\_model\_UTA.tex, Numbers/prA\_model\_UTA.tex, Numbers/prA\_model\_dif\_nottt.tex, respectively. Produced by describeFit2024.jl.
- Line 621, unix : \item Numbers in Appendix E.4, footnote 36: ``Numbers/increase\_enrollment\_ttt.tex'' and ``Numbers/increase\_enrollment\_ttt\_instatepublic.tex'', respectively, produced by descibe\_extensions.jl.
- Line 622, unix : \item Numbers in Appendix E.4, ``The total increase in four-year college enrollment among top-decile students is equal to...'': ``Numbers/increase\_enrollment\_ttt.tex,'' ``Numbers/increase\_enrollment\_nonttt.tex,'' and ``Numbers/increase\_enrollment\_total.tex'', respectively, produced by describe\_extensions.jl.
- Line 623, unix : \item Number in Appendix E.4, ``The peer-average SAT score at baseline is equal to...'': ``Numbers/mean\_sat\_1\_base.tex'', produced by describe\_extensions.jl.
- Line 624, unix : \item Numbers in Appendix E.5: ``I find that the LOS program would have increased UT Austin enrollment...'': ``Numbers/los\_d1.tex, Numbers/los\_d2.tex, Numbers/los\_d5.tex, Numbers/los\_d11.tex'' respectively, produced by describeNoLOS2024.jl.
- Line 629, unix : \item Table 1: Output/Tables/means\_studentlevel.tex, produced by code/setup/new\_descriptive.do.  Requires restricted data.
- Line 630, unix : \item Figure 1: Output/Tables/fig\_fit\_1.png, produced by code/analysis/describeFit2024.jl. Requires restricted data.
- Line 631, unix : \item Table 2: Output/Tables/tab\_gamma.tex, produced by describeResults2024.jl. Requires restricted data.
- Line 632, unix : \item Figure 2: Output/Tables/fig\_params.png, produced by describeResults2024.jl. Requires restricted data.
- Line 633, unix : \item Figure 3: Output/Tables/fig\_prefs\_aware\_simple.png, produced by describeResults2024.jl. Requires restricted data.
- Line 634, unix : \item Table 3: Output/Tables/tab\_robustness.tex, produced by describeCounterfactuals2024.jl. Requires restricted data.
- Line 635, unix : \item Figure 4: Output/Tables/fig\_cf\_1.png, produced by describeCounterfactuals2024.jl. Requires restricted data.
- Line 636, unix : \item Figure A1: Output/Tables/fig\_fit\_1\_UTA.png, produced by describeFit2024.jl. Requires restricted data.
- Line 637, unix : \item Figure A2: Output/Tables/fig\_fit\_1\_TAMU.png, produced by describeFit2024.jl. Requires restricted data.
- Line 638, unix : \item Figure A3: Output/Tables/fig\_fit\_1\_Other.png, produced by describeFit2024.jl. Requires restricted data.
- Line 639, unix : \item Table A1: Output/Tables/tab\_info.tex, produced by describeParameters2024.jl. Requires Restricted Data.
- Line 640, unix : \item Table A2: Output/Tables/tab\_cutoffs.tex, produced by describeParameters2024.jl. Requires Restricted Data.
- Line 641, unix : \item Table A3: Output/Tables/tab\_gamma\_probit.tex, produced by describeParameters2024.jl. Requires restricted data.
- Line 642, unix : \item Figure A4: Output/Tables/fig\_prefs\_aware.png, produced by describeParameters2024.jl. Requires restricted data.
- Line 643, unix : \item Figure A5: Output/Tables/fig\_cf\_1b\_bar.png, produced by describeCounterfactuals2024.jl. Requires restricted data.
- Line 644, unix : \item Figure A6: Output/Tables/fig\_pushed\_pulled\_totalchange.png, produced by describe\_extensions.jl. Requires restricted data.
- Line 645, unix : \item Figure A7: Output/Tables/fig\_pushed\_pulled.png, produced by describe\_extensions.jl. Requires restricted data.
- Line 646, unix : \item Table A4: Output/Tables/tab\_outcomes\_nonflagship.tex, produced by describe\_extensions.jl. Requires restricted data.
- Line 647, unix : \item Figure A8: Output/Tables/fig\_total\_persistence.png, produced by describe\_extensions.jl. Requires restricted data.
- Line 648, unix : \item Figure A9: Output/Tables/fit\_los.png, produced by describeNoLos2024.jl. Requires restricted data.
- Line 649, unix : \item Table A5: Output/Tables/tab\_robustness\_classbalance\_extension.tex, produced by describeAdditionalModels.jl. Requires restricted data.
- Line 650, unix : \item Table A6: Output/Tables/tab\_gamma\_includev.tex, produced by describeAdditionalModels.jl. Requires restricted data.
- Line 651, unix : \item Table A7: Output/Tables/tab\_robustness\_v.tex, produced by describeAdditionalModels.jl. Requires restricted data.

**/code/setup/ExportCollegeNames.do**

- Line 8, windows : outsheet collegeID college using "${workfiles_path}\toMatlab\collegeNames.txt", replace noquote

**/code/analysis/describeParameters2024.jl**

- Line 178, unix : coef_s!q = var_s/var_q
- Line 561, windows : ["\$\\underline\\pi\$ Eqbm. ($(z))" for z in name_J];

**/code/analysis/reversemodegradientfunctions_2024.jl**

- Line 14, unix : d_sum_expll = d_loglik/sum_expll
- Line 144, unix : d_prj = d_log_prj/prj
- Line 195, unix : d_denom::Float64 = -d_ll_a/denom
- Line 295, unix : d_tmp2[jj] = d_ll_qq/tmp2[jj]

**/code/setup/UTA_TAMU_Admin.do**

- Line 5, windows : local UTA_rawdata = "${rawdata_path}\DS0005\29841-0005-Data-REST"
- Line 6, windows : local UTA_transcripts = "${rawdata_path}\DS0006\29841-0006-Data-REST"
- Line 7, windows : local TAMU_rawdata = "${rawdata_path}\DS0007\29841-0007-Data-REST"
- Line 8, windows : local TAMU_transcripts = "${rawdata_path}\DS0008\29841-0008-Data-REST"
- Line 44, unix : gen satr = testscore_c/10
- Line 50, unix : gen crtrank = hspctrank_c^(1/4)
- Line 137, unix : replace SATr = SATr/1600

**/code/analysis/TTTestimate_noallocation.jl**

- Line 322, unix : dilm1[id][nn] = mysum/ilm1[id][nn]
- Line 323, unix : dGG[id][nn] = -mysum/GG[id][nn]
- Line 566, unix : obj = -loglik/nobs + aidmoment

