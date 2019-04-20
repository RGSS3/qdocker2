@echo off
call scp_send %1 %1
call ssh "chmod 744 ~/%1"
call ssh ~/%*

