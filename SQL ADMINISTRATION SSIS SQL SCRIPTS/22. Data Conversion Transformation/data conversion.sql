create database SSISProjects
go


use SSISProjects
go

Create table Mountains
(Mountainid int,
MountainName varchar (50),
MountainHeight varchar (15))

insert into Mountains (Mountainid,MountainName,MountainHeight)
values (1,'Everest', '29,035'),	
(2,'Karakoram', '28,250'),	
(3,'Kanchenjunga','28,169')	

select * from Mountains  --<< highlight the table name and then press Alt + F1 to view data types of fields
