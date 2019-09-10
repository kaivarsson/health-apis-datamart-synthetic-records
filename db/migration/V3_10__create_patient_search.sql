/*
==========================================================================
Author:			Mark D Shaffer
Create date:	7/29/2019
Database:       OIT_Lighthouse
Jira Ticket:	DEV-XXXX
GIT:            XXX
Table:          PatientSearch
Description:	Used to provide a set of searchable values for a given patient
                This table architecture is intended to support a single trip to
				the database using an entity framework style approach.  Resource
				data is stored in a json (or XML) format to make it readily 
				available to the api layer for consumption.

Data Definition:
Column Name      | Description
-----------------|-----------------------------------------------------
objectType       | used to indicate the type of object
-----------------|-----------------------------------------------------
objectVersion    | used to indicate the version of the object
-----------------|-----------------------------------------------------
fullICN          | The patient's VA internal control number
-----------------|-----------------------------------------------------
PatientSID       | the CDWID for the patient record.  This is the 
                 | identified 'Patient of Record' aka the master 
				 | record
-----------------|-----------------------------------------------------
ssn              | the patient's SSN
-----------------|-----------------------------------------------------
name             | the patient's full name (Last, First Middle)
-----------------|-----------------------------------------------------
lastName         | the patient's last name
-----------------|-----------------------------------------------------
firstName        | the patient's first and middle name 
-----------------|-----------------------------------------------------
birthDateTime    | the patient's date and time of birth in UTC.
                 | should the time be 0 or omitted then no time was 
				 | given
-----------------|-----------------------------------------------------
deceased         | flag to indicate if the patiend it deceased. 'Y'
			     | for yes|true and 'N' for no|false
-----------------|-----------------------------------------------------
deathDateTime    | date and time in UTC patient passed. Null when
                 | then the deceased flag is 'N'
-----------------|-----------------------------------------------------
gender           | indicates the patient's gender. 'M' for male, 'F'
                 | for female
-----------------|-----------------------------------------------------
selfIdentifiedGender | indicates the patient's self identified gender.
                     | varchar data type allows for descriptor of up
					 | to 50 characters
-----------------|-----------------------------------------------------
religion         | indicates the patient's religeon
-----------------|-----------------------------------------------------
managingOrganization | CDWID used to indicate the organization 
                     | responsible for the data.
-----------------|-----------------------------------------------------
ChunkNum         | ETL process chunk number  Used for managing initial 
                 | loading and updates of records
-----------------|-----------------------------------------------------

Change History   
--------------------------------------------------------------------------
m/d/yyyy DEV-XXXX Somed Udesname
 YADDA YADDA YADDA YADDA YADDA YADDA YADDA YADDA YADDA YADDA YADDA YADDA

========================================================================== */

CREATE TABLE [app].[PatientSearch](
	[objectType] [varchar](7) NULL,
	[objectVersion] [varchar](1) NULL,
	[fullIcn] [varchar](50) not NULL,
	[PatientSID] [int] NULL,
	[ssn] [varchar](50) NULL,
	[name] [varchar](100) NULL,
	[lastName] [varchar](50) NULL,
	[firstName] [varchar](100) NULL,
	[birthDateTime] [datetime2](0) NULL,
	[deceased] [varchar](1) NULL,
	[deathDateTime] [datetime2](0) NULL,
	[gender] [varchar](1) NULL,
	[selfIdentifiedGender] [varchar](50) NULL,
	[religion] [varchar](30) NULL,
	[managingOrganization] [varchar](102) NULL,
	[ChunkNum] [int] NULL,
	constraint PK_PatientSearch primary key clustered (fullIcn)
) 
GO

create index [IX_PatientSearch_PatientSID] on [App].[PatientSearch]([PatientSID])
go

create index [IX_PatientSearch_Name] on [App].[PatientSearch]([lastName],[firstName])
go

create index [IX_PatientSearch_Death] on [App].[PatientSearch]([deceased],[deathDateTime])
go

create index [IX_PatientSearch_GenderDOB] on [App].[PatientSearch]([gender],[birthDateTime])
go

create index [IX_PatientSearch_SSN] on [App].[PatientSearch]([SSN])
go
