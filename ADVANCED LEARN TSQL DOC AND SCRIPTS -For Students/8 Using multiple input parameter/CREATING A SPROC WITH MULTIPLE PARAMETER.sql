
--CREATING A SPROC WITH ONE PARAMETER. HAVE THE SCRIPT READY BEFORE CREATING A SPROC


CREATE PROCEDURE usp_GetProduct_MultiParameter
@Category nvarchar(30),    --<< NOTE: MULTIPLE PARAMETER ARE SEPERATED BY A COMMA
@SubCategory nvarchar(30)                                  
AS

SELECT  
Production.Product.Name, 
Production.ProductCategory.Name AS Category, 
Production.ProductSubcategory.Name AS SubCategory
FROM  Production.Product 
INNER JOIN
Production.ProductSubcategory 
ON Production.Product.ProductSubcategoryID = Production.ProductSubcategory.ProductSubcategoryID 
INNER JOIN
Production.ProductCategory 
ON Production.ProductSubcategory.ProductCategoryID = Production.ProductCategory.ProductCategoryID

WHERE Production.ProductCategory.Name = @Category  
AND 
Production.ProductSubcategory.Name =  @SubCategory  --<< MUST USE THE PARAMETER IN THE WHERE CLAUSE TO FILTER

--Components

--EXECUTE SPROC

EXEC usp_GetProduct_MultiParameter @SubCategory = 'Road Frames', @Category ='Components'   --<< IF YOU EXEUCTE THE SPROC WITH OUT GIVING A PARAMETER, THEN ERROR.


--DROP SPROC

DROP PROCEDURE usp_GetProduct_MultiParameter