CREATE PROCEDURE [Sales].[usp_OpportunitiesByType]	@OpportunityType NVARCHAR(55)

AS

SELECT o.Id,
	   o.CustomerId
FROM Sales.Opportunity AS o
INNER JOIN Sales.OpportunityType AS ot
	ON o.OpportunityTypeId = ot.Id
	WHERE ot.Name = @OpportunityType

