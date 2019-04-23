@echo off
call %QEMU-IMG.EXE% create -f qcow2 %HDA% 8G
exit /b