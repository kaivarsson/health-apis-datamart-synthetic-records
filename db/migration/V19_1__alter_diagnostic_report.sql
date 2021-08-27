ALTER TABLE [App].[DiagnosticReport_V2] ALTER COLUMN [CDWIdNumber] bigint NOT NULL
GO

ALTER TABLE [App].[DiagnosticReport_V2] ALTER COLUMN [CDWIdResourceCode] char(1) NOT NULL
GO

ALTER TABLE [App].[DiagnosticReport_V2] DROP constraint PK_DiagnosticReport_V2
GO

ALTER TABLE [App].[DiagnosticReport_V2] ADD constraint PK_DiagnosticReport_V2 primary key clustered (CDWIdNumber, CDWIdResourceCode)
GO
