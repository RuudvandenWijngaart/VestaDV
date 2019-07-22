REM @USERINPUT: List of runs to process.
call Impl\RunOneInstance.bat Referentie              /Resultaten/Exports/GenerateAllIndicatoren
call Impl\RunOneInstance.bat Referentie              /Resultaten/Exports/GenerateAllAlloc
call Impl\RunOneInstance.bat Verhoging50cent /Resultaten/Exports/GenerateAllIndicatoren
call Impl\RunOneInstance.bat Verhoging50cent /Resultaten/Exports/GenerateAllAlloc


