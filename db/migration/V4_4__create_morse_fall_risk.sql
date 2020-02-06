
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
