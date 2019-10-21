REM GeoDmsRun.exe [/PProjName] [/Llog_basFileName] ConfigFileName ItemNames
REM [] betekent optioneel
REM Sluit GUI-variant(GeoDmsGui.exe) af bij aanroepen van GeoDmsRun.exe (indien dit dezelfde is)
REM Resultaten worden weggeschreven in: n:/LD/%confignaam%/results/...
REM Bij nogmaals runnen worden bestanden gewoon overschreven

REM aanpassingen voor machine specifieke paden
set prj_dir=N:\PD\Runs_Leidraad\Default_Configuratie_Referentie
set log_dir=N:\log_vesta
set exe_dir=N:\prog\ObjectVision\GeoDms7182\GeoDmsRun.exe
REM einde aanpassingen voor machine specifieke paden

set exe_path=%exe_dir%\GeoDMSRun.exe

set CUR_YYYY=%date:~10,4%
set CUR_MM=%date:~4,2%
set CUR_DD=%date:~7,2%
set CUR_HH=%time:~0,2%
if %CUR_HH% lss 10 (set CUR_HH=0%time:~1,1%)
set CUR_NN=%time:~3,2%
set CUR_SS=%time:~6,2%
set CUR_MS=%time:~9,2%
set SUBFILENAME=%CUR_YYYY%%CUR_MM%%CUR_DD%-%CUR_HH%%CUR_NN%%CUR_SS%

if not exist %prj_dir% goto error

"%exe_path%" /L"%log_dir%\%SUBFILENAME%_S0_Referentie_StartJaar_S1_Hoofdindicatoren.txt" "%prj_dir%\Runs\S0_Referentie.dms" /Resultaten/StartJaar/PlanRegioResults/Vergelijking/meerkosten/Strategie_1/Hoofdindicatoren
"%exe_path%" /L"%log_dir%\%SUBFILENAME%_S0_Referentie_StartJaar_S1_NationaleKosten.txt" "%prj_dir%\Runs\S0_Referentie.dms" /Resultaten/StartJaar/PlanRegioResults/Vergelijking/meerkosten/Strategie_1/NationaleKosten
"%exe_path%" /L"%log_dir%\%SUBFILENAME%_S0_Referentie_StartJaar_S1_Aansluitingen.txt" "%prj_dir%\Runs\S0_Referentie.dms" /Resultaten/StartJaar/PlanRegioResults/Vergelijking/meerkosten/Strategie_1/Aansluitingen
"%exe_path%" /L"%log_dir%\%SUBFILENAME%_S0_Referentie_StartJaar_S1_Gevoeligheidsanalyse.txt" "%prj_dir%\Runs\S0_Referentie.dms" /Resultaten/StartJaar/PlanRegioResults/Vergelijking/meerkosten/Strategie_1/Gevoeligheidsanalyse

"%exe_path%" /L"%log_dir%\%SUBFILENAME%_S0_Referentie_StartJaar_S2_Hoofdindicatoren.txt" "%prj_dir%\Runs\S0_Referentie.dms" /Resultaten/StartJaar/PlanRegioResults/Vergelijking/meerkosten/Strategie_2/Hoofdindicatoren
"%exe_path%" /L"%log_dir%\%SUBFILENAME%_S0_Referentie_StartJaar_S2_NationaleKosten.txt" "%prj_dir%\Runs\S0_Referentie.dms" /Resultaten/StartJaar/PlanRegioResults/Vergelijking/meerkosten/Strategie_2/NationaleKosten
"%exe_path%" /L"%log_dir%\%SUBFILENAME%_S0_Referentie_StartJaar_S2_Aansluitingen.txt" "%prj_dir%\Runs\S0_Referentie.dms" /Resultaten/StartJaar/PlanRegioResults/Vergelijking/meerkosten/Strategie_2/Aansluitingen
"%exe_path%" /L"%log_dir%\%SUBFILENAME%_S0_Referentie_StartJaar_S2_Gevoeligheidsanalyse.txt" "%prj_dir%\Runs\S0_Referentie.dms" /Resultaten/StartJaar/PlanRegioResults/Vergelijking/meerkosten/Strategie_2/Gevoeligheidsanalyse

"%exe_path%" /L"%log_dir%\%SUBFILENAME%_S0_Referentie_StartJaar_S3_Hoofdindicatoren.txt" "%prj_dir%\Runs\S0_Referentie.dms" /Resultaten/StartJaar/PlanRegioResults/Vergelijking/meerkosten/Strategie_3/Hoofdindicatoren
"%exe_path%" /L"%log_dir%\%SUBFILENAME%_S0_Referentie_StartJaar_S3_NationaleKosten.txt" "%prj_dir%\Runs\S0_Referentie.dms" /Resultaten/StartJaar/PlanRegioResults/Vergelijking/meerkosten/Strategie_3/NationaleKosten
"%exe_path%" /L"%log_dir%\%SUBFILENAME%_S0_Referentie_StartJaar_S3_Aansluitingen.txt" "%prj_dir%\Runs\S0_Referentie.dms" /Resultaten/StartJaar/PlanRegioResults/Vergelijking/meerkosten/Strategie_3/Aansluitingen
"%exe_path%" /L"%log_dir%\%SUBFILENAME%_S0_Referentie_StartJaar_S3_Gevoeligheidsanalyse.txt" "%prj_dir%\Runs\S0_Referentie.dms" /Resultaten/StartJaar/PlanRegioResults/Vergelijking/meerkosten/Strategie_3/Gevoeligheidsanalyse

"%exe_path%" /L"%log_dir%\%SUBFILENAME%_S0_Referentie_StartJaar_S4_Hoofdindicatoren.txt" "%prj_dir%\Runs\S0_Referentie.dms" /Resultaten/StartJaar/PlanRegioResults/Vergelijking/meerkosten/Strategie_4/Hoofdindicatoren
"%exe_path%" /L"%log_dir%\%SUBFILENAME%_S0_Referentie_StartJaar_S4_NationaleKosten.txt" "%prj_dir%\Runs\S0_Referentie.dms" /Resultaten/StartJaar/PlanRegioResults/Vergelijking/meerkosten/Strategie_4/NationaleKosten
"%exe_path%" /L"%log_dir%\%SUBFILENAME%_S0_Referentie_StartJaar_S4_Aansluitingen.txt" "%prj_dir%\Runs\S0_Referentie.dms" /Resultaten/StartJaar/PlanRegioResults/Vergelijking/meerkosten/Strategie_4/Aansluitingen
"%exe_path%" /L"%log_dir%\%SUBFILENAME%_S0_Referentie_StartJaar_S4_Gevoeligheidsanalyse.txt" "%prj_dir%\Runs\S0_Referentie.dms" /Resultaten/StartJaar/PlanRegioResults/Vergelijking/meerkosten/Strategie_4/Gevoeligheidsanalyse

"%exe_path%" /L"%log_dir%\%SUBFILENAME%_S0_Referentie_StartJaar_S5_Hoofdindicatoren.txt" "%prj_dir%\Runs\S0_Referentie.dms" /Resultaten/StartJaar/PlanRegioResults/Vergelijking/meerkosten/Strategie_5/Hoofdindicatoren
"%exe_path%" /L"%log_dir%\%SUBFILENAME%_S0_Referentie_StartJaar_S5_NationaleKosten.txt" "%prj_dir%\Runs\S0_Referentie.dms" /Resultaten/StartJaar/PlanRegioResults/Vergelijking/meerkosten/Strategie_5/NationaleKosten
"%exe_path%" /L"%log_dir%\%SUBFILENAME%_S0_Referentie_StartJaar_S5_Aansluitingen.txt" "%prj_dir%\Runs\S0_Referentie.dms" /Resultaten/StartJaar/PlanRegioResults/Vergelijking/meerkosten/Strategie_5/Aansluitingen
"%exe_path%" /L"%log_dir%\%SUBFILENAME%_S0_Referentie_StartJaar_S4_Gevoeligheidsanalyse.txt" "%prj_dir%\Runs\S0_Referentie.dms" /Resultaten/StartJaar/PlanRegioResults/Vergelijking/meerkosten/Strategie_4/Gevoeligheidsanalyse

"%exe_path%" /L"%log_dir%\%SUBFILENAME%_S0_Referentie_StartJaar_S6_Hoofdindicatoren.txt" "%prj_dir%\Runs\S0_Referentie.dms" /Resultaten/StartJaar/PlanRegioResults/Vergelijking/meerkosten/Strategie_6/Hoofdindicatoren
"%exe_path%" /L"%log_dir%\%SUBFILENAME%_S0_Referentie_StartJaar_S6_NationaleKosten.txt" "%prj_dir%\Runs\S0_Referentie.dms" /Resultaten/StartJaar/PlanRegioResults/Vergelijking/meerkosten/Strategie_6/NationaleKosten
"%exe_path%" /L"%log_dir%\%SUBFILENAME%_S0_Referentie_StartJaar_S6_Aansluitingen.txt" "%prj_dir%\Runs\S0_Referentie.dms" /Resultaten/StartJaar/PlanRegioResults/Vergelijking/meerkosten/Strategie_6/Aansluitingen
"%exe_path%" /L"%log_dir%\%SUBFILENAME%_S0_Referentie_StartJaar_S6_Gevoeligheidsanalyse.txt" "%prj_dir%\Runs\S0_Referentie.dms" /Resultaten/StartJaar/PlanRegioResults/Vergelijking/meerkosten/Strategie_6/Gevoeligheidsanalyse

