/* ==========================================================================

Create date:    01/15/2020
Table:          FallRisk
Author:         jhulbert-va
Description:    

Data Definition:
Column Name        | Description
-------------------|-----------------------------------------------------
PatientFullICN     | The patient's VA internal control number.
-------------------|-----------------------------------------------------
CDWId              | Primary Key. The CDW identifier for the survey.
-------------------|-----------------------------------------------------
Sta3n              | The station identifier of where the survey was 
                   | performed.
-------------------|-----------------------------------------------------
DateUTC            | The date the survey was recorded by the person 
                   | administering the survey
-------------------|-----------------------------------------------------
MorseScore         | The Morse Fall-Risk score determined by the patients
                   | fall-risk survey. 
-------------------|-----------------------------------------------------                                                                                                                                           
MorseCategory      | The category that the patients fall-risk score has
                   | slotted them in (i.e. low, medium, high).                                
-------------------|-----------------------------------------------------                                                                                                                                           
FallRisk           | The json represention of the patients fall-risk.
-------------------|-----------------------------------------------------
ETLBatchId         | ETL process BatchId
-------------------|-----------------------------------------------------
ETLChunkNum        | ETL process chunk number  Used for managing initial 
                   | loading and updates of records
-------------------|-----------------------------------------------------
ETLCreateDate      | Date and time in UTC ETL record was first created
-------------------|-----------------------------------------------------
ETLEditDate        | Date and time in UTC ETL batch process last updated
                   | the record
-------------------|-----------------------------------------------------

========================================================================== */

Create table [app].[FallRisk]
(
        [CDWId] varchar(50) not null,
        [PatientFullICN] varchar(50) not null,
        [DateUTC] datetime null,
        [Sta3n] varchar(50) not null,
	[MorseScore] int not null,
        [MorseCategory] varchar(50) not null,
        [FallRisk] varchar(max) null,
        [ETLBatchId] int null,
        [ETLChunkNum] int null,
        [ETLCreateDate] datetime null,
        [ETLEditDate] datetime null,
        constraint PK_FallRisk primary key clustered (CDWId)
)
go

Create index [IX_FallRisk_PatientFullICN] on [App].[FallRisk]([PatientFullICN])
go

create index [IX_FallRisk_Recorded_Date] on [App].[FallRisk]([DateUTC])
go

create index [IX_FallRisk_Facility] on [App].[FallRisk]([Sta3n])
go


