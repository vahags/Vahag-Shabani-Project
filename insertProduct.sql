SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Author:	  <Vahag, Shabani>
-- Create date:   <5/3/2016>
-- Description:	<insert product procedure>


CREATE PROCEDURE [dbo].[insertProduct]
	@productID int,
	@productName varchar(60),
	@productDescr varchar(150),
	@systemID int,
	@genreID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

BEGIN TRANSACTION
BEGIN TRY
   
   INSERT INTO product
   VALUES (@productID, @productName, @productDescr, @systemID, @genreID)

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