USE [tweb]
GO
/****** Object:  Table [dbo].[UsuarioPerfil]    Script Date: 10/27/2011 14:48:36 ******/
SET IDENTITY_INSERT [dbo].[UsuarioPerfil] ON
INSERT [dbo].[UsuarioPerfil] ([Id], [Descricao]) VALUES (1, N'Administrador')
INSERT [dbo].[UsuarioPerfil] ([Id], [Descricao]) VALUES (2, N'Editor')
SET IDENTITY_INSERT [dbo].[UsuarioPerfil] OFF



/****** Object:  Table [dbo].[Usuario]    Script Date: 10/27/2011 14:48:36 ******/
SET IDENTITY_INSERT [dbo].[Usuario] ON
INSERT [dbo].[Usuario] ([Id], [Nome], [Login], [Email], [Senha], [StatusId], [PerfilId]) VALUES (1, N'Administrador', N'admin', N'email@admin.com', N'admin', 1, 1)
INSERT [dbo].[Usuario] ([Id], [Nome], [Login], [Email], [Senha], [StatusId], [PerfilId]) VALUES (2, N'Alessandro Santos', N'alessandro', N'email@teste.com', N'senha', 1, 2)
SET IDENTITY_INSERT [dbo].[Usuario] OFF
