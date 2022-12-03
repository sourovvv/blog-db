﻿CREATE TABLE [dbo].[User]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	[Username] NVARCHAR(20) NOT NULL UNIQUE,
	[Password] NVARCHAR(50) NOT NULL,
	[Role] NVARCHAR(20) NOT NULL DEFAULT 'User',
	[CreatedAt] DATETIME NOT NULL
)