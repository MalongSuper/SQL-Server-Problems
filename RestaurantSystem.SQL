{\rtf1\ansi\ansicpg1252\cocoartf2821
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\margl1440\margr1440\vieww11520\viewh8400\viewkind0
\pard\tx566\tx1133\tx1700\tx2267\tx2834\tx3401\tx3968\tx4535\tx5102\tx5669\tx6236\tx6803\pardirnatural\partightenfactor0

\f0\fs24 \cf0 -- INIT database\
CREATE TABLE Employees (\
  EmployeeID INT IDENTITY(100, 1) PRIMARY KEY,\
  Name VARCHAR(50) NOT NULL,\
  Account VARCHAR(50) NOT NULL,\
  Password VARBINARY(64) NOT NULL\
);\
\
CREATE TABLE Dishes (\
  DishesID INT IDENTITY(200, 1) PRIMARY KEY,\
  Name VARCHAR(50) NOT NULL,\
  Price DECIMAL(10, 2) NOT NULL\
);\
\
CREATE TABLE OrderTicket (\
  OrderID INT IDENTITY(300, 1) PRIMARY KEY,\
  DateofOrder DATE NOT NULL DEFAULT GETDATE(),\
  SeatNumber INT NOT NULL,\
  Server INT NOT NULL,\
  DishOrdered INT NOT NULL,\
  Quantity INT NOT NULL,\
  FOREIGN KEY (Server) REFERENCES Employees(EmployeeID),\
  FOREIGN KEY (DishOrdered) REFERENCES Dishes(DishesID)\
);\
\
-- Employee Table\
INSERT INTO Employees(Name, Account, Password) VALUES ('Employee A', 'Adam', HASHBYTES('SHA2_256', '123456'));\
INSERT INTO Employees(Name, Account, Password) VALUES ('Employee B', 'Ben', HASHBYTES('SHA2_256', '123321'));\
INSERT INTO Employees(Name, Account, Password) VALUES ('Employee C', 'Cindy', HASHBYTES('SHA2_256', '123241'));\
INSERT INTO Employees(Name, Account, Password) VALUES ('Employee D', 'Dean', HASHBYTES('SHA2_256', '123921'));\
INSERT INTO Employees(Name, Account, Password) VALUES ('Employee E', 'Elly', HASHBYTES('SHA2_256', '128881'));\
\
-- Dishes Table\
INSERT INTO Dishes(Name, Price) VALUES ('Fish and Chip', '12.99');\
INSERT INTO Dishes(Name, Price) VALUES ('Soup', '8.99');\
INSERT INTO Dishes(Name, Price) VALUES ('Hamburger', '15.99');\
INSERT INTO Dishes(Name, Price) VALUES ('Beef', '24.99');\
\
-- Order Ticket Table\
INSERT INTO OrderTicket(SeatNumber, Server, DishOrdered, Quantity) VALUES (1, 101, 202, 2);\
INSERT INTO OrderTicket(SeatNumber, Server, DishOrdered, Quantity) VALUES (2, 103, 203, 2);\
INSERT INTO OrderTicket(SeatNumber, Server, DishOrdered, Quantity) VALUES (4, 104, 200, 2);\
\
-- QUERY database: Employees Table, Dishes Table\
SELECT * FROM Employees \
SELECT * FROM Dishes\
-- QUERY: Order Ticket\
-- Convert the number to employee name and dish name from Order Tickets\
-- Using "JOIN"\
SELECT\
	SeatNumber,\
    e.Name AS Server, \
    d.Name AS DishOrdered,\
    Quantity\
FROM OrderTicket ot\
JOIN Employees e ON ot.Server = e.EmployeeID\
JOIN Dishes d ON ot.DishOrdered = d.DishesID;}