
-- 1. A stored function that retrieves the total sales revenue for a given personnel within a specific date range.

CREATE OR REPLACE FUNCTION get_personnel_sales_revenue(
    IN personnel_id INTEGER,
    IN start_date DATE,
    IN end_date DATE
) RETURNS NUMERIC
AS $$
DECLARE
    total_sales_revenue NUMERIC;
BEGIN
    SELECT SUM(pr.productprice) INTO total_sales_revenue
    FROM sales s
    INNER JOIN personnel p ON s.personnelid = p.personnelid
    INNER JOIN product pr ON s.productid = pr.productid
    WHERE p.personnelid = personnel_id AND s.salesdate BETWEEN start_date AND end_date;

    RETURN total_sales_revenue;
END;
$$ LANGUAGE plpgsql;

SELECT get_personnel_sales_revenue(6, '2023-01-01', '2023-05-08');


--2. A stored function that retrieves the top 5 customers who made the highest number of purchases, along with the total amount they spent:

CREATE OR REPLACE FUNCTION get_store_total_revenue(
    IN store_id INTEGER
) RETURNS NUMERIC
AS $$
DECLARE
    total_revenue NUMERIC;
BEGIN
    SELECT COALESCE(SUM(p.productprice), 0) INTO total_revenue
    FROM sales s
    INNER JOIN product p ON s.productid = p.productid
    WHERE s.storeid = store_id;

    RETURN total_revenue;
END;
$$ LANGUAGE plpgsql;

SELECT get_store_total_revenue(5);
