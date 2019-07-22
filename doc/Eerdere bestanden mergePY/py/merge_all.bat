@echo off
REM Set the environment parameters to your personal choice (no blanks are allowed in the next statement!)
set vesta_root=C:\LD\VestaDV

if not exist %vesta_root% goto error

set tmpcsv=tmpcsv
md %tmpcsv%

REM Geef pad naar Results-folder in de LD-map
set "padtoresults=%vesta_root%\Results\"

set "Run1=Referentie"
set "Run1_pad=%padtoresults%%Run1%" 

set "Run2=Verhoging50cent"
Set "Run2_pad=%padtoresults%%Run2%" 


call python linenumbers.py %Run1_pad% %tmpcsv%/mut_allflow_%Run1%.csv mut_lijst
call python linenumbers.py %Run1_pad% %tmpcsv%/mut_allstock_%Run1%.csv mut_allstock_lijst
call python linenumbers.py %Run1_pad% %tmpcsv%/matrix_allflow_%Run1%.csv matrix_allflow
call python linenumbers.py %Run1_pad% %tmpcsv%/matrix_allstock_%Run1%.csv matrix_allstock
call python linenumbers.py %Run1_pad% %tmpcsv%/flow_%Run1%.csv NL
call python linenumbers.py %Run1_pad% %tmpcsv%/NL_emission_%Run1%.csv NL_emission
call python linenumbers.py %Run1_pad% %tmpcsv%/Gebiedsmaatregelen_%Run1%.csv gebiedsmaatregelen
call python linenumbers.py %Run1_pad% %tmpcsv%/Opwekking_%Run1%.csv opwekking
call python linenumbers.py %Run1_pad% %tmpcsv%/Verbetering_%Run1%.csv verbetering
call python linenumbers.py %Run1_pad% %tmpcsv%/mut_bebouwing_allflow_%Run1%.csv mut_bebouwing_allflow
call python linenumbers.py %Run1_pad% %tmpcsv%/mut_bebouwing_allstock_%Run1%.csv mut_bebouwing_allstock

call python linenumbers.py %Run2_pad% %tmpcsv%/mut_allflow_%Run2%.csv mut_lijst
call python linenumbers.py %Run2_pad% %tmpcsv%/mut_allstock_%Run2%.csv mut_allstock_lijst
call python linenumbers.py %Run2_pad% %tmpcsv%/matrix_allflow_%Run2%.csv matrix_allflow
call python linenumbers.py %Run2_pad% %tmpcsv%/matrix_allstock_%Run2%.csv matrix_allstock
call python linenumbers.py %Run2_pad% %tmpcsv%/flow_%Run2%.csv NL
call python linenumbers.py %Run2_pad% %tmpcsv%/NL_emission_%Run2%.csv NL_emission
call python linenumbers.py %Run2_pad% %tmpcsv%/Gebiedsmaatregelen_%Run2%.csv gebiedsmaatregelen
call python linenumbers.py %Run2_pad% %tmpcsv%/Opwekking_%Run2%.csv opwekking
call python linenumbers.py %Run2_pad% %tmpcsv%/Verbetering_%Run2%.csv verbetering
call python linenumbers.py %Run2_pad% %tmpcsv%/mut_bebouwing_allflow_%Run2%.csv mut_bebouwing_allflow
call python linenumbers.py %Run2_pad% %tmpcsv%/mut_bebouwing_allstock_%Run2%.csv mut_bebouwing_allstock




cd tmpcsv
copy flow_*.csv ..\flow.csv
copy NL_emission_*.csv ..\NL_emission.csv
copy *Gebiedsmaatregelen*.csv ..\Gebiedsmaatregelen.csv
copy *matrix_allflow*.csv ..\matrix_allflow.csv
copy *matrix_allstock*.csv ..\matrix_allstock.csv
copy *mut_allflow*.csv ..\mut_allflow.csv
copy *mut_allstock*.csv ..\mut_allstock.csv
copy *mut_bebouwing_allflow*.csv ..\mut_bebouwing_allflow.csv
copy *mut_bebouwing_allstock*.csv ..\mut_bebouwing_allstock.csv
copy *Opwekking*.csv ..\Opwekking.csv
copy *Verbetering*.csv ..\Verbetering.csv

del *.csv
goto end

:error
echo "****** ERROR ************************************"
echo "Please check vesta_root on line 3 of this script."
echo "****** ERROR ************************************"

:end
@echo off
REM clean environment parameters
set vesta_root=
set tmpcsv=

PAUSE

