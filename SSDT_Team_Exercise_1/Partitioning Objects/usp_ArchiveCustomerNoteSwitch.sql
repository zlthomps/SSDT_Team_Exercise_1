
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