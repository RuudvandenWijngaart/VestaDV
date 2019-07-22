Rem zet directories op basis van inhoud config.ini / default waarden
if (%RegrResult%)==(FAILED) goto End
echo ========= SetDirs.bat: Start
	Rem Lees de LocalDataDir uit de registry en zet de waarde als environment variable
	:: delims is a TAB followed by a space
	if not (%LocalDataDir%)==() goto skipLocalDataDir
	FOR /F "tokens=2* delims=	 " %%A IN ('REG QUERY "HKCU\Software\ObjectVision\%COMPUTERNAME%\GeoDMS" /v LocalDataDir') DO SET LocalDataDir=%%B
	if not (%LocalDataDir%)==() goto skipLocalDataDir
	FOR /F "tokens=2* delims=	 " %%A IN ('REG QUERY "HKCU\Software\ObjectVision\DMS" /v LocalDataDir') DO SET LocalDataDir=%%B
: skipLocalDataDir
	ECHO LocalDataDir=%LocalDataDir%
	
	set BatchDir=%CD%
	echo BatchDir=%BatchDir%

	if not exist %1 md %1
	cd %1
	set ConfigDir=%CD%
	echo ConfigDir=%ConfigDir%

	cd ..
	set CurrentDir=%CD%
	echo CurrentDir=%CurrentDir%

	set ProjDir=
	for /f "delims=" %%a in ('call %BatchDir%\Impl\read_ini.bat %ConfigDir%\config.ini directories ProjDir') do (
	    set %ProjDir%=%%a
	)
	if not (%ProjDir%)==() goto skipProjDir
		cd ..
		SET ProjDir=%CD%
: skipProjDir
	cd %BatchDir%
	echo ProjDir=%ProjDir%

	if not (%LocalDataProjDir%)==() goto skipLocalDataProjDir
	for /f "delims==" %%F in ("%ProjDir%") do set ProjName=%%~nF
	echo ProjName=%ProjName%

	set LocalDataProjDir=
	for /f "delims=" %%a in ('call %BatchDir%\Impl\read_ini.bat %ConfigDir%\config.ini directories LocalDataProjDir') do (
	    set %LocalDataProjDir=%%a
	)
	if (%LocalDataProjDir%)==() SET LocalDataProjDir=%LocalDataDir%\%ProjName%
: skipLocalDataProjDir
	echo LocalDataProjDir=%LocalDataProjDir%

echo ========= SetDirs.bat: End

:End
