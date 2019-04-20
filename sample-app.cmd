start run-haxm-4096M-nodisk.cmd
call ssh_wait.cmd
call ssh.cmd "docker run --rm -p 8080:3050 swipl/swish"
start http://localhost:18080

