DROP TABLE [App].[Medication]
GO

CREATE TABLE [App].[Medication]
(
  [CDWId] varchar(50) not null,
  [CDWIdNumber] bigint null,
  [CDWIdResourceCode] char(1) null,
  [Medication] varchar(max) null,
  constraint PK_Medication primary key clustered (CDWId)
)
GO
