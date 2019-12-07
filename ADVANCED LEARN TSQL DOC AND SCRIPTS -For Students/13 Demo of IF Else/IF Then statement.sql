--What is the IF ... ELSE logical statement?

--The purpose of the IF ...THEN statement is to execute a single line or block of code based upon a Boolean condition.  You will see these in sprocs.

 --There are multiple format of logic when using IF statements: two common ones are as below:

--You can use the IF alone or you can use the IF Statement with Else

--The logic is as follows when using the IF statement alone:

--1:  IF <condition> is TRUE THEN do this <then code to be executed when condition true>

--OR

--The logic is as follows when using the IF statement with the Else keyword

--2:  IF <condition> is TRUE THEN do this <then code to be executed when condition true>   

--but if it's FALSE DO this
                  
--ELSE < else code to be executed when condition is false>

--Example1 :

Declare @number int
Set @number = 15

IF @number > 12
PRINT 'This number is  greater than 12'


--Example 2 :

--IF the statement is TRUE then execute the sql statement

Declare @number int
Set @number = 10

IF (@number > 2 )

   BEGIN
		
	   SELECT * From [HumanResources].[Department]

   END


-------------------------------------------------------------------------

--Exmaple 3: IF ELSE

Declare @Name varchar(20)
Set @Name = 'Raf'


IF @Name = 'Raf'

	PRINT 'My name is Raphael'

ELSE

	PRINT 'My name is NOT Raphael'

----------------------------------------------

Declare @Name varchar(20)
Set @Name = 'Tom'


IF @Name = 'Raf'

	PRINT 'My name is Raphael'

ELSE

	PRINT 'My name is NOT Tom'

----------------------
--Using the IF Else statement to determine if a record needs to be updated or inserted.
--Using a select statement in the IF clause.

SELECT * FROM [SUBQUERY].[dbo].[Students]


IF EXISTS(SELECT * FROM [SUBQUERY].[dbo].[Students] WHERE fname = 'TOM')

	PRINT 'Need to update Customer Record Tom'

ELSE

	PRINT 'Need to add Customer Record Tom'

	------------------------------------------------

SELECT * FROM [SUBQUERY].[dbo].[Students]


IF EXISTS(SELECT * FROM [SUBQUERY].[dbo].[Students] WHERE fname = 'SAM')

	PRINT 'Need to update Customer Record SAM'

ELSE

	PRINT 'Need to add Customer Record SAM'












