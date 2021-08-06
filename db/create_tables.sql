print 'Use database $(SQLSERVER_DBNAME)'
use $(SQLSERVER_DBNAME)


print 'Start : Create new tables'
print '     --> Create table EXCH'
CREATE TABLE exch (
	exch varchar(20) NOT NULL,
	exch_name varchar(50) NOT NULL,
	currency_code varchar(3) NOT NULL,
    CONSTRAINT PK_exch PRIMARY KEY (exch)
);
print '     --> Create table STK'
CREATE TABLE stk (
	stk varchar(10) NOT NULL,
	stk_name varchar(200) NOT NULL
); 

print '     --> Create table STK_PRICE'
CREATE TABLE stk_price (
	exch varchar(20) NOT NULL,
	stk varchar(10) NOT NULL,
	stk_date varchar(8) NOT NULL,
	open_price decimal(20, 5) NOT NULL,
	high_price decimal(20, 5) NOT NULL,
	low_price decimal(20, 5) NOT NULL,
	close_price decimal(20, 5) NOT NULL,
	volume bigint NOT NULL,
	CONSTRAINT PK_stk PRIMARY KEY (exch, stk, stk_date),
	CONSTRAINT FK_exch FOREIGN KEY (exch)
	REFERENCES exch(exch)
); 

print 'End   : Created new tables'