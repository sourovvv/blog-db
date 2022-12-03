CREATE PROCEDURE [dbo].[Insert_To_User_Gallery]
	@Username nvarchar(20),
	@Image nvarchar(50),
	@Description nvarchar(max)
AS

BEGIN TRY
	SET NOCOUNT ON
	
	IF LEN(@Username) < 6
	BEGIN
		RAISERROR('Username must be at least 6 characters long', 16, 1)
		RETURN
	END
	ELSE IF NOT EXISTS (SELECT * FROM [dbo].[User] WHERE [Username] = @Username)
	BEGIN
		RAISERROR('Username does not exist', 16, 1)
		RETURN
	END
	ELSE
	BEGIN
		INSERT INTO [dbo].[User_Gallery] (Username, Image, Description, CreatedAt)
		VALUES (@Username, @Image, @Description, GETDATE())
		
		SELECT * FROM [dbo].[User_Gallery]
		WHERE [Id] = SCOPE_IDENTITY()
	END
END TRY

BEGIN CATCH
	SELECT ERROR_NUMBER() AS ErrorNumber, ERROR_MESSAGE() AS ErrorMessage
END CATCH
