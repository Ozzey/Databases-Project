import psycopg2
import pandas as pd
from pandas.testing import assert_frame_equal


# Establish a connection to the database
conn = psycopg2.connect(f"""
            dbname='postgres'
            user='postgres'
            host='localhost'
            port='5432'
            password='admin'
        """)


# Create a function,check_dtype=False for query A
def query_a():
    cur = conn.cursor()
    cur.execute("""
    SELECT st.branchname, AVG(p.productprice) AS avg_price
    FROM sales s
    INNER JOIN store st ON s.storeid = st.storeid
    INNER JOIN product p ON s.productid = p.productid
    INNER JOIN personnel pe ON s.personnelid = pe.personnelid
    GROUP BY st.branchname
    HAVING AVG(p.productprice) > 50
    ORDER BY avg_price DESC;
    """)
    rows = cur.fetchall()
    cur.close()
    return pd.DataFrame(rows, columns=["branchname", "avg_price"])


# Test query A
result_a = query_a()
expected_a = pd.read_csv('outputs/select_1.csv', encoding='utf-8')


# Create a function for query B
def query_b():
    cur = conn.cursor()
    cur.execute("""
    SELECT st.branchname, SUM(p.productprice) AS total_revenue
    FROM sales s
    INNER JOIN store st ON s.storeid = st.storeid
    INNER JOIN product p ON s.productid = p.productid
    INNER JOIN personnel pe ON s.personnelid = pe.personnelid
    GROUP BY st.branchname
    ORDER BY total_revenue DESC;
    """)
    rows = cur.fetchall()
    cur.close()
    return pd.DataFrame(rows, columns=["branchname", "total_revenue"])


# Test query B
result_b = query_b()
expected_b = pd.read_csv('outputs/select_2.csv', encoding='utf-8')


# Create a function for query C1
def query_c1():
    cur = conn.cursor()
    cur.execute("""
    SELECT cn.categoryname, cl.colorcode, COUNT(*) AS num_products, RANK() OVER (PARTITION BY cn.categoryname ORDER BY COUNT(*) DESC) AS color_rank
    FROM category c
    INNER JOIN categoryname cn ON c.categorynameid = cn.categorynameid
    INNER JOIN product p ON c.categoryid = p.categoryid
    INNER JOIN color cl ON c.colorid = cl.colorid
    GROUP BY cn.categoryname, cl.colorcode;
    """)
    rows = cur.fetchall()
    cur.close()
    return pd.DataFrame(rows, columns=["categoryname", "colorcode", "num_products", "color_rank"])


# Test query C1
result_c1 = query_c1()
expected_c1 = pd.read_csv('outputs/select_3A.csv', encoding='utf-8')


# Create a function for query C2
def query_c2():
    cur = conn.cursor()
    cur.execute("""
    SELECT st.branchname, SUM(p.productprice) AS total_revenue, SUM(SUM(p.productprice)) OVER (ORDER BY st.branchname) AS running_total_revenue
    FROM sales s
    INNER JOIN store st ON s.storeid = st.storeid
    INNER JOIN product p ON s.productid = p.productid
    GROUP BY st.branchname
    ORDER BY st.branchname;
    """)
    rows = cur.fetchall()
    cur.close()
    result = pd.DataFrame(rows, columns=["branchname", "total_revenue", "running_total_revenue"])
    result['running_total_revenue'] = result['running_total_revenue'].astype('int64')
    return result


# Test query C2
result_c2 = query_c2()
expected_c2 = pd.read_csv('outputs/select_3B.csv')


def query_c3():
    cur = conn.cursor()
    cur.execute("""
    SELECT st.branchname, p.personnelname, SUM(pr.productprice) AS total_sales_revenue, RANK() OVER (PARTITION BY st.branchname ORDER BY SUM(pr.productprice) DESC) AS sales_rank
    FROM sales s
    INNER JOIN store st ON s.storeid = st.storeid
    INNER JOIN personnel p ON s.personnelid = p.personnelid
    INNER JOIN product pr ON s.productid = pr.productid
    GROUP BY st.branchname, p.personnelname
    ORDER BY st.branchname, sales_rank
    LIMIT 3;
    """)
    rows = cur.fetchall()
    cur.close()
    result = pd.DataFrame(rows, columns=["branchname", "personnelname", "total_sales_revenue", "sales_rank"])
    return result


# test query c3
result_c3 = query_c3()
expected_c3 = pd.read_csv('outputs/select_3C.csv')


def query_d1():
    cur = conn.cursor()
    cur.execute("""
    SELECT cn.categoryname, COUNT(*) AS num_products
    FROM category c
    INNER JOIN categoryname cn ON c.categorynameid = cn.categorynameid
    INNER JOIN product p ON c.categoryid = p.categoryid
    GROUP BY cn.categoryname;
    """)
    rows = cur.fetchall()
    cur.close()
    result = pd.DataFrame(rows, columns=["categoryname", "num_products"])
    return result


result_d1 = query_d1()
expected_d1 = pd.read_csv('outputs/select_4A.csv', encoding='utf-8')


def query_d2():
    cur = conn.cursor()
    cur.execute("""
    SELECT p.personnelname, SUM(pr.productprice) AS total_sales_revenue, RANK() OVER (ORDER BY SUM(pr.productprice) DESC) AS sales_rank
    FROM sales s
    INNER JOIN personnel p ON s.personnelid = p.personnelid
    INNER JOIN product pr ON s.productid = pr.productid
    GROUP BY p.personnelname
    ORDER BY total_sales_revenue DESC
    LIMIT 3;
    """)
    rows = cur.fetchall()
    cur.close()
    result = pd.DataFrame(rows, columns=["personnelname", "total_sales_revenue", "sales_rank"])
    return result


result_d2 = query_d2()
expected_d2 = pd.read_csv('outputs/select_4B.csv', encoding='utf-8')


def query_d3():
    cur = conn.cursor()
    cur.execute("""
    SELECT *
    FROM product
    LIMIT 5;
    """)
    rows = cur.fetchall()
    cur.close()
    result = pd.DataFrame(rows, columns=["productid", "productname",  "productprice",  "categoryid",  "barcode",  "customerid"])

    return result


result_d3 = query_d3()
expected_d3 = pd.read_csv('outputs/select_4C.csv', encoding='utf-8')


def query_d4():
    cur = conn.cursor()
    cur.execute("""
    SELECT c.customername, COUNT(*) AS num_purchases, SUM(s.salesnumber) AS total_spent, RANK() OVER (ORDER BY COUNT(*) DESC) AS purchase_rank
    FROM sales s
    INNER JOIN customer c ON s.customerid = c.customerid
    GROUP BY c.customername
    ORDER BY purchase_rank ASC
    LIMIT 5;
    """)
    rows = cur.fetchall()
    cur.close()
    result = pd.DataFrame(rows, columns=["customername", "num_purchases", "total_spent", "purchase_rank"])
    return result


result_d4 = query_d4()
expected_d4 = pd.read_csv('outputs/select_4D.csv', encoding='utf-8')


# Close the database connection
conn.close()


def test():
    assert_frame_equal(result_a, expected_a, check_dtype=False)
    assert_frame_equal(result_b, expected_b, check_dtype=False)
    assert_frame_equal(result_c1, expected_c1,check_dtype=False)
    assert_frame_equal(result_c2, expected_c2,check_dtype=False)
    assert_frame_equal(result_c3, expected_c3,check_dtype=False)
    assert_frame_equal(result_d1, expected_d1,check_dtype=False)
    assert_frame_equal(result_d2, expected_d2,check_dtype=False)
    assert_frame_equal(result_d3, expected_d3,check_dtype=False)
    assert_frame_equal(result_d4, expected_d4,check_dtype=False)
