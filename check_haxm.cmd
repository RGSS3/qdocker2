@echo off
haxm\haxm_check.exe | find "VT support -- yes" >nul 2>&1
if "%errorlevel%" == "0" (
    echo HAXM found
    exit /b 0
)
call haxm\silent_install.bat

haxm\haxm_check.exe | find "VT support -- yes" >nul 2>&1
if not "%errorlevel%" == "0" (
    echo Can't install HAXM
    exit /b 1
)
exit /b 0