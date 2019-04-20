@echo off
set PSCP=%~dp0putty\pscp.exe
call PSCP -P 5022 -pw tcuser docker@127.0.0.1:%1 %2
