
--User send you a list of items that they have vai excel sheet and they want to know what are the names of each product
--Answer:  Use a Excel vlookup
--use VLOOKUP to look up a value you want to find in an Excel list or table. 
--Using VLOOKUP is similar to looking up a person's name in a telephone book to get a telephone number. 
--VLOOKUP looks at a value in one column, and finds its corresponding value on the same row in another column


SELECT distinct 
[OrderQty]
,[ProductID]
,[UnitPrice]
FROM [AdventureWorks2014].[Sales].[SalesOrderDetail]
order by [ProductID]

--Step 1:  write a query that find the productid and its description

SELECT [ProductID]
,[Name]
FROM [AdventureWorks2014].[Production].[Product]
order by productid


--step 2:  copy paste the result set to excel sheet