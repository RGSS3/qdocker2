@echo off
if "%1"=="" (
    echo Empty password is not allowed
    echo usage: docker-here password
    exit /b
)
setlocal
set dir=%CD%
echo MOUNT "%dir%" to /mnt/here
net share docker-here /delete
net share docker-here="%dir%" /grant:everyone,full
pushd %~dp0
call use_cifs.cmd	>nul
call runsh.cmd docker-here.sh %username% %1	>nul
call scp_send_dir user-here /root	>nul
call ssh sudo chmod 755 /root/user-here/*.sh >nul
if not "%2"=="--noputty" (
  call start putty
)
call popd
