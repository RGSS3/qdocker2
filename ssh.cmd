@echo off
set PLINK=%~dp0putty\plink.exe
call %PLINK% -ssh -P 5022 -pw tcuser docker@127.0.0.1 "%*"