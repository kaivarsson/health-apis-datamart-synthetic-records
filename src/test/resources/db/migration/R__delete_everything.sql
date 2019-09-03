DROP TABLE IF EXISTS [dbo].[flyway_schema_history];

IF EXISTS(select * from sys.databases where name='${db.name}') ALTER DATABASE dq SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
DROP DATABASE IF EXISTS ${db.name} ;

DROP USER IF EXISTS ${db.user};
IF EXISTS(select * from sys.syslogins where name='${db.user}') DROP LOGIN ${db.user};