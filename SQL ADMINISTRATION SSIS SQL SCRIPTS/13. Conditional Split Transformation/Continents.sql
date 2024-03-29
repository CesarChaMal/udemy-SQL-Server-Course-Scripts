
--suppose you want to split the data based on continent;  how do you do that?  You can write SQL scripts to do that, 
--or you can use a conditional split task, so as this table is populated with new data, the SSIS package seperates the
--data based on a job.

SELECT  [Continent]
,[Country]
,[Capital]
,[Population]
,[Total area]
,[Continentid]
FROM [World].[dbo].[Continents]
order by Capital

use world
go

select distinct Continent 
from Continents