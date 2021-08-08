call r_init.bat

echo -------------------------------------------------------------------
echo ++++++++ Load table EXCH
call r_init.bat
sqlcmd -S localhost -i "/work/stk1/db/load_EXCH.sql" -o "/work/stk1_log/load_EXCH.%V_DATETIME%.log" -v SQLSERVER_DBNAME=%V_SQLSERVER_DBNAME%
