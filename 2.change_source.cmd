@echo off
call scp_send daemon.json /root/daemon.json
call scp_send set_default.sh /root/set_default.sh
call ssh "sudo cp /root/daemon.json /etc/docker/daemon.json"
call ssh "sudo chmod 755 /root/set_default.sh"
call ssh "sudo /root/set_default.sh"