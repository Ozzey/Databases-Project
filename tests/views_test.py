import psycopg2
import unittest
import pandas as pd
from pandas.testing import assert_frame_equal


def assert_dataframes_equal(dataframeA, dataframeB):
    comparison = dataframeA.compare(dataframeB)
    assert comparison.empty, \
        f"Dataframes are not equal: " \
        f"{comparison.to_string()}"


class TestAnonymization(unittest.TestCase):

    def setUp(self):
        self.conn = psycopg2.connect(f"""
            dbname='postgres'
            user='postgres'
            host='localhost'
            port='5432'
            password='admin'
        """)

    def tearDown(self):
        self.conn.close()

    def test_sales_anonymized(self):
        cur = self.conn.cursor()
        cur.execute("SELECT card_no_masked FROM sales_anonymized")
        rows = cur.fetchall()
        cur.execute("select card_no from customer")
        cust = cur.fetchall()
        for i in range(len(rows)):
            self.assertNotEquals(rows[i], cust[i])
        cur.close()

    def test_users_anonymized(self):
        cur = self.conn.cursor()
        cur.execute("SELECT password_masked FROM users_anonymized")
        rows = cur.fetchall()
        cur.execute('select password FROM "user"')
        cust = cur.fetchall()
        for i in range(len(rows)):
            self.assertNotEquals(rows[i], cust[i])
        cur.close()

    def test_sales_by_category(self):
        cur = self.conn.cursor()
        cur.execute("select * from sales_by_category")
        rows = cur.fetchall()
        result = pd.DataFrame(rows, columns=['categoryname', 'total_sales'])
        expected = pd.read_csv('outputs/view_3.csv')
        assert_frame_equal(result, expected, check_dtype=False)

    def test_sales_by_store_day(self):
        cur = self.conn.cursor()
        cur.execute("select storeid, total_sales from sales_by_store_day")
        rows = cur.fetchall()
        result = pd.DataFrame(rows, columns=['storeid', 'total_sales'])
        # Load expected results from file
        expected = pd.read_csv('outputs/view_4.csv', usecols=['storeid', 'total_sales'])
        pd.testing.assert_frame_equal(result, expected)

    def test_purchase_history(self):
        cur = self.conn.cursor()
        cur.execute("select * from purchase_history")
        rows = cur.fetchall()
        result = pd.DataFrame(rows, columns=['customerid', 'customername', 'productname', 'salesdate', 'salesnumber'])
        result['salesdate'] = result['salesdate'].to_string()
        expected = pd.read_csv('outputs/view_5.csv')
        expected['salesdate'] = expected['salesdate'].to_string()
        assert_frame_equal(result, expected, check_dtype=False)

    def product_details(self):
        cur = self.conn.cursor()
        cur.execute("SELECT * FROM product_details")
        rows = cur.fetchall()
        result = pd.DataFrame(rows,
                              columns=['productid', 'productname', 'productprice', 'barcode', 'brandname',
                                       'categoryname', 'sizename', 'patternname', 'colorcode', 'typename'])

        expected = pd.read_csv('outputs/view_6.csv')
        assert_frame_equal(result, expected, check_dtype=False)


if __name__ == '__main__':
    unittest.main()
