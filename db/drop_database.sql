
print 'Start : Drop database : $(SQLSERVER_DBNAME)' 
drop database $(SQLSERVER_DBNAME)
print 'End   : Dropped database : ' + '$(SQLSERVER_DBNAME)'
