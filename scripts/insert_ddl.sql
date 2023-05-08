INSERT INTO position (PositionName)
VALUES ('Manager'), ('Salesperson'), ('Cashier'), ('Stock Clerk'), ('Assistant Manager'),
('Store Manager'), ('Department Manager'), ('Supervisor'), ('Security'), ('Janitor');


INSERT INTO department (DepartmentName)
VALUES
('Sales'),
('Marketing'),
('Finance'),
('Human Resources'),
('IT'),
('Operations'),
('Production'),
('R&D'),
('Customer Service'),
('Legal');


INSERT INTO store (BranchName, StorePhoneNumber, StoreAddress, City, DepartmentID)
VALUES
('Main Street', 1234567890, '123 Main St', 'New York', 1),
('Elm Street', 2345678901, '456 Elm St', 'Los Angeles', 2),
('Oak Street', 3456789012, '789 Oak St', 'Chicago', 3),
('Pine Street', 4567890123, '321 Pine St', 'Houston', 4),
('Maple Street', 5678901234, '654 Maple St', 'Philadelphia', 5),
('Broadway', 6789012345, '246 Broadway', 'Phoenix', 6),
('Market Street', 7890123456, '135 Market St', 'San Antonio', 7),
('State Street', 8901234567, '246 State St', 'San Diego', 8),
('Park Avenue', 9012345678, '789 Park Ave', 'Dallas', 9),
('University Avenue', 1234567890, '246 University Ave', 'San Francisco', 10);


INSERT INTO personnel (PersonnelName, PersonnelSurname, PersonnelPhoneNum, PersonnelAddress, EntryDate, Salary, DepartmentID, PositionID, StoreID)
VALUES
('Sarah', 'Johnson', 5551234567, '567 Main St', '2020-01-01', 60000, 1, 1, 1),
('David', 'Brown', 5559876543, '789 Elm St', '2020-02-01', 55000, 2, 2, 2),
('Emily', 'Garcia', 5555551212, '123 Oak St', '2020-03-01', 50000, 3, 3, 1),
('Michael', 'Davis', 5554443333, '456 Pine St', '2020-04-01', 45000, 4, 4, 2),
('Jessica', 'Lee', 5551112222, '789 Maple St', '2020-05-01', 40000, 5, 5, 1),
('Kevin', 'Miller', 5552223333, '321 Oak St', '2020-06-01', 35000, 1, 6, 2),
('Amy', 'Taylor', 5553334444, '654 Pine St', '2020-07-01', 30000, 2, 7, 1),
('Steven', 'Wilson', 5556667777, '987 Maple St', '2020-08-01', 25000, 3, 8, 2),
('Melissa', 'Anderson', 5557778888, '246 Elm St', '2020-09-01', 20000, 4, 9, 1),
('Andrew', 'Martin', 5558889999, '135 Main St', '2020-10-01', 15000, 5, 10, 2);


INSERT INTO "user" (UserName, password, user_authorization, personnelID)
VALUES
('johndoe', 'password', 'admin', 1),
('janesmith', 'password', 'regular', 2),
('bobjohnson', 'password', 'regular', 3),
('alicelee', 'password', 'regular', 4),
('tomwilson', 'password', 'regular', 5),
('sarahjohnson', 'password', 'regular', 6),
('davidbrown', 'password', 'regular', 7),
('emilygarcia', 'password', 'regular', 8),
('michaeldavis', 'password', 'regular', 9),
('jessicalee', 'password', 'regular', 10);


-- third line: CategoryName Brand Pattern Size Color Type Category

-- Insert 10 rows into the Brand table
INSERT INTO Brand (BrandName) VALUES
('Brand 1'),
('Brand 2'),
('Brand 3'),
('Brand 4'),
('Brand 5'),
('Brand 6'),
('Brand 7'),
('Brand 8'),
('Brand 9'),
('Brand 10');

-- Insert 10 rows into the CategoryName table
INSERT INTO CategoryName (CategoryName) VALUES
('Category 1'),
('Category 2'),
('Category 3'),
('Category 4'),
('Category 5'),
('Category 6'),
('Category 7'),
('Category 8'),
('Category 9'),
('Category 10');

-- Insert 10 rows into the Size table
INSERT INTO Size (SizeName) VALUES
('Size 1'),
('Size 2'),
('Size 3'),
('Size 4'),
('Size 5'),
('Size 6'),
('Size 7'),
('Size 8'),
('Size 9'),
('Size 10');

-- Insert 10 rows into the Pattern table
INSERT INTO Pattern (PatternName) VALUES
('Pattern 1'),
('Pattern 2'),
('Pattern 3'),
('Pattern 4'),
('Pattern 5'),
('Pattern 6'),
('Pattern 7'),
('Pattern 8'),
('Pattern 9'),
('Pattern 10');

-- Insert 10 rows into the Color table
INSERT INTO Color (ColorCode) VALUES
('Red'),
('Green'),
('Blue'),
('Yellow'),
('Orange'),
('Purple'),
('Pink'),
('Black'),
('White'),
('Gray');

-- Insert 10 rows into the Type table
INSERT INTO Type (TypeName) VALUES
('Type 1'),
('Type 2'),
('Type 3'),
('Type 4'),
('Type 5'),
('Type 6'),
('Type 7'),
('Type 8'),
('Type 9'),
('Type 10');


INSERT INTO category (CategoryNameID, SizeID, BrandID, PatternID, ColorID, TypeID) VALUES
(1, 1, 1, 1, 1, 1),
(2, 2, 2, 2, 2, 2),
(3, 3, 3, 3, 3, 3),
(4, 4, 4, 4, 4, 4),
(5, 5, 5, 5, 5, 5),
(6, 6, 6, 6, 6, 6),
(7, 7, 7, 7, 7, 7),
(8, 8, 8, 8, 8, 8),
(9, 9, 9, 9, 9, 9),
(10, 10, 10, 10, 10, 10);


-- second Line: customer product exchange return sales bill

INSERT INTO customer (CustomerName, CustomerSurname, CustomerPhoneNum) VALUES
('John', 'Doe', '555-1234'),
('Jane', 'Doe', '555-5678'),
('Alice', 'Smith', '555-2468'),
('Bob', 'Johnson', '555-3690'),
('Charlie', 'Brown', '555-9876'),
('David', 'Lee', '555-5555'),
('Emily', 'Nguyen', '555-1111'),
('Frank', 'Garcia', '555-2222'),
('Grace', 'Chen', '555-3333'),
('Henry', 'Kim', '555-4444');

INSERT INTO product (ProductName, ProductPrice, CategoryID, Barcode, CustomerID) VALUES
('Product 1', 1000, 1, 32767, 1),
('Product 2', 2000, 2, 32766, 2),
('Product 3', 3000, 3, 32765, 3),
('Product 4', 4000, 4, 32764, 4),
('Product 5', 5000, 5, 32763, 5),
('Product 6', 6000, 6, 32762, 6),
('Product 7', 7000, 7, 32761, 7),
('Product 8', 8000, 8, 32760, 8),
('Product 9', 9000, 9, 32759, 9),
('Product 10', 10000, 10, 32758, 10);

INSERT INTO exchange (ExchangeNumber, ExchangeDate, ExchangeExplanation, ProductID, CustomerID) VALUES
(123, '2023-05-08', 'defective product', 1, 1),
(124, '2023-05-09', 'wrong size', 2, 2),
(125, '2023-05-10', 'different color', 3, 3),
(126, '2023-05-11', 'damaged packaging', 4, 4),
(127, '2023-05-12', 'wrong item', 5, 5),
(128, '2023-05-13', 'Exchange for gift', 6, 6),
(129, '2023-05-14', 'duplicate item', 7, 7),
(130, '2023-05-15', 'size issue', 8, 8),
(131, '2023-05-16', 'color issue', 9, 9),
(132, '2023-05-17', 'defective product', 10, 10);


-- stock
INSERT INTO stock (StockNumber, ProductID, StoreID)
VALUES
(100, 1, 1),
(200, 2, 2),
(300, 3, 3),
(400, 4, 4),
(500, 5, 5),
(600, 6, 6),
(700, 7, 7),
(800, 8, 8),
(900, 9, 9),
(1000, 10, 10);

-- sales
INSERT INTO sales (SalesNumber, SalesDate, ProductID, StoreID, PersonnelID, CustomerID)
VALUES
    (1, '2023-05-01', 1, 1, 1, 1),
    (2, '2023-05-02', 2, 2, 2, 2),
    (3, '2023-05-03', 3, 3, 3, 3),
    (4, '2023-05-04', 4, 4, 4, 4),
    (5, '2023-05-05', 5, 5, 5, 5),
    (6, '2023-05-06', 6, 6, 6, 6),
    (7, '2023-05-07', 7, 7, 7, 7),
    (8, '2023-05-08', 8, 8, 8, 8),
    (9, '2023-05-09', 9, 9, 9, 9),
    (10, '2023-05-10', 10, 10, 10, 10);