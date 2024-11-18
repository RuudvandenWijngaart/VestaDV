REM GeoDmsRun.exe [/PProjName] [/LLogFileName] ConfigFileName ItemNames
REM [] betekent optioneel
REM Sluit GUI-variant(GeoDmsGui.exe) af bij aanroepen van GeoDmsRun.exe (indien dit dezelfde is)
REM Resultaten worden weggeschreven in: n:/LD/%confignaam%/results/...
REM Bij nogmaals runnen worden bestanden gewoon overschreven

REM aanpassingen voor machine specifieke paden
Call path/set.bat
set FLAGS=/S1 /C2 /S3
"%exe_path%" /L"%log_dir%\StatischAll.txt" %FLAGS% "%prj_dir%\Runs\Runfile.dms" /LeidraadResultaten/StartJaar/PlanRegioResults/Statisch/export_csv/result || call :error_handler

call :do_reference Startjaar
call :do_reference Ref2030

call :do_variant S1a_B_LuchtWP
call :do_variant S1b_B_BodemWP

"%exe_path%" /L"%log_dir%\S1AofB.txt" %FLAGS% "%prj_dir%\Runs\Runfile.dms" /Vergelijking/Outputs/S1AofB/export_csv/result || call :error_handler

call :do_variant S2a_B_Restwarmte
call :do_variant S2b_B_Geo_contour
call :do_variant S2c_B_Geo_overal
call :do_variant S2d_D_Restwarmte
call :do_variant S2e_D_Geo_contour
call :do_variant S2f_D_Geo_overal

call :do_variant S3a_B_LT30_30
call :do_variant S3b_B_WKO15_15
call :do_variant S3c_B_WKO15_70
call :do_variant S3d_B_WKO15_50
call :do_variant S3e_B_TEO_15_15
call :do_variant S3f_D_LT30_70
call :do_variant S3g_D_WKO15_15
call :do_variant S3h_D_WKO15_70

call :do_variant S4a_GG_B_hWP
call :do_variant S4b_GG_D_hWP

call :do_variant S5a_H2_B_hWP
call :do_variant S5b_H2_D_hWP

call :do_runfile S1_WP
call :do_runfile S2_MT
call :do_runfile S3_LT
call :do_runfile S4_GG
call :do_runfile S5_H2

call :do_runfile LN

"%exe_path%" /L"%log_dir%\LN.txt" %FLAGS%  "%prj_dir%\Runs\Runfile.dms" /Vergelijking/Outputs/LN/Hulpvariabelen/export_csv/result || call :error_handler

echo Klaar met uitrekenen van alle varianten per buurt
pause
exit /B

:do_reference

"%exe_path%" /L"%log_dir%\%1.txt" %FLAGS% "%prj_dir%\Runs\Runfile.dms" /LeidraadResultaten/%1/PlanRegioResults/Hoofdindicatoren/export_csv/result || call :error_handler
"%exe_path%" /L"%log_dir%\%1.txt" %FLAGS% "%prj_dir%\Runs\Runfile.dms" /LeidraadResultaten/%1/PlanRegioResults/NationaleKosten/export_csv/result  || call :error_handler
"%exe_path%" /L"%log_dir%\%1.txt" %FLAGS% "%prj_dir%\Runs\Runfile.dms" /LeidraadResultaten/%1/PlanRegioResults/Aansluitingen/export_csv/result    || call :error_handler

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


:do_runfile

set ITEM1=/Vergelijking/Outputs/%1/Hoofdindicatoren/export_csv/result
set ITEM2=/Vergelijking/Outputs/%1/NationaleKosten/export_csv/result
set ITEM3=/Vergelijking/Outputs/%1/Aansluitingen/export_csv/result
set ITEM4=/Vergelijking/Outputs/%1/GevoeligheidsAnalyse/export_csv/result
set ITEMS=%ITEM1% %ITEM2% %ITEM3% %ITEM4%

REM "%exe_path%" /L"%log_dir%\%1.txt" %FLAGS% "%prj_dir%\Runs\Runfile.dms" %ITEM1% || call :error_handler
REM "%exe_path%" /L"%log_dir%\%1.txt" %FLAGS% "%prj_dir%\Runs\Runfile.dms" %ITEM2% || call :error_handler
REM "%exe_path%" /L"%log_dir%\%1.txt" %FLAGS% "%prj_dir%\Runs\Runfile.dms" %ITEM3% || call :error_handler
REM "%exe_path%" /L"%log_dir%\%1.txt" %FLAGS% "%prj_dir%\Runs\Runfile.dms" %ITEM4% || call :error_handler
"%exe_path%" /L"%log_dir%\%1.txt" %FLAGS% "%prj_dir%\Runs\Runfile.dms" %ITEMS% || call :error_handler

exit /B

:error_handler
echo Laatste rekenstap gaf foutcode: %errorlevel%. 
echo Het rekenproces zal worden voortgezet tenzij u het nu afbreekt met Ctrl-C.
pause
exit /B
