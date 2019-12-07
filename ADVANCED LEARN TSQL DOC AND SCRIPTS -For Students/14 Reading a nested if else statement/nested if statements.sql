
--Mood barameter:  yyy = fine, yy = avarege, y = not good

--Nested IF Else statements


DECLARE @Mood char(4);  
SET @Mood = 'y';  


IF @Mood = 'yyy' 
 
   PRINT 'My mood is fine';  

ELSE   

   BEGIN  

      IF @Mood = 'yy'                            --<< nested if statement

         PRINT 'My mood is average';  

      ELSE  

         PRINT 'My mood is not good';  

   END ;  
GO  


-------------------------------------------

--breaking down the if statement and its logic


SELECT *
FROM [AdventureWorks2014].[Production].[Product]
WHERE Name LIKE 'Touring-3000%'

USE AdventureWorks2014;  
GO 
 
DECLARE @AvgWeight decimal(8,2),   --<< 1. declare 2 variables
@BikeCount int  

IF   

(SELECT COUNT(*) FROM Production.Product WHERE Name LIKE 'Touring-3000%' ) > 11  --<< 2. asking - are there more than 5 touring-3000 like products

BEGIN  

   SET @BikeCount =                             --<< 3. setting the variable @bikecount to count how many tour-3000 products there are
        (SELECT COUNT(*)   
         FROM Production.Product   
         WHERE Name LIKE 'Touring-3000%');  

   SET @AvgWeight =                              --<< 4. setting the variable @AvgWeight to determine the average weight of tour-3000 products there are  
        (SELECT AVG(Weight)   
         FROM Production.Product   
         WHERE Name LIKE 'Touring-3000%');  

   PRINT 'There are ' + CAST(@BikeCount AS varchar(3)) + ' Touring-3000 bikes.'  --<< 5. Printing out the number of touring-300 bikes using varibale

   PRINT 'The average weight of the top 5 Touring-3000 bikes is ' + CAST(@AvgWeight AS varchar(8)) + '.';  --<< printing tghe wight of tour-3000 productgs

	END  

ELSE   --<< if the above statement is false then do this

	BEGIN  

		   SET @AvgWeight =   
				(SELECT AVG(Weight)  
				 FROM Production.Product   
				 WHERE Name LIKE 'Touring-3000%' );  

		   PRINT 'Average weight of the Touring-3000 bikes is ' + CAST(@AvgWeight AS varchar(8)) + '.' ;  

	END ;  
	GO 