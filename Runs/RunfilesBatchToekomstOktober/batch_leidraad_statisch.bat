REM GeoDmsRun.exe [/PProjName] [/LLogFileName] ConfigFileName ItemNames
REM [] betekent optioneel
REM Sluit GUI-variant(GeoDmsGui.exe) af bij aanroepen van GeoDmsRun.exe (indien dit dezelfde is)
REM Resultaten worden weggeschreven in: n:/LD/%confignaam%/results/...
REM Bij nogmaals runnen worden bestanden gewoon overschreven

Call path/set.bat

"%exe_path%" /L"%log_dir%\S0_Statisch.txt" "%prj_dir%\Runs\S0_Referentie.dms" /LeidraadResultaten/StartJaar/PlanRegioResults/Statisch/export_csv/result
"%exe_path%" /L"%log_dir%\S0_Statisch.txt" "%prj_dir%\Runs\S0_Referentie.dms" /LeidraadResultaten/StartJaar/PlanregioResults/Statisch/table_vergelijking
