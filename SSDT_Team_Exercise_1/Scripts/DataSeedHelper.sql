﻿

IF ( SELECT COUNT(*)
     FROM   Inventory.Make
   ) = 0
    BEGIN
	
			DECLARE @idpk UNIQUEIDENTIFIER = NEWID()

			INSERT INTO Inventory.Make 
					( Id,Name ) 
			VALUES  ( 
						@idpk,
						N'Mitsubishi'-- Name - nvarchar(50)
					  )

			INSERT INTO Inventory.Model
					( 
					  Name ,
					  MakeId
					)
			VALUES  ( 
					  N'Lancer Evolution GSR' , -- Name - nvarchar(50)
					  @idpk -- MakeId - uniqueidentifier
					),
					( 
					  N'Outlander' , -- Name - nvarchar(50)
					  @idpk -- MakeId - uniqueidentifier
					),
					( 
					  N'Lancer OZ Edition' , -- Name - nvarchar(50)
					  @idpk -- MakeId - uniqueidentifier
					)

			SET @idpk = NEWID()

			INSERT INTO Inventory.Make 
					( Id,Name ) 
			VALUES  ( 
						@idpk,
						N'Ferrari'-- Name - nvarchar(50)
					  )

			INSERT INTO Inventory.Model
					( 
					  Name ,
					  MakeId
					)
			VALUES  ( 
					  N'599 GTO' , -- Name - nvarchar(50)
					  @idpk -- MakeId - uniqueidentifier
					),
					( 
					  N'Italia' , -- Name - nvarchar(50)
					  @idpk -- MakeId - uniqueidentifier
					),
					( 
					  N'Enzo' , -- Name - nvarchar(50)
					  @idpk -- MakeId - uniqueidentifier
					)

			SET @idpk = NEWID()

			INSERT INTO Inventory.Make 
					( Id,Name ) 
			VALUES  ( 
						@idpk,
						N'Lotus'-- Name - nvarchar(50)
					  )

			INSERT INTO Inventory.Model
					( 
					  Name ,
					  MakeId
					)
			VALUES  ( 
					  N'Exige',-- Name - nvarchar(50)
					  @idpk -- MakeId - uniqueidentifier
					),
					( 
					  N'Elise' , -- Name - nvarchar(50)
					  @idpk -- MakeId - uniqueidentifier
					)


    END 

	GO

--Update Script
--Refactor CustomerAddress

IF EXISTS ( SELECT  *
            FROM    sys.columns AS sc
                    INNER JOIN sys.tables AS st ON sc.OBJECT_ID = st.object_id
            WHERE   sc.name = 'StateProvinceId'
                    AND st.name = 'CustomerAddress' )
    BEGIN

        UPDATE  Person.CustomerAddress
        SET     StateProvinceId = sp.Id
        FROM    dbo.StateProvince AS sp
                INNER JOIN dbo.Country AS c ON c.Id = sp.CountryId
                INNER JOIN person.CustomerAddress AS ca ON ca.Country = c.Name
                                                           AND sp.Name = ca.StateProvince
        WHERE   ca.StateProvinceId IS NULL

    END

GO


