--Example 3: A simple CTE with multiple CTEs

WITH 

Dept_CTE (DepartmentID,DeptName,DeptGroupName,DeptModifiedDate)  --<< table columns mentioned used as alias in CTE

as

(

SELECT [DepartmentID]
,[Name] as DeptName
,[GroupName] as DeptGroupName
,[ModifiedDate] as DeptModifiedDate
FROM [HumanResources].[Department]

)

,       --<< to joim CTEs you Must seperate them with a comma and write a join statement or union

GroupDept_CTE (DepartmentID,DeptName,DeptGroupName,DeptModifiedDate)  --<< give the second CTE a different expression name


as

(

SELECT [DepartmentID]
,[Name] as DeptName
,[GroupName] as DeptGroupName
,[ModifiedDate] as DeptModifiedDate
FROM [HumanResources].[Department]

)

Select                                             --<< rewrite the query with a join and filer with where clause
d.DeptName, d.DeptGroupName
from Dept_CTE as d
Inner Join GroupDept_CTE as g
on  d.DepartmentID = g.DepartmentID
where  d.DeptGroupName = 'Executive General and Administration'

