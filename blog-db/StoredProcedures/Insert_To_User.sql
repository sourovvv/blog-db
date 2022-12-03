CREATE PROCEDURE [dbo].[Insert_To_User]
	@Userame nvarchar(20),
	@Password nvarchar(50)
AS

BEGIN TRY
	SET NOCOUNT ON

	IF LEN(@Userame) < 6
	BEGIN
		RAISERROR('Username must be at least 6 characters long', 16, 1)
		RETURN
	END
	ELSE IF LEN(@Password) < 6
	BEGIN
		RAISERROR('Password must be at least 6 characters long', 16, 1)
		RETURN
	END
	ELSE
	BEGIN
		INSERT INTO [dbo].[User] (Username, Password, CreatedAt)
		VALUES (@Userame, @Password, GETDATE())
		
		SELECT * FROM [dbo].[User]
		WHERE [Id] = SCOPE_IDENTITY()
	END
END TRY

BEGIN CATCH
	SELECT ERROR_NUMBER() AS ErrorNumber, ERROR_MESSAGE() AS ErrorMessage
END CATCH
