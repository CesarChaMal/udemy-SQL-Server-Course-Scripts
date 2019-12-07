 
 /*
 
 What is a table variable?

 Just like a variable that holds data, you can view a table variable as a 'container' that holds a table data.

 You will see them in stored procedures and when developers want to review data for analysis.

 Before getting into how to create a table variable, lets quickly review what is a temp table so as to compare and contrast both objects.

 A temp table is created in the tempdb with the pound sign at the beginning such as: #TestTable

 A temp table is logged in the transsaction logs and can be used as normal tables in that you can modify data via updates, inserts and deletes.

 You can further modify the temp table with defaults, constraints and use both primary and foreign keys.

 When creating a temp table we use the '#' sign in front of the table name.  Here is an exmaple:

 */

 Use subquery
 go

 CREATE TABLE dbo.#Movies   --<< note we are uisng the # to denote that this is a temp table. ALso note that even though i used a Subquery database to direct the 
                            --<< table creation, it is created in the temmdb by default!
   (   
   Movieid int,
   Title varchar (100),
   Year date
   ) 


--Insert data into temp table

INSERT INTO dbo.#Movies 
VALUES (1,'Braveheart','2002') 


SELECT *
FROM dbo.#Movies 

DROP TABLE dbo.[#Movies]   --<< good habit to drop the table

/*

Now that we have seen how to create a temp table and some of its atttibutes, lets see how we create a table varible and its attributes.

Like the temp table, the table variable has a sign in front of the table name: the '@' sign.

Like the temp table, users can modify the table variable with select, insert, update and delete.

However, it has some limitations such as cannot create defaults, constraints, statistics and other attributes, thus you are limited when using a table variable.

The syntax to create a table varible is as follows:

*/

 DECLARE @Movies table   --<< note we are uisng the @ to denote that this is a table variable with the keywords declare and table
                         --<< Note: When creating a table variable, you MUST execute the entire script, other wise an error will occur!  
   (   
   Movieid int,
   Title varchar (100),
   Year date
   ) 


INSERT INTO @Movies
VALUES (1,'Braveheart','2002') 

SELECT * 
FROM @Movies


---------------------------------------------------------------------

/*

What is a derived table?

In the previous examples, we looked at creating and populating data into temp tables and table variables.

And we noticed that we had to create the temp table, populate it and the execute it to get the result set. And similarily we did the same way for table variables.

We can simplify this even further by using what are called derived tables when we want to see data fast and on the fly.

Derived tables are tables that are derived from an existing table.

No need to create tables ann insert data to get results, just use the existing table to get data using derived tables

A derived table is one way of creating a temporary set of records.

A derived table is only available at execution time AND LIVES IN MEMORY, THUS FASTER TO RETRIVE

*/

Use AdventureWorks2014
go

SELECT * FROM   [AdventureWorks2014].[Person].[Person] --13 COLUMNS


SELECT                                   --<< Select the SPECIFIC columns within the EXISTING table - person
       [Title]
      ,[FirstName]
      ,[MiddleName]
      ,[LastName]
      ,[Suffix]
      ,[EmailPromotion]
      ,[ModifiedDate]
  FROM 

  (   --<< place the query in open and closed paranthesis

  Select * from                           --<< Select command with a filter 
  [AdventureWorks2014].[Person].[Person]
  Where LastName = 'Ford'

  )

  AS Derived_Table_Person                 --<< created a new table name
  
  

