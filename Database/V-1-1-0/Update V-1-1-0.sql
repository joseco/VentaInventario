Use [Master]
GO 

IF  NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'VentaInventarioDB')
	RAISERROR('La base de datos ''VentaInventarioDB'' no existe. Cree la base de datos primero',16,127)
GO

USE [VentaInventarioDB]
GO

PRINT 'Actualizando a la version 1.1.0'

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_VERSION_GetVersion]') AND type in (N'P', N'PC'))
BEGIN

	RAISERROR('La base de datos no esta inicializada',16,127)
	RETURN;

END


DECLARE @intVersionMayor int
DECLARE @intVersionMenor int
DECLARE @intPatch int

EXECUTE [dbo].[usp_VERSION_GetVersion] 
   @intVersionMayor OUTPUT
  ,@intVersionMenor OUTPUT
  ,@intPatch OUTPUT

IF @intVersionMayor IS NULL OR @intVersionMenor IS NULL
BEGIN
	
	RAISERROR('La base de datos no esta inicializada',16,127)
	RETURN;

END


IF @intVersionMayor IS NULL OR @intVersionMenor IS NULL OR NOT (@intVersionMayor = 1 AND @intVersionMenor = 0)
BEGIN
	
	RAISERROR('La base de datos no esta en la version 1.0. Este script solamente se apllica a la version 1.0',16,127)
	RETURN;

END
ELSE
BEGIN
	
	PRINT 'Version OK'

END


IF  NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_Usuario]') AND type in (N'U'))
BEGIN

	SET ANSI_NULLS ON;


	SET QUOTED_IDENTIFIER ON;


	CREATE TABLE [dbo].[tbl_Usuario](
		[userId] [int] IDENTITY(2,1) NOT NULL,
		[nombreCompleto] [nvarchar](50) NOT NULL,
		[userName] [nvarchar](50) NOT NULL,
		[password] [nvarchar](100) NOT NULL,
	 CONSTRAINT [PK_tbl_Usuario] PRIMARY KEY CLUSTERED 
	(
		[userId] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
	 CONSTRAINT [IX_tbl_Usuario] UNIQUE NONCLUSTERED 
	(
		[userName] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
	

END
GO




DELETE FROM [dbo].[tbl_Version]
GO

INSERT INTO [dbo].[tbl_Version]
           ([versionMayor]
           ,[versionMenor]
           ,[patch])
     VALUES
           (1
           ,1
           ,0)
GO

