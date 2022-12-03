CREATE PROCEDURE [dbo].[Insert_To_User_Profile]	
	@Username nvarchar(20),
	@FirstName nvarchar(50),
	@LastName nvarchar(50),
	@ProfilePicture nvarchar(50)
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
	ELSE IF @FirstName < 3 OR @LastName < 3
	BEGIN
		RAISERROR('First name and last name must be at least 3 characters long', 16, 1)
		RETURN
	END
	ELSE
	BEGIN
		INSERT INTO [dbo].[User_Profile] (Username, FirstName, LastName, ProfilePicture, CreatedAt)
		VALUES (@Username, @FirstName, @LastName, @ProfilePicture, GETDATE())
		
		SELECT * FROM [dbo].[User_Profile]
		WHERE [Id] = SCOPE_IDENTITY()
	END
END TRY

BEGIN CATCH
	SELECT ERROR_NUMBER() AS ErrorNumber, ERROR_MESSAGE() AS ErrorMessage
END CATCH
