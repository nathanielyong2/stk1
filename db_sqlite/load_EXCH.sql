select 'Using database : ';
.database

select 'Start : Insert into exch';
INSERT INTO exch VALUES ('NASDAQ', 'NASDAQ Stock Exchange', 'USD');
INSERT INTO exch VALUES ('NYSE', 'New York Stock Exchange', 'USD');
INSERT INTO exch VALUES ('TSX', 'Toronto Stock Exchange', 'CAD');
INSERT INTO exch VALUES ('AMEX', 'American Stock Exchange', 'USD');
select changes(), total_changes();
select 'End : Insert into exch';