
--good practice to have the sproc identified regarding the author, date and its purpose

/******************************************************************************************************
Author: Raf Asghar

Date: 01/13/17

Purpose: the following exmaple will demonstrate the use of Begin and End keywords and use of multiple sql statements

BEGIN and END are control-of-flow language keywords 
used to encloses a series of Transact-SQL statements


*******************************************************************************************************/


Create procedure usp_BlockStatements
as


BEGIN

	SELECT * FROM [HumanResources].[Department] --<< note the indentation of sql statement for clarity

END 


BEGIN

	SELECT * FROM [HumanResources].[Employee]

END 

--this is a comment

execute usp_BlockStatements

drop procedure usp_BlockStatements
