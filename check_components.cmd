@echo off
if not exist boot2docker.iso (
  echo Fetching image
  call :fetch-bin
)
if not exist "qemu.2019.2\qemu-system-x86_64.exe" (
  call :fetch-bin
)

if not exist "putty\putty.exe" (
  if not exist "putty.zip" (
     echo Fetching SSH tool
     call :download1 http://registry.npm.taobao.org/qdocker/download/qdocker-1.0.4.tgz qdocker-1.0.4.tgz
  ) 
  echo Unzipping SSH tool
  call :un7z qdocker-1.0.4 putty putty
  call :un7z qdocker-1.0.4 haxm haxm
  del qdocker-1.0.4.tar
)

del *.tgz 2>nul

exit /b
:fetch-bin
if exist qdocker-1.0.2.tgz goto 1.0.3
echo Fetching binary
call :download1 http://registry.npm.taobao.org/qdocker/download/qdocker-1.0.2.tgz qdocker-1.0.2.tgz
:1.0.3
if exist qdocker-1.0.3.tgz goto extract
call :download1 http://registry.npm.taobao.org/qdocker/download/qdocker-1.0.3.tgz qdocker-1.0.3.tgz
:extract
echo Unzip binary
call :un7z qdocker-1.0.2 boot2docker.iso boot2docker.iso
call :un7z qdocker-1.0.3 qemu.2019.2 qemu.2019.2
rd tmp /s/q
del qdocker-1.0.2.tar
del qdocker-1.0.3.tar
exit /b
:download
call aria2c %1 -x 16 -s 16 -o %2
exit /b
:download1 
powershell -c "[System.Net.ServicePointManager]::SecurityProtocol=[System.Net.SecurityProtocolType]::Tls12;Invoke-WebRequest -uri %1 -OutFile %2"
exit /b

:unzip
powershell -c "Expand-Archive -DestinationPath %2 -Force %1"
exit /b

:un7z
call 7za.exe x -y %1.tgz -o. >nul 2>nul
call 7za.exe x -y %1.tar -otmp >nul 2>nul
move /Y tmp\package\%2 %3
exit /b
