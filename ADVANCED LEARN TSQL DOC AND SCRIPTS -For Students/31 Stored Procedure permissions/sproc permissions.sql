
--sp_who
--kill 55

--USE [SUBQUERY]
--GO

--DROP TABLE [dbo].[PrivateStuff]
--GO


--Applying permission for stored procedures. One advantage of using sprocs is to micro manage permission to objects.
--Rather thatn applying permission to the database and tables, we can create a sproc and assign limited permission to sql login

--Create table

Use SUBQUERY
go

Create table PrivateStuff
(
ID int primary key identity (1,1),
Fname varchar(20),
Gender char (1),
Age int,
Salary money
)

--Insert data

Insert into PrivateStuff
values 
('tom','m',23,'5000'),
('sue','f',34,'2000'),
('matt','m',21,'3000'),
('bill','m',56,'4500'),
('wendy','f',34,'1000')

--view data

select * from PrivateStuff


--create a sql login for bob.  At this point, since he is does not have access to any user databases

USE [master]
GO

CREATE LOGIN [Bob] WITH PASSWORD=N'password', 
DEFAULT_DATABASE=[master], 
CHECK_EXPIRATION=OFF, 
CHECK_POLICY=OFF
GO

USE [SUBQUERY]
GO

CREATE USER [Bob] FOR LOGIN [Bob]
GO


--bob connects but cannot view database or any tables.  Must go to view data by having permission to execute a sproc

--drop login

USE [master]
GO

DROP LOGIN [Bob]
GO

-- Create stored procedure to limit the table and columns bob can view.

Use SUBQUERY
go

Create procedure usp_privatestuff_no_salary
as

Select ID, Fname, Gender, Age
from PrivateStuff

go
 
--multiple ways to give permission to the sproc, via GUI or TSQL

--granting execute permission to bob

use [SUBQUERY]
GO

GRANT EXECUTE ON [dbo].[usp_privatestuff_no_salary] 
TO [Bob]
GO


--use permission for bob on seperate query

Use SUBQUERY
go

exec [dbo].[usp_privatestuff_no_salary]

--revokiing permission


use [SUBQUERY]
GO
REVOKE EXECUTE ON [dbo].[usp_privatestuff_no_salary] TO [Bob] AS [dbo]
GO
