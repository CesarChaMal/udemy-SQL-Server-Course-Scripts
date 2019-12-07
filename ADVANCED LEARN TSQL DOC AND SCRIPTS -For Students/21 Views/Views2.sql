
--Previously, we have gone over viewing result sets that was not permamnent in tables.  what if to want to view data that is permanent and resuable but don't
--want to create tables from scratch.  Use Views!
--The following is an example of multiple join in a select statement from multiple tables.
--To make this data 'permanent' and resuable, we transform this select statement to a view!  Now we can reuse this newly created virtual table.

--Create View vw_UserData
--as

SELECT        
e.BusinessEntityID, 
p.Title, p.FirstName, 
p.MiddleName, p.LastName, 
p.Suffix, 
e.JobTitle, 
pp.PhoneNumber, 
pnt.Name AS PhoneNumberType, 
ea.EmailAddress, 
p.EmailPromotion, 
a.AddressLine1, 
a.AddressLine2, 
a.City, 
sp.Name AS StateProvinceName, 
a.PostalCode, 
cr.Name AS CountryRegionName,
 p.AdditionalContactInfo
FROM            
HumanResources.Employee AS e 
INNER JOIN
Person.Person AS p ON p.BusinessEntityID = e.BusinessEntityID 
INNER JOIN
Person.BusinessEntityAddress AS bea ON bea.BusinessEntityID = e.BusinessEntityID 
INNER JOIN
Person.Address AS a ON a.AddressID = bea.AddressID 
INNER JOIN
Person.StateProvince AS sp ON sp.StateProvinceID = a.StateProvinceID 
INNER JOIN
Person.CountryRegion AS cr ON cr.CountryRegionCode = sp.CountryRegionCode 
LEFT OUTER JOIN
Person.PersonPhone AS pp ON pp.BusinessEntityID = p.BusinessEntityID 
LEFT OUTER JOIN
Person.PhoneNumberType AS pnt ON pp.PhoneNumberTypeID = pnt.PhoneNumberTypeID 
LEFT OUTER JOIN
Person.EmailAddress AS ea ON p.BusinessEntityID = ea.BusinessEntityID

--viewing the result set from aview

Select * from vw_UserData


Use SUBQUERY
go


Create table SalesPerson
(
Personid int,
fname varchar (20)
)

insert into SalesPerson
values 
(1,'bob'),(2,'tom'),(3,'matt'),(4,'sue'),(5,'kirk')


select * from SalesPerson


Create table ProductSales
(
salesid int,
salesamount money,
Personid int
)

Insert into ProductSales
values (1,24,1),(2,22,1),(3,33,2),(4,24,2),(5,25,3),(6,23,4)

Select * from ProductSales
select * from SalesPerson

--join shows sale amount by each salesperson

SELECT SalesPerson.fname, ProductSales.salesamount
FROM SalesPerson INNER JOIN
ProductSales ON SalesPerson.Personid = ProductSales.Personid

--join shows total sales of each salesperson

Select fname, SalesPerson.personid, sum(salesamount) as TotalSales			
From  SalesPerson INNER JOIN
ProductSales ON SalesPerson.Personid = ProductSales.Personid
Group by fname,SalesPerson.personid


--Now that you have an aggregate of that joined table, we use this and create a view and do some analysis against aggregates


Create View vwAggregateSales
As
Select fname, SalesPerson.personid, sum(salesamount) as TotalSales			
From  SalesPerson INNER JOIN
ProductSales ON SalesPerson.Personid = ProductSales.Personid
Group by fname,SalesPerson.personid


--using the view aggregates with case statement

Select fname,TotalSales,
case 
When TotalSales > 45 then 'Great Sales'
When TotalSales between 25 and 30 then 'Average Sales'
Else 'Below Average'
End As 'Productivity'
from vwAggregateSales
