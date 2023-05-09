import psycopg2


# Connect to PostgreSQL database
def connect_to_db():
    conn = psycopg2.connect(f"""
            dbname='postgres'
            user='postgres'
            host='localhost'
            port='5432'
            password='admin'
        """)
    return conn


# Test case 1: Personnel 6 sales revenue between 2023-01-01 and 2023-05-08
def test_get_personnel_sales_revenue_1():
    conn = connect_to_db()
    cur = conn.cursor()
    cur.execute("SELECT get_personnel_sales_revenue(6, '2023-01-01', '2023-05-08')")
    result = cur.fetchone()[0]
    expected_result = 6000  # Replace with expected result
    assert result == expected_result, f"Test case 1 failed: expected {expected_result}, but got {result}"
    cur.close()
    conn.close()


# Test case 2:Personnel 3 sales revenue between 2023-01-01 and 2023-05-08
def test_get_personnel_sales_revenue_2():
    conn = connect_to_db()
    cur = conn.cursor()
    cur.execute("SELECT get_personnel_sales_revenue(3, '2023-01-01', '2023-05-08')")
    result = cur.fetchone()[0]
    expected_result = 3000  # Replace with expected result
    assert result == expected_result, f"Test case 2 failed: expected {expected_result}, but got {result}"
    cur.close()
    conn.close()


# Test case 3: Personnel 4 sales revenue between 2023-01-01 and 2023-05-08
def test_get_personnel_sales_revenue_3():
    conn = connect_to_db()
    cur = conn.cursor()
    cur.execute("SELECT get_personnel_sales_revenue(4, '2023-01-01', '2023-05-08')")
    result = cur.fetchone()[0]
    expected_result = 4000  # Replace with expected result
    assert result == expected_result, f"Test case 3 failed: expected {expected_result}, but got {result}"
    cur.close()
    conn.close()


# Test case 4: Store 5 total revenue
def test_get_store_total_revenue_1():
    conn = connect_to_db()
    cur = conn.cursor()
    cur.execute("SELECT get_store_total_revenue(5)")
    result = cur.fetchone()[0]
    expected_result = 5000  # Replace with expected result
    assert result == expected_result, f"Test case 4 failed: expected {expected_result}, but got {result}"
    cur.close()
    conn.close()


# Test case 5: Store 2 total revenue
def test_get_store_total_revenue_2():
    conn = connect_to_db()
    cur = conn.cursor()
    cur.execute("SELECT get_store_total_revenue(2)")
    result = cur.fetchone()[0]
    expected_result = 2000  # Replace with expected result
    assert result == expected_result, f"Test case 5 failed: expected {expected_result}, but got {result}"
    cur.close()
    conn.close()


# Test case 6: Store 10 total revenue
def test_get_store_total_revenue_3():
    conn = connect_to_db()
    cur = conn.cursor()
    cur.execute("SELECT get_store_total_revenue(10)")
    result = cur.fetchone()[0]
    expected_result = 10000  # Replace with expected result
    assert result == expected_result, f"Test case 6 failed: expected {expected_result}, but got {result}"
    cur.close()
    conn.close()


