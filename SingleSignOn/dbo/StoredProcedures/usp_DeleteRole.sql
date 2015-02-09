CREATE PROCEDURE [dbo].[usp_DeleteRole]
AS

DELETE FROM [Role] 
FROM [Role] AS r
WHERE NOT EXISTS (SELECT 
						* 
				  FROM [User] AS u 
					WHERE u.RoleId = r.Id)