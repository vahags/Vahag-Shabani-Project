SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Author:	  <Vahag, Shabani>
-- Create date:   <5/3/2016>
-- Description:	<Insert users into the database>


CREATE PROCEDURE [dbo].[insertUser] 
	-- Add the parameters for the stored procedure here
	@userName varchar(30),
	@firstName varchar(30),
	@lastName varchar(30),
	@email varchar(60),
	@phoneNumber varchar(30),
	@password varchar(30),
	@phoneTypeID int = 2, --phoneType: 1 = work,  2 = mobile
	@companyID int = 0
	
AS

BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

BEGIN TRANSACTION
BEGIN TRY
   
   INSERT INTO users
   VALUES (@userName, @firstName, @lastName, @email, @phoneNumber, @password, @phoneTypeID, @companyID)

 COMMIT TRANSACTION
END TRY
BEGIN CATCH
    SELECT 
        ERROR_NUMBER() AS ErrorNumber,
        ERROR_SEVERITY() AS ErrorSeverity,
        ERROR_STATE() AS ErrorState,
        ERROR_PROCEDURE() AS ErrorProcedure,
        ERROR_LINE() AS ErrorLine,
        ERROR_MESSAGE() AS ErrorMessage
   
    ROLLBACK TRANSACTION
END CATCH
END

GO