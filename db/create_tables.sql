CREATE TABLE exch (
	exch varchar(20) NOT NULL,
	exch_name varchar(50) NOT NULL,
	currency_code varchar(3) NOT NULL,
    CONSTRAINT PK_exch PRIMARY KEY (exch)
);

CREATE TABLE stk_price_hist (
	exch varchar(20) NOT NULL,
	stk varchar(10) NOT NULL,
	stk_date varchar(8) NOT NULL,
	open_price decimal(10, 5) NOT NULL,
	high_price decimal(10, 5) NOT NULL,
	low_price decimal(10, 5) NOT NULL,
	close_price decimal(10, 5) NOT NULL,
	volume bigint NOT NULL,
	CONSTRAINT PK_stk PRIMARY KEY (exch, stk, stk_date),
	CONSTRAINT FK_exch FOREIGN KEY (exch)
	REFERENCES exch(exch)
); 