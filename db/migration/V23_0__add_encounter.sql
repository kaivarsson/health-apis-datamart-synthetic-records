CREATE TABLE [App].[Encounter](
    [CDWIdNumber] [bigint] NOT NULL,
    [CDWIdResourceCode] [char](1) NOT NULL,
    [PatientFullICN] [varchar](50) NOT NULL,
    [StartDateTime] [datetime2](0) NULL,
    [EndDateTime] [datetime2](0) NULL,
    [LastUpdated] [date] NOT NULL,
    [Encounter] varchar(max)
    CONSTRAINT PK_Encounter PRIMARY KEY CLUSTERED (CDWIdNumber, CDWIdResourceCode)
)
GO
