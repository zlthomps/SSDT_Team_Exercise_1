﻿CREATE TABLE [dbo].[Role]
(
	[Id] UNIQUEIDENTIFIER NOT NULL CONSTRAINT PK_Role_Id PRIMARY KEY DEFAULT NEWID(),
	[Name] NVARCHAR(50) NOT NULL,
	[CreatedDate] DATE NOT NULL,
	[ModifiedDate] DATE NOT NULL
)