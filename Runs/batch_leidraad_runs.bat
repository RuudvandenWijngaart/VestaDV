REM GeoDmsRun.exe [/PProjName] [/LLogFileName] ConfigFileName ItemNames
REM [] betekent optioneel
REM Sluit GUI-variant(GeoDmsGui.exe) af bij aanroepen van GeoDmsRun.exe (indien dit dezelfde is)
REM Resultaten worden weggeschreven in: n:/LD/%confignaam%/results/...
REM Bij nogmaals runnen worden bestanden gewoon overschreven

Call path/set.bat

set CUR_YYYY=%date:~10,4%
set CUR_MM=%date:~4,2%
set CUR_DD=%date:~7,2%
set CUR_HH=%time:~0,2%
if %CUR_HH% lss 10 (set CUR_HH=0%time:~1,1%)
set CUR_NN=%time:~3,2%
set CUR_SS=%time:~6,2%
set CUR_MS=%time:~9,2%
set SUBFILENAME=%CUR_YYYY%%CUR_MM%%CUR_DD%-%CUR_HH%%CUR_NN%%CUR_SS%

"%exe_path%" /L"%log_dir%\%SUBFILENAME%_Statisch.txt" "%prj_dir%\Runs\S0_Referentie.dms" /LeidraadResultaten/StartJaar/PlanRegioResults/Statisch


"%exe_path%" /L"%log_dir%\%SUBFILENAME%_S0_Referentie_StartJaar_Hoofdindicatoren.txt" "%prj_dir%\Runs\S0_Referentie.dms" /LeidraadResultaten/StartJaar/PlanRegioResults/Hoofdindicatoren
"%exe_path%" /L"%log_dir%\%SUBFILENAME%_S0_Referentie_StartJaar_NationaleKosten.txt" "%prj_dir%\Runs\S0_Referentie.dms" /LeidraadResultaten/StartJaar/PlanRegioResults/NationaleKosten
"%exe_path%" /L"%log_dir%\%SUBFILENAME%_S0_Referentie_StartJaar_Aansluitingen.txt" "%prj_dir%\Runs\S0_Referentie.dms" /LeidraadResultaten/StartJaar/PlanRegioResults/Aansluitingen

"%exe_path%" /L"%log_dir%\%SUBFILENAME%_S0_Referentie_R2_2030_Hoofdindicatoren.txt" "%prj_dir%\Runs\S0_Referentie.dms" /LeidraadResultaten/Zichtjaar/PlanRegioResults/Hoofdindicatoren
"%exe_path%" /L"%log_dir%\%SUBFILENAME%_S0_Referentie_R2_2030_NationaleKosten.txt" "%prj_dir%\Runs\S0_Referentie.dms" /LeidraadResultaten/Zichtjaar/PlanRegioResults/NationaleKosten
"%exe_path%" /L"%log_dir%\%SUBFILENAME%_S0_Referentie_R2_2030_Aansluitingen.txt" "%prj_dir%\Runs\S0_Referentie.dms" /LeidraadResultaten/Zichtjaar/PlanRegioResults/Aansluitingen


"%exe_path%" /L"%log_dir%\%SUBFILENAME%_S1a_AllElectric_lucht_R2_2030_Hoofdindicatoren.txt" "%prj_dir%\Runs\S1a_AllElectric_lucht.dms" /LeidraadResultaten/Zichtjaar/PlanRegioResults/Hoofdindicatoren
"%exe_path%" /L"%log_dir%\%SUBFILENAME%_S1a_AllElectric_lucht_R2_2030_NationaleKosten.txt" "%prj_dir%\Runs\S1a_AllElectric_lucht.dms" /LeidraadResultaten/Zichtjaar/PlanRegioResults/NationaleKosten
"%exe_path%" /L"%log_dir%\%SUBFILENAME%_S1a_AllElectric_lucht_R2_2030_Aansluitingen.txt" "%prj_dir%\Runs\S1a_AllElectric_lucht.dms" /LeidraadResultaten/Zichtjaar/PlanRegioResults/Aansluitingen

"%exe_path%" /L"%log_dir%\%SUBFILENAME%_S1b_AllElectric_bodem_R2_2030_Hoofdindicatoren.txt" "%prj_dir%\Runs\S1b_AllElectric_bodem.dms" /LeidraadResultaten/Zichtjaar/PlanRegioResults/Hoofdindicatoren
"%exe_path%" /L"%log_dir%\%SUBFILENAME%_S1b_AllElectric_bodem_R2_2030_NationaleKosten.txt" "%prj_dir%\Runs\S1b_AllElectric_bodem.dms" /LeidraadResultaten/Zichtjaar/PlanRegioResults/NationaleKosten
"%exe_path%" /L"%log_dir%\%SUBFILENAME%_S1b_AllElectric_bodem_R2_2030_Aansluitingen.txt" "%prj_dir%\Runs\S1b_AllElectric_bodem.dms" /LeidraadResultaten/Zichtjaar/PlanRegioResults/Aansluitingen


"%exe_path%" /L"%log_dir%\%SUBFILENAME%_S2a_restwarmte_R1_2030_Hoofdindicatoren.txt" "%prj_dir%\Runs\S2a_restwarmte.dms" /LeidraadResultaten/Zichtjaar/PlanRegioResults/Hoofdindicatoren
"%exe_path%" /L"%log_dir%\%SUBFILENAME%_S2a_restwarmte_R1_2030_NationaleKosten.txt" "%prj_dir%\Runs\S2a_restwarmte.dms" /LeidraadResultaten/Zichtjaar/PlanRegioResults/NationaleKosten
"%exe_path%" /L"%log_dir%\%SUBFILENAME%_S2a_restwarmte_R1_2030_Aansluitingen.txt" "%prj_dir%\Runs\S2a_restwarmte.dms" /LeidraadResultaten/Zichtjaar/PlanRegioResults/Aansluitingen

"%exe_path%" /L"%log_dir%\%SUBFILENAME%_S2b_Geothermie-metcontour_R1_2030_Hoofdindicatoren.txt" "%prj_dir%\Runs\S2b_Geothermie-metcontour.dms" /LeidraadResultaten/Zichtjaar/PlanRegioResults/Hoofdindicatoren
"%exe_path%" /L"%log_dir%\%SUBFILENAME%_S2b_Geothermie-metcontour_R1_2030_NationaleKosten.txt" "%prj_dir%\Runs\S2b_Geothermie-metcontour.dms" /LeidraadResultaten/Zichtjaar/PlanRegioResults/NationaleKosten
"%exe_path%" /L"%log_dir%\%SUBFILENAME%_S2b_Geothermie-metcontour_R1_2030_Aansluitingen.txt" "%prj_dir%\Runs\S2b_Geothermie-metcontour.dms" /LeidraadResultaten/Zichtjaar/PlanRegioResults/Aansluitingen

"%exe_path%" /L"%log_dir%\%SUBFILENAME%_S2c_Geothermie-zondercontour_R1_2030_Hoofdindicatoren.txt" "%prj_dir%\Runs\S2c_Geothermie-zondercontour.dms" /LeidraadResultaten/Zichtjaar/PlanRegioResults/Hoofdindicatoren
"%exe_path%" /L"%log_dir%\%SUBFILENAME%_S2c_Geothermie-zondercontour_R1_2030_NationaleKosten.txt" "%prj_dir%\Runs\S2c_Geothermie-zondercontour.dms" /LeidraadResultaten/Zichtjaar/PlanRegioResults/NationaleKosten
"%exe_path%" /L"%log_dir%\%SUBFILENAME%_S2c_Geothermie-zondercontour_R1_2030_Aansluitingen.txt" "%prj_dir%\Runs\S2c_Geothermie-zondercontour.dms" /LeidraadResultaten/Zichtjaar/PlanRegioResults/Aansluitingen

"%exe_path%" /L"%log_dir%\%SUBFILENAME%_S2d_BioWKK_R1_2030_Hoofdindicatoren.txt" "%prj_dir%\Runs\S2d_BioWKK.dms" /LeidraadResultaten/Zichtjaar/PlanRegioResults/Hoofdindicatoren
"%exe_path%" /L"%log_dir%\%SUBFILENAME%_S2d_BioWKK_R1_2030_NationaleKosten.txt" "%prj_dir%\Runs\S2d_BioWKK.dms" /LeidraadResultaten/Zichtjaar/PlanRegioResults/NationaleKosten
"%exe_path%" /L"%log_dir%\%SUBFILENAME%_S2d_BioWKK_R1_2030_Aansluitingen.txt" "%prj_dir%\Runs\S2d_BioWKK.dms" /LeidraadResultaten/Zichtjaar/PlanRegioResults/Aansluitingen


"%exe_path%" /L"%log_dir%\%SUBFILENAME%_S3a_LT3030_R2_2030_Hoofdindicatoren.txt" "%prj_dir%\Runs\S3a_LT3030.dms" /LeidraadResultaten/Zichtjaar/PlanRegioResults/Hoofdindicatoren
"%exe_path%" /L"%log_dir%\%SUBFILENAME%_S3a_LT3030_R2_2030_NationaleKosten.txt" "%prj_dir%\Runs\S3a_LT3030.dms" /LeidraadResultaten/Zichtjaar/PlanRegioResults/NationaleKosten
"%exe_path%" /L"%log_dir%\%SUBFILENAME%_S3a_LT3030_R2_2030_Aansluitingen.txt" "%prj_dir%\Runs\S3a_LT3030.dms" /LeidraadResultaten/Zichtjaar/PlanRegioResults/Aansluitingen

"%exe_path%" /L"%log_dir%\%SUBFILENAME%_S3b_LT3070_R2_2030_Hoofdindicatoren.txt" "%prj_dir%\Runs\S3b_LT3070.dms" /LeidraadResultaten/Zichtjaar/PlanRegioResults/Hoofdindicatoren
"%exe_path%" /L"%log_dir%\%SUBFILENAME%_S3b_LT3070_R2_2030_NationaleKosten.txt" "%prj_dir%\Runs\S3b_LT3070.dms" /LeidraadResultaten/Zichtjaar/PlanRegioResults/NationaleKosten
"%exe_path%" /L"%log_dir%\%SUBFILENAME%_S3b_LT3070_R2_2030_Aansluitingen.txt" "%prj_dir%\Runs\S3b_LT3070.dms" /LeidraadResultaten/Zichtjaar/PlanRegioResults/Aansluitingen

"%exe_path%" /L"%log_dir%\%SUBFILENAME%_S3c_LT3050_R2_2030_Hoofdindicatoren.txt" "%prj_dir%\Runs\S3c_LT3050.dms" /LeidraadResultaten/Zichtjaar/PlanRegioResults/Hoofdindicatoren
"%exe_path%" /L"%log_dir%\%SUBFILENAME%_S3c_LT3050_R2_2030_NationaleKosten.txt" "%prj_dir%\Runs\S3c_LT3050.dms" /LeidraadResultaten/Zichtjaar/PlanRegioResults/NationaleKosten
"%exe_path%" /L"%log_dir%\%SUBFILENAME%_S3c_LT3050_R2_2030_Aansluitingen.txt" "%prj_dir%\Runs\S3c_LT3050.dms" /LeidraadResultaten/Zichtjaar/PlanRegioResults/Aansluitingen

"%exe_path%" /L"%log_dir%\%SUBFILENAME%_S3d_WKO_R2_2030_Hoofdindicatoren.txt" "%prj_dir%\Runs\S3d_WKO.dms" /LeidraadResultaten/Zichtjaar/PlanRegioResults/Hoofdindicatoren
"%exe_path%" /L"%log_dir%\%SUBFILENAME%_S3d_WKO_R2_2030_NationaleKosten.txt" "%prj_dir%\Runs\S3d_WKO.dms" /LeidraadResultaten/Zichtjaar/PlanRegioResults/NationaleKosten
"%exe_path%" /L"%log_dir%\%SUBFILENAME%_S3d_WKO_R2_2030_Aansluitingen.txt" "%prj_dir%\Runs\S3d_WKO.dms" /LeidraadResultaten/Zichtjaar/PlanRegioResults/Aansluitingen

"%exe_path%" /L"%log_dir%\%SUBFILENAME%_S3e_TEO_R2_2030_Hoofdindicatoren.txt" "%prj_dir%\Runs\S3e_TEO.dms" /LeidraadResultaten/Zichtjaar/PlanRegioResults/Hoofdindicatoren
"%exe_path%" /L"%log_dir%\%SUBFILENAME%_S3e_TEO_R2_2030_NationaleKosten.txt" "%prj_dir%\Runs\S3e_TEO.dms" /LeidraadResultaten/Zichtjaar/PlanRegioResults/NationaleKosten
"%exe_path%" /L"%log_dir%\%SUBFILENAME%_S3e_TEO_R2_2030_Aansluitingen.txt" "%prj_dir%\Runs\S3e_TEO.dms" /LeidraadResultaten/Zichtjaar/PlanRegioResults/Aansluitingen


"%exe_path%" /L"%log_dir%\%SUBFILENAME%_S4_hwp_GG_R1_2030_Hoofdindicatoren.txt" "%prj_dir%\Runs\S4_hwp_GG.dms" /LeidraadResultaten/Zichtjaar/PlanRegioResults/Hoofdindicatoren
"%exe_path%" /L"%log_dir%\%SUBFILENAME%_S4_hwp_GG_R1_2030_NationaleKosten.txt" "%prj_dir%\Runs\S4_hwp_GG.dms" /LeidraadResultaten/Zichtjaar/PlanRegioResults/NationaleKosten
"%exe_path%" /L"%log_dir%\%SUBFILENAME%_S4_hwp_GG_R1_2030_Aansluitingen.txt" "%prj_dir%\Runs\S4_hwp_GG.dms" /LeidraadResultaten/Zichtjaar/PlanRegioResults/Aansluitingen


"%exe_path%" /L"%log_dir%\%SUBFILENAME%_S5_HR_GG_R1_2030_Hoofdindicatoren.txt" "%prj_dir%\Runs\S5_HR_GG.dms" /LeidraadResultaten/Zichtjaar/PlanRegioResults/Hoofdindicatoren
"%exe_path%" /L"%log_dir%\%SUBFILENAME%_S5_HR_GG_R1_2030_NationaleKosten.txt" "%prj_dir%\Runs\S5_HR_GG.dms" /LeidraadResultaten/Zichtjaar/PlanRegioResults/NationaleKosten
"%exe_path%" /L"%log_dir%\%SUBFILENAME%_S5_HR_GG_R1_2030_Aansluitingen.txt" "%prj_dir%\Runs\S5_HR_GG.dms" /LeidraadResultaten/Zichtjaar/PlanRegioResults/Aansluitingen
