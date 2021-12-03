ALTER TABLE [App].[MedicationStatement]
  DROP COLUMN
   [ETLBatchId]
  ,[ETLChunkNum]
  ,[ETLCreateDate]
  ,[ETLEditDate]
GO

ALTER TABLE [App].[MedicationStatement] ADD [LastUpdated] [date] NULL
GO
