REM GeoDmsRun.exe [/PProjName] [/LLogFileName] ConfigFileName ItemNames
REM [] betekent optioneel
REM Sluit GUI-variant(GeoDmsGui.exe) af bij aanroepen van GeoDmsRun.exe (indien dit dezelfde is)
REM Resultaten worden weggeschreven in: n:/LD/%confignaam%/results/...
REM Bij nogmaals runnen worden bestanden gewoon overschreven

REM aanpassingen voor machine specifieke paden
set prj_dir=N:\PD\_Folckert\VestaDV_GeneralisatieConversie
set log_dir=N:\log_folckert
set exe_dir=N:\prog\ObjectVision\GeoDms7207

REM einde aanpassingen voor machine specifieke paden

set exe_path=%exe_dir%\GeoDMSRun.exe

set ITEM1=/LeidraadResultaten/Zichtjaar/PlanRegioResults/Hoofdindicatoren/export_csv/result
set ITEM2=/LeidraadResultaten/Zichtjaar/PlanRegioResults/NationaleKosten/export_csv/result
set ITEM3=/LeidraadResultaten/Zichtjaar/PlanRegioResults/Aansluitingen/export_csv/result
set ITEM4=/LeidraadResultaten/Zichtjaar/PlanRegioResults/Hulpvariabelen/export_csv/result
set ITEM5=/LeidraadResultaten/Zichtjaar/PlanRegioResults/GevoeligheidsAnalyse/export_csv/result
set ITEMS=%ITEM1% %ITEM2% %ITEM3% %ITEM4% %ITEM5%

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

pause Totaal klaar