

IF ( SELECT COUNT(*)
     FROM   Inventory.Make
   ) = 0
    BEGIN
        
        INSERT  INTO Inventory.Make
                ( Name )
        VALUES  ( N'Ferrari' -- Name - nvarchar(50)
                  ),
                ( N'Lotus' -- Name - nvarchar(50)
                  ),
                ( N'Mitsubishi'-- Name - nvarchar(50)
                  )

    END 
GO

IF ( SELECT COUNT(*)
     FROM   Inventory.Model
   ) = 0
    BEGIN
        
        INSERT  INTO Inventory.Model
                ( Name )
        VALUES  ( N'Lancer' ),
                ( N'Lancer Evolution' ),
                ( N'599 GTO' ),
                ( N'Exige' ),
                ( N'Elise' ),
                ( N'Italia' ),
                ( N'Enzo' ),
                ( N'Outlander' )
    END 


