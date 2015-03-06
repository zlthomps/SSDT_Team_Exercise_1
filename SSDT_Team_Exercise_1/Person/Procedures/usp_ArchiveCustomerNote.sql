
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


