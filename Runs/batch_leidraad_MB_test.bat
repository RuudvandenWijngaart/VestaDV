REM GeoDmsRun.exe [/PProjName] [/LLogFileName] ConfigFileName ItemNames
REM [] betekent optioneel
REM Sluit GUI-variant(GeoDmsGui.exe) af bij aanroepen van GeoDmsRun.exe (indien dit dezelfde is)
REM Resultaten worden weggeschreven in: n:/LD/%confignaam%/results/...
REM Bij nogmaals runnen worden bestanden gewoon overschreven

REM aanpassingen voor machine specifieke paden
set prj_dir=D:\prj_git\VestaDV
set log_dir=D:\LocalData\log_vesta
set exe_dir=C:\Program Files\ObjectVision\GeoDms7207


REM einde aanpassingen voor machine specifieke paden

set exe_path=%exe_dir%\GeoDMSRun.exe

"%exe_path%" /L"%log_dir%\StatischAll.txt" "%prj_dir%\Runs\Runfile.dms" /LeidraadResultaten/StartJaar/PlanRegioResults/Statisch/export_csv/result

set ITEM1=/LeidraadResultaten/Zichtjaar/PlanRegioResults/Hoofdindicatoren/export_csv/result
set ITEM2=/LeidraadResultaten/Zichtjaar/PlanRegioResults/NationaleKosten/export_csv/result
set ITEM3=/LeidraadResultaten/Zichtjaar/PlanRegioResults/Aansluitingen/export_csv/result
set ITEM4=/LeidraadResultaten/Zichtjaar/PlanRegioResults/Hulpvariabelen/export_csv/result
set ITEM5=/LeidraadResultaten/Zichtjaar/PlanRegioResults/GevoeligheidsAnalyse/export_csv/result
set ITEMS=%ITEM1% %ITEM2% %ITEM3% %ITEM4% %ITEM5%

"%exe_path%" /L"%log_dir%\Ref2019All.txt"        "%prj_dir%\Runs\Runfile.dms"     /LeidraadResultaten/Startjaar/PlanRegioResults/Hoofdindicatoren/export_csv/result
"%exe_path%" /L"%log_dir%\Ref2030All.txt"        "%prj_dir%\Runs\Runfile.dms"     /LeidraadResultaten/Ref2030/PlanRegioResults/Hoofdindicatoren/export_csv/result

"%exe_path%" /L"%log_dir%\S2a_B_Restwarmte.txt"  "%prj_dir%\Runs\S2a_B_Restwarmte.dms"  %ITEM1%
"%exe_path%" /L"%log_dir%\S2b_B_Geo_contour.txt" "%prj_dir%\Runs\S2b_B_Geo_contour.dms" %ITEM1%
"%exe_path%" /L"%log_dir%\S2c_B_Geo_overal.txt"  "%prj_dir%\Runs\S2c_B_Geo_overal.dms"  %ITEM1%
"%exe_path%" /L"%log_dir%\S2d_D_Restwarmte.txt"  "%prj_dir%\Runs\S2d_D_Restwarmte.dms"  %ITEM1%
"%exe_path%" /L"%log_dir%\S2e_D_Geo_contour.txt" "%prj_dir%\Runs\S2e_D_Geo_contour.dms" %ITEM1%
"%exe_path%" /L"%log_dir%\S2f_D_Geo_overal.txt"  "%prj_dir%\Runs\S2f_D_Geo_overal.dms"  %ITEM1%

"%exe_path%" /L"%log_dir%\S3a_B_LT30_30.txt"     "%prj_dir%\Runs\S3a_B_LT30_30.dms"     %ITEM1%
"%exe_path%" /L"%log_dir%\S3b_B_LT30_70.txt"     "%prj_dir%\Runs\S3b_B_LT30_70.dms"     %ITEM1%
"%exe_path%" /L"%log_dir%\S3c_B_BuurtWKO.txt"    "%prj_dir%\Runs\S3c_B_BuurtWKO.dms"    %ITEM1%
"%exe_path%" /L"%log_dir%\S3d_B_WKO.txt"         "%prj_dir%\Runs\S3d_B_WKO.dms"         %ITEM1%
"%exe_path%" /L"%log_dir%\S3e_B_TEO.txt"         "%prj_dir%\Runs\S3e_B_TEO.dms"         %ITEM1%
"%exe_path%" /L"%log_dir%\S3f_D_LT30_70.txt"     "%prj_dir%\Runs\S3f_D_LT30_70.dms"     %ITEM1%
"%exe_path%" /L"%log_dir%\S3g_D_BuurtWKO.txt"    "%prj_dir%\Runs\S3g_D_BuurtWKO.dms"    %ITEM1%
"%exe_path%" /L"%log_dir%\S3h_D_TEO.txt"         "%prj_dir%\Runs\S3h_D_TEO.dms"         %ITEM1%

"%exe_path%" /L"%log_dir%\S4a_GG_B_hWP.txt"      "%prj_dir%\Runs\S4a_GG_B_hWP.dms"      %ITEM1%
"%exe_path%" /L"%log_dir%\S4b_GG_B_HR.txt"       "%prj_dir%\Runs\S4b_GG_B_HR.dms"       %ITEM1%
"%exe_path%" /L"%log_dir%\S4c_GG_D_hWP.txt"      "%prj_dir%\Runs\S4c_GG_D_hWP.dms"      %ITEM1%
"%exe_path%" /L"%log_dir%\S4d_GG_D_HR.txt"       "%prj_dir%\Runs\S4d_GG_D_HR.dms"       %ITEM1%

"%exe_path%" /L"%log_dir%\S5a_H2_B_hWP.txt"      "%prj_dir%\Runs\S5a_H2_B_hWP.dms"      %ITEM1%
"%exe_path%" /L"%log_dir%\S5b_H2_B_HR.txt"       "%prj_dir%\Runs\S5b_H2_B_HR.dms"       %ITEM1%
"%exe_path%" /L"%log_dir%\S5c_H2_D_hWP.txt"      "%prj_dir%\Runs\S5c_H2_D_hWP.dms"      %ITEM1%
"%exe_path%" /L"%log_dir%\S5d_H2_D_HR.txt"       "%prj_dir%\Runs\S5d_H2_D_HR.dms"       %ITEM1%
pause Totaal klaar