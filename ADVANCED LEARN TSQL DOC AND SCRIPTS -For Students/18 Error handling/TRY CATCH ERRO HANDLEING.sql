/*


What is Try..Catch block?

Introduced in SQL 2005, the Try...Catch is basically a set of two block of codes that lets you manage how to capture error handling

The Try block of code execute some code, while the Catch handle the errors if there are any errors.

The sysntax is as follows:

BEGIN TRY  

     { sql_statement | statement_block }  --<< this block is where the sql statement or multiple sql statements are written

END TRY  

BEGIN CATCH  

     [ { sql_statement | statement_block } ]  --<< this block is where if the sql statement or multiple sql statements cause an error is captured

END CATCH  

[ ; ]  


*/

--Example 1: IF THE SQL STATEMENT HAS AN ERROR

BEGIN TRY  
    
    SELECT 1/0 AS ERROR;  --<< Generate a divide-by-zero error.  (sql statement)  If there is an error with this sql statement, go to catch
	                      --<< Since this was an error, it will NOT EXECUTE!
END TRY  

BEGIN CATCH  

	PRINT 'There is an error!  Cant divide one by zero' 

END CATCH;  
GO  


--Example 2: IF THE SQL STATEMENT DOES NOT HAVE AN ERROR

BEGIN TRY  
    
    SELECT 1/1 AS ERROR;  --<< (sql statement)  If there is no error with this sql statement,  skip catch
	                      --<< Since this is true, it will EXECUTE!
END TRY  

BEGIN CATCH  

	PRINT 'There is an error!  Cant divide one by zero' 

END CATCH;  
GO  


--Example 3:  If there are two sql statements, then the one that fails will capture in the catch block but the other sql statement will execute

BEGIN TRY  

	USE AdventureWorks2014 
	
	SELECT * FROM [HumanResources].[Department];  --<< any sql statement(s) before the error will execute
    
    SELECT 1/0 AS ERROR;                          --<< this will be captured and can be logged in a table
	                      

END TRY  

BEGIN CATCH  

	PRINT 'There is an error!  Cant divide one by zero' 

END CATCH;  
GO  


--Exmaple 4:  So we have seen what the Try ..Catch blocks statements is and its outcome.  But we can delve into deeper in knowing the errors
--and recording them in a table with the sql error functions that give a litte more detail.

--The functions: ERROR_LINE, ERROR_MESSAGE, ERROR_NUMBER, ERROR_PROCEDURE, ERROR_SEVERITY, ERROR_STATE 
--return the error information specific to the CATCH block in which they are referenced.
--for deeper understanding go to:   https://msdn.microsoft.com/en-us/library/ms175976.aspx


BEGIN TRY

    SELECT 1/0  --<< note that the select statement did not execute and was turned over to the catch statement that has the error fucntions.
	            --<< these give us more detailed and can be stored in a table.  You have the choice of deciding which error to select

END TRY

BEGIN CATCH

    SELECT 
	  ERROR_NUMBER() AS ErrorNumber
     ,ERROR_SEVERITY() AS ErrorSeverity
     ,ERROR_STATE() AS ErrorState
     ,ERROR_PROCEDURE() AS ErrorProcedure
     ,ERROR_LINE() AS ErrorLine
     ,ERROR_MESSAGE() AS ErrorMessage;

END CATCH


--Example 5:  Integrating transaction statement with Try..Catch and error functions

BEGIN TRANSACTION;  
  
	BEGIN TRY  

    
		DELETE                            --<< TRYING TO DELETE A ROW THAT HAS A FOREIGN KEY REFERENCE
		FROM [AdventureWorks2014].[Person].[Person]
		WHERE [BusinessEntityID] = 1;

	END TRY  

	BEGIN CATCH  

		SELECT                              --<< PROVIDE DETAILS OF ERROR IF IT OCCURS
			ERROR_NUMBER() AS ErrorNumber  
			,ERROR_SEVERITY() AS ErrorSeverity  
			,ERROR_STATE() AS ErrorState  
			,ERROR_PROCEDURE() AS ErrorProcedure  
			,ERROR_LINE() AS ErrorLine  
			,ERROR_MESSAGE() AS ErrorMessage;  
  
		IF @@TRANCOUNT > 0                  
			ROLLBACK TRANSACTION;  

	END CATCH;  
  
		IF @@TRANCOUNT > 0  
		COMMIT TRANSACTION;  
GO 




  


