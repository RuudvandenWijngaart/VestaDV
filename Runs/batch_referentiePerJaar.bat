REM GeoDmsRun.exe [/PProjName] [/LLogFileName] ConfigFileName ItemNames
REM [] betekent optioneel
REM Sluit GUI-variant(GeoDmsGui.exe) af bij aanroepen van GeoDmsRun.exe (indien dit dezelfde is)
REM Resultaten worden weggeschreven in: n:/LD/%confignaam%/results/...
REM Bij nogmaals runnen worden bestanden gewoon overschreven

REM aanpassingen voor machine specifieke paden
Call path/set.bat

START "HESTIA" /WAIT /BELOWNORMAL /NODE 0 /AFFINITY 0x5555 "%exe_path%" "/L%log_dir%\ReferentiePerJaar.txt"  "%prj_dir%\Runs\ReferentiePerJaar.dms" /Resultaten/Exports/GenerateAllIndicatoren

pause Totaal klaar