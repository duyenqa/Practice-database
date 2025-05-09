USE master
GO
-- Create the new database if it does not exist already
IF NOT EXISTS (
    SELECT [name]
        FROM sys.databases
        WHERE [name] = N'Ecommerce'
)
CREATE DATABASE Ecommerce
GO

USE Ecommerce
GO

IF OBJECT_ID('[dbo].[Customer]', 'U') IS NOT NULL
DROP TABLE [dbo].[Customer]
GO
CREATE TABLE [dbo].[Customer]
(
    [Customer_ID] VARCHAR(5) PRIMARY KEY,
    [Name] VARCHAR(100),
	[Email] VARCHAR(50)
)
GO

IF OBJECT_ID('[dbo].[Orders]', 'U') IS NOT NULL
DROP TABLE [dbo].[Orders]
GO
CREATE TABLE [dbo].[Orders]
(
	[Order_ID] INT PRIMARY KEY,
	[Customer_ID] VARCHAR(5) FOREIGN KEY REFERENCES Customer([Customer_ID]),
	[Order_Date] DATE,
)
GO

IF OBJECT_ID('[dbo].[Products]', 'U') IS NOT NULL
DROP TABLE [dbo].[Products]
GO
CREATE TABLE [dbo].[Products]
(
	[Product_ID] INT PRIMARY KEY,
	[Product_Name] VARCHAR(100)
)
GO

IF OBJECT_ID('[dbo].[Order_Item]', 'U') IS NOT NULL
DROP TABLE [dbo].[Order_Item]
GO
CREATE TABLE [dbo].[Order_Item]
(
	[Order_ID] INT FOREIGN KEY REFERENCES Orders([Order_ID]),
	[Product_ID] INT FOREIGN KEY REFERENCES Products([Product_ID]),
	[Quantity] INT,
	[Discount] DECIMAL(10,2),
	PRIMARY KEY([Order_ID], [Product_ID])
)
GO


INSERT INTO Customer ([Customer_ID], [Name], [Email]) VALUES
('ALFKI', 'Alice Johnson', 'alicejohnson123@gmail.com'),
('BLAUS', 'Ben', 'ben456@gmail.com'),
('CENTC', 'Ben', 'ben456@gmail.com')
GO
SELECT * FROM Customer
GO
INSERT INTO Orders ([Order_ID], [Customer_ID], [Order_Date]) VALUES
(10248, 'BLAUS', '2025-03-15'),
(10249, 'CENTC', '2025-04-22'),
(10250, 'ALFKI', '2025-05-02'),
(10251, 'CENTC', '2025-02-19'),
(10252, 'ALFKI', '2024-12-08')
GO
SELECT * FROM Orders
GO
INSERT INTO Products ([Product_ID], [Product_Name]) VALUES
(1, 'iPhone 16 Pro Max'),
(2, 'iPhone 16 Plus 128GB'),
(3, 'Samsung Galaxy A56 5G 12GB/256GB'),
(4, 'Xiaomi Redmi Note 14 8GB/128GB'),
(5, 'Vivo V50 Lite 8GB/256GB')
GO
SELECT * FROM Products
GO
INSERT INTO Order_Item ([Order_ID], [Product_ID],[Quantity], [Discount]) VALUES
(10248,2,1,0),
(10248,1,1,0),
(10249,5,1,0),
(10249,1,1,0.15),
(10249,3,1,0.15),
(10250,4,1,0.05),
(10251,3,1,0.05),
(10251,2,1,0),
(10252,1,1,0.05)
GO
SELECT * FROM Order_Item
GO