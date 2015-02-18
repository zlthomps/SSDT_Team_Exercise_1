CREATE VIEW [Person].[vw_SelectSalespersonLogin]
AS
SELECT u.Username AS Username,
		u.[Password] AS [Password] 		
FROM Person.Salesperson AS s
LEFT OUTER JOIN [$(SingleSignOn)].dbo.[User] AS u
	ON s.LoginId = u.Id


