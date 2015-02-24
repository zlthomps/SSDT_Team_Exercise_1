CREATE PROCEDURE [dbo].[usp_UpdateRole]
	@ExistingName NVARCHAR(50),
	@NewName NVARCHAR(50)
AS
	UPDATE [Role] SET Name = @NewName
	WHERE Name = @ExistingName
