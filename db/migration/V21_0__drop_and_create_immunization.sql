drop table [App].[Immunization]
go

Create table [App].[Immunization]
(
    [CDWId] varchar(26) not null,
    [CDWIdNumber] bigint null,
    [CDWIdResourceCode] char(1) null,
    [PatientFullICN] varchar(50) not null,
    [DateUTC] datetime null,
    [Immunization] varchar(max) null,
    [CVXCode] varchar(50) null,
    constraint PK_Immunization primary key clustered (CDWId)
)

Create Index [IX_Immunization_PatientFullICN] on [App].[Immunization]([PatientFullICN])
go

Create Index [IX_Immunization_DateUTC] on [App].[Immunization]([DateUTC])
go
