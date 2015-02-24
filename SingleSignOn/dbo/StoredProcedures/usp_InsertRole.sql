CREATE PROCEDURE [dbo].[usp_InsertRole]
@Name NVARCHAR(50),@CreatedDate DATE, @ModifiedDate DATE
AS
	INSERT INTO [Role] (Name, CreatedDate, ModifiedDate)
	VALUES(@Name, @CreatedDate, @ModifiedDate)
