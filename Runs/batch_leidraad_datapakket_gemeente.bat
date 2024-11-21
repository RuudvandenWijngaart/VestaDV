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

echo Klaar met uitrekenen van alle varianten per buurt voor het datapakket per gemeente
pause
exit /B

:do_reference

"%exe_path%" /L"%log_dir%\%1.txt" %FLAGS% "%prj_dir%\Runs\Runfile.dms" /LeidraadResultaten/%1/DataPakketExport/bestaand/generate_all || call :error_handler

exit /B

:do_variant

"%exe_path%" /L"%log_dir%\%1.txt" %FLAGS% "%prj_dir%\Runs\%1.dms"  /LeidraadResultaten/zichtjaar/DataPakketExport/bestaand/generate_all || call :error_handler

exit /B

:error_handler
echo Laatste rekenstap gaf foutcode: %errorlevel%. 
echo Het rekenproces zal worden voortgezet tenzij u het nu afbreekt met Ctrl-C.
pause
exit /B