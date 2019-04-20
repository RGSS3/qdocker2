@echo off
setlocal
call check_components
call check_haxm
if not "%errorlevel%" == "0" (
    echo "HAXM not supported"
    exit /b 1
)
call run_all -m 4096M -accel accel=hax
exit /b 0