--Setting up MAIN AND SUBREPORT report

--View data: notice we don't have a ContinentID column.  Thus, the following will add an ID field

SELECT *
FROM [World].[dbo].[continents]

--make a copy of table

select * into Continents053116
from continents

--alter the existing table with adding a id key

ALTER TABLE continents 
ADD Continentid INT 
GO 


select distinct continent from continents


update continents set Continentid = 1 where Continent = 'Africa'
update continents set Continentid = 2 where Continent = 'Asia'
update continents set Continentid = 3 where Continent = 'Europe'
update continents set Continentid = 4 where Continent = 'North America'
update continents set Continentid = 5 where Continent = 'Oceania'
update continents set Continentid = 6 where Continent = 'South America'


------------------------------------------------------------------------------------

--	CREATING A SUBREPORT

--1 create a MAIN table from the script below using the template

USE [World]
GO

SELECT Distinct
[Continentid],    --<< make sure you select the ID field, as this will join the two reports
[Continent] 
FROM [dbo].[continents]


--2 create a subreport from the script below using the template

SELECT 
[Country]
,[Capital]
,[Population]
,[Total area]
,[Continentid]   --<< make sure you select the ID field, as this will join the two reports
FROM [dbo].[continents]  
where Continentid = @continentid

  --3 on the MAIN Report, go to text box of continentid, RC, and then choose Action, then Choose subreport then select the parameter