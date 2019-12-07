--step 1: create a table using the following script for products dataset

SELECT        
pc.ProductCategoryID AS 'CategoryID', 
pc.Name AS 'Category', 
ps.ProductSubcategoryID AS 'SubcategoryID', 
ps.Name AS 'Subcategory', 
p.Color, 
p.StandardCost, 
p.Size, 
p.Weight
FROM            
Production.Product AS p 
INNER JOIN
Production.ProductSubcategory AS ps 
ON p.ProductSubcategoryID = ps.ProductSubcategoryID 
INNER JOIN
Production.ProductCategory AS pc 
ON ps.ProductCategoryID = pc.ProductCategoryID

--step 4: create a parameter for subcategory adding the where clause to the product dataset

WHERE   (ps.ProductSubcategoryID = @SubCategory)

--step 2: create a dataset for category

SELECT ProductCategoryID, Name 
FROM Production.ProductCategory

--step 3: create a dataset for Subcategory

SELECT 
productsubcategoryid,productcategoryid,name  
from 
Production.ProductSubcategory

--step 5: create a parameter for category adding the where clause to the Subcategory dataset

WHERE ProductCategoryID = @Category

--step 6: map the category and the subcategory parameters to each dataset (category and then subcategory)