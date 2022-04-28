sqlite3 stkdb < drop_tables.sql
sqlite3 stkdb < create_tables.sql
sqlite3 stkdb ".read delete_STK_PRICE.sql
sqlite3 stkdb ".read load_EXCH.sql
sqlite3 stkdb < load_STK.sql
