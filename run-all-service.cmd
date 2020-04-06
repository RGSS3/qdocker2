@echo off
call check_components.cmd
set QEMU=%~dp0qemu.2019.2\
set QEMU.EXE=%QEMU%qemu-system-x86_64.exe
set QEMU-IMG.EXE=%QEMU%qemu-img.exe
set DOCKER.ISO=%~dp0boot2docker.iso
set HDA=%~dp0hda.raw
if not "%QDOCKER.EXT%" == "" set CMDS=%* %QDOCKER.EXT%
if "%QDOCKER.EXT%" == "" set CMDS=%*
if "%QDOCKER.USEDISK%" == "1" (
  set QDOCKER.HDA=-drive format=qcow2,file=%HDA%
  if not exist %HDA% (
    call :create-disk
  )
)
if not "%QDOCKER.USEDISK%" == "1" (
  set QDOCKER.HDA=
  
)
echo %*
call :run-qemu %CMDS%
exit /b

:run-qemu
echo start /min %QEMU.EXE% -net nic -net user,hostfwd=tcp::12376-:2376,hostfwd=tcp::12375-:2375,hostfwd=tcp::5022-:22,hostfwd=tcp::10080-:80,hostfwd=tcp::18080-:8080 -cdrom %DOCKER.ISO%  -boot d %* %QDOCKER.HDA%  -nographic
start /min "" cmd /c "ssh_wait.cmd && init.cmd"
%QEMU.EXE% -net nic -net user,hostfwd=tcp::12376-:2376,hostfwd=tcp::12375-:2375,hostfwd=tcp::5022-:22,hostfwd=tcp::10080-:80,hostfwd=tcp::18080-:8080 -cdrom %DOCKER.ISO%  -boot d %* %QDOCKER.HDA% -nographic
exit /b 0
:create-disk
call create_disk.cmd 8G
exit /b

REM -kernel bzImage -append "root=/dev/sda2 panic=1 rootfstype=ext4 rw console=tty0"

