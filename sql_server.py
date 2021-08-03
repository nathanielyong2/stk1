import os
import csv
import pyodbc
import socket

rows = 0
server_name='Server=' + socket.gethostname() + ';'
connect_string='Driver={SQL Server};' + server_name + 'Database=stocks;' + 'Trusted_Connection=yes;'
conn = pyodbc.connect(connect_string)
cursor = conn.cursor()

basedir = os.path.abspath(os.path.dirname(__file__))
path = os.path.abspath(os.path.join(basedir, '..', 'stk_data'))

for filename in os.listdir(path):
    file = os.path.join(path, filename)

    if os.path.isfile(file):
        stk_filename = os.path.splitext(filename)[0]
        exch = stk_filename.split('_')[0]

        with open(f'{file}', mode='r') as csv_file:
            csv_reader = csv.reader(csv_file, delimiter=',')
            firstLine = True

            for row in csv_reader:
                if firstLine:
                    firstLine = False
                else:
                    cursor.execute(
                        f"INSERT INTO stocks.dbo.stk_price_hist VALUES('{exch}', '{row[0]}', '{row[1]}', {row[2]}, {row[3]}, {row[4]}, {row[5]}, {row[6]})")
                    rows += 1

cursor.commit()

print(f'Finished inserting {rows} rows')
