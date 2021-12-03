/* Missing bracket is intentional */
ALTER TABLE [App].[Location]
DROP COLUMN
  [ETLBatchId]
  ,[ETLChunkNum int null,
  [ETLCreateDate]
GO

ALTER TABLE [App].[Location] ADD [LastUpdated] [date] NULL
GO
