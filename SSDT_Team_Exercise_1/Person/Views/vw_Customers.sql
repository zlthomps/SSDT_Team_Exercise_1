CREATE VIEW [Person].[vw_Customers]
	AS

SELECT  Person.[FirstName] AS FirstName ,
        Person.[LastName] AS LastName ,
        ISNULL(Email.EmailAddress,N'') AS Email,
		ISNULL(Phone.PhoneNumber,N'') AS Phone,
		ISNULL(Address.Street + SPACE(1) + Address.City + N',' + Address.StateProvince + SPACE(1) + Address.PostalCode,N'') AS [Address]
FROM    Person.Person AS Person
        LEFT OUTER JOIN Person.Customer AS Customer ON Customer.PersonId = Person.Id
        LEFT OUTER JOIN Person.CustomerEmail AS Email ON Email.CustomerId = Customer.Id
		LEFT OUTER JOIN person.CustomerAddress AS [Address] ON Address.CustomerId = Customer.Id
		LEFT OUTER JOIN Person.CustomerPhone AS Phone ON Phone.CustomerId = Customer.Id


