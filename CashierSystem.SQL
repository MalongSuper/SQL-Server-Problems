{\rtf1\ansi\ansicpg1252\cocoartf2821
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fmodern\fcharset0 CourierNewPS-BoldMT;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\margl1440\margr1440\vieww11520\viewh8400\viewkind0
\deftab720
\pard\pardeftab720\li360\ri0\qj\partightenfactor0

\f0\b\fs20 \cf0 -- INIT database\
CREATE TABLE Employees (\
  EmployeeID INT IDENTITY(100001, 1) PRIMARY KEY,\
  EmployeeName VARCHAR(50) NOT NULL,\
  Password VARBINARY(64) NOT NULL\
);\
\
CREATE TABLE Purchase (\
  PurchaseID VARCHAR(7) PRIMARY KEY,\
  PurchaseTime DATE NOT NULL,\
  Employee INT NOT NULL,\
  CONSTRAINT chk_PurchaseID_format CHECK(PurchaseID LIKE '[0][0-9][0-9][0-9][0-9][0-9][0-9]')\
);\
\
CREATE TABLE Product (\
  ProductID VARCHAR(7) PRIMARY KEY,\
  PurchaseID VARCHAR(7) NOT NULL,\
  ProductName VARCHAR(50) NOT NULL,\
  Price DECIMAL(10, 2) NOT NULL, \
  Quantity VARCHAR(50) NOT NULL,\
  CONSTRAINT chk_ProductID_format CHECK(ProductID LIKE '[1][0-9][0-9][0-9][0-9][0-9][0-9]')\
);\
\
-- Employee Table\
INSERT INTO Employees(EmployeeName, Password) VALUES ('Adam Joe',  HASHBYTES('SHA2_256', 'JoeA24'));\
INSERT INTO Employees(EmployeeName, Password) VALUES ('Ben Noe', HASHBYTES('SHA2_256', 'Ben124'));\
  \
-- Purchase Order\
INSERT INTO Purchase(PurchaseID, PurchaseTime, Employee) VALUES ('0182917', '2025-03-22', 100001);\
\
-- Product Table\
INSERT INTO Product(PurchaseID, ProductID, ProductName, Price, Quantity) VALUES ('0182917', '1264566', 'Pringles', 4.99, 2);\
INSERT INTO Product(PurchaseID, ProductID, ProductName, Price, Quantity) VALUES ('0182917', '1264567', 'Oreo', 2.99, 3);\
INSERT INTO Product(PurchaseID, ProductID, ProductName, Price, Quantity) VALUES ('0182917', '1264568', 'Frozen Pizza', 10.99, 1);\
INSERT INTO Product(PurchaseID, ProductID, ProductName, Price, Quantity) VALUES ('0182917', '1264569', 'Potato Snack', 1.99, 5);\
\
-- QUERY database\
SELECT * FROM Employees\
SELECT PurchaseID, PurchaseTime, e.EmployeeName AS Employee FROM Purchase pr \
JOIN Employees e ON pr.Employee = e.EmployeeID\
SELECT ProductID, ProductName, Price, Quantity, Price * Quantity AS TotalPrice FROM Product WHERE PurchaseID = '0182917'\
SELECT SUM(Price * Quantity) AS Total FROM Product WHERE PurchaseID = '0182917'\
}