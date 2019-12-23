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
echo 辅助功能：请使用主程序调用。
echo 参数 tlekill EXENAME FILENAME TIME
echo 在超过设定时间后结束程序。
pause
exit
:tlekillqwq