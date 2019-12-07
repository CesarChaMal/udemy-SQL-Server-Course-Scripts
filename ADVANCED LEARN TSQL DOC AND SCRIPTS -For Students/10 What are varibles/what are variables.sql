--Good practice to have the sproc identified regarding the author, date and its purpose

/******************************************************************************************************
Author: Raf Asghar

Date: 01/13/17

Purpose: the following will demonstrate what is a variable and how to use a variable in sprocs

--https://technet.microsoft.com/en-us/library/ms187953(v=sql.105).aspx


*******************************************************************************************************/
--what is a variable?

--A VARIABLE is an OBJECT that can hold a single data value of a SPECIFIED DATA.

--Their purpose is as follows:

--As a counter either to count the number of times a loop is performed or to control how many times the loop is performed.

--To hold a data value to be tested by a control-of-flow statement.

--When using a variable, you must do 2 things:
--1.  Declare the variable with the appropriate datatype
--2. set the variable to a value

--EXAMPLE 1

--Finding out multiplication of numbers;  you will have to change the 10 and 12 each time you wnat to multiple with another number


select 5 * 10
select 300 * 10
select 18 * 10
select 343 * 10
select 342 * 10
select 88 * 10


select 5 * 12
select 300 * 12
select 18 * 12
select 343 * 12
select 342 * 12
select 88 * 12

--using variables to change the number

DECLARE @number int  --<< Declare the variable with the appropriate datatype
SET @number = 12     --<< set the variable to a value

select 5 * @number
select 300 * @number
select 18 * @number
select 343 * @number
select 342 * @number
select 88 * @number


--EXAMPLE 2

USE AdventureWorks2014;  
GO  

SELECT  [TerritoryID]
,[Name]
,[CountryRegionCode]
,[Group]
,[SalesYTD]
,[SalesLastYear]
,[CostYTD]
,[CostLastYear]
,[rowguid]
,[ModifiedDate]
FROM [AdventureWorks2014].[Sales].[SalesTerritory]


SELECT  DISTINCT [Group]
FROM [AdventureWorks2014].[Sales].[SalesTerritory]

--Europe
--North America
--Pacific

DECLARE @GROUP varchar(30);   
SET @GROUP = 'EUR%';   

SELECT  [TerritoryID]
,[Name]
,[CountryRegionCode]
,[Group]
,[SalesYTD]
,[SalesLastYear]
,[CostYTD]
,[CostLastYear]
,[rowguid]
,[ModifiedDate]
FROM [AdventureWorks2014].[Sales].[SalesTerritory]
WHERE [Group] LIKE @GROUP;  
  

