@echo off
if "%1" == "" goto tlekillhelp
if "%2" == "" goto tlekillhelp
if "%3" == "" goto tlekillhelp
set /a qwq=%3/100
set /a qwq=qwq
REM echo %qwq%
ping -n %qwq% localhost 1>nul 2>nul
if exist "%cd%\%2" (
	echo TLE KILLED!
	taskkill /f /im %1 1>nul 2>nul
)
goto tlekillqwq
:tlekillhelp
echo �������ܣ���ʹ����������á�
echo ���� tlekill EXENAME FILENAME TIME
echo �ڳ����趨ʱ����������
pause
exit
:tlekillqwq