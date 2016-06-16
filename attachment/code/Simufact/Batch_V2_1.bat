@echo off
setlocal ENABLEDELAYEDEXPANSION
set FormingPath="C:\Program Files\simufact\forming\10.0\sfForming\bin\sfForming.exe"
set SourceDir=%cd%

echo           ==========================================================
echo           =                                                        =
echo           =                Simufact Helper v2.1                    =
echo           =                                                        =
echo           ==========================================================
echo.
echo.

:: creat dir "batch" to save xml files
if exist ".\batch" (
    echo Dir "batch" exist, resuming...
	echo.
) else (
	echo Dir "batch" does not exist, creating...
    md batch
	echo Done^^!^^!^^!
	echo.
	echo.
) 

:: creat .\batch\creat_xml.bat
if exist ".\batch\creat_xml.bat" (
	echo Batch File ".\batch\creat_xml.bat" exist, resuming...
	echo.
) else (
	echo the File ".\batch\creat_xml.bat" does not exist, creating...
	echo :: creat xml files >.\batch\creat_xml.bat
	echo @echo off>>.\batch\creat_xml.bat
	echo setlocal ENABLEDELAYEDEXPANSION>>.\batch\creat_xml.bat
	echo FOR %%%%i in ^(*.sfp^) DO ^(>>.\batch\creat_xml.bat
	echo set name=%%%%i>>.\batch\creat_xml.bat
	echo set shortname=^^!name:~0,-4^^!>>.\batch\creat_xml.bat
	echo echo Creating ^^!shortname^^!.xml ...>>.\batch\creat_xml.bat
	echo echo ^^^^^<Batch^^^^^>^> .\batch\^^!shortname^^!.xml>>.\batch\creat_xml.bat
	echo echo   ^^^^^<File^^^^^>%%cd%%\^^!name^^!^^^^^</File^^^^^>^>^> .\batch\^^!shortname^^!.xml>>.\batch\creat_xml.bat
	echo echo   ^^^^^<Process^^^^^>forming^^^^^</Process^^^^^>^>^> .\batch\^^!shortname^^!.xml>>.\batch\creat_xml.bat
	echo echo   ^^^^^<Log^^^^^>%%cd%%\^^!name:~0,-4^^!\PROJECT\^^!name:~0,-4^^!\batch.log^^^^^</Log^^^^^>^>^> .\batch\^^!shortname^^!.xml>>.\batch\creat_xml.bat
	echo echo   ^^^^^<Window^^^^^>true^^^^^</Window^^^^^>^>^> .\batch\^^!shortname^^!.xml>>.\batch\creat_xml.bat
	echo echo   ^^^^^<CreateResultImages^^^^^>false^^^^^</CreateResultImages^^^^^>^>^> .\batch\^^!shortname^^!.xml>>.\batch\creat_xml.bat
	echo echo   ^^^^^<OnlyClearResults^^^^^>false^^^^^</OnlyClearResults^^^^^>^>^> .\batch\^^!shortname^^!.xml>>.\batch\creat_xml.bat
	echo echo ^^^^^</Batch^^^^^>^>^> .\batch\^^!shortname^^!.xml>>.\batch\creat_xml.bat
	echo echo Done^^^^^^^^^^!^^^^^^^^^^!^^^^^^^^^^!>>.\batch\creat_xml.bat
	echo echo.>>.\batch\creat_xml.bat
	echo ^)>>.\batch\creat_xml.bat
	echo Done^^!^^!^^!
	echo.
)

call .\batch\creat_xml.bat>nul

:_Simufact
FOR %%z in (.\batch\*.xml) DO (
	set name=%%z
	set shortname=!name:~8,-4!
	set finished=!shortname!.fin
	set running=!shortname!.run
	if not exist .\batch\!finished! (
		if not exist .\batch\!running! (
			echo running !shortname!.sfp ...
			echo running>".\batch\!running!"
			echo.

			set time_begin=!time:~0,-3!
			set date_begin=!date!
			echo ===== Begin: !date_begin! !time_begin! =====
			:: get rid of the blank like 09
			for /f "tokens=1,2,3 delims=:" %%i in ("!time_begin!") do (
				set /a hour_b=%%i
				set /a munite_b=%%j
				set /a second_b=%%k
			)
			::!FormingPath! -batch !SourceDir!\batch\!shortname!.xml
			ping 127.0.0.1 -n 5 -w 1000 > nul
			del ".\batch\!running!"
			echo finished>.\batch\!finished!

			set time_end=!time:~0,-3!
			set date_end=!date!
			echo ===== End  : !date_end! !time_end! =====
			for /f "tokens=1,2,3 delims=:" %%i in ("!time_end!") do (
				set /a hour_e=%%i
				set /a munite_e=%%j
				set /a second_e=%%k
			)
			call :time_lapse
			echo.
			echo used: !hour_! h !munite_! min !second_! sec
			echo.
			echo Done^^!^^!^^!
			call .\batch\creat_xml.bat > nul
			echo.
			echo.
			echo.
			goto _Simufact
		)
	)
)
pause




:time_lapse
if !second_e! lss !second_b! (
    set /a munite_e=!munite_e!-1
    set /a second_e=!second_e!+60
)
set /a second_=!second_e!-!second_b!

if !munite_e! lss !munite_b! (
    set /a hour_e=!hour_e!-1
    set /a munite_e=!munite_e!+60
)
set /a munite_=!munite_e!-!munite_b!

if !hour_e! lss !hour_b! (
    set /a hour_e=!hour_e!+24
)
set /a hour_=!hour_e!-!hour_b!
goto :eof