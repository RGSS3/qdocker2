# qdocker2
Mini client Docker on Windows with HAXM support and tools

# SYNOPSIS 
```batchfile
start run-haxm-4096M-nodisk.cmd
call ssh_wait.cmd
call use_ustc.cmd
call puttycmd.cmd docker pull swipl/swish
start puttycmd.cmd "docker run --rm -p 8080:3050 swipl/swish"
timeout /T 5
start http://localhost:18080
```

