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
PRINT N'Dropping DF__Salespers__isAct__1A14E395...';


GO
ALTER TABLE [Person].[Salesperson] DROP CONSTRAINT [DF__Salespers__isAct__1A14E395];


GO
PRINT N'Creating [Inventory].[Color]...';


GO
CREATE TABLE [Inventory].[Color] (
    [Id]          UNIQUEIDENTIFIER NOT NULL,
    [Name]        NVARCHAR (50)    NOT NULL,
    [CreatedDate] DATETIME         NOT NULL,
    CONSTRAINT [PK_Color_Id] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [Inventory].[Make]...';


GO
CREATE TABLE [Inventory].[Make] (
    [Id]          UNIQUEIDENTIFIER NOT NULL,
    [Name]        NVARCHAR (50)    NOT NULL,
    [CreatedDate] DATETIME         NOT NULL,
    CONSTRAINT [PK_Make_Id] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [Inventory].[Model]...';


GO
CREATE TABLE [Inventory].[Model] (
    [Id]          UNIQUEIDENTIFIER NOT NULL,
    [Name]        NVARCHAR (50)    NOT NULL,
    [CreatedDate] DATETIME         NOT NULL,
    CONSTRAINT [PK_Model_Id] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [Inventory].[Vehicle]...';


GO
CREATE TABLE [Inventory].[Vehicle] (
    [Id]      UNIQUEIDENTIFIER NOT NULL,
    [MakeId]  UNIQUEIDENTIFIER NOT NULL,
    [ModelId] UNIQUEIDENTIFIER NOT NULL,
    [Year]    SMALLINT         NOT NULL,
    [ColorId] UNIQUEIDENTIFIER NOT NULL,
    [Price]   MONEY            NOT NULL,
    CONSTRAINT [PK_Vehicle_Id] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [Sales].[Opportunity]...';


GO
CREATE TABLE [Sales].[Opportunity] (
    [Id]                UNIQUEIDENTIFIER NOT NULL,
    [CustomerId]        UNIQUEIDENTIFIER NOT NULL,
    [VehicleId]         UNIQUEIDENTIFIER NOT NULL,
    [OpportunityTypeId] UNIQUEIDENTIFIER NOT NULL,
    [CreatedDate]       DATETIME         NOT NULL,
    CONSTRAINT [PK_Opportunity_Id] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [Sales].[OpportunityType]...';


GO
CREATE TABLE [Sales].[OpportunityType] (
    [Id]   UNIQUEIDENTIFIER NOT NULL,
    [Name] NVARCHAR (50)    NOT NULL,
    CONSTRAINT [PK_OpportunityType_Id] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating Default Constraint on [Person].[Salesperson]....';


GO
ALTER TABLE [Person].[Salesperson]
    ADD DEFAULT CAST(1 AS BIT) FOR [isActive];


GO
PRINT N'Creating Default Constraint on [Inventory].[Color]....';


GO
ALTER TABLE [Inventory].[Color]
    ADD DEFAULT NEWID() FOR [Id];


GO
PRINT N'Creating Default Constraint on [Inventory].[Color]....';


GO
ALTER TABLE [Inventory].[Color]
    ADD DEFAULT GETUTCDATE() FOR [CreatedDate];


GO
PRINT N'Creating Default Constraint on [Inventory].[Make]....';


GO
ALTER TABLE [Inventory].[Make]
    ADD DEFAULT NEWID() FOR [Id];


GO
PRINT N'Creating Default Constraint on [Inventory].[Make]....';


GO
ALTER TABLE [Inventory].[Make]
    ADD DEFAULT GETUTCDATE() FOR [CreatedDate];


GO
PRINT N'Creating Default Constraint on [Inventory].[Model]....';


GO
ALTER TABLE [Inventory].[Model]
    ADD DEFAULT NEWID() FOR [Id];


GO
PRINT N'Creating Default Constraint on [Inventory].[Model]....';


GO
ALTER TABLE [Inventory].[Model]
    ADD DEFAULT GETUTCDATE() FOR [CreatedDate];


GO
PRINT N'Creating Default Constraint on [Inventory].[Vehicle]....';


GO
ALTER TABLE [Inventory].[Vehicle]
    ADD DEFAULT NEWID() FOR [Id];


GO
PRINT N'Creating Default Constraint on [Sales].[Opportunity]....';


GO
ALTER TABLE [Sales].[Opportunity]
    ADD DEFAULT NEWID() FOR [Id];


GO
PRINT N'Creating Default Constraint on [Sales].[Opportunity]....';


GO
ALTER TABLE [Sales].[Opportunity]
    ADD DEFAULT GETUTCDATE() FOR [CreatedDate];


GO
PRINT N'Creating Default Constraint on [Sales].[OpportunityType]....';


GO
ALTER TABLE [Sales].[OpportunityType]
    ADD DEFAULT NEWID() FOR [Id];


GO
PRINT N'Creating FK_Vehicle_MakeId_Make_Id...';


GO
ALTER TABLE [Inventory].[Vehicle] WITH NOCHECK
    ADD CONSTRAINT [FK_Vehicle_MakeId_Make_Id] FOREIGN KEY ([MakeId]) REFERENCES [Inventory].[Make] ([Id]);


GO
PRINT N'Creating FK_Vehicle_ModelId_Model_Id...';


GO
ALTER TABLE [Inventory].[Vehicle] WITH NOCHECK
    ADD CONSTRAINT [FK_Vehicle_ModelId_Model_Id] FOREIGN KEY ([ModelId]) REFERENCES [Inventory].[Model] ([Id]);


GO
PRINT N'Creating FK_Vehicle_ColorId_Color_Id...';


GO
ALTER TABLE [Inventory].[Vehicle] WITH NOCHECK
    ADD CONSTRAINT [FK_Vehicle_ColorId_Color_Id] FOREIGN KEY ([ColorId]) REFERENCES [Inventory].[Color] ([Id]);


GO
PRINT N'Creating FK_Opportunity_CustomerId_Customer_Id...';


GO
ALTER TABLE [Sales].[Opportunity] WITH NOCHECK
    ADD CONSTRAINT [FK_Opportunity_CustomerId_Customer_Id] FOREIGN KEY ([CustomerId]) REFERENCES [Person].[Customer] ([Id]);


GO
PRINT N'Creating FK_Opportunity_VehicleId_Vehicle_Id...';


GO
ALTER TABLE [Sales].[Opportunity] WITH NOCHECK
    ADD CONSTRAINT [FK_Opportunity_VehicleId_Vehicle_Id] FOREIGN KEY ([VehicleId]) REFERENCES [Inventory].[Vehicle] ([Id]);


GO
PRINT N'Creating FK_Opportunity_OpportunityTypeId_OpportunityType_Id...';


GO
ALTER TABLE [Sales].[Opportunity] WITH NOCHECK
    ADD CONSTRAINT [FK_Opportunity_OpportunityTypeId_OpportunityType_Id] FOREIGN KEY ([OpportunityTypeId]) REFERENCES [Sales].[OpportunityType] ([Id]);


GO
PRINT N'Checking existing data against newly created constraints';


GO
USE [$(DatabaseName)];


GO
ALTER TABLE [Inventory].[Vehicle] WITH CHECK CHECK CONSTRAINT [FK_Vehicle_MakeId_Make_Id];

ALTER TABLE [Inventory].[Vehicle] WITH CHECK CHECK CONSTRAINT [FK_Vehicle_ModelId_Model_Id];

ALTER TABLE [Inventory].[Vehicle] WITH CHECK CHECK CONSTRAINT [FK_Vehicle_ColorId_Color_Id];

ALTER TABLE [Sales].[Opportunity] WITH CHECK CHECK CONSTRAINT [FK_Opportunity_CustomerId_Customer_Id];

ALTER TABLE [Sales].[Opportunity] WITH CHECK CHECK CONSTRAINT [FK_Opportunity_VehicleId_Vehicle_Id];

ALTER TABLE [Sales].[Opportunity] WITH CHECK CHECK CONSTRAINT [FK_Opportunity_OpportunityTypeId_OpportunityType_Id];


GO
PRINT N'Update complete.';


GO
