--drop sproc

USE [SUBQUERY]
GO

DROP PROCEDURE [dbo].[usp_UpdateAllergy]
GO

USE [SUBQUERY]
GO

--drop tables

DROP TABLE [dbo].[Admission]
GO

DROP TABLE [dbo].[History]
GO

DROP TABLE [dbo].[Medication]
GO

DROP TABLE [dbo].[Surgery]
GO




--create 4 tables

--Use SUBQUERY
--go

--create table Admission
--(
--fname varchar (20),
--lname varchar (20),
--age int,
--allergy char (1)
--)


--create table Surgery
--(
--fname varchar (20),
--lname varchar (20),
--age int,
--allergy char (1)
--)

--create table Medication
--(
--fname varchar (20),
--lname varchar (20),
--age int,
--allergy char (1)
--)

--create table History
--(
--fname varchar (20),
--lname varchar (20),
--age int,
--allergy char (1)
--)

--Insert values in admission table

Insert into Admission
values ('bob','smith',45, 'Y')


select * from Admission


--Insert values in the other tables --<< using indentation and begin end blocks

--Begin

--	Insert into Surgery
--	values ('bob','smith',45, 'Y')

-- End

-- Begin

--	Insert into Medication
--	values ('bob','smith',45, 'Y')

--End

-- Begin

--	Insert into History
--	values ('bob','smith',45, 'Y')

--End


 --View data in tables
select * from Admission
select * from Surgery
select * from Medication
select * from History

--Create sproc to update all other related tables with valrible to update allergy status

--Create procedure usp_UpdateAllergy
--As

--Declare @allergy char(1);
--Set  @allergy = 'N'

--Begin

--	 update Admission
--	 set 
--	 fname = 'bob',
--	 lname = 'smith',
--	 age = 45,
--	 allergy = @allergy

-- End


--Begin

--	 update Surgery
--	 set 
--	 fname = 'bob',
--	 lname = 'smith',
--	 age = 45,
--	 allergy = @allergy

-- End

-- Begin

--	update Medication
--	set 
--	fname = 'bob',
--	lname = 'smith',
--	age = 45,
--	allergy = @allergy

--End

-- Begin

--	update History
--	set 
--	fname = 'bob',
--	lname = 'smith',
--	age = 45,
--	allergy = @allergy

--End


--View data

select * from Admission
select * from Surgery
select * from Medication
select * from History

--Execute sproc to populate all other tables

execute usp_UpdateAllergy