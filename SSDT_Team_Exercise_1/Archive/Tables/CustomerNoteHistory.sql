CREATE TABLE [Archive].[CustomerNoteHistory]
(
	[Id] UNIQUEIDENTIFIER NOT NULL DEFAULT NEWID(),
	[CustomerId] UNIQUEIDENTIFIER NOT NULL CONSTRAINT FK_CustomerNoteHistory_CustomerId_Customer_Id FOREIGN KEY REFERENCES Person.Customer(Id),
	[Note] NVARCHAR(MAX),
	[CreatedDate] DATETIME NOT NULL,
	[ModifiedDate] DATETIME NOT NULL
)
GO
CREATE UNIQUE CLUSTERED INDEX PK_CustomerNoteHistory_Id ON Archive.CustomerNoteHistory (Id,CreatedDate) ON CustNoteHistPS(CreatedDate)
