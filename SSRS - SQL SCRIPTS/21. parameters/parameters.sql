--parameters


--dataset#1

SELECT [Continent]
,[Country]
,[Capital]
,[Population]
,[Total area]
FROM [dbo].[Continents]
--where continent = @continent

--use the following script for distinct continent dataset#2

SELECT  distinct [Continent]
FROM [World].[dbo].[Continents]
order by [Continent]