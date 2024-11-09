USE master
GO
-- Create the new database if it does not exist already
IF NOT EXISTS (
    SELECT [name]
        FROM sys.databases
        WHERE [name] = N'Candidates'
)
CREATE DATABASE Candidates
GO

USE Candidates
GO

CREATE TABLE [dbo].[Department](
	[Department_ID] INT PRIMARY KEY,
	[Department_Name] VARCHAR(30)
)
GO
	
CREATE TABLE [dbo].[Employee](
	[Emp_ID] INT PRIMARY KEY,
	[Emp_FirstName] VARCHAR(30),
	[Emp_LastName] VARCHAR(30),
	[Emp_Birthday] DATE,
	[Emp_City] VARCHAR(30),
	[Emp_HireDate] DATE,
	[Emp_Salary] DECIMAL(10,2),
    	[Emp_Email] VARCHAR(255) UNIQUE,
	[Department_ID] INT FOREIGN KEY REFERENCES Department([Department_ID])
) 
GO

CREATE TABLE [dbo].[Skill](
	[Skill_ID] INT PRIMARY KEY,
	[Skill_Name] VARCHAR(30) UNIQUE
)
GO

CREATE TABLE [dbo].[Emp_Skill](
	[Emp_ID] INT FOREIGN KEY REFERENCES Employee([Emp_ID]),
	[Skill_ID] INT FOREIGN KEY REFERENCES Skill([Skill_ID]),
	[Skill_Level] VARCHAR(20),
	PRIMARY KEY([Emp_ID], [Skill_ID])
)
GO

INSERT INTO Department ([Department_ID], [Department_Name])VALUES
(1, 'Developer AI'),
(2, 'Developer Web'),
(3, 'Developer Tool'),
(4, 'Data Engineer'),
(5, 'Tech Leader'),
(6, 'Human Resources'),
(7, 'Marketing')
GO
SELECT * FROM Department
GO

INSERT INTO Employee ([Emp_ID], [Emp_FirstName], [Emp_LastName], [Emp_Email], [Emp_Birthday], [Emp_HireDate], [Emp_Salary], [Emp_City], [Department_ID])
VALUES
(1, 'John', 'Doe', 'john.doe@example.com','1980-12-25', '2010-01-07',35000000,'Berlin', 2),
(2, 'Jane', 'Smith', 'jane.smith@example.com','1993-09-07', '2016-11-08',21000000, 'London', 3),
(3, 'Alice', 'Johnson', 'alice.johnson@example.com','1998-08-20', '2022-11-08',18000000, 'San Francisco', 4),
(4, 'Howell', 'Ervin', 'howell.ervin@example.com','1998-05-25', '2024-05-04',5000000, 'San Francisco', 1),
(5, 'Reichert', 'Glenna', 'reichert.glenna@example.com','1994-09-16', '2024-02-1',5000000, 'London', 5),
(6, 'Amelie', 'Giacoppoli', 'agiacoppoli9@wp.com','1997-11-02', '2023-03-18',15000000, 'Madrid', 6),
(7, 'Richardo', 'Kingzett', 'rkingzett5@dailymotion.com','1996-01-06', '2023-06-09',15000000, 'Torino', 6),
(8, 'Hayden', 'Gillum', 'hgillum2@google.co.jp','1995-04-04', '2020-09-15',19500000, 'London', 7)
GO
SELECT * FROM Employee
GO

INSERT INTO Skill ([Skill_ID], [Skill_Name]) VALUES
(1, 'JavaScript'),
(2, 'Python'),
(3, 'Project Management'),
(4, 'SQL'),
(5, 'Java'),
(6, 'Recruitment skills'),
(7, 'Communication skills'),
(8, 'Customer psychology'),
(9, 'Sensitive to the market')
GO
SELECT * FROM Skill
GO

INSERT INTO Emp_Skill ([Emp_ID], [Skill_ID], [Skill_Level])
VALUES
(1, 1, 'Expert'),
(1, 4, 'Intermediate'),
(2, 2, 'Beginner'),
(2, 3, 'Expert'),
(3, 1, 'Intermediate'),
(3, 2, 'Expert'),
(3, 4, 'Advanced'),
(4, 1, 'Advanced'),
(4, 2, 'Advanced'),
(5, 3, 'Beginner'),
(6, 6, 'Intermediate'),
(6, 7, 'Intermediate'),
(7, 6, 'Intermediate'),
(8, 8, 'Advanced'),
(8, 9, 'Expert');
GO
SELECT * FROM Emp_Skill
GO
