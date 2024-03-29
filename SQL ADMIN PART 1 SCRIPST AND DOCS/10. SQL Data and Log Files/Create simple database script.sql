
CREATE DATABASE [Admin]
GO
 -- Find recovery mode for each database

select [name], DATABASEPROPERTYEX([name],'recovery') As RecoveryMode
from sysdatabases
where name not in ('master','model','tempdb','msdb') --<< Excluding system databases.  (comment out the where clause to find recovery modes for system dbs)


--Change the recovery mode for databases:

USE master;
GO
-- Set recovery model to SIMPLE
ALTER DATABASE Admin 
SET RECOVERY SIMPLE;
GO
 
-- Set recovery model to FULL
ALTER DATABASE Admin 
SET RECOVERY FULL;
GO


