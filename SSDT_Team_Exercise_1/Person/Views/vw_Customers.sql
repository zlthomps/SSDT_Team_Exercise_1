CREATE VIEW [Person].[vw_Customers]
	AS

	SELECT Person.FName AS FirstName,
		   Person.LName AS LastName
    FROM Person.Customer AS Customer
	INNER JOIN Person.Person AS Person
		ON Customer.PersonId = Person.Id