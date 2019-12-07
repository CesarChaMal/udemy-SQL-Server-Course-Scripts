
--Execute a full database backup

Use Admin
Go

BACKUP DATABASE [Admin] 
TO DISK = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\Backup\Admin.bak' 
WITH NOINIT,  
NAME = N'Admin-Full Database Backup'
GO

--Running the DBCC CHECKDB: Checks the logical and physical integrity of all the objects in the specified database
--In a production server, where the database may be very large, 
--running this can cause performance issues; thus run with NO_INFOMSGS which suppresses all informational messages and other options

Use Admin
Go

DBCC ChecKDB
