


/*

What is a recursive CTE?

A recursive CTE is one that can reference itself. Recursive CTEs work well when hierarchical data is needed, and as such,
i am going to demo a recursive CTE.

*/

Use adventureworks2014
go

--Drop Table CompanyEmployees

CREATE TABLE CompanyEmployees
(
  Employee_ID int PRIMARY KEY,
  First_Name varchar(25) ,
  Manager_ID int NULL
)
GO

-- Insert values in table with manager_id and null to represent the top level of hiearchy

INSERT INTO CompanyEmployees VALUES
(1, 'Bob', NULL),
(2, 'Tom',1),
(3, 'Sue',1),
(4, 'Mary',2),
(5, 'Matt',2),
(6, 'Will',3),
(7, 'Henry',3),
(8, 'Lewis',5),
(9, 'Scott',5),
(10, 'Bill',6)

SELECT * FROM CompanyEmployees;

WITH

  ManagersCTE (Employee_ID, First_Name,Manager_ID, EmpLevel)
  AS

  (

    SELECT Employee_ID, First_Name, Manager_ID, 1 as EmpLevel --<< Anchor Member – This portion executes first, and is only called once.
    FROM CompanyEmployees
    WHERE Manager_ID IS NULL

    UNION ALL                                              --<< used to combine the  anchor results and recursive member

    SELECT e.Employee_ID, e.First_Name, e.Manager_ID, --<<Recursive Member:The query is repeatedly executed until no rows are returned.  										
      m.EmpLevel + 1
    FROM CompanyEmployees e
      INNER JOIN ManagersCTE m
        ON e.Manager_ID = m.Employee_ID
  )

SELECT
  First_Name, Employee_ID,
  EmpLevel,
  (SELECT First_Name FROM CompanyEmployees 
    WHERE Employee_ID = ManagersCTE.Manager_ID) AS Manager
FROM ManagersCTE 
ORDER BY EmpLevel, Manager_ID

