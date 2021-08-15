call r_init.bat

echo -------------------------------------------------------------------
echo ++++++++ Load table STK
call r_init.bat
sqlcmd -S localhost -i "/work/stk1/db/load_STK.sql" -o "/work/stk1_log/load_STK.%V_DATETIME%.log" -v SQLSERVER_DBNAME=%V_SQLSERVER_DBNAME%
