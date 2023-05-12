-- 1. Find all customers who have made a purchase at a store located in the city of "New York":

SELECT DISTINCT c.*
FROM customer c
INNER JOIN sales s ON c.customerid = s.customerid
INNER JOIN store st ON s.storeid = st.storeid
WHERE st.city = 'New York';

--2. Find the total number of sales made by each personnel, ordered by the number of sales in descending order:

SELECT p.personnelname, COUNT(*) AS total_sales
FROM sales s
INNER JOIN personnel p ON s.personnelid = p.personnelid
GROUP BY p.personnelname
ORDER BY total_sales DESC;

--3. Find the total sales revenue for each store, ordered by the revenue in descending order:

SELECT st.branchname, SUM(p.productprice) AS total_revenue
FROM sales s
INNER JOIN store st ON s.storeid = st.storeid
INNER JOIN product p ON s.productid = p.productid
GROUP BY st.branchname
ORDER BY total_revenue DESC;

--4. Find the average salary of personnel in each department:

SELECT d.departmentname, AVG(p.salary) AS avg_salary
FROM personnel p
INNER JOIN department d ON p.departmentid = d.departmentid
GROUP BY d.departmentname;

--5. Find the total number of exchanges for each customer, ordered by the number of exchanges in descending order:

SELECT c.customername, COUNT(*) AS total_exchanges
FROM exchange e
INNER JOIN customer c ON e.customerid = c.customerid
GROUP BY c.customername
ORDER BY total_exchanges DESC;

--6. Find the number of sales made by each personnel in each store, ordered by store and personnel:

SELECT st.branchname, p.personnelname, COUNT(*) AS num_sales
FROM sales s
INNER JOIN store st ON s.storeid = st.storeid
INNER JOIN personnel p ON s.personnelid = p.personnelid
GROUP BY st.branchname, p.personnelname
ORDER BY st.branchname, p.personnelname;

--7. Find the number of products in each category, ordered by the category name:

SELECT cn.categoryname, COUNT(*) AS num_products
FROM category c
INNER JOIN categoryname cn ON c.categorynameid = cn.categorynameid
GROUP BY cn.categoryname
ORDER BY cn.categoryname;

--8. Find the total sales revenue for each store, ordered by the revenue in descending order:

SELECT st.branchname, SUM(p.productprice) AS total_revenue
FROM sales s
INNER JOIN store st ON s.storeid = st.storeid
INNER JOIN product p ON s.productid = p.productid
INNER JOIN personnel pe ON s.personnelid = pe.personnelid
GROUP BY st.branchname
ORDER BY total_revenue DESC;

--9 . Find the top 3 personnel with the highest total sales revenue:

SELECT p.personnelname, SUM(pr.productprice) AS total_sales_revenue
FROM sales s
INNER JOIN personnel p ON s.personnelid = p.personnelid
INNER JOIN product pr ON s.productid = pr.productid
GROUP BY p.personnelname
ORDER BY total_sales_revenue DESC
LIMIT 3;

--10. Find the personnel with the highest sales revenue for each store:

SELECT st.branchname, p.personnelname, SUM(pr.productprice) AS total_sales_revenue
FROM sales s
INNER JOIN store st ON s.storeid = st.storeid
INNER JOIN personnel p ON s.personnelid = p.personnelid
INNER JOIN product pr ON s.productid = pr.productid
GROUP BY st.branchname, p.personnelname
HAVING SUM(pr.productprice) = (
    SELECT MAX(total_sales_revenue)
    FROM (
        SELECT st2.branchname, p2.personnelname, SUM(pr2.productprice) AS total_sales_revenue
        FROM sales s2
        INNER JOIN store st2 ON s2.storeid = st2.storeid
        INNER JOIN personnel p2 ON s2.personnelid = p2.personnelid
        INNER JOIN product pr2 ON s2.productid = pr2.productid
        GROUP BY st2.branchname, p2.personnelname
    ) s3
    WHERE s3.branchname = st.branchname
)
ORDER BY st.branchname;



--------------------------------
-- DELETE QUERIES

--1. Delete all sales records for a specific store with a total sales price less than $2000:
DELETE FROM sales
WHERE StoreID = 1 AND ProductID IN (
  SELECT ProductID
  FROM product
  WHERE ProductPrice * SalesNumber < 2000
);

--2. Delete all exchange records for a specific customer with a product name containing the word "defective":
DELETE FROM exchange
WHERE CustomerID = 1 AND ProductID IN (
  SELECT ProductID
  FROM product
  WHERE ProductName LIKE '%defective%'
);


--------------------------------
-- UPDATE QUERIES:

--1. Undo the delete of all sales records for a specific store with a total sales price less than $2000:
UPDATE sales
SET SalesNumber = SalesNumber + (
  SELECT SUM(SalesNumber)
  FROM sales AS s
  JOIN product AS p ON s.ProductID = p.ProductID
  WHERE s.StoreID = 1 AND p.ProductPrice * s.SalesNumber < 2000
)
WHERE StoreID = 1 AND ProductID IN (
  SELECT ProductID
  FROM product
  WHERE ProductPrice * SalesNumber < 2000
);



--2.Update the SalesNumber values for all sales records at a specific store to account for a change in pricing:
UPDATE sales
SET SalesNumber = SalesNumber * (old_price.ProductPrice / new_price.ProductPrice)
FROM (
  SELECT ProductID, ProductPrice
  FROM product
  WHERE ProductID = 1
) AS old_price
CROSS JOIN (
  SELECT ProductID, ProductPrice
  FROM product
  WHERE ProductID = 1
) AS new_price
WHERE sales.ProductID = new_price.ProductID AND sales.StoreID = 1;

--To undo this action,
--we can update the SalesNumber values to their previous values
--using a similar query with the appropriate prices.
UPDATE sales
SET SalesNumber = SalesNumber / (old_price.ProductPrice / new_price.ProductPrice)
FROM (
  SELECT ProductID, ProductPrice
  FROM product
  WHERE ProductID = 1
) AS old_price
CROSS JOIN (
  SELECT ProductID, ProductPrice
  FROM product
  WHERE ProductID = 1
) AS new_price
WHERE sales.ProductID = new_price.ProductID AND sales.StoreID = 1;



--3. Update the Salary values for all personnel in a specific department based on their tenure:
UPDATE personnel
SET Salary = Salary * (1 + tenure_bonus.BonusPercentage)
FROM (
  SELECT PersonnelID, DATE_PART('year', NOW() - EntryDate) AS Tenure, CASE
    WHEN DATE_PART('year', NOW() - EntryDate) > 5 THEN 0.05
    WHEN DATE_PART('year', NOW() - EntryDate) > 3 THEN 0.03
    ELSE 0
  END AS BonusPercentage
  FROM personnel
  WHERE DepartmentID = 1
) AS tenure_bonus
WHERE personnel.PersonnelID = tenure_bonus.PersonnelID;

--To undo this action,
--we can update the Salary values to their previous values
--by dividing them by the appropriate multiplier.
UPDATE personnel
SET Salary = Salary / (1 + tenure_bonus.BonusPercentage)
FROM (
  SELECT PersonnelID, DATE_PART('year', NOW() - EntryDate) AS Tenure, CASE
    WHEN DATE_PART('year', NOW() - EntryDate) > 5 THEN 0.05
    WHEN DATE_PART('year', NOW() - EntryDate) > 3 THEN 0.03
    ELSE 0
  END AS BonusPercentage
  FROM personnel
  WHERE DepartmentID = 1
) AS tenure_bonus
WHERE personnel.PersonnelID = tenure_bonus.PersonnelID;
