REM
REM Remove CalcCache (comment-out the following line if intermediate results need to be retained).
REM

if exist %CalcCacheDir%\CacheInfo.dmsdata del %CalcCacheDir%\CacheInfo.dmsdata

REM @USERINPUT: List of runs to process.

call Impl\RunOneInstance.bat Run4Combi_2016_Referentie                  /RunContext/GenerateAll
call Impl\RunOneInstance.bat Run4Combi_2016_Referentie_Verhoging50cent  /RunContext/GenerateAll

REM call Impl\RunOneInstance.bat Run4Combi_2016_Referentie                  /RunContext/Y2050/RegressieTest/Generate
REM call Impl\RunOneInstance.bat Run4Combi_2016_Referentie_Verhoging50cent  /RunContext/Y2050/RegressieTest/Generate


