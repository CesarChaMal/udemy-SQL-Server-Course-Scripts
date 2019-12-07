--what are the ages of each person and concatenate their fname and lname

--using Derived COlumns, we can achive this result


use SSISProjects
go

create table Employees
(Lname varchar (20),
Fname varchar (20),
Birthday date)

Insert into Employees
values 
('Bob','Smith','02/01/1965'),
('Tom','Jones','01/23/1968'),
('Henry','Marker','06/22/1999'),
('Sue','Wilson','12/01/1965'),
('Andy','Saunders','02/25/2000'),
('Mary','Bills','05/15/2001'),
('Jan','Shaffer','09/08/1942')

select * from Employees