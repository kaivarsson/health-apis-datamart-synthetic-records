/*
==========================================================================
Author:			Mark D Shaffer
Create date:	7/29/2019
Database:       OIT_Lighthouse
Jira Ticket:	DEV-XXXX
GIT:            XXX
Table:          DiagnosticReport_Crosswalk
Description:	Represents a list of the individual diagnostic report items
                associated with the patient full icn. 

Data Definition:
Column Name      | Description
-----------------|-----------------------------------------------------
PatientFullICN   | The patient's VA internal control number
-----------------|-----------------------------------------------------
Identifier       | Primary Key. Diagnostic Report item's CDW SID
-----------------|-----------------------------------------------------
ETLBacthId       | ETL process BatchId
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




Create table [App].[DiagnosticReport_Crosswalk]
(
	PatientFullICN varchar(50) not null,
	Identifier varchar(50) not null,
	ETLBatchId int null,
	ETLCreateDate datetime2(0) null,
	ETLEditDate datetime2(0) null
	constraint PK_DiagnosticReport_Crosswalk primary key clustered (Identifier)
)
go

Create index IX_DiagnosticReport_Crosswalk_PatientFullICN 
	on [app].[DiagnosticReport_Crosswalk](PatientFullICN)
go