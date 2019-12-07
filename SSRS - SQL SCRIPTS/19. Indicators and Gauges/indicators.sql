use World
go

create table Sales
(Fname varchar (20),
ProductSold varchar (20)
)

Insert into Sales
values 
('bob','23'),('same','355'),('tom','235'),('jan','123'),('lewis','500'),('matt','34'),('bobby','235'),('henry','499'),('doris','5')

select * from Sales

--script for terminate
=iif(Fields!ProductSold.Value < 50,"Terminate","Warning")