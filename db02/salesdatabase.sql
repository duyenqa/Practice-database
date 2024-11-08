USE master
GO
-- Create the new database if it does not exist already
IF NOT EXISTS (
    SELECT [name]
        FROM sys.databases
        WHERE [name] = N'Salesdb'
)
CREATE DATABASE Salesdb
GO

USE Salesdb
GO

IF OBJECT_ID('[dbo].[Customer]', 'U') IS NOT NULL
DROP TABLE [dbo].[Customer]
GO

CREATE TABLE [dbo].[Customer]
(
    [Customer_ID] INT PRIMARY KEY,
    [Name] VARCHAR(100),
    [Birthdate] DATE,
    [Address] VARCHAR(255)
)
GO

IF OBJECT_ID('[dbo].[Product]', 'U') IS NOT NULL
DROP TABLE [dbo].[Product]
GO

CREATE TABLE [dbo].[Product]
(
    [Product_ID] INT PRIMARY KEY,
    [Product_Name] VARCHAR(100),
    [Price_Unit] Decimal(10,2)
)
GO

IF OBJECT_ID('[dbo].[Payments]', 'U') IS NOT NULL
DROP TABLE [dbo].[Payments]
GO

CREATE TABLE [dbo].[Payments]
(
    [Customer_ID] INT FOREIGN KEY REFERENCES Customer([Customer_ID]),
    [Product_ID] INT FOREIGN KEY REFERENCES Product([Product_ID]),
    [PaymentDate] DATE,
    [Amount] DECIMAL(10,2),
    PRIMARY KEY([Customer_ID], [Product_ID], [PaymentDate])
)
GO

INSERT INTO Customer (Customer_ID, Name, Birthdate, Address) VALUES
(1, 'Alice Johnson', '1990-04-12', '123 Maple St'),
(2, 'Bob Smith', '1985-07-20', '456 Oak Ave'),
(3, 'Cathy Brown', '1978-02-28', '789 Pine Rd')
GO
SELECT * FROM Customer
GO

INSERT INTO Product (Product_ID, Product_Name, Price_Unit) VALUES
(1, 'Laptop', 999.99),
(2, 'Smartphone', 499.99),
(3, 'Headphones', 79.99)
GO
SELECT * FROM Product
GO

INSERT INTO Payments (Customer_ID, Product_ID, PaymentDate, Amount) VALUES
(1, 1, '2023-10-01', 999.99),
(1, 2, '2023-10-02', 499.99),
(2, 3, '2023-10-03', 79.99),
(3, 1, '2023-10-04', 999.99),
(2, 2, '2023-10-05', 499.99)
GO
SELECT * FROM Payments
GO
