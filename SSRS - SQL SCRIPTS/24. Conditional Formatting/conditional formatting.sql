Use AdventureWorks2016CTP3
go

SELECT        
ProductID, Name, Color, StandardCost, Size
FROM  Production.Product
where StandardCost <> 0 and size is not null
order by Productid

--  =IIf(Fields!StandardCost.Value > 500,"Red","Black")