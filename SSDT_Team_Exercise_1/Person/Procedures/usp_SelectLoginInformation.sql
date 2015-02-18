CREATE PROCEDURE [dbo].[usp_SelectLoginInformation]
	@SalespersonId UNIQUEIDENTIFIER
AS

SELECT [Username], 
       [Password], 
	   [LastLogonDate] 
FROM [$(SingleSignOn)].dbo.[User] AS u
INNER JOIN Person.[Salesperson] AS s
	ON s.LoginId = u.Id
		WHERE s.Id = @SalespersonId
	

