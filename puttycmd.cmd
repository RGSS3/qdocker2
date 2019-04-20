@echo off
echo %* > m.txt
call putty.cmd -m m.txt -t