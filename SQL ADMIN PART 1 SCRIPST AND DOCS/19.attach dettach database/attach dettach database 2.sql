USE [master]
GO
ALTER DATABASE [Admin] 
SET  SINGLE_USER WITH ROLLBACK IMMEDIATE
GO

USE [master]
GO
EXEC master.dbo.sp_detach_db @dbname = N'Admin', @skipchecks = 'false'
GO
