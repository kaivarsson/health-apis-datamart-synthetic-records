ALTER TABLE [App].[MedicationOrder]
  DROP COLUMN
   [ETLBatchId]
  ,[ETLChunkNum]
  ,[ETLCreateDate]
  ,[ETLEditDate]
GO

ALTER TABLE [App].[MedicationOrder] ADD [LastUpdated] [date] NULL
GO
