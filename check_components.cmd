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
     call :download https://the.earth.li/~sgtatham/putty/0.71/w64/putty.zip putty.zip
  ) 
  echo Unzipping SSH tool
  call :unzip putty.zip putty
)

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
call 7za.exe x -y qdocker-1.0.2.tgz -o.
call 7za.exe x -y qdocker-1.0.2.tar -otmp
move /Y tmp\package\boot2docker.iso boot2docker.iso
call 7za.exe x -y qdocker-1.0.3.tgz -o.
call 7za.exe x -y qdocker-1.0.3.tar -otmp
move /Y tmp\package\qemu.2019.2 qemu.2019.2
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
