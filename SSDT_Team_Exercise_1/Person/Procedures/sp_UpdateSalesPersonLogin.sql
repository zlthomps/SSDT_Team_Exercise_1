﻿CREATE PROCEDURE Person.usp_UpdateSalespersonLogin
    @NewLoginId UNIQUEIDENTIFIER ,
    @SalespersonId UNIQUEIDENTIFIER
AS
    UPDATE  Person.Salesperson
    SET     LoginId = @NewLoginId
    WHERE   Id = @SalespersonId