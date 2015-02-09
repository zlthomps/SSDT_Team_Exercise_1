﻿CREATE TABLE [dbo].[User]
(
	[Id] UNIQUEIDENTIFIER NOT NULL CONSTRAINT PK_User_Id PRIMARY KEY DEFAULT NEWID(),
	[Username] NVARCHAR(50) NOT NULL,
	[Password] NVARCHAR(50) NOT NULL,
	[RoleId] UNIQUEIDENTIFIER CONSTRAINT FK_User_RoleId_Role_Id FOREIGN KEY REFERENCES dbo.[Role](id),
	[LastLogonDate] DATE NOT NULL,
	[CreatedDate] DATE NOT NULL
)