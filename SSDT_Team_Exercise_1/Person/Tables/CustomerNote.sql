﻿CREATE TABLE [Person].[CustomerNote]
(
	[Id] UNIQUEIDENTIFIER NOT NULL CONSTRAINT PK_CustomerNote_Id PRIMARY KEY CLUSTERED DEFAULT NEWID(),
	[CustomerId] UNIQUEIDENTIFIER NOT NULL CONSTRAINT FK_CustomerNote_CustomerId_Customer_Id FOREIGN KEY REFERENCES Person.Customer(Id),
	[Note] NVARCHAR(MAX),
	[CreatedDate] DATETIME NOT NULL,
	[ModifiedDate] DATETIME NOT NULL
)
