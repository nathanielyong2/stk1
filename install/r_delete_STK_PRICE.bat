echo off
echo -------------------------------------------------------------------
echo ++++++++ Delete stk_price

call r_init.bat
sqlcmd -S localhost -i "/work/stk1/db/delete_STK_PRICE.sql" -o "/work/stk1_log/delete_STK_PRICE.%V_DATETIME%.log" -v SQLSERVER_DBNAME=%V_SQLSERVER_DBNAME%
