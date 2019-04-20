@echo off
:loop
call ssh_ping.cmd
if "%errorlevel%" == "0" goto next
goto loop

:next
exit /b 0
