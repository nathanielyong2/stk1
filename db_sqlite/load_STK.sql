select 'Using database : ';
.database


select 'Start : Insert into stk table';
select changes();
INSERT INTO stk VALUES ('NASDAQ', 'MSFT', 'Microsoft Corporation');
INSERT INTO stk VALUES ('NASDAQ', 'TSLA', 'Tesla Inc.');
INSERT INTO stk VALUES ('NASDAQ', 'AAPL', 'Apple Inc.');
INSERT INTO stk VALUES ('NASDAQ', 'GOOG', 'Alphabet Inc.');
INSERT INTO stk VALUES ('NASDAQ', 'AMZN', 'Amazon Inc.');

INSERT INTO stk VALUES ('NYSE', 'ORCL', 'Oracle Corporation');
INSERT INTO stk VALUES ('NYSE', 'WMT', 'Walmart Inc.');
select total_changes();

select 'End : Insert into stk table';