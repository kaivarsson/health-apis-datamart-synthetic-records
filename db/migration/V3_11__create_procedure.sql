/*
==========================================================================
Author:			Mark D Shaffer
Create date:	7/29/2019
Database:       OIT_Lighthouse
Jira Ticket:	DEV-XXXX
GIT:            XXX
Table:          Procedure
Description:	Represents a Procedure. This table architecture is
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
Date             | the number of milliseconds since 1/1/1970
                 | Epoch timestamp
-----------------|-----------------------------------------------------
DateUTC          | the date and time in utc the record was first recorded
-----------------|-----------------------------------------------------
Procedure        | A JSON (or XML) formatted data payload intended to 
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


Create table [App].[Procedure]
(
	[CDWId] varchar(50) not null,
	[PatientFullICN] varchar(50) not null,
	[Date] bigint null,
	[DateUTC] datetime not null,	
	[Procedure] varchar(max) null,
	[ETLBatchId] int null,
	[ETLChunkNum int null,
	[ETLCreateDate] datetime null,
	[ETLEditDate] datetime null,
	constraint PK_Procedure primary key clustered (CDWId)
)

Create index [IX_Procedure_PatientFullICN] on [App].[Procedure]([PatientFullICN])
go

Create index [IX_Procedure_DateUTC] on [App].[Procedure]([DateUTC])
go
