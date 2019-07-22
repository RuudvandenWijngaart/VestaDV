echo off
if (%1)==() ( Echo Usage: RUNIMPL.BAT ^[R32 ^<versionNr^>^|R64 ^<versionNr^>^|D32^|D64^] && GoTo End)

cls
echo *************               *************
echo *************   V E S T A   *************
echo *************               *************
echo .

	Rem Bepaal de actieve program files directory, deze verschilt op Windows 64 machines
	Set ProgramFiles32=%ProgramFiles(x86)%
	
	if "%ProgramFiles(x86)%"=="" (
		Set ProgramFiles32=%ProgramFiles%
		Set ProgramFiles64=DoesNotExistOnThisMachine
		Set GeoDmsPlatform=Win32
	) else (
		Set ProgramFiles64=%ProgramFiles%
		Set GeoDmsPlatform=x64
	)
	
	Rem Verwerk de meegegeven parameter die bepaalt welke exe gebruikt moet worden
	Set GeoDmsRunPath="%ProgramFiles%\ObjectVision\GeoDms%2%\GeoDmsRun.exe"
	
	IF %1 == D32 Set GeoDmsRunPath="C:\dev\GeoDms\bin\Debug\Win32\GeoDmsRun.exe"
	IF %1 == R32 Set GeoDmsRunPath="%ProgramFiles32%\ObjectVision\GeoDms%2%\GeoDmsRun.exe"
	IF %1 == D64 Set GeoDmsRunPath="C:\dev\GeoDms\bin\Debug\x64\GeoDmsRun.exe"
	IF %1 == R64 Set GeoDmsRunPath="%ProgramFiles%\ObjectVision\GeoDms%2%\GeoDmsRun.exe"
	
	Set T1=%3
	if not "%T1%"=="" (
		set GeoDmsRunPath=%T1%
		set T1=
	)
	
	IF %1 == D64 Set GeoDmsPlatform=x64
	IF %1 == R64 Set GeoDmsPlatform=x64
	IF %1 == D32 Set GeoDmsPlatform=Win32
	IF %1 == R32 Set GeoDmsPlatform=Win32

	CALL Impl/SetDirs.bat Run4Combi_2016_Referentie

	Rem Bepaal de actieve Runs directory
	set runDir=%projDir%\Runs
	echo RunDir=%runDir%

	if "%GEODMS_DIRECTORIES_CALCCACHEDIR%"=="" (
		Set GEODMS_DIRECTORIES_CALCCACHEDIR=%LocalDataProjDir%\CCRUN
	)

	Set LogFileDir=%LocalDataProjDir%\log

	If NOT EXIST "%LocalDataDir%"     md "%LocalDataDir%"
	If NOT EXIST "%LocalDataProjDir%" md "%LocalDataProjDir%"
	If NOT EXIST "%LogFileDir%"       md "%LogFileDir%"

	Set LogFileName=temp.txt
	Set LogFilePath=%LogFileDir%\%LogFileName%
	Set GeoDmsLogFilePath=%LogFileDir%\GeoDmsTemp.txt

	REM
	REM Remove CalcCache (comment-out the following line if intermediate results need to be retained).
	REM

	echo Removing CalcCache?
	If EXIST %GEODMS_DIRECTORIES_CALCCACHEDIR% rd /S %GEODMS_DIRECTORIES_CALCCACHEDIR%

	Set Sequence=%date:/=-%_%time::=-%
	Echo Start Logging at %Sequence% > %LogFilePath%
	Echo Start Logging at %Sequence% > %GeoDmsLogFilePath%

	Set GeoDmdRunCmdBase=%GeoDmsRunPath% /L%GeoDmsLogFilePath%

	Set RegrResult=OK
	
	REM @USERINPUT: List of runs to process now edited in RunList.bat
	if "%RunListBatchFile%"=="" (
		Set T1=RunList.bat
	) else (
		Set T1=%RunListBatchFile%
	)
	Call %T1%
	Set T1=

	Echo End Logging >> %LogFilePath%
	Set Sequence=%date:/=-%_%time::=-%
	SET LogFileFinalName=v%1_%RegrResult%_%Sequence%.txt
	RENAME "%LogFilePath%" "%LogFileFinalName%"
	Echo Log Information written to "%LogFileDir%\%LogFileFinalName%"
	
	IF not %RegrResult% == OK (
		"%ProgramFiles32%\Crimson Editor\cedt.exe" "%LogFileDir%\%LogFileFinalName%"
	)

: End
echo .
echo Einde.
pause