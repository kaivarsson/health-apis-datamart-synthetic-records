DROP TABLE IF EXISTS [dbo].[flyway_schema_history];

IF EXISTS(select * from sys.databases where name='dq') ALTER DATABASE dq SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
DROP DATABASE IF EXISTS dq ;
DROP USER IF EXISTS dq;
IF EXISTS(select * from sys.syslogins where name='dq') DROP LOGIN dq;