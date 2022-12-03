CREATE PROCEDURE [dbo].[Insert_To_User_Work]
	@Username nvarchar(20),
	@Company nvarchar(100),
	@Position nvarchar(50),
	@City nvarchar(50),
	@Country nvarchar(50),
	@IsCurrent bit
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
	ELSE IF LEN(@Company) < 3
	BEGIN
		RAISERROR('Company must be at least 3 characters long', 16, 1)
		RETURN
	END
	ELSE IF LEN(@Position) < 2
	BEGIN
		RAISERROR('Position must be at least 2 characters long', 16, 1)
		RETURN
	END
	ELSE IF LEN(@City) < 3
	BEGIN
		RAISERROR('City must be at least 3 characters long', 16, 1)
		RETURN
	END
	ELSE IF LEN(@Country) < 3
	BEGIN
		RAISERROR('Country must be at least 3 characters long', 16, 1)
		RETURN
	END
	ELSE
	BEGIN
		INSERT INTO [dbo].[User_Work] (Username, Company, Position, City, Country, IsCurrent, CreatedAt)
		VALUES (@Username, @Company, @Position, @City, @Country, @IsCurrent, GETDATE())
		
		SELECT * FROM [dbo].[User_Work]
		WHERE [Id] = SCOPE_IDENTITY()
	END
END TRY

BEGIN CATCH
	SELECT ERROR_NUMBER() AS ErrorNumber, ERROR_MESSAGE() AS ErrorMessage
END CATCH
