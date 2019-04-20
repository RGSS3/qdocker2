@echo off
set PLINK=%~dp0putty\plink.exe
echo y | %PLINK% -ssh 127.0.0.1 -P 5022 2>nul | find "login as:"
if "%errorlevel%"=="0" exit /b 0
exit /b 1
