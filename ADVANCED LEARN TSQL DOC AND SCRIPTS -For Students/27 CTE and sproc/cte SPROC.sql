
--CREATE SPROC WITH 1 PARAMETER

Create Proc usp_CTE_Select_person

as


WITH Select_CTE

as
(

SELECT  
*
FROM Person.Person032617

)

SELECT  
* 
FROM Person.Person032617



--ALTER SPROC WITH 1 PARAMETER

ALTER Proc usp_CTE_Select_person

@LASTNAME NVARCHAR(50)     --<< Add a parameter

as


WITH Select_CTE

as
(

SELECT  
*
FROM Person.Person032617

)

SELECT  
* 
FROM Person.Person032617
WHERE LASTNAME = @LASTNAME                     --<<must use the parameter in the where clause


exec usp_CTE_Select_person 'turner'
