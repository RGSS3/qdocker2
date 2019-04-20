# qdocker2
Mini client Docker on Windows with HAXM support and tools

## SYNOPSIS 
```batchfile
start run-haxm-4096M-nodisk.cmd
call ssh_wait.cmd
call use_ustc.cmd
call docker.cmd pull swipl/swish
start docker.cmd run --rm -p 8080:3050 swipl/swish
timeout /T 5
start http://localhost:18080
```
Then pack all rest files

If you make a self-extracting file like I do, (WinRAR is used). You will get a ~600KB mini client exe file.
The files hosted is accelerated for users in Mainland China. If you or your client are outside, then little in only one batch file will be changed, I will make this alternative later.
