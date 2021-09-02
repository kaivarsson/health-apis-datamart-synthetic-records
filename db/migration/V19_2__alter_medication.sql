ALTER TABLE [App].[Medication] ALTER COLUMN [CDWIdNumber] bigint NOT NULL
GO

ALTER TABLE [App].[Medication] ALTER COLUMN [CDWIdResourceCode] char(1) NOT NULL
GO

ALTER TABLE [App].[Medication] DROP constraint PK_Medication
GO

ALTER TABLE [App].[Medication] ADD constraint PK_Medication primary key clustered (CDWIdNumber, CDWIdResourceCode)
GO
