CREATE TABLE [${db_name}].[app].[AllergyIntolerance](
	[CDWId] [varchar](50) NOT NULL,
	[PatientFullICN] [varchar](50) NOT NULL,
	[AllergyIntolerance] [varchar](max) NULL,
	[ETLBatchId] [int] NULL,
	[ETLChunkNum] [int] NULL,
	[ETLCreateDate] [datetime2](0) NULL,
	[ETLEditDate] [datetime2](0) NULL,
 CONSTRAINT [PK__AllergyI__27E9E52C46F78693] PRIMARY KEY CLUSTERED
(
	[CDWId] ASC
)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

CREATE NONCLUSTERED INDEX [IX_AllergyIntolerance_PatientFullICN] ON [${db_name}].[app].[AllergyIntolerance]
(
	[PatientFullICN] ASC
)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
