# Databases-Project

This is the repository of MIPT2025 Databases project.

- The database is for Online Shopping Website automation system.
- It contains 19 different tables


## Conceptual Model
![image](https://user-images.githubusercontent.com/49760167/232552177-7e0d2ca6-3b92-479d-804b-5219eb089d72.png)


## Logical Model
![image](https://github.com/Ozzey/Databases-Project/blob/dev/docs/ERD.png)


## Physical Model (Description)

### Table 1: bill
| Column Name | Description | Data Type |
| --- | --- | --- |
| BillID | Unique identifier for each bill | int(11) |
| SalesID | Unique identifier for each sales transaction related to the bill | int(11) |


### Table 2: category
| Column Name | Description | Data Type |
| --- | --- | --- |
| CategoryID | Unique identifier for each category | int(20) |
| CategoryNameID | Unique identifier for each category name | int(11) |
| SizeID | Unique identifier for each size | int(11) |
| BrandID | Unique identifier for each brand | int(11) |
| PatternID | Unique identifier for each pattern | int(11) |
| ColorID | Unique identifier for each color | int(11) |
| TypeID | Unique identifier for each type | int(11) |


### Table 3: categoryname
| Column Name | Description | Data Type |
| --- | --- | --- |
| CategoryNameID | Unique identifier for each category name | int(11) |
| CategoryNames | The actual name of the category | varchar(20) |

### Table 4: color
| Column Name | Description | Data Type |
| --- | --- | --- |
| ColorID | Unique identifier for each color | int(11) |
| ColorCode | The code for the color | varchar(20) |


### Table 5: customer
| Column Name | Description | Data Type |
| --- | --- | --- |
| CustomerID | Unique identifier for each customer | int(11) |
| CustomerName | The first name of the customer | varchar(20) |
| CustomerSurname | The last name of the customer | varchar(20) |
| CustomerPhoneNum | The phone number of the customer | int(15) |


### Table 6: department
| Column Name | Description | Data Type |
| --- | --- | --- |
| DepartmentID | Unique identifier for each department | int(11) |
| DepartmentName | The name of the department | varchar(50) |


### Table 7: exchange
| Column Name | Description | Data Type |
| --- | --- | --- |
| ExchangeID | Unique identifier for each exchange transaction | int(11) |
| ExchangeNumber | Unique identifier for each exchange | int(20) |
| ExchangeDate | The date of the exchange | date |
| ExchangeExplanation | An explanation of the exchange | varchar(300) |
| ProductID | Unique identifier for each product related to the exchange | int(11) |
| CustomerID | Unique identifier for the customer related to the exchange | int(11) |


### Table 8: pattern
| Column Name | Description | Data Type |
| --- | --- | --- |
| PatternID | Unique identifier for each pattern | int(11) |
| PatternName | The name of the pattern | varchar(20) |

### Table 9: personnel
| Column      | Description                             | Data Type |
|-------------|-----------------------------------------|-----------|
| PersonnelID | Unique identifier for each personnel    | int       |
| PersonnelName | Name of the personnel                  | varchar(20) |
| PersonnelSurname | Surname of the personnel            | varchar(20) |
| PersonnelPhoneNum | Phone number of the personnel        | int(15)   |
| PersonnelAddress | Address of the personnel              | varchar(200) |
| EntryDate   | Date the personnel started working     | date      |
| Salary      | Salary of the personnel                | int(20)   |
| DepartmentID | Identifier for the department the personnel belongs to | int(11)   |
| ID  | Identifier for the position the personnel holds | int(11)   |
| StoreID     | Identifier for the store the personnel works at | int(11)   |

### Table 10: position
| Column     | Description                          | Data Type |
|------------|--------------------------------------|-----------|
| PositionID | Unique identifier for each position  | int       |
| PositionName | Name of the position               | varchar(20) |

### Table 11: product
| Column      | Description                             | Data Type |
|-------------|-----------------------------------------|-----------|
| ProductID   | Unique identifier for each product      | int       |
| ProductName | Name of the product                      | varchar(20) |
| ProductPrice | Price of the product                   | int(20)   |
| CategoryID  | Identifier for the category the product belongs to | int(11)   |
| Barcode     | Barcode number for the product           | int(20)   |

### Table 12: returnn
| Column             | Description                              | Data Type |
|--------------------|------------------------------------------|-----------|
| ReturnID           | Unique identifier for each return        | int       |
| ReturnNumber       | Unique identifier for each return number | int(20)   |
| ReturnDate         | Date the return was made                  | date      |
| ReturnExplanation  | Explanation for the return               | varchar(300) |
| ProductID          | Identifier for the product being returned | int(11)   |
| CustomerID         | Identifier for the customer making the return |


### Table 13: sales

| Column Name | Description | Data Type |
|-------------|-------------|-----------|
| SalesID     | Unique ID for each sales transaction | int(11)   |
| SalesNumber | Sales number for each transaction | int(20)   |
| SalesDate   | Date of the sales transaction | varchar(30) |
| ProductID   | ID of the product sold | int(11)   |
| StoreID     | ID of the store where the product was sold | int(11)   |
| PersonnelID | ID of the personnel who made the sale | int(11)   |

### Table 14: size

| Column Name | Description | Data Type |
|-------------|-------------|-----------|
| SizeID      | Unique ID for each size | int(11)   |
| SizeName    | Name of the size | varchar(20) |

### Table 15: stock

| Column Name | Description | Data Type |
|-------------|-------------|-----------|
| StockID     | Unique ID for each stock item | int(11)   |
| StockNumber | Stock number for each stock item | int(20)   |
| ProductID   | ID of the product in stock | int(11)   |
| StoreID     | ID of the store where the product is in stock | int(11)   |

### Table 16: store

| Column Name    | Description | Data Type |
|----------------|-------------|-----------|
| StoreID        | Unique ID for each store | int(11)   |
| BranchName     | Name of the store branch | varchar(30) |
| StorePhoneNumber | Phone number of the store | int(15)   |
| StoreAddress   | Address of the store | varchar(200) |
| City           | City where the store is located | varchar(20) |
| DepartmentID   | ID of the department to which the store belongs | int(11)   |

### Table 17: type

| Column Name | Description | Data Type |
|-------------|-------------|-----------|
| TypeID      | Unique ID for each type | int(11)   |
| TypeName    | Name of the type | varchar(20) |

### Table 18: user

| Column Name | Description | Data Type |
|-------------|-------------|-----------|
| UserID      | Unique ID for each user | int(11)   |
| UserName    | Username of the user | varchar(20) |
| Password    | Password of the user | varchar(20) |
| Authorization | Authorization of the user | varchar(20) |
| PersonnelID | ID of the personnel associated with the user | int(11)   |

### Table 19: brand
| Column Name | Description | Data Type |
| --- | --- | --- |
| BrandID | Unique identifier for each brand | int(11) |
| BrandName | The name of the brand | varchar(20) |

*******************************************************

### Task 12: Analysis
Analysis.py contains code for generating following graphs:
1. The top 10 most expensive products
2. Heatmap of sales by month and store location

Graph:
![image](https://github.com/Ozzey/Databases-Project/blob/dev/docs/Figure_1.png)
