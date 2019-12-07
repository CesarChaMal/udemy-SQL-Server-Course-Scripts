--find total hours by gender

WITH TotalHours --<< step 1 - write the WITH expression name followed by AS and () THEN step 2

AS

(                                

SELECT                           --<< step 2  Insert the Slect statement you want
 [LoginID]
,[JobTitle]
,[BirthDate]
,[MaritalStatus]
,[Gender]
,[VacationHours]
,[SickLeaveHours]
,Sum([VacationHours]+[SickLeaveHours]) as TotalHours  --<<concatenated total vacation and sick hours
,[ModifiedDate]
FROM [AdventureWorks2014].[HumanResources].[Employee]
Group by 
[LoginID]
,[JobTitle]
,[BirthDate]
,[MaritalStatus]
,[Gender]
,[VacationHours]
,[SickLeaveHours]
,[ModifiedDate]

)

--find out the total hours by gender

SELECT Gender, count(TotalHours) as TotalGenderHours    --<< Step 3 write select statement against the CTE
FROM TotalHours
Group by Gender

--;   --to view both CTEs, must seperate by ;

------------------------------------------------------------------
------------------------------------------------------------------

--find out the total hours by login


WITH TotalVandSHours 

AS

(
SELECT
 [LoginID]
,[JobTitle]
,[BirthDate]
,[MaritalStatus]
,[Gender]
,[VacationHours]
,[SickLeaveHours]
,Sum([VacationHours]+[SickLeaveHours]) as TotalHours  --<<concatenated total vacation and sick hours
,[ModifiedDate]
FROM [AdventureWorks2014].[HumanResources].[Employee]
Group by 
[LoginID]
,[JobTitle]
,[BirthDate]
,[MaritalStatus]
,[Gender]
,[VacationHours]
,[SickLeaveHours]
,[ModifiedDate]
)


SELECT Loginid, Gender, sum(TotalHours) as TotalGenderHours 
FROM TotalVandSHours
Group by Gender,Loginid,TotalHours
order by TotalHours desc


