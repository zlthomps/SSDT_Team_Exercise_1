CREATE PROCEDURE [dbo].[usp_UpdateRole]
	@ExistingName NVARCHAR(55),
	@NewName NVARCHAR(55)
AS
	UPDATE [Role] SET Name = @NewName
	WHERE Name = @ExistingName
