reg add HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\QDocker\Parameters /v AppDirectory /d "D:\QDocker" /t reg_sz /f

reg add HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\QDocker\Parameters /v Application /d "D:\QDocker\run-haxm-1024M.cmd" /t reg_sz /f
