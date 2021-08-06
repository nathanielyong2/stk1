print 'Use database $(SQLSERVER_DBNAME)'
use $(SQLSERVER_DBNAME)

print 'Start : Insert into exch'
INSERT INTO exch VALUES ('NASDAQ', 'NASDAQ Stock Exchange', 'USD');
INSERT INTO exch VALUES ('NYSE', 'New York Stock Exchange', 'USD');
INSERT INTO exch VALUES ('TSX', 'Toronto Stock Exchange', 'CAD');
INSERT INTO exch VALUES ('AMEX', 'American Stock Exchange', 'USD');

print 'End : Insert into exch'