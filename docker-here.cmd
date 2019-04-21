@echo off
if "%1"=="" (
    echo docker-here password
)
setlocal
set dir=%CD%
net share docker-here /delete
net share docker-here=%dir% /grant:everyone,full
pushd %~dp0
call use_cifs.cmd
call runsh.cmd docker-here.sh %username% %1
call scp_send_dir user-here /root
call ssh sudo chmod 755 /root/user-here/*.sh
call putty
call popd
