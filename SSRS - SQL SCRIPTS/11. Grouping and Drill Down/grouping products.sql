SELECT        
Production.ProductCategory.Name AS ProductCategory, 
Production.ProductSubcategory.Name AS ProductSubcategory, 
Production.Product.Name AS Product, 
Production.Product.Color, 
Production.Product.StandardCost, 
Production.Product.Size
FROM            
Production.Product 
INNER JOIN
Production.ProductSubcategory 
ON Production.Product.ProductSubcategoryID = Production.ProductSubcategory.ProductSubcategoryID 
INNER JOIN
Production.ProductCategory 
ON Production.ProductSubcategory.ProductCategoryID = Production.ProductCategory.ProductCategoryID