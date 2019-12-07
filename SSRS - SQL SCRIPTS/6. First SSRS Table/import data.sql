--create database for table for SSRS and import data from Excel to SQL server

--Create Database World
--Go

select * from WorldAndCapitals
order by name


--select only the data needed for the report.

SELECT 
[Name],
[Capital city]
FROM [World].[dbo].[WorldAndCapitals]