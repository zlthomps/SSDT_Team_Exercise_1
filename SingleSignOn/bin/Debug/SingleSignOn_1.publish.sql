﻿/*
Deployment script for SingleSignOn

This code was generated by a tool.
Changes to this file may cause incorrect behavior and will be lost if
the code is regenerated.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "SingleSignOn"
:setvar DefaultFilePrefix "SingleSignOn"
:setvar DefaultDataPath "C:\Users\zthompson\AppData\Local\Microsoft\VisualStudio\SSDT\"
:setvar DefaultLogPath "C:\Users\zthompson\AppData\Local\Microsoft\VisualStudio\SSDT\"

GO
:on error exit
GO
/*
Detect SQLCMD mode and disable script execution if SQLCMD mode is not supported.
To re-enable the script after enabling SQLCMD mode, execute the following:
SET NOEXEC OFF; 
*/
:setvar __IsSqlCmdEnabled "True"
GO
IF N'$(__IsSqlCmdEnabled)' NOT LIKE N'True'
    BEGIN
        PRINT N'SQLCMD mode must be enabled to successfully execute this script.';
        SET NOEXEC ON;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET ARITHABORT ON,
                CONCAT_NULL_YIELDS_NULL ON,
                CURSOR_DEFAULT LOCAL 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET PAGE_VERIFY NONE,
                DISABLE_BROKER 
            WITH ROLLBACK IMMEDIATE;
    END


GO
USE [$(DatabaseName)];


GO
PRINT N'Creating [dbo].[Role]...';


GO
CREATE TABLE [dbo].[Role] (
    [Id]           UNIQUEIDENTIFIER NOT NULL,
    [Name]         NVARCHAR (50)    NOT NULL,
    [CreatedDate]  DATE             NOT NULL,
    [ModifiedDate] DATE             NOT NULL,
    CONSTRAINT [PK_Role_Id] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[User]...';


GO
CREATE TABLE [dbo].[User] (
    [Id]            UNIQUEIDENTIFIER NOT NULL,
    [Username]      NVARCHAR (50)    NOT NULL,
    [Password]      NVARCHAR (50)    NOT NULL,
    [RoleId]        UNIQUEIDENTIFIER NULL,
    [LastLogonDate] DATE             NOT NULL,
    [CreatedDate]   DATE             NOT NULL,
    CONSTRAINT [PK_User_Id] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating Default Constraint on [dbo].[Role]....';


GO
ALTER TABLE [dbo].[Role]
    ADD DEFAULT NEWID() FOR [Id];


GO
PRINT N'Creating Default Constraint on [dbo].[User]....';


GO
ALTER TABLE [dbo].[User]
    ADD DEFAULT NEWID() FOR [Id];


GO
PRINT N'Creating FK_User_RoleId_Role_Id...';


GO
ALTER TABLE [dbo].[User] WITH NOCHECK
    ADD CONSTRAINT [FK_User_RoleId_Role_Id] FOREIGN KEY ([RoleId]) REFERENCES [dbo].[Role] ([Id]);


GO
PRINT N'Creating [dbo].[usp_DeleteRole]...';


GO
CREATE PROCEDURE [dbo].[usp_DeleteRole]
AS

DELETE FROM [Role] 
FROM [Role] AS r
WHERE NOT EXISTS (SELECT 
						* 
				  FROM [User] AS u 
					WHERE u.RoleId = r.Id)
GO
PRINT N'Creating [dbo].[usp_InsertLogin]...';


GO
CREATE PROCEDURE [dbo].[usp_InsertLogin]
@User NVARCHAR(55),@Password NVARCHAR(55),@RoleId UNIQUEIDENTIFIER, @LastLogonDate DATE, @CreatedDate DATE 

AS

INSERT INTO [User] (Username, [Password], RoleId, LastLogonDate, CreatedDate)
VALUES(@User,@Password,@RoleId,@LastLogonDate, @CreatedDate)
GO
PRINT N'Creating [dbo].[usp_InsertRole]...';


GO
CREATE PROCEDURE [dbo].[usp_InsertRole]
@Name NVARCHAR(55),@CreatedDate DATE, @ModifiedDate DATE
AS
	INSERT INTO [Role] (Name, CreatedDate, ModifiedDate)
	VALUES(@Name, @CreatedDate, @ModifiedDate)
GO
PRINT N'Creating [dbo].[usp_UpdateLogin]...';


GO
CREATE PROCEDURE [dbo].[usp_UpdateLogin]
@Username NVARCHAR(55), @NewPassword NVARCHAR(55)

AS

UPDATE [User] 
SET [Password] = @NewPassword
WHERE UserName = @Username
GO
PRINT N'Creating [dbo].[usp_UpdateRole]...';


GO
CREATE PROCEDURE [dbo].[usp_UpdateRole]
	@ExistingName NVARCHAR(55),
	@NewName NVARCHAR(55)
AS
	UPDATE [Role] SET Name = @NewName
	WHERE Name = @ExistingName
GO
PRINT N'Checking existing data against newly created constraints';


GO
USE [$(DatabaseName)];


GO
ALTER TABLE [dbo].[User] WITH CHECK CHECK CONSTRAINT [FK_User_RoleId_Role_Id];


GO
PRINT N'Update complete.';


GO
