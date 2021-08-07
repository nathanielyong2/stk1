print 'Use database $(SQLSERVER_DBNAME)'
use $(SQLSERVER_DBNAME)

print 'Start : Delete data - STK_PRICE'
delete from stk_price;
print 'End   : Delete data - STK_PRICE'