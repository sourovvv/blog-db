CREATE TABLE [dbo].[User_Gallery]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	[Username] NVARCHAR(20) NOT NULL UNIQUE,
	[Image] NVARCHAR(50) NOT NULL,
	[Description] NVARCHAR(MAX) NULL,
	[CreatedAt] DATETIME NOT NULL,
	[UpdatedAt] DATETIME NULL,
	CONSTRAINT [FK_User_Gallery_User] FOREIGN KEY ([Username]) REFERENCES [dbo].[User] ([Username])
)
