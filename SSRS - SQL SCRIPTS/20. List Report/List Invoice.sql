use World
go

create table Invoice
(InvoiceID int,
ClientFname varchar (20),
ClientLname varchar (20),
email varchar (20),
Lesson varchar (100),
Cost varchar (10),
DateofLesson date,
Paid char (1)
)



insert into Invoice
values
(1,'Bob','Smith','bsmith@gmail.com','Consulting Advanced SQL Admin','200','2016-4-14','Y'),
(2,'Bob','Smith','bsmith@gmail.com','Consulting Advanced SQL Admin','200','2016-4-28','Y'),
(3,'Bob','Smith','bsmith@gmail.com','Consulting Advanced SQL Admin','200','2016-4-29','Y'),
(4,'Bob','Smith','bsmith@gmail.com','Consulting Advanced SQL Admin','200','2016-5-10','N'),
(5,'Bob','Smith','bsmith@gmail.com','Consulting Advanced SQL Admin','200','2016-5-28','Y'),
(6,'Jon','Jones','jjones@gmail.com','Consulting Advanced SQL Admin','200','2016-5-28','Y'),
(7,'Jon','Jones','jjones@gmail.com','Consulting Advanced SQL Admin','200','2016-4-30','Y'),
(8,'Jon','Jones','jjones@gmail.com','Consulting Advanced SQL Admin','200','2016-4-15','Y'),
(9,'Jon','Jones','jjones@gmail.com','Consulting Advanced SQL Admin','200','2016-5-28','Y'),
(10,'Jon','Jones','jjones@gmail.com','Consulting Advanced SQL Admin','200','2016-5-30','N')


select * from Invoice

