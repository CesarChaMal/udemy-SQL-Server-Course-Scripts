/****** Script for SelectTopNRows command from SSMS  ******/
SELECT [ProductDescriptionID]
,[Description]
FROM [AdventureWorks2016CTP3].[Production].[ProductDescription]
where [ProductDescriptionID] <= 1216 


/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP 1000 [Term]
      ,[Score]
  FROM [SSISProjects].[dbo].[term]
