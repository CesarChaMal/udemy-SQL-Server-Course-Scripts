
--Creating a simple stored procedure

CREATE PROCEDURE usp_HR_Department
AS
SELECT * FROM [HumanResources].[Department]

--execute sproc

EXECUTE usp_HR_Department

--Trying to modify an existing sproc

CREATE PROCEDURE usp_HR_Department
AS
SELECT * FROM [HumanResources].[Department]
WHERE Name = 'Engineering'


-- modify the sproc, use keyword ALTER


ALTER PROCEDURE [dbo].[usp_HR_Department]
AS
SELECT * FROM [HumanResources].[Department]
WHERE Name = 'Engineering'

--execute sproc

EXECUTE usp_HR_Department  --<< should only get one row


--to drop the sproc, use the key word DROP

DROP PROCEDURE [dbo].[usp_HR_Department]
GO
