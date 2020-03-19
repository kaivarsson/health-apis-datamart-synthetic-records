/*
==========================================================================
Data Definition:
Column Name      | Description
-----------------|-----------------------------------------------------
PatientFullICN   | The patient's VA internal control number
-----------------|-----------------------------------------------------
LastName         | the patient's last name
-----------------|-----------------------------------------------------
FirstName        | the patient's first and middle name
-----------------|-----------------------------------------------------
Birthdate        | the patient's date and time of birth in UTC.
                 | should the time be 0 or omitted then no time was
				         | given
-----------------|-----------------------------------------------------
Gender           | indicates the patient's gender. 'M' for male, 'F'
                 | for female
-----------------------------------------------------------------------
LastUpdated      | indicates the last time this record was modified
-----------------------------------------------------------------------
Patient          | json payload containing the patient record
-----------------------------------------------------------------------


*/

CREATE TABLE [app].[Patient](
  [PatientFullICN] [varchar](50),
  [FullName] [varchar](152) NULL,
  [LastName] [varchar](50) NULL,
  [FirstName] [varchar](50) NULL,
  [Birthdate] [datetime2](0) NULL,
  [Gender] [varchar](50) NULL,
  [LastUpdated] smalldatetime DEFAULT GETUTCDATE(),
  [Patient] [varchar](max) NULL
)
GO

CREATE INDEX [IX_Patient_PatientFullICN] on [App].[Patient]([PatientFullICN])
GO

CREATE INDEX [IX_Patient_GivenAndGender] on [App].[Patient]([FirstName],[Gender])
GO

CREATE INDEX [IX_Patient_FamilyAndGender] on [App].[Patient]([LastName],[Gender])
GO

CREATE INDEX [IX_Patient_NameAndBirthdate] on [App].[Patient]([LastName],[Birthdate])
GO

CREATE INDEX [IX_Patient_NameAndGender] on [App].[Patient]([LastName],[Gender])
GO
