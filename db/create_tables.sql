print 'Use database $(SQLSERVER_DBNAME)'
use $(SQLSERVER_DBNAME)


print 'Start : Create new tables'
print '     --> Create table EXCH'
CREATE TABLE exch (
	exch varchar(20) NOT NULL,
	exch_name varchar(50) NOT NULL,
	currency_code varchar(3) NOT NULL,
    CONSTRAINT exch_pk PRIMARY KEY (exch)
);
print '     --> Table created'
print '     --> Create table STK'
CREATE TABLE stk (
	exch varchar(20) not null,
	stk varchar(10) NOT NULL,
	stk_name varchar(200) NOT NULL,
	CONSTRAINT stk_pk PRIMARY KEY (exch, stk),
	CONSTRAINT stk_fk FOREIGN KEY (exch)
	REFERENCES exch(exch)	
); 
print '     --> Table created'
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
	CONSTRAINT stk_price_pk PRIMARY KEY (exch, stk, stk_date),
	CONSTRAINT stk_price_fk FOREIGN KEY (exch)
	REFERENCES exch(exch)
); 
print '     --> Table created'
print 'End   : Created new tables'