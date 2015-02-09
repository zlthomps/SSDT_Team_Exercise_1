CREATE PROCEDURE [dbo].[usp_InsertLogin]
@User NVARCHAR(55),@Password NVARCHAR(55),@RoleId UNIQUEIDENTIFIER, @LastLogonDate DATE, @CreatedDate DATE 

AS

INSERT INTO [User] (Username, [Password], RoleId, LastLogonDate, CreatedDate)
VALUES(@User,@Password,@RoleId,@LastLogonDate, @CreatedDate)