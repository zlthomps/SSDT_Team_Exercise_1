CREATE VIEW [Inventory].[vw_Vehicles]
	AS 

	SELECT 
		v.Id AS VehicleId,
		m.Name AS Make,
		mo.Name AS Model,
		c.Name AS Color
	FROM Inventory.Vehicle AS v
	INNER JOIN Inventory.Make AS m
		ON m.Id = v.MakeId
	INNER JOIN Inventory.Model AS mo
		ON mo.Id = v.ModelId
	INNER JOIN Inventory.Color AS c
		ON c.Id = v.ColorId