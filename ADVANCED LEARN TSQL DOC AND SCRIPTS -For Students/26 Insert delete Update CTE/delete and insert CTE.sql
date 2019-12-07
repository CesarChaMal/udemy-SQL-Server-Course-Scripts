--View  table
--Select  *   from Person.Person

--Make a backup of Person.Person

--Select * Into Person.Person032617
--From Person.Person


--View table

SELECT  
Person.Person032617.BusinessEntityID,  
Person.Person032617.FirstName, 
Person.Person032617.LastName
FROM Person.Person032617 
Order by Person.Person032617.BusinessEntityID

--Create a CTE for insert and update

WITH Insert_CTE
as
(

SELECT  
Person.Person032617.BusinessEntityID,  
Person.Person032617.FirstName, 
Person.Person032617.LastName
FROM Person.Person032617 

)

INSERT    
INTO  Person.Person032617 (BusinessEntityID, FirstName, LastName,PersonType,NameStyle,ModifiedDate,EmailPromotion,rowguid)
VALUES (2000000,'Rafphael','Asghar','EM',0,'2009-01-07 00:00:00.000',0,'92C4279F-1207-48A3-8448-4636514EB7E3');

--CHECK THE TABLE TO SEE IF IT INSERTED

SELECT  
Person.Person032617.BusinessEntityID,  
Person.Person032617.FirstName, 
Person.Person032617.LastName
FROM Person.Person032617 
WHERE Person.Person032617.BusinessEntityID = 2000000

--Update a CTE (note we cannot update 2 tables in a join simultaneously, but can update a SINGLE table in a join)

WITH Update_CTE
as
(

SELECT  
Person.Person032617.BusinessEntityID,  
Person.Person032617.FirstName, 
Person.Person032617.LastName
FROM Person.Person032617 
WHERE Person.Person032617.BusinessEntityID = 2000000

)

Update Person.Person032617
Set Person.Person032617.FirstName = 'BOB'
Where Person.Person032617.BusinessEntityID = 2000000

SELECT  
Person.Person032617.BusinessEntityID,  
Person.Person032617.FirstName, 
Person.Person032617.LastName
FROM Person.Person032617 
WHERE Person.Person032617.BusinessEntityID = 2000000;


--Delete in CTE

WITH Delete_CTE
as
(

SELECT  
Person.Person032617.BusinessEntityID,  
Person.Person032617.FirstName, 
Person.Person032617.LastName
FROM Person.Person032617 
WHERE Person.Person032617.BusinessEntityID = 2000000

)


DELETE  [Person].[Person032617] 
FROM Delete_CTE
WHERE Person.Person032617.BusinessEntityID = 2000000

SELECT  
Person.Person032617.BusinessEntityID,  
Person.Person032617.FirstName, 
Person.Person032617.LastName
FROM Person.Person032617 
WHERE Person.Person032617.BusinessEntityID = 2000000

