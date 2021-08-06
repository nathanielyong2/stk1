@echo off

echo Windows Datetime = %date%_%time%

set v_hour=%time:~0,2%
set v_min=%time:~3,2%
set v_sec=%time:~6,2%

REM Need to enclose in double quotes in order to concatenate env variables
set "V_DATETIME=%date%_%v_hour%%v_min%%v_sec%"
echo V_DATETIME  = %V_DATETIME%

set V_SQLSERVER_DBNAME=stocks
echo V_SQLSERVER_DBNAME = %V_SQLSERVER_DBNAME%