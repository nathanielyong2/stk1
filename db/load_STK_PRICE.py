import os
import csv
import pyodbc
import socket

rows = 0

server_name = 'Server=' + socket.gethostname() + ';'
connect_string = 'Driver={SQL Server};' + server_name + 'Database=stocks;' + 'Trusted_Connection=yes;'
connection = pyodbc.connect(connect_string)
cursor = connection.cursor()
print('Connection set using connect string : ', connect_string)

basedir = os.path.abspath(os.path.dirname(__file__))
path = os.path.abspath(os.path.join(basedir, '../..', 'stk1_data_load'))

for filename in os.listdir(path):
    file = os.path.join(path, filename)
    print(f'Start : {filename}')
    
    current_file_linenum = 0

    if os.path.isfile(file):
        exch = filename.split('_')[0]

        with open(f'{file}', mode='r') as csv_file:
            csv_reader = csv.reader(csv_file, delimiter=',')
            next(csv_reader)
            
            stk_rows = list(csv_reader)
                
            cursor.executemany(
                        f"INSERT INTO stk_price VALUES('{exch}', ?, ?, ?, ?, ?, ?, ?)", [tuple(row) for row in stk_rows])
            connection.commit()
            
        current_file_linenum = len(stk_rows)    
        rows += current_file_linenum
        
        print(f'End : Loaded {current_file_linenum} rows for file {filename}')
    else:
        print(f'Error! : Invalid file : {filename}')

print(f'==> Total rows loaded = {rows}')

connection.close()
