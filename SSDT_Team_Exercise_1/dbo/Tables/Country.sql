﻿CREATE TABLE [dbo].[Country]
(
	[Id] UNIQUEIDENTIFIER NOT NULL CONSTRAINT PK_Country_Id PRIMARY KEY CLUSTERED DEFAULT NEWID(),
	CountryCode NVARCHAR(3) NOT NULL,
	[Name] NVARCHAR(50) NOT NULL,
	CreatedDate DATETIME NOT NULL DEFAULT GETUTCDATE()
)
