CREATE PROCEDURE [dbo].[usp_UpdateLogin]
@Username NVARCHAR(50), @NewPassword NVARCHAR(50)

AS

UPDATE [dbo].[User] 
SET [Password] = @NewPassword
WHERE [Username] = @Username
