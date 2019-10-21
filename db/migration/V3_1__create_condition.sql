/*
==========================================================================
Author:			Mark D Shaffer
Create date:	7/29/2019
Database:       OIT_Lighthouse
Jira Ticket:	DEV-XXXX
GIT:            XXX
Table:          Condition
Description:	Represents a Condition. This table architecture is
                intended to support a single trip to the database using an
				entity framework style approach.  Resource data is stored
				in a json (or XML) format to make it readily available to the api
				layer for consumption.

Data Definition:
Column Name      | Description
-----------------|-----------------------------------------------------
CDWId            | Primary Key.  the CDW SID value plus a letter to 
                 | identify the source of the data (D)Diagnosis, 
				 | (P)roblemList
-----------------|-----------------------------------------------------
PatientFullICN   | The patient's VA internal control number
-----------------|-----------------------------------------------------
Category         | the category of the condition
-----------------|-----------------------------------------------------
ClinicalStatus   | the clinical status of the condition
-----------------|-----------------------------------------------------
DateUTC          | Date and Time in UTC the record was recorded
-----------------|-----------------------------------------------------
Condition        | A JSON (or XML) formatted data payload intended to 
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


Create table [App].[Condition]
(
	[CDWId] varchar(50) not null,
	[PatientFullICN] varchar(50) not null,	
	[Category] varchar(50) null,
	[ClinicalStatus] varchar(50) null,
	[DateUTC] datetime null,
	[Condition] varchar(max) null,
	[ETLBatchId] int null,
	[ETLChunkNum] int null,
	[ETLCreateDate] datetime2(0) null,
	[ETLEditDate] datetime2(0) null,
	constraint PK_Condition primary key clustered (CDWId)
)
go

Create index [IX_Condition_PatientFullICN] on [App].[Condition]([PatientFullICN])
go

create index [IX_Condition_OnSet] on [App].[Condition]([DateUTC])
go

create index [IX_Condition_Category] on [App].[Condition]([Category])
go

create index [IX_Condition_ClinicalStatus] on [App].[Condition]([ClinicalStatus])
go





