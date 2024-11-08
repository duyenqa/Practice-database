-- Create a new database called 'Saledb'
-- Connect to the 'master' database to run this snippet
USE master
GO
-- Create the new database if it does not exist already
IF NOT EXISTS (
    SELECT [name]
        FROM sys.databases
        WHERE [name] = N'Saledb'
)
CREATE DATABASE Saledb
GO

-- Create a new table called '[Customer]' in schema '[dbo]'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[Customer]', 'U') IS NOT NULL
DROP TABLE [dbo].[Customer]
GO
-- Create the table in the specified schema
CREATE TABLE [dbo].[Customer]
(
    [Customer_ID] INT PRIMARY KEY,
    [Name] VARCHAR(100),
    [Birthdate] DATE,
    [Address] VARCHAR(255)
)
GO

-- Create a new table called '[Product]' in schema '[dbo]'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[Product]', 'U') IS NOT NULL
DROP TABLE [dbo].[Product]
GO
-- Create the table in the specified schema
CREATE TABLE [dbo].[Product]
(
    [Product_ID] INT PRIMARY KEY, -- Primary Key column
    [Product_Name] VARCHAR(100),
    [Price_Unit] Decimal(10,2)
)
GO

-- Create a new table called '[Transaction]' in schema '[dbo]'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[Transaction]', 'U') IS NOT NULL
DROP TABLE [dbo].[Transaction]
GO
-- Create the table in the specified schema
CREATE TABLE [dbo].[Transaction]
(
    [Transaction_ID] INT PRIMARY KEY, 
    [Date] DATE,
    [Customer_ID] INT FOREIGN KEY REFERENCES Customer([Customer_ID]),
    [Product_ID] INT FOREIGN KEY REFERENCES Product([Product_ID]),
    [Quantity] INT,
    [Price_Unit] Decimal(10,2),
    [Total_Amount] Decimal(10,2)
)
GO

INSERT INTO Customer ([Customer_ID], [Name], [Birthdate], [Address]) VALUES
(1, 'Alice Johnson', '1990-04-12', '123 Maple St'),
(2, 'Bob Smith', '1985-07-20', '456 Oak Ave'),
(3, 'Cathy Brown', '1978-02-28', '789 Pine Rd')
GO
SELECT * FROM Customer
GO
INSERT INTO Product ([Product_ID], [Product_Name], [Price_Unit]) VALUES
(1, 'Laptop', 999.99),
(2, 'Smartphone', 499.99),
(3, 'Headphones', 79.99)
GO
SELECT * FROM Product
GO

INSERT INTO [dbo].[Transaction]
( [Transaction_ID],[Date],[Customer_ID],[Product_ID], [Quantity], [Price_Unit],[Total_Amount])
VALUES
 (1, '2023-10-01', 1, 1, 1, 999.99, 999.99),
 (2, '2023-10-02', 1, 2, 2, 499.99, 999.98),
 (3, '2023-10-03', 2, 3, 1, 79.99, 79.99),
 (4, '2023-10-04', 3, 1, 1, 999.99, 999.99),
 (5, '2023-10-05', 2, 2, 1, 499.99, 499.99)
GO
SELECT * FROM dbo.[Transaction]
GO
