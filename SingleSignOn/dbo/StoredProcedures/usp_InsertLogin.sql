CREATE PROCEDURE dbo.usp_InsertLogin
    @User NVARCHAR(55) ,
    @Password NVARCHAR(55) ,
    @RoleName NVARCHAR(55) ,
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
