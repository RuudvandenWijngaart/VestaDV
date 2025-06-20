REM GeoDmsRun.exe [/PProjName] [/LLogFileName] ConfigFileName ItemNames
REM [] betekent optioneel
REM Sluit GUI-variant(GeoDmsGui.exe) af bij aanroepen van GeoDmsRun.exe (indien dit dezelfde is)
REM Resultaten worden weggeschreven in: n:/LD/%confignaam%/results/...
REM Bij nogmaals runnen worden bestanden gewoon overschreven

REM aanpassingen voor machine specifieke paden
Call path/set.bat
set FLAGS=/S1 /C2 /S3

call :do_variant supplementair_S3b_B_buurtWKO15_15
call :do_variant supplementair_S3c_B_buurtWKO15_50
call :do_variant supplementair_S3d_B_buurtWKO15_70
call :do_variant supplementair_S3g_D_buurtWKO15_15
call :do_variant supplementair_S3h_D_buurtWKO15_70


echo Klaar met uitrekenen van alle varianten per buurt

exit /B


:do_variant

set ITEM1=/LeidraadResultaten/Zichtjaar/PlanRegioResults/Hoofdindicatoren/export_csv/result
set ITEM2=/LeidraadResultaten/Zichtjaar/PlanRegioResults/NationaleKosten/export_csv/result
set ITEM3=/LeidraadResultaten/Zichtjaar/PlanRegioResults/Aansluitingen/export_csv/result
set ITEM4=/LeidraadResultaten/Zichtjaar/PlanRegioResults/Hulpvariabelen/export_csv/result
set ITEM5=/LeidraadResultaten/Zichtjaar/PlanRegioResults/GevoeligheidsAnalyse/export_csv/result
set ITEMS=%ITEM1% %ITEM2% %ITEM3% %ITEM4% %ITEM5% 


REM "%exe_path%" /L"%log_dir%\%1.txt" %FLAGS% "%prj_dir%\Runs\%1.dms" %ITEM1% || call :error_handler
REM "%exe_path%" /L"%log_dir%\%1.txt" %FLAGS% "%prj_dir%\Runs\%1.dms" %ITEM2% || call :error_handler
REM "%exe_path%" /L"%log_dir%\%1.txt" %FLAGS% "%prj_dir%\Runs\%1.dms" %ITEM3% || call :error_handler
REM "%exe_path%" /L"%log_dir%\%1.txt" %FLAGS% "%prj_dir%\Runs\%1.dms" %ITEM4% || call :error_handler
REM "%exe_path%" /L"%log_dir%\%1.txt" %FLAGS% "%prj_dir%\Runs\%1.dms" %ITEM5% || call :error_handler

"%exe_path%" /L"%log_dir%\%1.txt" %FLAGS% "%prj_dir%\Runs\%1.dms" %ITEMS% || call :error_handler

exit /B

:error_handler
echo Laatste rekenstap gaf foutcode: %errorlevel%. 
echo Het rekenproces zal worden voortgezet tenzij u het nu afbreekt met Ctrl-C.
pause
exit /B
