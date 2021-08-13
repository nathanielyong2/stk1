import os
import csv
import pyodbc
import socket

rows = 0
current_file_linenum = 0

server_name = 'Server=' + socket.gethostname() + ';'
connect_string = 'Driver={SQL Server};' + server_name + 'Database=stocks;' + 'Trusted_Connection=yes;'
connection = pyodbc.connect(connect_string)
cursor = connection.cursor()
print('Connection set...')

basedir = os.path.abspath(os.path.dirname(__file__))
path = os.path.abspath(os.path.join(basedir, '../..', 'stk1_data'))

for filename in os.listdir(path):
    file = os.path.join(path, filename)
    print(f'Start : {filename}')

    if os.path.isfile(file):
        stk_filename = os.path.splitext(filename)[0]
        exch = stk_filename.split('_')[0]

        with open(f'{file}', mode='r') as csv_file:
            csv_reader = csv.reader(csv_file, delimiter=',')
            next(csv_reader)
            
            current_file_linenum = 0
            stk_values = []

            for row in csv_reader:
                current_file_linenum += 1
                # print(f'Current line : {current_file_linenum}')
                
                stk_info = (row[0], row[1], row[2], row[3], row[4], row[5], row[6])
                stk_values.append(stk_info)
                
            cursor.executemany(
                        f"INSERT INTO stocks.dbo.stk_price VALUES('{exch}', ?, ?, ?, ?, ?, ?, ?)", stk_values)
            connection.commit()
            
        print(f'End : Loaded {current_file_linenum} rows for file {filename}')
        rows += current_file_linenum
    else:
        print(f'Error! : Invalid file : {filename}')

print(f'==> Total rows loaded = {rows}')

connection.close()
