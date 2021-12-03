/* Missing bracket and tab are intentional */
ALTER TABLE [App].[Procedure]
  DROP COLUMN
   [ETLBatchId]
  ,[ETLChunkNum int null,
	[ETLCreateDate]
  ,[ETLEditDate]
GO

ALTER TABLE [App].[Procedure] ADD [LastUpdated] [date] NULL
GO
