echo off
echo -------------------------------------------------------------------
echo ++++++++ Install DB
call r_create_database.bat
call r_create_tables.bat

call r_load_EXCH.bat
call r_load_STK.bat
call r_load_STK_PRICE.bat