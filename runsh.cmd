@echo off
setlocal
set a=%~dpnx1
set f=/home/docker/.runsh/%1
pushd %~dp0
call ssh "sudo mkdir       ~/.runsh" > nul
call ssh "sudo chmod 777  ~/.runsh" > nul
call scp_send %A% %F% > nul
echo scp_send %A% %F%
call ssh "sudo chmod 777 %F%" > nul
shift
call ssh %F% %* > nul
endlocal
popd