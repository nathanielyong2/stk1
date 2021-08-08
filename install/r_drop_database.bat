@echo off
echo ---------------------------------------------------------------
echo ++++++++ Drop database %V_SQLSERVER_DBNAME%

call r_init.bat

:section_input
set /p user_input="++++ Are you sure you want to drop database %V_SQLSERVER_DBNAME% ???????????!!!!!!!!!!!!!!! (y/n) : "
if /I "%user_input%"=="y" (GOTO section_yes)
if /I "%user_input%"=="n" (GOTO section_no)
echo ++++ Invalid response!!
GOTO section_input


REM --------------- YES ----------------------------
:section_yes
sqlcmd -S localhost -i "/work/stk1/db/drop_database.sql" -o "/work/stk1_log/drop_database.%V_DATETIME%.log" -v SQLSERVER_DBNAME=%V_SQLSERVER_DBNAME%
GOTO section_end

REM --------------- NO ----------------------------
:section_no
echo ++++ Exiting - Not dropping database!
echo ---------------------------------------------------------------

REM --------------- END ----------------------------
:section_end