/*
==========================================================================
Author:			Mark D Shaffer
Create date:	7/29/2019
Database:       OIT_Lighthouse
Jira Ticket:	DEV-XXXX
GIT:            XXX
Table:          Observation
Description:	Represents a Observation. This table architecture is
                intended to support a single trip to the database using an
				entity framework style approach.  Resource data is stored
				in a json (or XML) format to make it readily available to the api
				layer for consumption.

Data Definition:
Column Name      | Description
-----------------|-----------------------------------------------------
CDWId            | Primary Key.  the CDW SID value 
-----------------|-----------------------------------------------------
PatientFullICN   | The patient's VA internal control number
-----------------|-----------------------------------------------------
Category         | the category of the observation
-----------------|-----------------------------------------------------
Code             | the code to used to indicate the observation
-----------------|-----------------------------------------------------
Date             | the number of milliseconds since 1/1/1970
                 | Epoch timestamp
-----------------|-----------------------------------------------------
DateUTC          | Date and Time in UTC the record was recorded
-----------------|-----------------------------------------------------
Observation      | A JSON (or XML) formatted data payload intended to 
                 | support the API Layer.
-----------------|-----------------------------------------------------
ETLBacthId       | ETL process BatchId
-----------------|-----------------------------------------------------
ETLChunkNum      | ETL process chunk number  Used for managing initial 
                 | loading and updates of records
-----------------|-----------------------------------------------------
ETLCreateDate    | Date and time in UTC ETL record was first created
-----------------|-----------------------------------------------------
ETLEditDate      | Date and time in UTC ETL batch process last updated
                 | the record
-----------------|-----------------------------------------------------

Change History   
--------------------------------------------------------------------------
m/d/yyyy DEV-XXXX Somed Udesname
 YADDA YADDA YADDA YADDA YADDA YADDA YADDA YADDA YADDA YADDA YADDA YADDA

========================================================================== */

Create table [App].[Observation]
(
	[CDWId] varchar(50) not null Primary Key,
	[PatientFullICN] varchar(50) not null,
	[Category] varchar(50) null,
	[Code] varchar(50) null,
	[Date] int null,
	[DateUTC] int null,
	[Observation] varchar(max) null,
	[ETLBatchId] int null,
	[ETLChunkNum] int null,
	[ETLCreateDate] datetime2(0) null,
	[ETLEditDate] datetime2(0) null
)

Create index [IX_Observation_PatientFullICN] on [App].[Observation]([PatientFullICN])
go

Create index [IX_Observation_Date] on [App].[Observation]([Date])
go

Create index [IX_Observation_DateUTC] on [App].[Observation]([DateUTC])
go

Create index [IX_Observation_Category] on [App].[Observation]([Category])
go

Create index [IX_Observation_Code] on [App].[Observation]([Code])
go