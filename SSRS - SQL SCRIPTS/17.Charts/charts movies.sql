
use movies
go

create table Salary
(SalaryId int,
Actor varchar (50),
Movie varchar (50),
Salary varchar (25)
)



insert into Salary
values
(1,'Tom Cruise','Mission: Impossible I, II, III and IV','290'),
(2,'Keanu Reeves','The Matrix I, II and III','262'),
(3,'Johnny Depp ','Pirates of the Caribbean I, II, III and IV','185'),
(4,'Bruce Willis','The Sixth Sense','120'),
(5,'Tom Cruise','Wqar of the Worlds','100'),
(6,'Will Smith','Men in Black 3','100'),
(7,'Sandra Bullock','Gravity','77'),
(8,'Tom hanks','Forrest Gump','70'),
(9,'Harrison Ford','Indiana Jones and the Kingdom of the Crystal Skull','65'),
(10,'Jack Nicholson','Batman','60'),
(11,'Adam Sandler','Amger Management','60'),
(12,'Leonardo DiCaprio','Inception','59'),
(13,'Will Smith','bad Boys II','54'),
(14,'Robert Downey, Jr','Avengers','50'),
(15,'Will Smith','Men in Black II','44'),
(16,'Leonardo DiCaprio','Titanic','40'),
(17,'Tom Hanks','Sving Private Ryan','40'),
(18,'Johnny Depp','Alice in Wonderland','40'),
(19,'Denzel Washington','American Gangster','40'),
(20,'Jim Carrey','Yes Man','30'),
(21,'Mel Gibson','The Passion of the Christ','400')


select * from Salary
order by SalaryId
