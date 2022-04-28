select 'Using database ';
.database

select 'Start : Delete data - STK_PRICE';
delete from stk_price;
select changes(), total_changes();
select 'End   : Delete data - STK_PRICE';
