
-- Submission 1: Hide personal and technical data in the sales table
CREATE VIEW sales_anonymized AS
SELECT
salesid,
storeid,
personnelid,
productid,
DATE_TRUNC('day', salesdate) AS salesdate,
CAST(SUBSTRING(c.card_no, 1, 4) || '********' || SUBSTRING(c.card_no, 13, 4) AS VARCHAR) AS card_no_masked,
salesnumber
FROM sales s
JOIN customer c ON s.customerid = c.customerid;

SELECT * FROM sales_anonymized;


-- Submission 2: Hide user password
CREATE VIEW users_anonymized AS
SELECT
    userid,
    username,
    CAST('********' AS VARCHAR) AS password_masked
FROM "user";

SELECT * FROM users_anonymized;


-- Submission 3: Sales by catrgory
CREATE VIEW sales_by_category AS
SELECT
    c.categoryname,
    SUM(s.salesnumber) AS total_sales
FROM sales s
JOIN product p ON s.productid = p.productid
JOIN categoryname c ON p.categoryid = c.categorynameid
GROUP BY c.categoryname;

select * from sales_by_category;

--Submission 4: Total Sales by Store and Day
CREATE VIEW sales_by_store_day AS
SELECT
    s.storeid,
    DATE_TRUNC('day', s.salesdate) AS salesdate,
    SUM(s.salesnumber) AS total_sales
FROM sales s
JOIN store st ON s.storeid = st.storeid
GROUP BY s.storeid, DATE_TRUNC('day', s.salesdate);


select * from sales_by_store_day;


--Submission 5: Purchase History
CREATE VIEW purchase_history AS
SELECT
    c.customerid,
    c.customername,
    p.productname,
    s.salesdate,
    s.salesnumber
FROM sales s
JOIN customer c ON s.customerid = c.customerid
JOIN product p ON s.productid = p.productid;


select * from purchase_history;

--Submission 6: View that shows the product details
CREATE VIEW product_details AS
SELECT p.ProductID, p.ProductName, p.ProductPrice, barcode, b.BrandName, cn.CategoryName, s.SizeName, pt.PatternName, color.ColorCode, t.TypeName
FROM product p
JOIN category c ON p.CategoryID = c.CategoryID
JOIN brand b ON c.BrandID = b.BrandID
JOIN categoryName cn ON c.CategoryNameID = cn.CategoryNameID
JOIN pattern pt ON c.PatternID = pt.PatternID
JOIN size s ON c.SizeID = s.SizeID
JOIN color ON c.ColorID = color.ColorID
JOIN type t ON c.TypeID = t.TypeID;

SELECT * FROM product_details;
