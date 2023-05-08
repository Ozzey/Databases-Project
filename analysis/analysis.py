# import os
# import pandas as pd
# import psycopg2 as pg
# from faker import Faker
# import random
# import matplotlib.pyplot as plt
#
# conn = pg.connect(f"""
#         dbname='project'
#         user='postgres'
#         host='localhost'
#         port='5432'
#         password='admin'
#     """)
#
# # # Connect to PostgreSQL database
# # conn = psycopg2.connect(
# #     host="your_host",
# #     database="your_database",
# #     user="your_username",
# #     password="your_password"
# # )
#
# # Generate fake data using Faker and insert into the database
# fake = Faker()
# cur = conn.cursor()
#
# for i in range(100):
#     # Generate fake personnel data
#     personnel_name = fake.name()
#     personnel_email = fake.email()
#     personnel_phone = fake.phone_number()
#     personnel_address = fake.address()
#
#     # Insert personnel data into the database
#     cur.execute("INSERT INTO personnel "
#                 "(personnelname, personneladdress, personnelphone, personnelemail) "
#                 "VALUES (%s, %s, %s, %s) RETURNING personnelid",
#                 (personnel_name, personnel_address, personnel_phone, personnel_email))
#     personnel_id = cur.fetchone()[0]
#
#     # Generate fake product data
#     product_name = fake.word()
#     product_price = round(random.uniform(1.0, 100.0), 2)
#
#     # Insert product data into the database
#     cur.execute("INSERT INTO product (productname, productprice) VALUES (%s, %s) RETURNING productid", (product_name, product_price))
#     product_id = cur.fetchone()[0]
#
#     # Generate fake sales data
#     sale_date = fake.date_between(start_date='-1y', end_date='today')
#     sale_quantity = random.randint(1, 10)
#     sale_amount = round(sale_quantity * product_price, 2)
#
#     # Insert sales data into the database
#     cur.execute("INSERT INTO sales (personnelid, productid, saledate, salequantity, saleamount) "
#                 "VALUES (%s, %s, %s, %s, %s)",
#                 (personnel_id, product_id, sale_date, sale_quantity, sale_amount))
#
# conn.commit()
# cur.close()
# conn.close()
#
# # Extract sales data from the database
# sales_df = pd.read_sql("SELECT saledate, saleamount FROM sales", conn)
#
# # Aggregate sales data by month
# sales_df['saledate'] = pd.to_datetime(sales_df['saledate'])
# sales_df.set_index('saledate', inplace=True)
# sales_monthly = sales_df.resample('M').sum()
#
# # Plot sales data as a line chart
# plt.plot(sales_monthly)
# plt.title('Monthly Sales')
# plt.xlabel('Month')
# plt.ylabel('Sales Amount')
# plt.show()
#
# # Plot sales data as a heatmap
# sales_pivot_table = sales_df.pivot_table(values='saleamount', index=sales_df.index.month, columns=sales_df.index.year, aggfunc='sum')
# plt.pcolor(sales_pivot_table, cmap='Oranges')
# plt.title('Sales Heatmap')
# plt.xlabel('Year')
# plt.ylabel('Month')
# plt.xticks(range(1, len(sales_pivot_table.columns)+1))
# plt.yticks(range(1, len(sales_pivot_table.index)+1))
# plt.colorbar()
# plt.show()
#
# # Close database connection
# conn.close()
