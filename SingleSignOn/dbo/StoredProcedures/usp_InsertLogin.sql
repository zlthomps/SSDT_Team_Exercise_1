CREATE PROCEDURE dbo.usp_InsertLogin
    @User NVARCHAR(50) ,
    @Password NVARCHAR(50) ,
    @RoleName NVARCHAR(50) ,
    @LastLogonDate DATE ,
    @CreatedDate DATE
AS
    DECLARE @RoleId UNIQUEIDENTIFIER
    SET @RoleId = ( SELECT TOP 1 Id
                    FROM    dbo.Role
                    WHERE   Name = @RoleName
                  )

    INSERT  INTO [User]
            ( Username ,
              [Password] ,
              RoleId ,
              LastLogonDate ,
              CreatedDate
            )
    VALUES  ( @User ,
              @Password ,
              @RoleId ,
              @LastLogonDate ,
              @CreatedDate
            )
GO
