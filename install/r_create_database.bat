echo off
echo -------------------------------------------------------------------
echo ++++++++ Create database %V_SQLSERVER_DBNAME%
call r_init.bat


sqlcmd -S localhost -i "/work/stk1/db/create_database.sql" -o "/work/stk1_log/create_database.%V_DATETIME%.log" -v SQLSERVER_DBNAME=%V_SQLSERVER_DBNAME%


