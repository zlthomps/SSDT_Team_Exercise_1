CREATE PROCEDURE [dbo].[usp_UpdateLogin]
@Username NVARCHAR(55), @NewPassword NVARCHAR(55)

AS

UPDATE [dbo].[User] 
SET [Password] = @NewPassword
WHERE [Username] = @Username
