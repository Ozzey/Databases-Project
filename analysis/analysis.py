import pandas as pd
import matplotlib.pyplot as plt
import psycopg2
import seaborn as sns

# Connect to database
conn = psycopg2.connect(host="localhost", database="postgres", user="postgres", password="admin")

# Bar chart of top 10 most expensive products
# Extract data for first chart
query = """
SELECT ProductName, ProductPrice FROM product
ORDER BY ProductPrice DESC
LIMIT 10
"""
df_top10 = pd.read_sql_query(query, conn)

# Create first chart
fig, axs = plt.subplots(nrows=1, ncols=2, figsize=(12, 6))
axs[0].bar(df_top10["productname"], df_top10["productprice"])
axs[0].set_xticklabels(df_top10["productname"], rotation=45, ha='right')
axs[0].set_title("Top 10 Most Expensive Products")
axs[0].set_xlabel("Product Name")
axs[0].set_ylabel("Product Price")


# Heatmap of sales by month and store location
# Extract data for second chart
query = """
SELECT date_trunc('month', SalesDate) AS month, StoreID, SUM(ProductPrice) AS total_sales
FROM sales s
JOIN product p ON s.ProductID = p.ProductID
GROUP BY month, StoreID
"""
df_sales = pd.read_sql_query(query, conn)

# Pivot data and create second chart
df_pivot = df_sales.pivot(index="month", columns="storeid", values="total_sales")
sns.heatmap(df_pivot, cmap="YlGnBu", ax=axs[1])
axs[1].set_title("Sales by Month and Store Location")
axs[1].set_xlabel("Store Location")
axs[1].set_ylabel("Month")

plt.show()

