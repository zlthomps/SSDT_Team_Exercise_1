CREATE PROCEDURE [dbo].[usp_UpdateLogin]
@Username NVARCHAR(55), @NewPassword NVARCHAR(55)

AS

UPDATE [User] SET [Password] = @NewPassword
WHERE UserName = @Username
