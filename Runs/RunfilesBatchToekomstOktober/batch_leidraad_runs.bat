REM GeoDmsRun.exe [/PProjName] [/LLogFileName] ConfigFileName ItemNames
REM [] betekent optioneel
REM Sluit GUI-variant(GeoDmsGui.exe) af bij aanroepen van GeoDmsRun.exe (indien dit dezelfde is)
REM Resultaten worden weggeschreven in: n:/LD/%confignaam%/results/...
REM Bij nogmaals runnen worden bestanden gewoon overschreven

Call path/set.bat

"%exe_path%" /L"%log_dir%\S0_StatischAll.txt" "%prj_dir%\Runs\S0_Referentie.dms" /LeidraadResultaten/StartJaar/PlanRegioResults/Statisch/export_csv/result /LeidraadResultaten/Zichtjaar/PlanRegioResults/Hoofdindicatoren/export_csv/result /LeidraadResultaten/Zichtjaar/NLResults/Hoofdindicatoren/export_csv/result /LeidraadResultaten/Zichtjaar/PlanRegioResults/NationaleKosten/export_csv/result /LeidraadResultaten/Zichtjaar/NLResults/NationaleKosten/export_csv/result /LeidraadResultaten/Zichtjaar/PlanRegioResults/Aansluitingen/export_csv/result /LeidraadResultaten/Zichtjaar/NLResults/Aansluitingen/export_csv/result

set ITEM1=/LeidraadResultaten/Zichtjaar/PlanRegioResults/Hoofdindicatoren/export_csv/result /LeidraadResultaten/Zichtjaar/NLResults/Hoofdindicatoren/export_csv/result
set ITEM2=/LeidraadResultaten/Zichtjaar/PlanRegioResults/NationaleKosten/export_csv/result /LeidraadResultaten/Zichtjaar/NLResults/NationaleKosten/export_csv/result
set ITEM3=/LeidraadResultaten/Zichtjaar/PlanRegioResults/Aansluitingen/export_csv/result /LeidraadResultaten/Zichtjaar/NLResults/Aansluitingen/export_csv/result
set ITEMS=%ITEM1% %ITEM2% %ITEM3%

"%exe_path%" /L"%log_dir%\S0_Referentie_StartJaar_Hoofdindicatoren.txt" "%prj_dir%\Runs\S0_Referentie.dms" %ITEMS%
"%exe_path%" /L"%log_dir%\S0_Referentie_R2_2030_Hoofdindicatoren.txt" "%prj_dir%\Runs\S0_Referentie.dms" %ITEMS%
"%exe_path%" /L"%log_dir%\S1a_AllElectric_lucht_R2_2030_Hoofdindicatoren.txt" "%prj_dir%\Runs\S1a_AllElectric_lucht.dms" %ITEMS%
"%exe_path%" /L"%log_dir%\S1b_AllElectric_bodem_R2_2030_Hoofdindicatoren.txt" "%prj_dir%\Runs\S1b_AllElectric_bodem.dms" %ITEMS%
"%exe_path%" /L"%log_dir%\S2a_restwarmte_R1_2030_Hoofdindicatoren.txt" "%prj_dir%\Runs\S2a_restwarmte.dms" %ITEMS%
"%exe_path%" /L"%log_dir%\S2b_Geothermie-metcontour_R1_2030_Hoofdindicatoren.txt" "%prj_dir%\Runs\S2b_Geothermie-metcontour.dms" %ITEMS%
"%exe_path%" /L"%log_dir%\S2c_Geothermie-zondercontour_R1_2030_Hoofdindicatoren.txt" "%prj_dir%\Runs\S2c_Geothermie-zondercontour.dms" %ITEMS%
"%exe_path%" /L"%log_dir%\S2d_BioWKK_R1_2030_Hoofdindicatoren.txt" "%prj_dir%\Runs\S2d_BioWKK.dms" %ITEMS%
"%exe_path%" /L"%log_dir%\S3a_LT3030_R2_2030_Hoofdindicatoren.txt" "%prj_dir%\Runs\S3a_LT3030.dms" %ITEMS%
"%exe_path%" /L"%log_dir%\S3b_LT3070_R2_2030_Hoofdindicatoren.txt" "%prj_dir%\Runs\S3b_LT3070.dms" %ITEMS%
"%exe_path%" /L"%log_dir%\S3c_LT3050_R2_2030_Hoofdindicatoren.txt" "%prj_dir%\Runs\S3c_LT3050.dms" %ITEMS%
"%exe_path%" /L"%log_dir%\S3d_WKO_R2_2030_Hoofdindicatoren.txt" "%prj_dir%\Runs\S3d_WKO.dms" %ITEMS%
"%exe_path%" /L"%log_dir%\S3e_TEO_R2_2030_Hoofdindicatoren.txt" "%prj_dir%\Runs\S3e_TEO.dms" %ITEMS%
"%exe_path%" /L"%log_dir%\S4_hwp_GG_R1_2030_Hoofdindicatoren.txt" "%prj_dir%\Runs\S4_hwp_GG.dms" %ITEMS%
"%exe_path%" /L"%log_dir%\S5_HR_GG_R1_2030_Hoofdindicatoren.txt" "%prj_dir%\Runs\S5_HR_GG.dms" %ITEMS%

