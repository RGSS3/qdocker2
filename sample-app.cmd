start run-haxm-4096M-nodisk
call ssh_wait
call use_ustc
call docker pull swipl/swish
start docker run --rm -p 8080:3050 swipl/swish
timeout /T 5
start http://localhost:18080


