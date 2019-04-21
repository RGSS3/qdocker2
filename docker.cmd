@echo off
echo docker %* > m.txt
%~dp0putty\putty -l docker -pw tcuser -P 5022 127.0.0.1 -m m.txt -t