@echo off
:loop
call ssh_ping.cmd
if "%errorlevel%" == "0" goto next
echo Waiting...
timeout /T 5
goto loop

:next
exit /b 0
