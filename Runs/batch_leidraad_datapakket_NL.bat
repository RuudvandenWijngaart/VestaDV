REM GeoDmsRun.exe [/PProjName] [/LLogFileName] ConfigFileName ItemNames
REM [] betekent optioneel
REM Sluit GUI-variant(GeoDmsGui.exe) af bij aanroepen van GeoDmsRun.exe (indien dit dezelfde is)
REM Resultaten worden weggeschreven in: n:/LD/%confignaam%/results/...
REM Bij nogmaals runnen worden bestanden gewoon overschreven


REM GeoDmsRun.exe [/PProjName] [/LLogFileName] ConfigFileName ItemNames
REM [] betekent optioneel
REM Sluit GUI-variant(GeoDmsGui.exe) af bij aanroepen van GeoDmsRun.exe (indien dit dezelfde is)
REM Resultaten worden weggeschreven in: n:/LD/%confignaam%/results/...
REM Bij nogmaals runnen worden bestanden gewoon overschreven

REM aanpassingen voor machine specifieke paden
Call path/set.bat

"%exe_path%" /L"%log_dir%\Runfile_StartJaar_DataPakketExport_NL.txt"           "%prj_dir%\Runs\Runfile.dms"           LeidraadResultaten/StartJaar/DataPakketExport/bestaand/export_csv_nl/result
"%exe_path%" /L"%log_dir%\Runfile_ZichtJaar_DataPakketExport_NL.txt"           "%prj_dir%\Runs\Runfile.dms"           LeidraadResultaten/ZichtJaar/DataPakketExport/bestaand/export_csv_nl/result

"%exe_path%" /L"%log_dir%\S1a_B_LuchtWP_ZichtJaar_DataPakketExport_NL.txt"     "%prj_dir%\Runs\S1a_B_LuchtWP.dms"     LeidraadResultaten/ZichtJaar/DataPakketExport/bestaand/export_csv_nl/result
"%exe_path%" /L"%log_dir%\S1b_B_BodemWP_ZichtJaar_DataPakketExport_NL.txt"     "%prj_dir%\Runs\S1b_B_BodemWP.dms"     LeidraadResultaten/ZichtJaar/DataPakketExport/bestaand/export_csv_nl/result

"%exe_path%" /L"%log_dir%\S2a_B_Restwarmte_ZichtJaar_DataPakketExport_NL.txt"  "%prj_dir%\Runs\S2a_B_Restwarmte.dms"  LeidraadResultaten/ZichtJaar/DataPakketExport/bestaand/export_csv_nl/result
"%exe_path%" /L"%log_dir%\S2b_B_Geo_contour_ZichtJaar_DataPakketExport_NL.txt" "%prj_dir%\Runs\S2b_B_Geo_contour.dms" LeidraadResultaten/ZichtJaar/DataPakketExport/bestaand/export_csv_nl/result
"%exe_path%" /L"%log_dir%\S2c_B_Geo_overal_ZichtJaar_DataPakketExport_NL.txt"  "%prj_dir%\Runs\S2c_B_Geo_overal.dms"  LeidraadResultaten/ZichtJaar/DataPakketExport/bestaand/export_csv_nl/result
"%exe_path%" /L"%log_dir%\S2d_D_Restwarmte_ZichtJaar_DataPakketExport_NL.txt"  "%prj_dir%\Runs\S2d_D_Restwarmte.dms"  LeidraadResultaten/ZichtJaar/DataPakketExport/bestaand/export_csv_nl/result
"%exe_path%" /L"%log_dir%\S2e_D_Geo_contour_ZichtJaar_DataPakketExport_NL.txt" "%prj_dir%\Runs\S2e_D_Geo_contour.dms" LeidraadResultaten/ZichtJaar/DataPakketExport/bestaand/export_csv_nl/result
"%exe_path%" /L"%log_dir%\S2f_D_Geo_overal_ZichtJaar_DataPakketExport_NL.txt"  "%prj_dir%\Runs\S2f_D_Geo_overal.dms"  LeidraadResultaten/ZichtJaar/DataPakketExport/bestaand/export_csv_nl/result

"%exe_path%" /L"%log_dir%\S3a_B_LT30_30_ZichtJaar_DataPakketExport_NL.txt"     "%prj_dir%\Runs\S3a_B_LT30_30.dms"     LeidraadResultaten/ZichtJaar/DataPakketExport/bestaand/export_csv_nl/result
"%exe_path%" /L"%log_dir%\S3b_B_LT30_70_ZichtJaar_DataPakketExport_NL.txt"     "%prj_dir%\Runs\S3b_B_LT30_70.dms"     LeidraadResultaten/ZichtJaar/DataPakketExport/bestaand/export_csv_nl/result
"%exe_path%" /L"%log_dir%\S3c_B_BuurtWKO_ZichtJaar_DataPakketExport_NL.txt"    "%prj_dir%\Runs\S3c_B_BuurtWKO.dms"    LeidraadResultaten/ZichtJaar/DataPakketExport/bestaand/export_csv_nl/result
"%exe_path%" /L"%log_dir%\S3d_B_WKO_ZichtJaar_DataPakketExport_NL.txt"         "%prj_dir%\Runs\S3d_B_WKO.dms"         LeidraadResultaten/ZichtJaar/DataPakketExport/bestaand/export_csv_nl/result
"%exe_path%" /L"%log_dir%\S3e_B_TEO_ZichtJaar_DataPakketExport_NL.txt"         "%prj_dir%\Runs\S3e_B_TEO.dms"         LeidraadResultaten/ZichtJaar/DataPakketExport/bestaand/export_csv_nl/result
"%exe_path%" /L"%log_dir%\S3f_D_LT30_70_ZichtJaar_DataPakketExport_NL.txt"     "%prj_dir%\Runs\S3f_D_LT30_70.dms"     LeidraadResultaten/ZichtJaar/DataPakketExport/bestaand/export_csv_nl/result
"%exe_path%" /L"%log_dir%\S3g_D_BuurtWKO_ZichtJaar_DataPakketExport_NL.txt"    "%prj_dir%\Runs\S3g_D_BuurtWKO.dms"    LeidraadResultaten/ZichtJaar/DataPakketExport/bestaand/export_csv_nl/result
"%exe_path%" /L"%log_dir%\S3h_D_TEO_ZichtJaar_DataPakketExport_NL.txt"         "%prj_dir%\Runs\S3h_D_TEO.dms"         LeidraadResultaten/ZichtJaar/DataPakketExport/bestaand/export_csv_nl/result

"%exe_path%" /L"%log_dir%\S4a_GG_B_hWP_ZichtJaar_DataPakketExport_NL.txt"      "%prj_dir%\Runs\S4a_GG_B_hWP.dms"      LeidraadResultaten/ZichtJaar/DataPakketExport/bestaand/export_csv_nl/result
"%exe_path%" /L"%log_dir%\S4b_GG_B_HR_ZichtJaar_DataPakketExport_NL.txt"       "%prj_dir%\Runs\S4b_GG_B_HR.dms"       LeidraadResultaten/ZichtJaar/DataPakketExport/bestaand/export_csv_nl/result
"%exe_path%" /L"%log_dir%\S4c_GG_D_hWP_ZichtJaar_DataPakketExport_NL.txt"      "%prj_dir%\Runs\S4c_GG_D_hWP.dms"      LeidraadResultaten/ZichtJaar/DataPakketExport/bestaand/export_csv_nl/result
"%exe_path%" /L"%log_dir%\S4d_GG_D_HR_ZichtJaar_DataPakketExport_NL.txt"       "%prj_dir%\Runs\S4d_GG_D_HR.dms"       LeidraadResultaten/ZichtJaar/DataPakketExport/bestaand/export_csv_nl/result

"%exe_path%" /L"%log_dir%\S5a_H2_B_hWP_ZichtJaar_DataPakketExport_NL.txt"      "%prj_dir%\Runs\S5a_H2_B_hWP.dms"      LeidraadResultaten/ZichtJaar/DataPakketExport/bestaand/export_csv_nl/result
"%exe_path%" /L"%log_dir%\S5b_H2_B_HR_ZichtJaar_DataPakketExport_NL.txt"       "%prj_dir%\Runs\S5b_H2_B_HR.dms"       LeidraadResultaten/ZichtJaar/DataPakketExport/bestaand/export_csv_nl/result
"%exe_path%" /L"%log_dir%\S5c_H2_D_hWP_ZichtJaar_DataPakketExport_NL.txt"      "%prj_dir%\Runs\S5c_H2_D_hWP.dms"      LeidraadResultaten/ZichtJaar/DataPakketExport/bestaand/export_csv_nl/result
"%exe_path%" /L"%log_dir%\S5d_H2_D_HR_ZichtJaar_DataPakketExport_NL.txt"       "%prj_dir%\Runs\S5d_H2_D_HR.dms"       LeidraadResultaten/ZichtJaar/DataPakketExport/bestaand/export_csv_nl/result

pause Totaal klaar