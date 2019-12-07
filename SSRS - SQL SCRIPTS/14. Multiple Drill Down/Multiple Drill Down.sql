SELECT        
Production.ProductCategory.Name AS Category, 
Production.ProductSubcategory.Name AS Subcategory, 
Production.Product.Name AS Product, 
Production.Product.StandardCost
FROM            
Production.Product 
INNER JOIN
Production.ProductSubcategory 
ON Production.Product.ProductSubcategoryID = Production.ProductSubcategory.ProductSubcategoryID 
INNER JOIN
Production.ProductCategory 
ON Production.ProductSubcategory.ProductCategoryID = Production.ProductCategory.ProductCategoryID