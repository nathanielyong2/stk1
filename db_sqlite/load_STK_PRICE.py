import os
import csv
## import pyodbc
import socket

import sqlite3
from sqlite3 import Error

'''
def create_connection(db_file):
    """ create a database connection to a SQLite database """
    conn = None
    try:
        conn = sqlite3.connect(db_file)
        print(sqlite3.version)
    except Error as e:
        print(e)
    finally:
        if conn:
            conn.close()


if __name__ == '__main__':
    create_connection(r"C:\Work\stk1\db_sqlite\zzz1.db")
'''

rows = 0

# connection = pyodbc.connect(connect_string)
connection = sqlite3.connect('stkdb')
cursor = connection.cursor()
print('Connected to stkdb')

basedir = os.path.abspath(os.path.dirname(__file__))
path = os.path.abspath(os.path.join(basedir, '../..', 'stk1_data_load/DATA_PRICES'))
print('zzzz :' + path)
for filename in os.listdir(path):
    file = os.path.join(path, filename)
    print(f'Start : {filename}')
    
    current_file_linenum = 0

    if os.path.isfile(file):
        stk_filename = os.path.splitext(filename)[0]
        exch = stk_filename.split('_')[0]

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
