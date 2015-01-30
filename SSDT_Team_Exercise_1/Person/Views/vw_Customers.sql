CREATE VIEW [Person].[vw_Customers]
	AS

	SELECT Per.FName AS FirstName,
		   Per.LName AS LastName
    FROM Person.Customer AS Cust
	INNER JOIN Person.Person AS Per
		ON Cust.PersonId = Per.Id