/***********************************************************************************

Author Raf Asghar

Date: 02/18/17

Purpose: To introduce insert, Print, IF Else, and Set Nocount On

When setting the Set Nocount on the messages are turned off 

When SET NOCOUNT is ON, the count is not returned. When SET NOCOUNT is OFF, the count is returned.


************************************************************************************/
Use SUBQUERY
go

Drop table Students


Use SUBQUERY
go

--Create table

Create table Students
(fname varchar (20),
lname varchar(20),
gender char (1))

--view data

Select * from Students

--Droping existing procedures using IF

IF (object_id('InsertStudents')) is NOT NULL
 Drop Procedure InsertStudents
Go

--Creating sproc with varible for insert


Create Procedure InsertStudents
(
@fname varchar(20),
@lname varchar(20),
@gender char (1))

AS


Declare @insert int
Set @insert = 0



IF (@insert = 0)     --<< using the IF and ELSE logic statement (we will cover IF Else later) 

		Begin

		   
			Insert into Students values                  --<< Notice the double indentation!
			(@fname, @lname, @gender)

			PRINT 'Student data has been entered'  --<< using the PRINT command to output result of sproc

		End

Else      

	PRINT 'Students already exist in table'
Go


Execute InsertStudents 'Tom','Bond','M'
Execute InsertStudents 'Sue','Smith','F'


Set Nocount on  --<<setting this will prevent the number of records counts being shown
Select * from Students



Set Nocount off  
Select * from Students