/****** Script for SelectTopNRows command from SSMS  ******/
SELECT  [Id]
      ,[Name]
      ,[Photo]
      ,[DrivenBy]
  FROM [World].[dbo].[Cars]


  SELECT TOP 1000 [Id]
      ,[Name]
      ,[Photo]
      ,[DrivenBy]
      ,[Package name]
      ,[User name]
      ,[Execution start time]
  FROM [World].[dbo].[AuditCars]