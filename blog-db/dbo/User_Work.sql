﻿CREATE TABLE [dbo].[User_Work]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	[Username] NVARCHAR(20) NOT NULL UNIQUE,
	[Company] NVARCHAR(100) NOT NULL,
	[Position] NVARCHAR(50) NOT NULL,
	[City] NVARCHAR(50) NOT NULL,
	[Country] NVARCHAR(50) NOT NULL,
	[IsCurrent] BIT NOT NULL DEFAULT 0,
	[CreatedAt] DATETIME NOT NULL,
	[UpdatedAt] DATETIME NULL,
	CONSTRAINT [FK_User_Work_User] FOREIGN KEY ([Username]) REFERENCES [dbo].[User] ([Username])
)