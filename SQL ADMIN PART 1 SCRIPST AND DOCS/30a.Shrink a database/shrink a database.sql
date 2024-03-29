/*the following example will illustrate that shrinking a database will

1. Causes pages being moved from the front of file to the end
2. It will cause massive fragmentation
3. It will not reduce the size of the data file, but actually increase it
4. That shrinking a database will cause unnecessary I/O hits
5. That shrinking a database was a futile endeavor because of poor planning regarding sizing of database
6. And that shrinking a database should be very rarely done
*/

USE [master];
GO
 
CREATE DATABASE ShrinkDB;
GO

USE [ShrinkDB];
GO
 

-- Create an initial table at the 'front' of the data file
CREATE TABLE Initial (
    [col1] INT IDENTITY,
    [col2] CHAR (8000) DEFAULT 'Front');
GO


-- Insert data into Initial table
INSERT INTO Initial DEFAULT VALUES;
GO 1500

select * from Initial

--check the size of the database
sp_helpdb [ShrinkDB]
--14.83 MB
 
-- Create the second table, which will be created 'after' the initial table in the data file
CREATE TABLE second (
    [col1] INT IDENTITY,
    [col2] CHAR (8000) DEFAULT 'after');

--create a clusterd index on the second table
CREATE CLUSTERED INDEX [coll] ON second ([col1]);
GO
 

-- Insert data into second table
INSERT INTO second DEFAULT VALUES;
GO 1500


select * from second

--check db size 
sp_helpdb [ShrinkDB]

--database expanded due to insert of data in the second table (26.83 MB)
 
-- Check the fragmentation of the second table
SELECT
    [avg_fragmentation_in_percent]
FROM sys.dm_db_index_physical_stats (
    DB_ID (N'ShrinkDB'), OBJECT_ID (N'second'), 1, NULL, 'LIMITED');
GO

--notice that the fragmentation of the clustered index for the second table is almost zero before the shrink

--We will now drop the initial table we created and execute the shrink command to reclaim the SPACE at the front of the data file
-- then see what happens to the fragmentaion.

DROP TABLE Initial;
GO


sp_helpdb [ShrinkDB]
-- 26.83 MB the data file has not shrunk due to the deletion of the initial table
 
-- Shrink the database
DBCC SHRINKDATABASE ([ShrinkDB]);
GO

--notice that the SPACE after the shrink went down from 26.83 to 15.02 mb
sp_helpdb [ShrinkDB]
--15.02 MB
 
-- But notice what happened to the fragmentation of the data file because of the shrinking of the database???
--when Checking the index fragmentation again, we notice that the fragmentation has drastically increased to almost 100%!!!
--this is because we have shuffled all the data pages and the index is not in a sorted position

SELECT
    [avg_fragmentation_in_percent]
FROM sys.dm_db_index_physical_stats (
    DB_ID (N'ShrinkDB'), OBJECT_ID (N'second'), 1, NULL, 'LIMITED');
GO

--99.6

--while the database has shrunk, and we have reclaimed space from the data file, we MUST now the fix the fragmented index of the table by rebuilding the index!!!

-- Rebuild the Clustered Index

ALTER INDEX [coll] ON second REBUILD
GO


-- Checking the index fragmentation again indicates that the fragmentaion of the index has been restored, but notice the size of the data
--file when we run the sp_helpdb [ShrinkDB] - it has actually GROWN even more than it started from!!!

SELECT
    [avg_fragmentation_in_percent]
FROM sys.dm_db_index_physical_stats (
    DB_ID (N'ShrinkDB'), OBJECT_ID (N'second'), 1, NULL, 'LIMITED');
GO

--0.2%

sp_helpdb [ShrinkDB]
--41.81 MB

--the database file has grown because of the rebuilding of the index and the logging of the index

--use master
--go
--select * from sys.databases

--sp_helpdb ShrinkDB
--transaction log = 13888 KB

--individual file shrink
USE ShrinkDB
GO
DBCC SHRINKFILE (N'ShrinkDB_Log' , 0, TRUNCATEONLY)
GO

sp_helpdb ShrinkDB

--784 KB



--USE ShrinkDB
--GO
--DBCC SHRINKFILE (N'ShrinkDB_Data' , 0, TRUNCATEONLY)
--GO


--USE ShrinkDB
--GO
--DBCC SHRINKDATABASE(N'ShrinkDB' )
--GO
