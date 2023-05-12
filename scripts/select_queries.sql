-- Script for special select queries

-------------------------------------------------

--A. GROUP BY + HAVING queries:
-- Find the categories with average price greater than $50, ordered by the average price in descending order:
SELECT st.branchname, SUM(p.productprice) AS total_revenue
FROM sales s
INNER JOIN store st ON s.storeid = st.storeid
INNER JOIN product p ON s.productid = p.productid
INNER JOIN personnel pe ON s.personnelid = pe.personnelid
GROUP BY st.branchname
ORDER BY total_revenue DESC;

-------------------------------------------------

--B. ORDER BY:
-- Find the total sales revenue for each store, ordered by the revenue in descending order:
SELECT st.branchname, SUM(p.productprice) AS total_revenue
FROM sales s
INNER JOIN store st ON s.storeid = st.storeid
INNER JOIN product p ON s.productid = p.productid
INNER JOIN personnel pe ON s.personnelid = pe.personnelid
GROUP BY st.branchname
ORDER BY total_revenue DESC;

-------------------------------------------------

--C. <func>(..) OVER (..):

--1. PARTITION BY: Find the most common color used in each category, along with the rank of the color within the category:
SELECT cn.categoryname, cl.colorcode, COUNT(*) AS num_products, RANK() OVER (PARTITION BY cn.categoryname ORDER BY COUNT(*) DESC) AS color_rank
FROM category c
INNER JOIN categoryname cn ON c.categorynameid = cn.categorynameid
INNER JOIN product p ON c.categoryid = p.categoryid
INNER JOIN color cl ON c.colorid = cl.colorid
GROUP BY cn.categoryname, cl.colorcode;


--2. ORDER BY: Find the total sales revenue for each store, along with the running total of revenue across all stores:
SELECT st.branchname, SUM(p.productprice) AS total_revenue, SUM(SUM(p.productprice)) OVER (ORDER BY st.branchname) AS running_total_revenue
FROM sales s
INNER JOIN store st ON s.storeid = st.storeid
INNER JOIN product p ON s.productid = p.productid
GROUP BY st.branchname
ORDER BY st.branchname;

--3. PARTITION BY + ORDER BY: Find the top 3 personnel with the highest total sales revenue for each store, along with their rank within the store:
SELECT st.branchname, p.personnelname, SUM(pr.productprice) AS total_sales_revenue, RANK() OVER (PARTITION BY st.branchname ORDER BY SUM(pr.productprice) DESC) AS sales_rank
FROM sales s
INNER JOIN store st ON s.storeid = st.storeid
INNER JOIN personnel p ON s.personnelid = p.personnelid
INNER JOIN product pr ON s.productid = pr.productid
GROUP BY st.branchname, p.personnelname
ORDER BY st.branchname, sales_rank
LIMIT 3;


-------------------------------------------------

--D. <func>

--1. AGGREGATING: Find the total number of products in each category:
SELECT cn.categoryname, COUNT(*) AS num_products
FROM category c
INNER JOIN categoryname cn ON c.categorynameid = cn.categorynameid
INNER JOIN product p ON c.categoryid = p.categoryid
GROUP BY cn.categoryname;


--2. RANKING: Find the top 3 personnel with the highest total sales revenue:
SELECT p.personnelname, SUM(pr.productprice) AS total_sales_revenue, RANK() OVER (ORDER BY SUM(pr.productprice) DESC) AS sales_rank
FROM sales s
INNER JOIN personnel p ON s.personnelid = p.personnelid
INNER JOIN product pr ON s.productid = pr.productid
GROUP BY p.personnelname
ORDER BY total_sales_revenue DESC
LIMIT 3;

--3. OFFSET: Get the first 5 products in the database:
SELECT *
FROM product
LIMIT 5;

--4. ALL 3 FUNCTIONS: Get the top 5 customers who made the highest number of purchases, along with the total amount they spent.
SELECT c.customername, COUNT(*) AS num_purchases, SUM(s.salesnumber) AS total_spent, RANK() OVER (ORDER BY COUNT(*) DESC) AS purchase_rank
FROM sales s
INNER JOIN customer c ON s.customerid = c.customerid
GROUP BY c.customername
ORDER BY purchase_rank ASC
LIMIT 5;

-------------------------------------------------
