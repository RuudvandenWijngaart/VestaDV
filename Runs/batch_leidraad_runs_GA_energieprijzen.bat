REM GeoDmsRun.exe [/PProjName] [/LLogFileName] ConfigFileName ItemNames
REM [] betekent optioneel
REM Sluit GUI-variant(GeoDmsGui.exe) af bij aanroepen van GeoDmsRun.exe (indien dit dezelfde is)
REM Resultaten worden weggeschreven in: n:/LD/%confignaam%/results/...
REM Bij nogmaals runnen worden bestanden gewoon overschreven

set pd_root=N:\PD\Runs_Leidraad\Default_Configuratie
set exe=GeoDms7182

set CUR_YYYY=%date:~10,4%
set CUR_MM=%date:~4,2%
set CUR_DD=%date:~7,2%
set CUR_HH=%time:~0,2%
if %CUR_HH% lss 10 (set CUR_HH=0%time:~1,1%)
set CUR_NN=%time:~3,2%
set CUR_SS=%time:~6,2%
set CUR_MS=%time:~9,2%
set SUBFILENAME=%CUR_YYYY%%CUR_MM%%CUR_DD%-%CUR_HH%%CUR_NN%%CUR_SS%

if not exist %pd_root% goto error



"N:\prog\ObjectVision\%exe%\GeoDmsRun.exe" /L"N:\log\%SUBFILENAME%_Referentie_R1_2030_Hoofdindicatoren.txt" "%pd_root%\Runs\Referentie_GA_energieprijzen_hoog.dms" /Resultaten/R1_2030/PlanRegioResults/Hoofdindicatoren
"N:\prog\ObjectVision\%exe%\GeoDmsRun.exe" /L"N:\log\%SUBFILENAME%_Referentie_R1_2030_Hoofdindicatoren.txt" "%pd_root%\Runs\Referentie_GA_energieprijzen_laag.dms" /Resultaten/R1_2030/PlanRegioResults/Hoofdindicatoren


"N:\prog\ObjectVision\%exe%\GeoDmsRun.exe" /L"N:\log\%SUBFILENAME%_S1a_AllElectric_lucht_R2_2030_Hoofdindicatoren.txt" "%pd_root%\Runs\S1a_AllElectric_lucht_GA_energieprijzen_hoog.dms" /Resultaten/R2_2030/PlanRegioResults/Hoofdindicatoren
"N:\prog\ObjectVision\%exe%\GeoDmsRun.exe" /L"N:\log\%SUBFILENAME%_S1a_AllElectric_lucht_R2_2030_Hoofdindicatoren.txt" "%pd_root%\Runs\S1a_AllElectric_lucht_GA_energieprijzen_laag.dms" /Resultaten/R2_2030/PlanRegioResults/Hoofdindicatoren


"N:\prog\ObjectVision\%exe%\GeoDmsRun.exe" /L"N:\log\%SUBFILENAME%_S1b_AllElectric_bodem_R2_2030_Hoofdindicatoren.txt" "%pd_root%\Runs\S1b_AllElectric_bodem_GA_energieprijzen_hoog.dms" /Resultaten/R2_2030/PlanRegioResults/Hoofdindicatoren
"N:\prog\ObjectVision\%exe%\GeoDmsRun.exe" /L"N:\log\%SUBFILENAME%_S1b_AllElectric_bodem_R2_2030_Hoofdindicatoren.txt" "%pd_root%\Runs\S1b_AllElectric_bodem_GA_energieprijzen_laag.dms" /Resultaten/R2_2030/PlanRegioResults/Hoofdindicatoren


"N:\prog\ObjectVision\%exe%\GeoDmsRun.exe" /L"N:\log\%SUBFILENAME%_S2a_restwarmte_R1_2030_Hoofdindicatoren.txt" "%pd_root%\Runs\S2a_restwarmte_GA_energieprijzen_hoog.dms" /Resultaten/R1_2030/PlanRegioResults/Hoofdindicatoren
"N:\prog\ObjectVision\%exe%\GeoDmsRun.exe" /L"N:\log\%SUBFILENAME%_S2a_restwarmte_R1_2030_Hoofdindicatoren.txt" "%pd_root%\Runs\S2a_restwarmte_GA_energieprijzen_laag.dms" /Resultaten/R1_2030/PlanRegioResults/Hoofdindicatoren

"N:\prog\ObjectVision\%exe%\GeoDmsRun.exe" /L"N:\log\%SUBFILENAME%_S2b_Geothermie-metcontour_R1_2030_Hoofdindicatoren.txt" "%pd_root%\Runs\S2b_Geothermie-metcontour_GA_energieprijzen_hoog.dms" /Resultaten/R1_2030/PlanRegioResults/Hoofdindicatoren
"N:\prog\ObjectVision\%exe%\GeoDmsRun.exe" /L"N:\log\%SUBFILENAME%_S2b_Geothermie-metcontour_R1_2030_Hoofdindicatoren.txt" "%pd_root%\Runs\S2b_Geothermie-metcontour_GA_energieprijzen_laag.dms" /Resultaten/R1_2030/PlanRegioResults/Hoofdindicatoren

"N:\prog\ObjectVision\%exe%\GeoDmsRun.exe" /L"N:\log\%SUBFILENAME%_S2c_Geothermie-zondercontour_R1_2030_Hoofdindicatoren.txt" "%pd_root%\Runs\S2c_Geothermie-zondercontour_GA_energieprijzen_hoog.dms" /Resultaten/R1_2030/PlanRegioResults/Hoofdindicatoren
"N:\prog\ObjectVision\%exe%\GeoDmsRun.exe" /L"N:\log\%SUBFILENAME%_S2c_Geothermie-zondercontour_R1_2030_Hoofdindicatoren.txt" "%pd_root%\Runs\S2c_Geothermie-zondercontour_GA_energieprijzen_laag.dms" /Resultaten/R1_2030/PlanRegioResults/Hoofdindicatoren

"N:\prog\ObjectVision\%exe%\GeoDmsRun.exe" /L"N:\log\%SUBFILENAME%_S2d_BioWKK_R1_2030_Hoofdindicatoren.txt" "%pd_root%\Runs\S2d_BioWKK_GA_energieprijzen_hoog.dms" /Resultaten/R1_2030/PlanRegioResults/Hoofdindicatoren
"N:\prog\ObjectVision\%exe%\GeoDmsRun.exe" /L"N:\log\%SUBFILENAME%_S2d_BioWKK_R1_2030_Hoofdindicatoren.txt" "%pd_root%\Runs\S2d_BioWKK_GA_energieprijzen_laag.dms" /Resultaten/R1_2030/PlanRegioResults/Hoofdindicatoren


"N:\prog\ObjectVision\%exe%\GeoDmsRun.exe" /L"N:\log\%SUBFILENAME%_S3a_LT3030_R2_2030_Hoofdindicatoren.txt" "%pd_root%\Runs\S3a_LT3030_GA_energieprijzen_hoog.dms" /Resultaten/R2_2030/PlanRegioResults/Hoofdindicatoren
"N:\prog\ObjectVision\%exe%\GeoDmsRun.exe" /L"N:\log\%SUBFILENAME%_S3a_LT3030_R2_2030_Hoofdindicatoren.txt" "%pd_root%\Runs\S3a_LT3030_GA_energieprijzen_laag.dms" /Resultaten/R2_2030/PlanRegioResults/Hoofdindicatoren

"N:\prog\ObjectVision\%exe%\GeoDmsRun.exe" /L"N:\log\%SUBFILENAME%_S3b_LT3070_R2_2030_Hoofdindicatoren.txt" "%pd_root%\Runs\S3b_LT3070_GA_energieprijzen_hoog.dms" /Resultaten/R2_2030/PlanRegioResults/Hoofdindicatoren
"N:\prog\ObjectVision\%exe%\GeoDmsRun.exe" /L"N:\log\%SUBFILENAME%_S3b_LT3070_R2_2030_Hoofdindicatoren.txt" "%pd_root%\Runs\S3b_LT3070_GA_energieprijzen_laag.dms" /Resultaten/R2_2030/PlanRegioResults/Hoofdindicatoren

"N:\prog\ObjectVision\%exe%\GeoDmsRun.exe" /L"N:\log\%SUBFILENAME%_S3c_LT3050_R2_2030_Hoofdindicatoren.txt" "%pd_root%\Runs\S3c_LT3050_GA_energieprijzen_hoog.dms" /Resultaten/R2_2030/PlanRegioResults/Hoofdindicatoren
"N:\prog\ObjectVision\%exe%\GeoDmsRun.exe" /L"N:\log\%SUBFILENAME%_S3c_LT3050_R2_2030_Hoofdindicatoren.txt" "%pd_root%\Runs\S3c_LT3050_GA_energieprijzen_laag.dms" /Resultaten/R2_2030/PlanRegioResults/Hoofdindicatoren

"N:\prog\ObjectVision\%exe%\GeoDmsRun.exe" /L"N:\log\%SUBFILENAME%_S3d_WKO_R2_2030_Hoofdindicatoren.txt" "%pd_root%\Runs\S3d_WKO_GA_energieprijzen_hoog.dms" /Resultaten/R2_2030/PlanRegioResults/Hoofdindicatoren
"N:\prog\ObjectVision\%exe%\GeoDmsRun.exe" /L"N:\log\%SUBFILENAME%_S3d_WKO_R2_2030_Hoofdindicatoren.txt" "%pd_root%\Runs\S3d_WKO_GA_energieprijzen_laag.dms" /Resultaten/R2_2030/PlanRegioResults/Hoofdindicatoren

"N:\prog\ObjectVision\%exe%\GeoDmsRun.exe" /L"N:\log\%SUBFILENAME%_S3e_TEO_R2_2030_Hoofdindicatoren.txt" "%pd_root%\Runs\S3e_TEO_GA_energieprijzen_hoog.dms" /Resultaten/R2_2030/PlanRegioResults/Hoofdindicatoren
"N:\prog\ObjectVision\%exe%\GeoDmsRun.exe" /L"N:\log\%SUBFILENAME%_S3e_TEO_R2_2030_Hoofdindicatoren.txt" "%pd_root%\Runs\S3e_TEO_GA_energieprijzen_laag.dms" /Resultaten/R2_2030/PlanRegioResults/Hoofdindicatoren


"N:\prog\ObjectVision\%exe%\GeoDmsRun.exe" /L"N:\log\%SUBFILENAME%_S4_hwp_GG_R1_2030_Hoofdindicatoren.txt" "%pd_root%\Runs\S4_hwp_GG_GA_energieprijzen_hoog.dms" /Resultaten/R1_2030/PlanRegioResults/Hoofdindicatoren
"N:\prog\ObjectVision\%exe%\GeoDmsRun.exe" /L"N:\log\%SUBFILENAME%_S4_hwp_GG_R1_2030_Hoofdindicatoren.txt" "%pd_root%\Runs\S4_hwp_GG_GA_energieprijzen_laag.dms" /Resultaten/R1_2030/PlanRegioResults/Hoofdindicatoren

"N:\prog\ObjectVision\%exe%\GeoDmsRun.exe" /L"N:\log\%SUBFILENAME%_S5_HR_GG_R1_2030_Hoofdindicatoren.txt" "%pd_root%\Runs\S5_HR_GG_GA_energieprijzen_hoog.dms" /Resultaten/R1_2030/PlanRegioResults/Hoofdindicatoren
"N:\prog\ObjectVision\%exe%\GeoDmsRun.exe" /L"N:\log\%SUBFILENAME%_S5_HR_GG_R1_2030_Hoofdindicatoren.txt" "%pd_root%\Runs\S5_HR_GG_GA_energieprijzen_laag.dms" /Resultaten/R1_2030/PlanRegioResults/Hoofdindicatoren

