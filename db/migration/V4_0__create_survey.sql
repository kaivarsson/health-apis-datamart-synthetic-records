/* ==========================================================================

Create date:    01/02/2020
Table:          Survey
Description:    

Data Definition:
Column Name        | Description
-------------------|-----------------------------------------------------
PatientFullICN     | The patient's VA internal control number.
-------------------|-----------------------------------------------------
SurveyName         | The type of survey that was performed (i.e. Morse 
                   | Fall Scale). 
-------------------|-----------------------------------------------------
CDWId              | Primary Key. The CDW identifier for the survey.
-------------------|-----------------------------------------------------
Sta3n              | The station identifier of where the survey was 
                   | performed.
-------------------|-----------------------------------------------------
SurveyRecordedDate | The date the survey was recorded by the person 
                   | administering the survey
-------------------|-----------------------------------------------------
Survey             | The json formatted survey datamart resource payload.
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

Create table [app].[Survey]
(
        [CDWId] varchar(50) not null,
        [PatientFullICN] varchar(50) not null,
        [DateUTC] datetime null,
        [SurveyName] varchar(50) not null,
        [Sta3n] varchar(50) not null,
        [SurveyRecordedDate] bigint not null,
        [Survey] varchar(max) null,
        [ETLBatchId] int null,
        [ETLChunkNum] int null,
        [ETLCreateDate] datetime null,
        [ETLEditDate] datetime null,
        constraint PK_Survey primary key clustered (CDWId)
)
go

Create index [IX_Survey_PatientFullICN] on [App].[Survey]([PatientFullICN])
go

create index [IX_Survey_Recorded_Date] on [App].[Survey]([SurveyRecordedDate])
go

create index [IX_Survey_Type] on [App].[Survey]([SurveyName])
go

create index [IX_Survey_Facility] on [App].[Survey]([Sta3n])
go


