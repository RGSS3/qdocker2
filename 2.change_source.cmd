@echo off
call scp_send daemon.json /root/daemon.json
call ssh "sudo cp /root/daemon.json /etc/docker/daemon.json"
