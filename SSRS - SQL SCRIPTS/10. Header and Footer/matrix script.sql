SELECT        Production.Product.Name AS Product, Production.Product.StandardCost, Production.ProductCategory.Name AS Expr1
FROM            Production.Product INNER JOIN
                         Production.ProductSubcategory ON Production.Product.ProductSubcategoryID = Production.ProductSubcategory.ProductSubcategoryID INNER JOIN
                         Production.ProductCategory ON Production.ProductSubcategory.ProductCategoryID = Production.ProductCategory.ProductCategoryID
GROUP BY Production.Product.Name, Production.Product.StandardCost, Production.ProductCategory.Name
ORDER BY Product