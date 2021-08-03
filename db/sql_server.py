import csv
import pyodbc

conn = pyodbc.connect('Driver={SQL Server};'
                      'Server=LAPTOP-KHUTVNS5;'
                      'Database=stocks;'
                      'Trusted_Connection=yes;')
cursor = conn.cursor()

with open('dummy.txt', mode='r') as csv_file:
    csv_reader = csv.reader(csv_file, delimiter=',')
    for row in csv_reader:
        cursor.execute(
            f"INSERT INTO stocks.dbo.stk_price_hist VALUES('{row[0]}', '{row[1]}', '{row[2]}', {row[3]}, {row[4]}, {row[5]}, {row[6]}, {row[7]})")
cursor.commit()

cursor.execute('SELECT * FROM stocks.dbo.stk_price_hist')
for row in cursor:
    print(row)
