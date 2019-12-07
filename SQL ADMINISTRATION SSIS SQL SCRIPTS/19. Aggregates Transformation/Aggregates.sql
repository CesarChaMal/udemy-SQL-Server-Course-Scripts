
SELECT  
[VendorID]
,[TotalDue]
FROM [AdventureWorks2016CTP3].[Purchasing].[PurchaseOrderHeader]
order by [VendorID]


/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP 1000 [VendorID]
      ,[TotalDue]
  FROM [SSISProjects].[dbo].[Aggregate]