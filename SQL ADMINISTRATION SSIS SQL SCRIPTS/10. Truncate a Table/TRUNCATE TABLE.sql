/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP 1000 [DepartmentID]
      ,[Name]
      ,[GroupName]
      ,[ModifiedDate]
  FROM [HR].[dbo].[DEPT]

--TRUNCATE TABLE [HR].[dbo].[DEPT]
