print 'Use database $(SQLSERVER_DBNAME)'
use $(SQLSERVER_DBNAME)


print 'Start : Drop tables'
print '-----------> Drop table STK_PRICE'
DROP TABLE stk_price;
print '-----------> Drop table STK'
DROP TABLE stk;
print '-----------> Drop table STK_EXCH'
DROP TABLE exch;
print 'End   : Dropped tables'