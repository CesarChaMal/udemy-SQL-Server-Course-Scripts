SELECT        
Production.ProductCategory.Name as Prod_Category, 
Production.ProductSubcategory.Name AS Prod_Sub_Cat, 
Production.Product.Name AS Product, 
Production.Product.ProductID
FROM            
Production.Product 
INNER JOIN
Production.ProductSubcategory 
ON Production.Product.ProductSubcategoryID = Production.ProductSubcategory.ProductSubcategoryID 
INNER JOIN
Production.ProductCategory 
ON Production.ProductSubcategory.ProductCategoryID = Production.ProductCategory.ProductCategoryID