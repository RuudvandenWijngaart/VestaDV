REM GeoDmsRun.exe [/PProjName] [/Llog_basFileName] ConfigFileName ItemNames
REM [] betekent optioneel
REM Sluit GUI-variant(GeoDmsGui.exe) af bij aanroepen van GeoDmsRun.exe (indien dit dezelfde is)
REM Resultaten worden weggeschreven in: n:/LD/%confignaam%/results/...
REM Bij nogmaals runnen worden bestanden gewoon overschreven

set pd_root=N:\PD\_Bas\Vesta35beta_Bas
set exe=GeoDms7182

set CUR_YYYY=%date:~10,4%
set CUR_MM=%date:~4,2%
set CUR_DD=%date:~7,2%
set CUR_HH=%time:~0,2%
if %CUR_HH% lss 10 (set CUR_HH=0%time:~1,1%)
set CUR_NN=%time:~3,2%
set CUR_SS=%time:~6,2%
set CUR_MS=%time:~9,2%
set SUBFILENAME=%CUR_YYYY%%CUR_MM%%CUR_DD%-%CUR_HH%%CUR_NN%%CUR_SS%

if not exist %pd_root% goto error

"N:\prog\ObjectVision\%exe%\GeoDmsRun.exe" /L"N:\log_bas\%SUBFILENAME%_S0_Referentie_StartJaar_S1_Hoofdindicatoren.txt" "%pd_root%\Runs\S0_Referentie.dms" /Resultaten/StartJaar/PlanRegioResults/Vergelijking/meerkosten/Scenario_1/Hoofdindicatoren
"N:\prog\ObjectVision\%exe%\GeoDmsRun.exe" /L"N:\log_bas\%SUBFILENAME%_S0_Referentie_StartJaar_S1_NationaleKosten.txt" "%pd_root%\Runs\S0_Referentie.dms" /Resultaten/StartJaar/PlanRegioResults/Vergelijking/meerkosten/Scenario_1/NationaleKosten
"N:\prog\ObjectVision\%exe%\GeoDmsRun.exe" /L"N:\log_bas\%SUBFILENAME%_S0_Referentie_StartJaar_S1_Aansluitingen.txt" "%pd_root%\Runs\S0_Referentie.dms" /Resultaten/StartJaar/PlanRegioResults/Vergelijking/meerkosten/Scenario_1/Aansluitingen
"N:\prog\ObjectVision\%exe%\GeoDmsRun.exe" /L"N:\log_bas\%SUBFILENAME%_S0_Referentie_StartJaar_S1_Gevoeligheidsanalyse.txt" "%pd_root%\Runs\S0_Referentie.dms" /Resultaten/StartJaar/PlanRegioResults/Vergelijking/meerkosten/Scenario_1/Gevoeligheidsanalyse

"N:\prog\ObjectVision\%exe%\GeoDmsRun.exe" /L"N:\log_bas\%SUBFILENAME%_S0_Referentie_StartJaar_S2_Hoofdindicatoren.txt" "%pd_root%\Runs\S0_Referentie.dms" /Resultaten/StartJaar/PlanRegioResults/Vergelijking/meerkosten/Scenario_2/Hoofdindicatoren
"N:\prog\ObjectVision\%exe%\GeoDmsRun.exe" /L"N:\log_bas\%SUBFILENAME%_S0_Referentie_StartJaar_S2_NationaleKosten.txt" "%pd_root%\Runs\S0_Referentie.dms" /Resultaten/StartJaar/PlanRegioResults/Vergelijking/meerkosten/Scenario_2/NationaleKosten
"N:\prog\ObjectVision\%exe%\GeoDmsRun.exe" /L"N:\log_bas\%SUBFILENAME%_S0_Referentie_StartJaar_S2_Aansluitingen.txt" "%pd_root%\Runs\S0_Referentie.dms" /Resultaten/StartJaar/PlanRegioResults/Vergelijking/meerkosten/Scenario_2/Aansluitingen
"N:\prog\ObjectVision\%exe%\GeoDmsRun.exe" /L"N:\log_bas\%SUBFILENAME%_S0_Referentie_StartJaar_S2_Gevoeligheidsanalyse.txt" "%pd_root%\Runs\S0_Referentie.dms" /Resultaten/StartJaar/PlanRegioResults/Vergelijking/meerkosten/Scenario_2/Gevoeligheidsanalyse

"N:\prog\ObjectVision\%exe%\GeoDmsRun.exe" /L"N:\log_bas\%SUBFILENAME%_S0_Referentie_StartJaar_S3_Hoofdindicatoren.txt" "%pd_root%\Runs\S0_Referentie.dms" /Resultaten/StartJaar/PlanRegioResults/Vergelijking/meerkosten/Scenario_3/Hoofdindicatoren
"N:\prog\ObjectVision\%exe%\GeoDmsRun.exe" /L"N:\log_bas\%SUBFILENAME%_S0_Referentie_StartJaar_S3_NationaleKosten.txt" "%pd_root%\Runs\S0_Referentie.dms" /Resultaten/StartJaar/PlanRegioResults/Vergelijking/meerkosten/Scenario_3/NationaleKosten
"N:\prog\ObjectVision\%exe%\GeoDmsRun.exe" /L"N:\log_bas\%SUBFILENAME%_S0_Referentie_StartJaar_S3_Aansluitingen.txt" "%pd_root%\Runs\S0_Referentie.dms" /Resultaten/StartJaar/PlanRegioResults/Vergelijking/meerkosten/Scenario_3/Aansluitingen
"N:\prog\ObjectVision\%exe%\GeoDmsRun.exe" /L"N:\log_bas\%SUBFILENAME%_S0_Referentie_StartJaar_S3_Gevoeligheidsanalyse.txt" "%pd_root%\Runs\S0_Referentie.dms" /Resultaten/StartJaar/PlanRegioResults/Vergelijking/meerkosten/Scenario_3/Gevoeligheidsanalyse

"N:\prog\ObjectVision\%exe%\GeoDmsRun.exe" /L"N:\log_bas\%SUBFILENAME%_S0_Referentie_StartJaar_S4_Hoofdindicatoren.txt" "%pd_root%\Runs\S0_Referentie.dms" /Resultaten/StartJaar/PlanRegioResults/Vergelijking/meerkosten/Scenario_4/Hoofdindicatoren
"N:\prog\ObjectVision\%exe%\GeoDmsRun.exe" /L"N:\log_bas\%SUBFILENAME%_S0_Referentie_StartJaar_S4_NationaleKosten.txt" "%pd_root%\Runs\S0_Referentie.dms" /Resultaten/StartJaar/PlanRegioResults/Vergelijking/meerkosten/Scenario_4/NationaleKosten
"N:\prog\ObjectVision\%exe%\GeoDmsRun.exe" /L"N:\log_bas\%SUBFILENAME%_S0_Referentie_StartJaar_S4_Aansluitingen.txt" "%pd_root%\Runs\S0_Referentie.dms" /Resultaten/StartJaar/PlanRegioResults/Vergelijking/meerkosten/Scenario_4/Aansluitingen
"N:\prog\ObjectVision\%exe%\GeoDmsRun.exe" /L"N:\log_bas\%SUBFILENAME%_S0_Referentie_StartJaar_S4_Gevoeligheidsanalyse.txt" "%pd_root%\Runs\S0_Referentie.dms" /Resultaten/StartJaar/PlanRegioResults/Vergelijking/meerkosten/Scenario_4/Gevoeligheidsanalyse

"N:\prog\ObjectVision\%exe%\GeoDmsRun.exe" /L"N:\log_bas\%SUBFILENAME%_S0_Referentie_StartJaar_S5_Hoofdindicatoren.txt" "%pd_root%\Runs\S0_Referentie.dms" /Resultaten/StartJaar/PlanRegioResults/Vergelijking/meerkosten/Scenario_5/Hoofdindicatoren
"N:\prog\ObjectVision\%exe%\GeoDmsRun.exe" /L"N:\log_bas\%SUBFILENAME%_S0_Referentie_StartJaar_S5_NationaleKosten.txt" "%pd_root%\Runs\S0_Referentie.dms" /Resultaten/StartJaar/PlanRegioResults/Vergelijking/meerkosten/Scenario_5/NationaleKosten
"N:\prog\ObjectVision\%exe%\GeoDmsRun.exe" /L"N:\log_bas\%SUBFILENAME%_S0_Referentie_StartJaar_S5_Aansluitingen.txt" "%pd_root%\Runs\S0_Referentie.dms" /Resultaten/StartJaar/PlanRegioResults/Vergelijking/meerkosten/Scenario_5/Aansluitingen
"N:\prog\ObjectVision\%exe%\GeoDmsRun.exe" /L"N:\log_bas\%SUBFILENAME%_S0_Referentie_StartJaar_S4_Gevoeligheidsanalyse.txt" "%pd_root%\Runs\S0_Referentie.dms" /Resultaten/StartJaar/PlanRegioResults/Vergelijking/meerkosten/Scenario_4/Gevoeligheidsanalyse

"N:\prog\ObjectVision\%exe%\GeoDmsRun.exe" /L"N:\log_bas\%SUBFILENAME%_S0_Referentie_StartJaar_S6_Hoofdindicatoren.txt" "%pd_root%\Runs\S0_Referentie.dms" /Resultaten/StartJaar/PlanRegioResults/Vergelijking/meerkosten/Scenario_6/Hoofdindicatoren
"N:\prog\ObjectVision\%exe%\GeoDmsRun.exe" /L"N:\log_bas\%SUBFILENAME%_S0_Referentie_StartJaar_S6_NationaleKosten.txt" "%pd_root%\Runs\S0_Referentie.dms" /Resultaten/StartJaar/PlanRegioResults/Vergelijking/meerkosten/Scenario_6/NationaleKosten
"N:\prog\ObjectVision\%exe%\GeoDmsRun.exe" /L"N:\log_bas\%SUBFILENAME%_S0_Referentie_StartJaar_S6_Aansluitingen.txt" "%pd_root%\Runs\S0_Referentie.dms" /Resultaten/StartJaar/PlanRegioResults/Vergelijking/meerkosten/Scenario_6/Aansluitingen
"N:\prog\ObjectVision\%exe%\GeoDmsRun.exe" /L"N:\log_bas\%SUBFILENAME%_S0_Referentie_StartJaar_S6_Gevoeligheidsanalyse.txt" "%pd_root%\Runs\S0_Referentie.dms" /Resultaten/StartJaar/PlanRegioResults/Vergelijking/meerkosten/Scenario_6/Gevoeligheidsanalyse

