--drop table Cars

Use World
go


CREATE TABLE Cars
(
    Id int,
    Name varchar(50) not null,
    Photo varbinary(max) not null, --<< when inserting an image, use the varbinary (max) data type
	DrivenBy varchar (50)
)

--Have the image on a local drive


INSERT INTO Cars (Id, Name, Photo,DrivenBy) 
SELECT 1, 'Bugatti', Bulkcolumn ,'Tom Cruise'
FROM Openrowset( Bulk 'C:\sql server administation SSRS\Images\Bugatti.jpg', Single_Blob) as BugattiPic --<< change the path to your directory for each insert!!

INSERT INTO Cars (Id, Name, Photo,DrivenBy) 
SELECT 2, 'Rolls Royce', Bulkcolumn ,'Sean Connery'
FROM Openrowset( Bulk 'C:\sql server administation SSRS\Images\Rolls Royce.jpg', Single_Blob) as RollsRoyce

INSERT INTO Cars (Id, Name, Photo,DrivenBy) 
SELECT 3, 'Aston Martin One-77', Bulkcolumn ,'John Travolta'
FROM Openrowset( Bulk 'C:\sql server administation SSRS\Images\Aston Martin One-77.jpg', Single_Blob) as AstonMartinOne

INSERT INTO Cars (Id, Name, Photo,DrivenBy) 
SELECT 4, 'Lamborghini', Bulkcolumn ,'Bradley Cooper'
FROM Openrowset( Bulk 'C:\sql server administation SSRS\Images\Lamborghini.jpg', Single_Blob) as Lamborghini

INSERT INTO Cars (Id, Name, Photo,DrivenBy) 
SELECT 5, 'Zenvo ST1', Bulkcolumn ,'Nicole Kidman'
FROM Openrowset( Bulk 'C:\sql server administation SSRS\Images\Zenvo ST1.jpg', Single_Blob) as ZenvoST1

select * from cars






