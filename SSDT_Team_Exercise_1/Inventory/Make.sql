﻿CREATE TABLE [Inventory].[Make]
(
	[Id] UNIQUEIDENTIFIER NOT NULL CONSTRAINT PK_Make_Id PRIMARY KEY CLUSTERED DEFAULT NEWID(),
	[Name] NVARCHAR(50) NOT NULL,
	[CreatedDate] DATETIME NOT NULL DEFAULT GETUTCDATE(),

)