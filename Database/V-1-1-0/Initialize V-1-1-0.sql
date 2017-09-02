USE [VentaInventarioDB]
GO

SET IDENTITY_INSERT [dbo].[tbl_Usuario] ON;
INSERT INTO [dbo].[tbl_Usuario]
           ([userId]
           ,[nombreCompleto]
           ,[userName]
           ,[password])
     VALUES
           (1
           ,'Administrador del Sistema'
           ,'admin'
           ,'rootAdmin');

SET IDENTITY_INSERT [dbo].[tbl_Usuario] OFF;
GO
