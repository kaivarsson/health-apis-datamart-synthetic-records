ALTER TABLE [App].[Immunization] ALTER COLUMN [CDWIdNumber] bigint NOT NULL
GO

ALTER TABLE [App].[Immunization] ALTER COLUMN [CDWIdResourceCode] char(1) NOT NULL
GO

ALTER TABLE [App].[Immunization] DROP constraint PK_Immunization
GO

ALTER TABLE [App].[Immunization] ADD constraint PK_Immunization primary key clustered (CDWIdNumber, CDWIdResourceCode)
GO

ALTER TABLE [App].[Immunization] ALTER COLUMN [CDWId] varchar(26) NULL
GO
