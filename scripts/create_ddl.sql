CREATE TABLE position (
  positionID SERIAL PRIMARY KEY,
  PositionName VARCHAR(20)
);

CREATE TABLE "user" (
  UserID SERIAL PRIMARY KEY,
  UserName VARCHAR(20),
  password VARCHAR(30),
  user_authorization VARCHAR(30),
  personnelID SERIAL
);

CREATE TABLE personnel (
  PersonnelID SERIAL PRIMARY KEY,
  PersonnelName VARCHAR(20),
  PersonnelSurname VARCHAR(20),
  PersonnelPhoneNum BIGINT,
  PersonnelAddress VARCHAR(200),
  EntryDate DATE,
  Salary INT,
  DepartmentID SERIAL,
  PositionID serial REFERENCES position(PositionID),
  StoreID SERIAL
);

CREATE TABLE department (
  DepartmentID SERIAL PRIMARY KEY,
  DepartmentName VARCHAR(20)
);

CREATE TABLE store (
  StoreID SERIAL PRIMARY KEY,
  BranchName VARCHAR(30),
  StorePhoneNumber BIGINT,
  StoreAddress VARCHAR(200),
  City VARCHAR(20),
  DepartmentID SERIAL REFERENCES department(DepartmentID)
);

CREATE TABLE stock (
  StockID SERIAL PRIMARY KEY,
  StockNumber INT,
  ProductID SERIAL,
  StoreID SERIAL REFERENCES store(StoreID)
);

-- Second line

CREATE TABLE customer (
    CustomerId SERIAL PRIMARY KEY,
    CustomerName VARCHAR(30),
    CustomerSurname VARCHAR(30),
    CustomerPhoneNum VARCHAR(15)
);

CREATE TABLE sales (
    SalesID SERIAL PRIMARY KEY,
    SalesNumber INT,
    SalesDate DATE,
    ProductID SERIAL,
    StoreID SERIAL,
    PersonnelID SERIAL,
    CustomerID SERIAL,
    FOREIGN KEY (StoreID) REFERENCES store (StoreID),
    FOREIGN KEY (PersonnelID) REFERENCES personnel (PersonnelID),
    FOREIGN KEY (CustomerID) REFERENCES customer (CustomerID)
);

CREATE TABLE BILL (
    BillID SERIAL PRIMARY KEY,
   	SalesID SERIAL,
    FOREIGN KEY (SalesID) REFERENCES sales (SalesID)
);

CREATE TABLE product (
    ProductID SERIAL PRIMARY KEY,
    ProductName VARCHAR(20),
    ProductPrice INT,
    CategoryID SERIAL,
    Barcode INT,
    CustomerID SERIAL,
    FOREIGN KEY (CustomerID) REFERENCES customer (CustomerID)
);

CREATE TABLE exchange (
    ExchangeID SERIAL PRIMARY KEY,
    ExchangeNumber INT,
    ExchangeDate DATE,
    ExchangeExplanation VARCHAR(20),
    ProductID SERIAL,
	  CustomerID SERIAL,
    FOREIGN KEY (ProductID) REFERENCES product (ProductID),
	FOREIGN KEY (CustomerID) REFERENCES customer (CustomerID)
);

CREATE TABLE return (
    ReturnID SERIAL PRIMARY KEY,
    ReturnNumber INT,
    ReturnDate DATE,
    ReturnExplanation VARCHAR(255),
    ProductID SERIAL,
    CustomerID SERIAl,
    FOREIGN KEY (ProductID) REFERENCES product (ProductID),
    FOREIGN KEY (CustomerID) REFERENCES customer (CustomerID)
);

-- Third Line
CREATE TABLE Brand (
  BrandID serial PRIMARY KEY,
  BrandName varchar(20) NOT NULL
);

CREATE TABLE CategoryName (
  CategoryNameID serial PRIMARY KEY,
  CategoryName varchar(20) NOT NULL
);

CREATE TABLE Size (
  SizeID serial PRIMARY KEY,
  SizeName varchar(20) NOT NULL
);

CREATE TABLE Pattern (
  PatternID serial PRIMARY KEY,
  PatternName varchar(20) NOT NULL
);

CREATE TABLE Color (
  ColorID serial PRIMARY KEY,
  ColorCode varchar(20) NOT NULL
);

CREATE TABLE Type (
  TypeID serial PRIMARY KEY,
  TypeName varchar(20) NOT NULL
);

CREATE TABLE category (
  CategoryID serial PRIMARY KEY,
  CategoryNameID SERIAL REFERENCES categoryName(CategoryNameID),
  SizeID SERIAL REFERENCES size(SizeID),
  BrandID SERIAL REFERENCES brand(BrandID),
  PatternID SERIAL REFERENCES pattern(PatternID),
  ColorID SERIAL REFERENCES color(ColorID),
  TypeID SERIAL REFERENCES type(TypeID)
);
