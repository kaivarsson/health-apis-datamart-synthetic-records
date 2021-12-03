ALTER TABLE [App].[AllergyIntolerance]
  DROP COLUMN
   [ETLBatchId]
  ,[ETLChunkNum]
  ,[ETLCreateDate]
  ,[ETLEditDate]
GO

ALTER TABLE [App].[AllergyIntolerance] ADD [LastUpdated] [date] NULL
GO
