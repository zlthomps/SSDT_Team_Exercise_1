
INSERT INTO SSDT_Team_Exercise_1.dbo.Country
        ( 
          CountryCode ,
          Name ,
          CreatedDate
        )
        SELECT  CountryRegionCode,
				Name,
				GETUTCDATE()
        FROM    [LOCALHOST\MSSQLSERVER2014].AdventureWorks2014.Person.CountryRegion


INSERT  INTO SSDT_Team_Exercise_1.dbo.StateProvince
        ( 
          StateProvinceCode ,
          CountryId ,
          Name ,
          CreatedDate
        )
        SELECT 
			s.StateProvinceCode,
			c.Id,
			s.Name,
			GETUTCDATE()
        FROM    [LOCALHOST\MSSQLSERVER2014].AdventureWorks2014.Person.StateProvince AS s
		INNER JOIN [LOCALHOST\MSSQLSERVER2014].AdventureWorks2014.Person.CountryRegion AS cr
			ON cr.CountryRegionCode = s.CountryRegionCode
		INNER JOIN SSDT_Team_Exercise_1.dbo.Country AS c ON c.Name = cr.Name
			