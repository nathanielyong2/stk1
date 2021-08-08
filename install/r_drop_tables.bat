echo off
echo -------------------------------------------------------------------
echo ++++++++ Drop tables

call r_init.bat
sqlcmd -S localhost -i "/work/stk1/db/drop_tables.sql" -o "/work/stk1_log/drop_tables.%V_DATETIME%.log" -v SQLSERVER_DBNAME=%V_SQLSERVER_DBNAME%


