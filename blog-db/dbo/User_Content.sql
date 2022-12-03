﻿CREATE TABLE [dbo].[User_Content]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	[Username] NVARCHAR(20) NOT NULL UNIQUE,
	[Title] NVARCHAR(100) NOT NULL UNIQUE,
	[Body] TEXT NOT NULL,
	[CreatedAt] DATETIME NOT NULL,
	[UpdatedAt] DATETIME NULL,
	CONSTRAINT [FK_User_Content_User] FOREIGN KEY ([Username]) REFERENCES [dbo].[User] ([Username])
)
