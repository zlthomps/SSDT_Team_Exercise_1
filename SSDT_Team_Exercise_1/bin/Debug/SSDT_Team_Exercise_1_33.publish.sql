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
:setvar SingleSignOn "SingleSignOn"
:setvar DatabaseName "SSDT_Team_Exercise_1"
:setvar DefaultFilePrefix "SSDT_Team_Exercise_1"
:setvar DefaultDataPath "C:\Program Files (x86)\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\"
:setvar DefaultLogPath "C:\Program Files (x86)\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\"

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
PRINT N'Rename refactoring operation with key a7be8ed6-617b-407a-b64c-f79f88c021e2 is skipped, element [Person].[Person].[FName] (SqlSimpleColumn) will not be renamed to [FirstName]';


GO
PRINT N'Rename refactoring operation with key e59fd519-2d05-400a-af98-67f016780c9e is skipped, element [Person].[Person].[LName] (SqlSimpleColumn) will not be renamed to [LastName]';


GO
PRINT N'Dropping unnamed constraint on [Person].[Salesperson]...';


GO
ALTER TABLE [Person].[Salesperson] DROP CONSTRAINT [DF__Salespers__isAct__38996AB5];


GO
PRINT N'Creating unnamed constraint on [Person].[Salesperson]...';


GO
ALTER TABLE [Person].[Salesperson]
    ADD DEFAULT CAST(1 AS BIT) FOR [isActive];


GO
PRINT N'Creating [Person].[vw_Customers]...';


GO
CREATE VIEW [Person].[vw_Customers]
	AS

SELECT  Person.[FirstName] AS FirstName ,
        Person.[LastName] AS LastName ,
        ISNULL(Email.EmailAddress,N'') AS Email,
		ISNULL(Phone.PhoneNumber,N'') AS Phone,
		ISNULL(Address.Street + SPACE(1) + Address.City + N',' + StateProv.Name + SPACE(1) + Address.PostalCode,N'') AS [Address]
FROM    Person.Person AS Person
        LEFT OUTER JOIN Person.Customer AS Customer ON Customer.PersonId = Person.Id
        LEFT OUTER JOIN Person.CustomerEmail AS Email ON Email.CustomerId = Customer.Id
		LEFT OUTER JOIN Person.CustomerAddress AS [Address] ON Address.CustomerId = Customer.Id
		LEFT OUTER JOIN Person.CustomerPhone AS Phone ON Phone.CustomerId = Customer.Id
		LEFT OUTER JOIN dbo.StateProvince AS StateProv ON [Address].StateProvinceId = StateProv.Id
GO
PRINT N'Creating [Person].[vw_SelectSalespersonLogin]...';


GO
CREATE VIEW [Person].[vw_SelectSalespersonLogin]
AS
SELECT u.Username AS Username,
		u.[Password] AS [Password] 		
FROM Person.Salesperson AS s
LEFT OUTER JOIN [$(SingleSignOn)].dbo.[User] AS u
	ON s.LoginId = u.Id
GO
PRINT N'Creating [Sales].[vw_CustomersOpportunities]...';


GO
CREATE VIEW [Sales].[vw_CustomersOpportunities]
	AS 
	
	SELECT 
		Person.[FirstName],
		Person.[LastName],
		OppType.Name AS OppType,
		Vehic.Year AS VehicleYear,
		Make.Name AS Make,
		Model.Name AS Model,
		opps.CreatedDate AS OppOpen
	FROM Person.Person AS Person
	INNER JOIN Person.Customer AS Cust
		ON Cust.PersonId = Person.Id
	INNER JOIN Sales.Opportunity AS Opps
		ON Opps.CustomerId = Cust.Id
	INNER JOIN Sales.OpportunityType AS OppType
		ON OppType.Id = Opps.OpportunityTypeId
	INNER JOIN Inventory.Vehicle AS Vehic
		ON Vehic.Id = Opps.VehicleId
	INNER JOIN Inventory.Make AS Make
		ON Make.Id = Vehic.MakeId
	INNER JOIN Inventory.Model AS Model
		ON Model.Id = Vehic.ModelId
GO
PRINT N'Creating [dbo].[usp_ArchiveCustomerNote]...';


GO

CREATE PROCEDURE usp_ArchiveCustomerNote
AS
    BEGIN

        DECLARE @r INT
        SET @r = 1
        WHILE @r > 0
            BEGIN 
                BEGIN TRANSACTION;        
                WAITFOR DELAY '00:00:01'
        
                INSERT  INTO Archive.CustomerNoteHistory
                        ( CustomerId ,
                          Note ,
                          CreatedDate ,
                          ModifiedDate
                        )
                        SELECT TOP 10000
                                CustomerId ,
                                Note ,
                                CreatedDate ,
                                ModifiedDate
                        FROM    Person.CustomerNote AS cn
                        WHERE   cn.CreatedDate <= DATEADD(YEAR, -1, GETDATE())

                SET @r = @@ROWCOUNT
                COMMIT TRANSACTION
            END 

        DECLARE @i INT
        SET @i = 1
        WHILE @i > 0
            BEGIN 
                BEGIN TRANSACTION;        
                WAITFOR DELAY '00:00:01'
        
                DELETE TOP ( 10000 )
                        Person.CustomerNote
                FROM    Person.CustomerNote AS cn
                WHERE   cn.CreatedDate <= DATEADD(YEAR, -1, GETDATE())

                SET @r = @@ROWCOUNT
                COMMIT TRANSACTION
            END 

    END
GO
PRINT N'Creating [dbo].[usp_ArchiveCustomerNoteSwitch]...';


GO

CREATE PROCEDURE usp_ArchiveCustomerNoteSwitch
AS
    BEGIN

        SET XACT_ABORT ON

        DECLARE @MinBoundaryCustNote NVARCHAR(25)
        DECLARE @NextBoundaryCustNote NVARCHAR(25)
        DECLARE @MinBoundaryCustNoteArchive NVARCHAR(25)
        DECLARE @NextBoundaryCustNoteArchive NVARCHAR(25)
        DECLARE @Constraint_Sqlsmtpt NVARCHAR(MAX)


        BEGIN TRY
            BEGIN TRANSACTION

----Person.CustomerNote----
            SET @MinBoundaryCustNote =
                ( SELECT    MIN(CONVERT(VARCHAR(10), CAST(value AS DATE), 120))
                  FROM      master.sys.partition_range_values AS prv
                            INNER JOIN sys.partition_functions AS pf ON pf.function_id = prv.function_id
                  WHERE     pf.name = 'CustNotePF'
                )

            SET @NextBoundaryCustNote =
                ( SELECT    MAX(CONVERT(VARCHAR(10), DATEADD(MONTH, 1,
                                                             CAST(value AS DATE)), 120))
                  FROM      sys.partition_range_values AS prv
                            INNER JOIN sys.partition_functions AS pf ON pf.function_id = prv.function_id
                  WHERE     pf.name = 'CustNotePF'
                )

--Split in New Part to Archive Table here, matching boundary in src
            ALTER PARTITION SCHEME CustNoteHistPS NEXT USED [PRIMARY]
            ALTER PARTITION FUNCTION CustNoteHisPF()
            SPLIT RANGE (@MinBoundaryCustNote)
	
--Drop Constraint and Re-Create with min boundary on src table
            IF EXISTS ( SELECT  *
                        FROM    sys.check_constraints AS cs
                        WHERE   cs.name = 'chk_CreatedDate' )
                BEGIN
                    ALTER TABLE Person.CustomerNote DROP CONSTRAINT chk_CreatedDate
                END 

            SET @Constraint_Sqlsmtpt = 'ALTER TABLE person.CustomerNote ADD CONSTRAINT chk_CreatedDate CHECK (CreatedDate >='
                + ''''
                + CAST(DATEADD(MONTH, -1, @MinBoundaryCustNote) AS NVARCHAR(255))
                + ''')'

            EXEC(@Constraint_Sqlsmtpt)

--Move Data to Part in Archive
            ALTER TABLE Person.CustomerNote SWITCH 
            PARTITION 1 TO Archive.CustomerNoteHistory PARTITION 2

--Deleting the old empty partition
            ALTER PARTITION FUNCTION CustNotePF()
            MERGE RANGE (@MinBoundaryCustNote)

 --Adding new part for current mo
            ALTER PARTITION SCHEME CustNotePS NEXT USED [PRIMARY]

            ALTER PARTITION FUNCTION CustNotePF()
            SPLIT RANGE (@NextBoundaryCustNote)

----Archive.CustomerNoteHistory----

            SET @MinBoundaryCustNoteArchive = ( SELECT TOP 1
                                                        MIN(CONVERT(VARCHAR(10), CAST(value AS DATE), 120))
                                                FROM    sys.partition_range_values
                                                        AS prv
                                                        INNER JOIN sys.partition_functions
                                                        AS pf ON pf.function_id = prv.function_id
                                                WHERE   pf.name = 'CustNoteHisPF'
                                              )

            SET @NextBoundaryCustNote = ( SELECT    DATEADD(MONTH, 1,
                                                            @MinBoundaryCustNoteArchive)
                                        )

            ALTER PARTITION FUNCTION CustNoteHisPF()
            MERGE RANGE (@MinBoundaryCustNoteArchive)

            COMMIT TRANSACTION
            PRINT 'COMMIT TRANSACTION'
        END TRY
        BEGIN CATCH
            IF XACT_STATE() = -1
                BEGIN
                    ROLLBACK TRANSACTION
                    PRINT 'ROLLBACK TRANSACTION'
                    PRINT ERROR_MESSAGE()
                END

            IF XACT_STATE() = 1
                BEGIN
                    COMMIT TRANSACTION
                    PRINT 'COMMIT TRANSACTION'
                END
        END CATCH



        SET XACT_ABORT OFF


    END
GO
PRINT N'Creating [dbo].[usp_SelectLoginInformation]...';


GO
CREATE PROCEDURE [dbo].[usp_SelectLoginInformation]
	@SalespersonId UNIQUEIDENTIFIER
AS

SELECT [Username], 
       [Password], 
	   [LastLogonDate] 
FROM [$(SingleSignOn)].dbo.[User] AS u
INNER JOIN Person.[Salesperson] AS s
	ON s.LoginId = u.Id
		WHERE s.Id = @SalespersonId
GO
PRINT N'Creating [Person].[usp_UpdateSalespersonLogin]...';


GO
CREATE PROCEDURE Person.usp_UpdateSalespersonLogin
    @NewLoginId UNIQUEIDENTIFIER ,
    @SalespersonId UNIQUEIDENTIFIER
AS
    UPDATE  Person.Salesperson
    SET     LoginId = @NewLoginId
    WHERE   Id = @SalespersonId
GO
PRINT N'Creating [Sales].[usp_OpportunitiesByType]...';


GO
CREATE PROCEDURE [Sales].[usp_OpportunitiesByType]	@OpportunityType NVARCHAR(55)

AS

SELECT o.Id,
	   o.CustomerId
FROM Sales.Opportunity AS o
INNER JOIN Sales.OpportunityType AS ot
	ON o.OpportunityTypeId = ot.Id
	WHERE ot.Name = @OpportunityType
GO
-- Refactoring step to update target server with deployed transaction logs

IF OBJECT_ID(N'dbo.__RefactorLog') IS NULL
BEGIN
    CREATE TABLE [dbo].[__RefactorLog] (OperationKey UNIQUEIDENTIFIER NOT NULL PRIMARY KEY)
    EXEC sp_addextendedproperty N'microsoft_database_tools_support', N'refactoring log', N'schema', N'dbo', N'table', N'__RefactorLog'
END
GO
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'a7be8ed6-617b-407a-b64c-f79f88c021e2')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('a7be8ed6-617b-407a-b64c-f79f88c021e2')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'e59fd519-2d05-400a-af98-67f016780c9e')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('e59fd519-2d05-400a-af98-67f016780c9e')

GO

GO
PRINT N'Update complete.';


GO