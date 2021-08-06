sqlcmd -S localhost -i "/work/stk1/db/load_data_EXCH.sql" -o "/work/stk1_log/load_data_EXCH.log"
CD "C:/work/stk1/db" 
python load_data_STK_PRICE.py