SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:	  <Vahag, Shabani>
-- Create date:   <5/3/2016>
-- Description:	<obtain company ID>
-- =============================================
CREATE PROCEDURE getCompanyID
	@CompanyName varchar(60)
AS
BEGIN
	SET NOCOUNT ON;
	BEGIN TRY
		SELECT companyID FROM company WHERE @companyName = companyName
	END TRY

	BEGIN CATCH
		RAISERROR('Error retrieving companyID',1,1);
	END CATCH
END
GO