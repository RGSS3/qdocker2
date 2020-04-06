@echo off
setlocal
call check_components
call check_haxm
if not "%errorlevel%" == "0" (
    echo "HAXM not supported"
    exit /b 1
)
set QDOCKER.USEDISK=1
call run-all-service -m 1024M -accel accel=hax
exit /b 0

