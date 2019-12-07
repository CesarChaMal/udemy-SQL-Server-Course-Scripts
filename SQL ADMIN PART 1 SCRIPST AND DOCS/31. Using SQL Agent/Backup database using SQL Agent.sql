
create database Library
go

--Drop table   [dbo].[Books]

use Library
go


create table Books
(BooksID int primary key identity (1,1),
Tilte varchar (100))

--First, a full database backup job captures the creation of table books (start time manual) 11:30 pm

--Each 30 seconds, activity is occuring against the table books (inserts).  As activity occrs, a scehduled backup job is captuing those modifications to the
--database (the insert)

insert into Books values ('Dracula') 

--a scheduled transaction log captures the next inserts (job executes after each 40th second)

WAITFOR DELAY '00:00:15';

--a scheduled transaction log captures the next inserts (job executes after each 40th second)

insert into Books values ('Mody Dick') 

--a scheduled transaction log captures the next inserts (job executes after each 40th second)

WAITFOR DELAY '00:00:30';

insert into Books values ('Macbeth')

--a scheduled transaction log captures the next inserts (job executes after each 40th second)

WAITFOR DELAY '00:00:15';


insert into Books values ('The Martian')

--a scheduled transaction log captures the next inserts (job executes after each 40th second)

WAITFOR DELAY '00:00:05';


insert into Books values ('Train Robbery')

--a scheduled transaction log captures the next inserts (job executes after each 40th second)

WAITFOR DELAY '00:00:03';


insert into Books values ('Godfather')

--a scheduled transaction log captures the next inserts (job executes after each 40th second)

WAITFOR DELAY '00:00:20';

select * from books


--RESTORE HEADERONLY FROM DISK = 'C:\FullBackups\labrary.bak'