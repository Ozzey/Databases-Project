import os
import pandas as pd
import psycopg2 as pg

if __name__ == '__main__':
    conn = pg.connect(f"""
        dbname='project' 
        user='postgres' 
        host='localhost' 
        port='5432' 
        password='admin'
    """)

    cursor = conn.cursor()

