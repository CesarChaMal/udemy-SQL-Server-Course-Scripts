 /*

 1. What is a WHILE statement?
 2. Examples of WHILE statement
 3. What is the BREAK and CONTINUE keywords in a WHILE statement
 3. Demo of WHILE in an adventureworks2014 database

 

Using WHILE...BREAK or CONTINUE. 
The WHILE statement repeats a statement or block of statements as long as a specified condition remains true. 
Two Transact-SQL statements are commonly used with WHILE: BREAK or CONTINUE. 
The BREAK statement exits the innermost WHILE loop 
and the CONTINUE statement restarts a WHILE loop



-- Syntax for SQL Server
  
WHILE Boolean_expression   
     { sql_statement | statement_block | BREAK | CONTINUE }  
  




*/

--1 Example of WHILE Loop

DECLARE @Number INT          --<< declare the variable with datatype

SET @Number = 1              --<< set the variable to 1

WHILE (@Number <=10)          --<< Condition:  While the varible is less than or equal to 5, begin the next command (in this case PRINT)

BEGIN

	PRINT @Number                --<< Print the variable 1

	SET @Number = @Number + 1   --<< Set the variable to 1 and then add plus 1 until the WHILE condition is met

END

GO


--the result should be printing number 1 thru 5


--2 Example of WHILE Loop with BREAK keyword
--If a BREAK statement is executed within a WHILE loop, 
--then it causes the control to go out of the while loop 
--and start executing the first statement immediately after the while loop.


DECLARE @Number INT

SET @Number = 1

WHILE (@Number <=5)

BEGIN

	PRINT @Number

	SET @Number = @Number + 1

	IF @Number = 4   --<< if you reach number 4, then BREAK (Stop)

	BREAK;

END

	PRINT 'THIS IS AN EXAMLE OF BREAK - RATHER THAN GOING PRINTING 1 THRU 5 IT PRINTS THE NEXT STATEMENT'

GO


--3) Example of WHILE Loop with CONTINUE and BREAK keywords



DECLARE @Number INT

SET @Number = 1

WHILE (@Number <=5)

BEGIN

	PRINT @Number

	SET @Number = @Number + 1

	CONTINUE;      --<< continue, even if you see 4 (restart the loop)

	IF @Number = 4 

	BREAK;

END

	PRINT 'THIS IS AN EXAMLE OF CONTINUE - IT WILL SKIP THE BREAK AND RESTART THE LOOP'

GO

--If you did'nt have a break command - endless loop


WHILE 1=1
BEGIN
SELECT 'This is an infinite loop!'
END

--To avoid the SQL statement to run in an infinite WHILE loop, use BREAK where needed:

WHILE 1 = 1
BEGIN

	SELECT * FROM [HumanResources].[Department]
	-- use BREAK to stop execution
	BREAK;
END

