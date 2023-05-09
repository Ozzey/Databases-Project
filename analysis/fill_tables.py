import random
from faker import Faker
import psycopg2

# Connect to database
conn = psycopg2.connect(host="localhost", database="mydatabase", user="myusername", password="mypassword")
cur = conn.cursor()

# Generate random data
faker = Faker()
products = []
for i in range(1000):
    product = {
        "ProductName": faker.word(),
        "ProductPrice": random.randint(10, 100),
        "CategoryID": random.randint(1, 10),
        "Barcode": faker.ean13(),
        "CustomerID": random.randint(1, 100)
    }
    products.append(product)

# Insert data into database
for product in products:
    cur.execute("INSERT INTO product (ProductName, ProductPrice, CategoryID, Barcode, CustomerID) "
                "VALUES (%s, %s, %s, %s, %s)",
                (product["ProductName"], product["ProductPrice"], product["CategoryID"],
                 product["Barcode"], product["CustomerID"]))
conn.commit()
print("Data inserted successfully.")