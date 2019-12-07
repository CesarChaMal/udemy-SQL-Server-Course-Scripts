
/*

 What is SQL Server Common Table Expressions or (CTE)?

Introduced in SQL Server 2005, the CTE is a temporary named set of data that exists for the duration of a query.  
We can execute within the scope of a CTE statements such as: SELECT, INSERT, DELETE, or UPDATE.
Like SQL views, these CTE will update, delete and insert data in the base table consisting of the CTE (in some cases.)
Like temp tables, CTE tables hold temperary data that can be query against.
One advantage of using the CTEs are that they are stored in memory and thus faster, and do not create physical tables or objects like temp table. 
Can be used in stored procedures, tiggers and functions.

The syntax for a CTE is as follows:


WITH                                                   --<<the CTE begins with the  WITH command and not select

Expression_Name                                        --<<The expression_name is the name of the CTE

(Column_Name1, ColumnName2,.....ColumnNameN)           --<< optional columns can be metioned

AS                                                     --<< keyword AS            
 
(

CTE query                                              --<< the SQL query that the expression_name is going to 'hold' in between ()

)                        


SELECT Column1, Column2, Column3  (or more columsn)    --<< the SQL query that will be executed against the Expression_Name

FROM CTE Name                                          --<< the Expression_Name

*/

--Example 1: A simple CTE

WITH Dept_CTE

as

(

SELECT 
[DepartmentID]
,
[Name]
,[GroupName]
,[ModifiedDate]
FROM [HumanResources].[Department]

)

Select name from Dept_CTE   --<< must select all the CTE to execute



--Example 2: A simple CTE with column names

WITH Dept_CTE (DepartmentID,DeptName,DeptGroupName,DeptModifiedDate)  --<< table columns mentioned used as alias in CTE
     --Dept_CTE (DepartmentID,DeptName,DeptGroupName)  --<< Must have all the columns mentioned if used in CTE

as

(

SELECT [DepartmentID]
,[Name] as DeptName
,[GroupName] as DeptGroupName
,[ModifiedDate] as DeptModifiedDate
FROM [HumanResources].[Department]

)

Select DeptName,DeptGroupName 
from Dept_CTE


