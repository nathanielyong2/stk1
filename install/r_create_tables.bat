echo off
echo -------------------------------------------------------------------
echo ++++++++ Create tables
call r_init.bat
sqlcmd -S localhost -i "/work/stk1/db/create_tables.sql" -o "/work/stk1_log/create_tables.%V_DATETIME%.log" -v SQLSERVER_DBNAME=%V_SQLSERVER_DBNAME%

