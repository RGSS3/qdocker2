start run-haxm-4096M-nodisk.cmd
call ssh_wait.cmd
call 2.change_source.cmd
call scp_send "set_default.sh"
call ssh.cmd  "sudo chmod 744 ~/set_default.sh"
call ssh.cmd  "sudo ~/set_default.sh"
call ssh.cmd  "sudo /etc/init.d/docker restart"

echo docker pull swipl/swish > m.txt
call putty.cmd -m m.txt -t
start ssh.cmd "docker run --rm -p 8080:3050 swipl/swish"
timeout /T 5
start http://localhost:18080

