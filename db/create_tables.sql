CREATE TABLE exch (
	exch varchar(20),
	exch_name varchar(50),
	currency_code varchar(3)
);

CREATE TABLE stk_price_hist (
	exch varchar(20),
	stk varchar(10),
	stk_date varchar(8),
	open_price decimal(10, 5),
	high_price decimal(10, 5),
	low_price decimal(10, 5),
	close_price decimal(10, 5),
	volume bigint,
	CONSTRAINT PK_stk PRIMARY KEY (exch, stk, stk_date)
); 