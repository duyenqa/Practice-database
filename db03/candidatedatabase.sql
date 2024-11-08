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

CREATE TABLE [dbo].[Employee](
	[Emp_ID] INT PRIMARY KEY,
	[Emp_FirstName] VARCHAR(30),
	[Emp_LastName] VARCHAR(30),
	[Emp_Birthday] DATE,
	[Emp_HireDate] DATE,
    [Emp_Email] VARCHAR(255) UNIQUE
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

INSERT INTO Employee ([Emp_ID], [Emp_FirstName], [Emp_LastName], [Emp_Email], [Emp_Birthday], [Emp_HireDate])
VALUES
(1, 'John', 'Doe', 'john.doe@example.com','12-25-1980', '01-07-2010'),
(2, 'Jane', 'Smith', 'jane.smith@example.com','09-07-1993', '11-08-2016'),
(3, 'Alice', 'Johnson', 'alice.johnson@example.com','08-20-1998', '11-08-2022')
GO
SELECT * FROM Employee
DELETE FROM Employee;
GO

INSERT INTO Skill ([Skill_ID], [Skill_Name])
VALUES
(1, 'JavaScript'),
(2, 'Python'),
(3, 'Project Management'),
(4, 'SQL')
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
(3, 4, 'Advanced');
GO
SELECT * FROM Emp_Skill
GO