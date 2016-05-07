use[s16guest73]
GO

-- =============================================
-- Author:		<Vahag Shabani>
-- Create date: <5/5/2016>
-- Description:	<Count Downloads by releaseID>
-- =============================================
CREATE PROCEDURE [dbo].[countDownloads]
	@releaseID int

AS
DECLARE @err_message varchar(150)
BEGIN
	SET NOCOUNT ON;

	IF EXISTS (Select releaseID FROM download WHERE releaseID = @releaseID)
		BEGIN
		SELECT COUNT(releaseID) FROM download WHERE releaseID = @releaseID;
		END
	ELSE
		BEGIN
		SET @err_message = ('Error: releaseID does not exist in the database')
				 RAISERROR (@err_message,10, 1) 	
		END
END