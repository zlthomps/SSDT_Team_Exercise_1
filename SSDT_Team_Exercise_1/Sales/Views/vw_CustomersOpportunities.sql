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
