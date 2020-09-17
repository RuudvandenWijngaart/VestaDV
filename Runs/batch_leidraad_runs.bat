REM GeoDmsRun.exe [/PProjName] [/LLogFileName] ConfigFileName ItemNames
REM [] betekent optioneel
REM Sluit GUI-variant(GeoDmsGui.exe) af bij aanroepen van GeoDmsRun.exe (indien dit dezelfde is)
REM Resultaten worden weggeschreven in: n:/LD/%confignaam%/results/...
REM Bij nogmaals runnen worden bestanden gewoon overschreven

REM aanpassingen voor machine specifieke paden
Call path/set.bat

"%exe_path%" /L"%log_dir%\StatischAll.txt" "%prj_dir%\Runs\Runfile.dms" /LeidraadResultaten/StartJaar/PlanRegioResults/Statisch/export_csv/result

set ITEM1=/LeidraadResultaten/Zichtjaar/PlanRegioResults/Hoofdindicatoren/export_csv/result
set ITEM2=/LeidraadResultaten/Zichtjaar/PlanRegioResults/NationaleKosten/export_csv/result
set ITEM3=/LeidraadResultaten/Zichtjaar/PlanRegioResults/Aansluitingen/export_csv/result
set ITEM4=/LeidraadResultaten/Zichtjaar/PlanRegioResults/Hulpvariabelen/export_csv/result
set ITEM5=/LeidraadResultaten/Zichtjaar/PlanRegioResults/GevoeligheidsAnalyse/export_csv/result
set ITEMS=%ITEM1% %ITEM2% %ITEM3% %ITEM4% %ITEM5%

"%exe_path%" /L"%log_dir%\Ref2019All.txt"        "%prj_dir%\Runs\Runfile.dms"     /LeidraadResultaten/Startjaar/PlanRegioResults/Hoofdindicatoren/export_csv/result
"%exe_path%" /L"%log_dir%\Ref2019All.txt"        "%prj_dir%\Runs\Runfile.dms"     /LeidraadResultaten/Startjaar/PlanRegioResults/NationaleKosten/export_csv/result
"%exe_path%" /L"%log_dir%\Ref2019All.txt"        "%prj_dir%\Runs\Runfile.dms"     /LeidraadResultaten/Startjaar/PlanRegioResults/Aansluitingen/export_csv/result

"%exe_path%" /L"%log_dir%\Ref2030All.txt"        "%prj_dir%\Runs\Runfile.dms"     /LeidraadResultaten/Ref2030/PlanRegioResults/Hoofdindicatoren/export_csv/result
"%exe_path%" /L"%log_dir%\Ref2030All.txt"        "%prj_dir%\Runs\Runfile.dms"     /LeidraadResultaten/Ref2030/PlanRegioResults/NationaleKosten/export_csv/result
"%exe_path%" /L"%log_dir%\Ref2030All.txt"        "%prj_dir%\Runs\Runfile.dms"     /LeidraadResultaten/Ref2030/PlanRegioResults/Aansluitingen/export_csv/result

"%exe_path%" /L"%log_dir%\S1a_B_LuchtWP.txt"     "%prj_dir%\Runs\S1a_B_LuchtWP.dms"     %ITEMS%
"%exe_path%" /L"%log_dir%\S1b_B_BodemWP.txt"     "%prj_dir%\Runs\S1b_B_BodemWP.dms"     %ITEMS%

"%exe_path%" /L"%log_dir%\S1AofB.txt"       "%prj_dir%\Runs\Runfile.dms" /Vergelijking/Outputs/S1AofB/export_csv/result

"%exe_path%" /L"%log_dir%\S2a_B_Restwarmte.txt"  "%prj_dir%\Runs\S2a_B_Restwarmte.dms"  %ITEMS%
"%exe_path%" /L"%log_dir%\S2b_B_Geo_contour.txt" "%prj_dir%\Runs\S2b_B_Geo_contour.dms" %ITEMS%
"%exe_path%" /L"%log_dir%\S2c_B_Geo_overal.txt"  "%prj_dir%\Runs\S2c_B_Geo_overal.dms"  %ITEMS%
"%exe_path%" /L"%log_dir%\S2d_D_Restwarmte.txt"  "%prj_dir%\Runs\S2d_D_Restwarmte.dms"  %ITEMS%
"%exe_path%" /L"%log_dir%\S2e_D_Geo_contour.txt" "%prj_dir%\Runs\S2e_D_Geo_contour.dms" %ITEMS%
"%exe_path%" /L"%log_dir%\S2f_D_Geo_overal.txt"  "%prj_dir%\Runs\S2f_D_Geo_overal.dms"  %ITEMS%

"%exe_path%" /L"%log_dir%\S3a_B_LT30_30.txt"     "%prj_dir%\Runs\S3a_B_LT30_30.dms"     %ITEMS%
"%exe_path%" /L"%log_dir%\S3b_B_LT30_70.txt"     "%prj_dir%\Runs\S3b_B_LT30_70.dms"     %ITEMS%
"%exe_path%" /L"%log_dir%\S3c_B_BuurtWKO.txt"    "%prj_dir%\Runs\S3c_B_BuurtWKO.dms"    %ITEMS%
"%exe_path%" /L"%log_dir%\S3d_B_WKO.txt"         "%prj_dir%\Runs\S3d_B_WKO.dms"         %ITEMS%
"%exe_path%" /L"%log_dir%\S3e_B_TEO.txt"         "%prj_dir%\Runs\S3e_B_TEO.dms"         %ITEMS%
"%exe_path%" /L"%log_dir%\S3f_D_LT30_70.txt"     "%prj_dir%\Runs\S3f_D_LT30_70.dms"     %ITEMS%
"%exe_path%" /L"%log_dir%\S3g_D_BuurtWKO.txt"    "%prj_dir%\Runs\S3g_D_BuurtWKO.dms"    %ITEMS%
"%exe_path%" /L"%log_dir%\S3h_D_TEO.txt"         "%prj_dir%\Runs\S3h_D_TEO.dms"         %ITEMS%

"%exe_path%" /L"%log_dir%\S4a_GG_B_hWP.txt"      "%prj_dir%\Runs\S4a_GG_B_hWP.dms"      %ITEMS%
"%exe_path%" /L"%log_dir%\S4b_GG_B_HR.txt"       "%prj_dir%\Runs\S4b_GG_B_HR.dms"       %ITEMS%
"%exe_path%" /L"%log_dir%\S4c_GG_D_hWP.txt"      "%prj_dir%\Runs\S4c_GG_D_hWP.dms"      %ITEMS%
"%exe_path%" /L"%log_dir%\S4d_GG_D_HR.txt"       "%prj_dir%\Runs\S4d_GG_D_HR.dms"       %ITEMS%

"%exe_path%" /L"%log_dir%\S5a_H2_B_hWP.txt"      "%prj_dir%\Runs\S5a_H2_B_hWP.dms"      %ITEMS%
"%exe_path%" /L"%log_dir%\S5b_H2_B_HR.txt"       "%prj_dir%\Runs\S5b_H2_B_HR.dms"       %ITEMS%
"%exe_path%" /L"%log_dir%\S5c_H2_D_hWP.txt"      "%prj_dir%\Runs\S5c_H2_D_hWP.dms"      %ITEMS%
"%exe_path%" /L"%log_dir%\S5d_H2_D_HR.txt"       "%prj_dir%\Runs\S5d_H2_D_HR.dms"       %ITEMS%

"%exe_path%" /L"%log_dir%\S1_WP.txt"       "%prj_dir%\Runs\Runfile.dms"       /Vergelijking/Outputs/S1_WP/Hoofdindicatoren/export_csv/result
"%exe_path%" /L"%log_dir%\S1_WP.txt"       "%prj_dir%\Runs\Runfile.dms"       /Vergelijking/Outputs/S1_WP/NationaleKosten/export_csv/result
"%exe_path%" /L"%log_dir%\S1_WP.txt"       "%prj_dir%\Runs\Runfile.dms"       /Vergelijking/Outputs/S1_WP/Aansluitingen/export_csv/result
"%exe_path%" /L"%log_dir%\S1_WP.txt"       "%prj_dir%\Runs\Runfile.dms"       /Vergelijking/Outputs/S1_WP/GevoeligheidsAnalyse/export_csv/result

"%exe_path%" /L"%log_dir%\S2_MT.txt"       "%prj_dir%\Runs\Runfile.dms"       /Vergelijking/Outputs/S2_MT/Hoofdindicatoren/export_csv/result
"%exe_path%" /L"%log_dir%\S2_MT.txt"       "%prj_dir%\Runs\Runfile.dms"       /Vergelijking/Outputs/S2_MT/NationaleKosten/export_csv/result
"%exe_path%" /L"%log_dir%\S2_MT.txt"       "%prj_dir%\Runs\Runfile.dms"       /Vergelijking/Outputs/S2_MT/Aansluitingen/export_csv/result
"%exe_path%" /L"%log_dir%\S2_MT.txt"       "%prj_dir%\Runs\Runfile.dms"       /Vergelijking/Outputs/S2_MT/GevoeligheidsAnalyse/export_csv/result

"%exe_path%" /L"%log_dir%\S3_LT.txt"       "%prj_dir%\Runs\Runfile.dms"       /Vergelijking/Outputs/S3_LT/Hoofdindicatoren/export_csv/result
"%exe_path%" /L"%log_dir%\S3_LT.txt"       "%prj_dir%\Runs\Runfile.dms"       /Vergelijking/Outputs/S3_LT/NationaleKosten/export_csv/result
"%exe_path%" /L"%log_dir%\S3_LT.txt"       "%prj_dir%\Runs\Runfile.dms"       /Vergelijking/Outputs/S3_LT/Aansluitingen/export_csv/result
"%exe_path%" /L"%log_dir%\S3_LT.txt"       "%prj_dir%\Runs\Runfile.dms"       /Vergelijking/Outputs/S3_LT/GevoeligheidsAnalyse/export_csv/result

"%exe_path%" /L"%log_dir%\S4_GG.txt"       "%prj_dir%\Runs\Runfile.dms"       /Vergelijking/Outputs/S4_GG/Hoofdindicatoren/export_csv/result
"%exe_path%" /L"%log_dir%\S4_GG.txt"       "%prj_dir%\Runs\Runfile.dms"       /Vergelijking/Outputs/S4_GG/NationaleKosten/export_csv/result
"%exe_path%" /L"%log_dir%\S4_GG.txt"       "%prj_dir%\Runs\Runfile.dms"       /Vergelijking/Outputs/S4_GG/Aansluitingen/export_csv/result
"%exe_path%" /L"%log_dir%\S4_GG.txt"       "%prj_dir%\Runs\Runfile.dms"       /Vergelijking/Outputs/S4_GG/GevoeligheidsAnalyse/export_csv/result

"%exe_path%" /L"%log_dir%\S5_H2.txt"       "%prj_dir%\Runs\Runfile.dms"       /Vergelijking/Outputs/S5_H2/Hoofdindicatoren/export_csv/result
"%exe_path%" /L"%log_dir%\S5_H2.txt"       "%prj_dir%\Runs\Runfile.dms"       /Vergelijking/Outputs/S5_H2/NationaleKosten/export_csv/result
"%exe_path%" /L"%log_dir%\S5_H2.txt"       "%prj_dir%\Runs\Runfile.dms"       /Vergelijking/Outputs/S5_H2/Aansluitingen/export_csv/result
"%exe_path%" /L"%log_dir%\S5_H2.txt"       "%prj_dir%\Runs\Runfile.dms"       /Vergelijking/Outputs/S5_H2/GevoeligheidsAnalyse/export_csv/result

"%exe_path%" /L"%log_dir%\LN.txt"          "%prj_dir%\Runs\Runfile.dms"       /Vergelijking/Outputs/LN/Hoofdindicatoren/export_csv/result
"%exe_path%" /L"%log_dir%\LN.txt"          "%prj_dir%\Runs\Runfile.dms"       /Vergelijking/Outputs/LN/NationaleKosten/export_csv/result
"%exe_path%" /L"%log_dir%\LN.txt"          "%prj_dir%\Runs\Runfile.dms"       /Vergelijking/Outputs/LN/Aansluitingen/export_csv/result
"%exe_path%" /L"%log_dir%\LN.txt"          "%prj_dir%\Runs\Runfile.dms"       /Vergelijking/Outputs/LN/GevoeligheidsAnalyse/export_csv/result
"%exe_path%" /L"%log_dir%\LN.txt"          "%prj_dir%\Runs\Runfile.dms"       /Vergelijking/Outputs/LN/Hulpvariabelen/export_csv/result
pause Totaal klaar