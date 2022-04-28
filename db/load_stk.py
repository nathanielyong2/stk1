import os
import csv
import pyodbc
import socket

server_name = 'Server=' + socket.gethostname() + ';'
connect_string = 'Driver={SQL Server};' + server_name + 'Database=stocks;' + 'Trusted_Connection=yes;'
connection = pyodbc.connect(connect_string)
cursor = connection.cursor()
print('Connection set using connect string : ', connect_string)

files = ['C:/work/stk1_data/NASDAQ_listing_fundamentals/NASDAQ_listing.2021-08-15.txt', 'C:/work/stk1_data/NYSE_listing_fundamentals/NYSE_symbol_list.2021-08-15.txt']

num_rows = 0

for filename in files:
    exch = os.path.basename(filename).split('_')[0]
    
    with open(f'{filename}', mode='r') as csv_file:
        csv_reader = csv.reader(csv_file, delimiter='\t')
        next(csv_reader)
        
        rows = list(csv_reader)
            
        cursor.executemany(
                    f"INSERT INTO stk VALUES('{exch}', ?, ?)", [tuple(row) for row in rows])
        connection.commit()
    
    num_rows += len(rows)
                
print(f'==> Total rows loaded = {num_rows}')

connection.close()
