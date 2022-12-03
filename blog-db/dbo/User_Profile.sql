CREATE TABLE [dbo].[User_Profile]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	[Username] NVARCHAR(20) NOT NULL UNIQUE,
	[FirstName] NVARCHAR(50) NOT NULL,
	[LastName] NVARCHAR(50) NOT NULL,
	[ProfilePicture] NVARCHAR(50) NULL,
	[CreatedAt] DATETIME NOT NULL,
	[UpdatedAt] DATETIME NULL,
	CONSTRAINT [FK_User_Profile_User] FOREIGN KEY ([Username]) REFERENCES [dbo].[User] ([Username])
)
