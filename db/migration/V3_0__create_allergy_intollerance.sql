/*
==========================================================================
Author:			Mark D Shaffer
Create date:	7/29/2019
Database:       OIT_Lighthouse
Jira Ticket:	DEV-XXXX
GIT:            XXX
Table:          AllergyIntolerance
Description:	Represents a AllergyIntolerance. This table architecture is
                intended to support a single trip to the database using an
				entity framework style approach.  Resource data is stored
				in a json (or XML) format to make it readily available to the api
				layer for consumption.

Data Definition:
Column Name         | Description
--------------------|-----------------------------------------------------4
CDWId               | Primary Key. the CDW SID value 
--------------------|-----------------------------------------------------
PatientFullICN      | The Patient's VA internal control number
--------------------|-----------------------------------------------------
DateUTC             | Date and Time in UTC the record was recorded
--------------------|-----------------------------------------------------
AllergyIntolerance  | A JSON (or XML) formatted data payload intended to 
                    | support the API Layer.
--------------------|-----------------------------------------------------
ETLBatchId          | ETL process BatchId Used for managing intial load
                    | and updates
--------------------|-----------------------------------------------------
ETLChunkNum         | ETL process chunk number  Used for managing initial 
                    | loading and updates of records
--------------------|-----------------------------------------------------
ETLCreateDate       | Date and time in UTC ETL record was first created
--------------------|-----------------------------------------------------
ETLEditDate         | Date and time in UTC ETL batch process last updated
                    | the record
--------------------|-----------------------------------------------------

Change History   
--------------------------------------------------------------------------
m/d/yyyy DEV-XXXX Somed Udesname
 YADDA YADDA YADDA YADDA YADDA YADDA YADDA YADDA YADDA YADDA YADDA YADDA

========================================================================== */


CREATE TABLE [App].[AllergyIntolerance](
	[CDWId] varchar(50) NOT NULL,
	[PatientFullICN] [varchar](50) NOT NULL,
	[DateUTC] datetime null,
	[AllergyIntolerance] [varchar](max) NULL,	
	[ETLBatchId] [int] NULL,
	[ETLChunkNum] int null,
	[ETLCreateDate] [datetime2](0) NULL,
	[ETLEditDate] [datetime2](0) NULL,
	constraint PK_AllergyIntolerance primary key clustered (CDWId)
) 
GO

Create index [IX_AllergyIntolerance_PatientFullICN] on [App].[AllergyIntolerance] ([PatientFullICN])
go

Create index [IX_AllergyIntolerance_DateUTC] on [App].[AllergyIntolerance]([DateUTC])
go
