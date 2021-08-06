
print 'Start : Create new database : $(SQLSERVER_DBNAME)' 
create database $(SQLSERVER_DBNAME)
print 'End   : Created new database : ' + '$(SQLSERVER_DBNAME)'
