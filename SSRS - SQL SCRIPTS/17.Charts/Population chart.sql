
--View data: notice we don't have a ContinentID column.  Thus, the following will add an ID field

SELECT *
FROM [World].[dbo].[continents]


ALTER TABLE continents 
ADD Continentid INT IDENTITY(1,1) 
GO 