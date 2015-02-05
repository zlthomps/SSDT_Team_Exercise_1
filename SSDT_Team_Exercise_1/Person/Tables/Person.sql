--Exercise 8a-8e

CREATE TABLE [Person].[Person]
(
	[Id] UNIQUEIDENTIFIER NOT NULL CONSTRAINT PK_Person_Id PRIMARY KEY CLUSTERED DEFAULT NEWID(), 
    [IndexId] BIGINT NOT NULL IDENTITY(1,1), 
    [FirstName] NVARCHAR(50) NOT NULL, 
    [LastName] NVARCHAR(50) NULL, 
    [Birthdate] DATE NULL, 
    CONSTRAINT [CK_Person_ValidateAge] CHECK (DATEDIFF(YEAR,[Birthdate],GETDATE()) >= 18),
)


GO

CREATE INDEX [IX_Person_IndexId] ON [Person].[Person] ([IndexId])
