
/*
==========================================================================
Author:			Mark D Shaffer
Create date:	7/29/2019
Database:       OIT_Lighthouse
Jira Ticket:	DEV-XXXX
GIT:            XXX
Table:          PatientReport
Description:	Represents a PatientReport. This table architecture is
                intended to support a single trip to the database using an
				entity framework style approach.  Resource data is stored
				in a json (or XML) format to make it readily available to the api
				layer for consumption.

Data Definition:
Column Name      | Description
-----------------|-----------------------------------------------------
PatientFullICN   | Primary Key. The patient's VA internal control number
-----------------|-----------------------------------------------------
DateUTC          | Date and Time in UTC the record was recorded
-----------------|-----------------------------------------------------
PatientReport    | A JSON (or XML) formatted data payload intended to 
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

Create table [app].[PatientReport]
(
	[PatientFullICN] varchar(50) not null,
	[DateUTC] datetime null,
	[PatientReport] varchar(max) null,
	[ETLBatchId] int null,
	[ETLChunkNum] int null,
	[ETLCreateDate] datetime null,
	[ETLEditDate] datetime null,
	constraint PK_PatientReport primary key clustered (PatientFullICN)
)
go

create index [IX_PatientReport_DateUTC] on [app].[PatientReport]([DateUTC])
go