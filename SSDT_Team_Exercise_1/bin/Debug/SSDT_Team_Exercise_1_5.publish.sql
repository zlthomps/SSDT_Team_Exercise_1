﻿/*
Deployment script for SSDT_Team_Exercise_1

This code was generated by a tool.
Changes to this file may cause incorrect behavior and will be lost if
the code is regenerated.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "SSDT_Team_Exercise_1"
:setvar DefaultFilePrefix "SSDT_Team_Exercise_1"
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
USE [$(DatabaseName)];


GO
PRINT N'Dropping DF__Salespers__isAct__47DBAE45...';


GO
ALTER TABLE [Person].[Salesperson] DROP CONSTRAINT [DF__Salespers__isAct__47DBAE45];


GO
PRINT N'Creating Default Constraint on [Person].[Salesperson]....';


GO
ALTER TABLE [Person].[Salesperson]
    ADD DEFAULT CAST(1 AS BIT) FOR [isActive];


GO
PRINT N'Update complete.';


GO
