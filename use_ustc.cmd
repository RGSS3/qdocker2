@echo off
call 2.change_source.cmd
call scp_send "set_default.sh"
call ssh.cmd  "sudo chmod 744 ~/set_default.sh"
call ssh.cmd  "sudo ~/set_default.sh"
call ssh.cmd  "sudo DOCKER_REMOTE=yes DOCKER_TLS=no /etc/init.d/docker restart"
