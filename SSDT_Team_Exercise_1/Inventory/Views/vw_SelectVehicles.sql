CREATE VIEW [Inventory].[vw_SelectVehicles]
	AS 
	
	SELECT 
		v.Id AS VehicleId,
		m.Name AS Make,
		mo.Name AS Model,
		c.Name AS Color
	FROM Inventory.Vehicle AS v
	LEFT OUTER JOIN Inventory.Make AS m
		ON m.Id = v.MakeId
	LEFT OUTER JOIN Inventory.Model AS mo
		ON mo.Id = v.ModelId
	LEFT OUTER JOIN Inventory.Color AS c
		ON c.Id = v.ColorId
	