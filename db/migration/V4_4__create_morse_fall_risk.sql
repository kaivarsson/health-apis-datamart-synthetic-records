/* ==========================================================================

Create date:    02/07/2020
Table:          FallRisk
Author:         ilaflamme-va
Description:

Data Definition:
Column Name        | Description
-------------------|-----------------------------------------------------
CDWId              | Primary Key. The CDW identifier for the record.
-------------------|-----------------------------------------------------
Sta3n              | The station identifier of where the survey was
                   | performed.
-------------------|-----------------------------------------------------
StationName        | The name of the station where the survey was
                   | performed.
-------------------|-----------------------------------------------------
PatientName        | Name of the patient receiving the survey.
-------------------|-----------------------------------------------------
PatientFullICN     | The patients unique ICN
-------------------|-----------------------------------------------------
LastFour           | Last four digits of the patient's government-issued
                   | Social Security Number.
-------------------|-----------------------------------------------------
CurrentWard        | The hospital ward currently housing the patient.
-------------------|-----------------------------------------------------
RoomBed            | Room and bed assigned to the patient. (Rm 123 Bd 456)
-------------------|-----------------------------------------------------
AdmitDateTime      | Datetime the patient was admitted.
-------------------|-----------------------------------------------------
AttendingProvider  | Name of provider assisting the patient.
-------------------|-----------------------------------------------------
CurrentlySpecialty | Skill specialty of the AttendingProvider
-------------------|-----------------------------------------------------
MorseAdmitScore    | Morse score calculated for the patient.
-------------------|-----------------------------------------------------
MorseCategory      | Severity rating of the score. (High/Medium/Low)
-------------------|-----------------------------------------------------
MorseAdmitDateTime | Datetime that the morse score was generated and
                   | assigned to the patient.
-------------------|-----------------------------------------------------
Payload            | Json payload containing the fall-risk record.
-------------------|-----------------------------------------------------

========================================================================== */

CREATE TABLE [app].[MorseFallRisk]
(
        [CDWId] bigint NOT NULL,
        [Sta3n] smallint NOT NULL,
        [StationName] varchar(50) NULL,
        [PatientName] varchar(100) NULL,
        [PatientFullICN] varchar(50) NULL,
        [LastFour] varchar(4) NULL,
        [CurrentWard] nvarchar(30) NULL,
        [RoomBed] varchar(50),
        [AdmitDateTime] datetimeoffset NULL,
        [AttendingProvider] varchar(100),
        [CurrentSpecialty] varchar(100) NULL,
        [MorseAdmitScore] smallint NULL,
        [MorseCategory] varchar(6) NULL,
        [MorseAdmitDateTime] datetimeoffset NULL,
        [Payload] nvarchar(max) NULL
)
GO

CREATE UNIQUE CLUSTERED INDEX idx_FallRisk_CDWId ON App.MorseFallRisk(CDWId)
WITH (MAXDOP = 0, FILLFACTOR = 95, STATISTICS_NORECOMPUTE = ON, SORT_IN_TEMPDB = ON, DATA_COMPRESSION = PAGE)
GO

CREATE INDEX idx_MorseFallRisk_Sta3n ON App.MorseFallRisk(Sta3n)
WITH (MAXDOP = 0, FILLFACTOR = 95, STATISTICS_NORECOMPUTE = ON, SORT_IN_TEMPDB = ON, DATA_COMPRESSION = PAGE)
GO

CREATE INDEX idx_PatientFullICN_Sta3n ON App.MorseFallRisk(PatientFullICN)
WITH (MAXDOP = 0, FILLFACTOR = 95, STATISTICS_NORECOMPUTE = ON, SORT_IN_TEMPDB = ON, DATA_COMPRESSION = PAGE)
GO
