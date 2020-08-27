REM GeoDmsRun.exe [/PProjName] [/LLogFileName] ConfigFileName ItemNames
REM [] betekent optioneel
REM Sluit GUI-variant(GeoDmsGui.exe) af bij aanroepen van GeoDmsRun.exe (indien dit dezelfde is)
REM Resultaten worden weggeschreven in: n:/LD/%confignaam%/results/...
REM Bij nogmaals runnen worden bestanden gewoon overschreven

REM aanpassingen voor machine specifieke paden
set prj_dir=C:\Users\Gebruiker\Desktop\Vesta\PD\VestaDV_Conversie
set log_dir=C:\Users\Gebruiker\Desktop\Vesta\log_folckert
set exe_dir=C:\Program Files\ObjectVision\GeoDms7212

REM einde aanpassingen voor machine specifieke paden

set exe_path=%exe_dir%\GeoDMSRun.exe

set ITEM1=/LeidraadResultaten/Zichtjaar/PlanRegioResults/GevoeligheidsAnalyse/export_csv/result
set ITEMS=%ITEM1%

"%exe_path%" /L"%log_dir%\S1_WP.txt"       "%prj_dir%\Runs\Runfile.dms"       /Vergelijking/Outputs/S1_WP/GevoeligheidsAnalyse/export_csv/result

"%exe_path%" /L"%log_dir%\S2_MT.txt"       "%prj_dir%\Runs\Runfile.dms"       /Vergelijking/Outputs/S2_MT/GevoeligheidsAnalyse/export_csv/result

"%exe_path%" /L"%log_dir%\S3_LT.txt"       "%prj_dir%\Runs\Runfile.dms"       /Vergelijking/Outputs/S3_LT/GevoeligheidsAnalyse/export_csv/result

"%exe_path%" /L"%log_dir%\S4_GG.txt"       "%prj_dir%\Runs\Runfile.dms"       /Vergelijking/Outputs/S4_GG/GevoeligheidsAnalyse/export_csv/result

"%exe_path%" /L"%log_dir%\S5_H2.txt"       "%prj_dir%\Runs\Runfile.dms"       /Vergelijking/Outputs/S5_H2/GevoeligheidsAnalyse/export_csv/result

"%exe_path%" /L"%log_dir%\LN.txt"          "%prj_dir%\Runs\Runfile.dms"       /Vergelijking/Outputs/LN/GevoeligheidsAnalyse/export_csv/result

pause Totaal klaar