USE [TWEB]
GO

ALTER DATABASE tweb SET SINGLE_USER WITH ROLLBACK IMMEDIATE 
ALTER DATABASE tweb COLLATE Latin1_General_CI_AI 
ALTER DATABASE tweb SET MULTI_USER

/****** Object:  Table [dbo].[Status]    Script Date: 10/24/2011 13:31:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Status](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Descricao] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Status] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO



/****** Object:  Table [dbo].[Documentos]    Script Date: 10/24/2011 13:31:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Documentos](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[LDO] [bit] NOT NULL,
	[BF] [bit] NOT NULL,
	[BP] [bit] NOT NULL,
	[RGF] [bit] NOT NULL,
	[RREO] [bit] NOT NULL,
	[PPA] [bit] NOT NULL,
	[BO] [bit] NOT NULL,
	[LC] [bit] NOT NULL,
	[PainelFinanceiro] [bit] NOT NULL,
	[ParecerTCE] [bit] NOT NULL,
 CONSTRAINT [PK_Documentos] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


/****** Object:  Table [dbo].[Artigo]    Script Date: 10/24/2011 13:31:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Artigo](
	[Id] [int] NOT NULL,
	[Conteudo] [varchar](max) NOT NULL,
	[StatusId] [int] NOT NULL,
 CONSTRAINT [PK_Artigo] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO



/****** Object:  Table [dbo].[Prefeitura]    Script Date: 10/24/2011 13:31:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Prefeitura](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [varchar](max) NULL,
	[Latitude] [varchar](max) NULL,
	[Longitude] [varchar](max) NULL,
	[Aderencia] [int] NULL,
	[Ordem] [int] NULL,
	[Brasao] [image] NULL,
	[StatusId] [int] NOT NULL,
	[DocumentosId] [int] NULL,
 CONSTRAINT [PK_Prefeitura] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO


/****** Object:  Table [dbo].[UsuarioPerfil]    Script Date: 10/27/2011 14:42:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UsuarioPerfil](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Descricao] [varchar](max) NOT NULL,
 CONSTRAINT [PK_UsuarioPerfil] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO


/****** Object:  Table [dbo].[Usuario]    Script Date: 10/27/2011 14:42:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Usuario](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [varchar](256) NOT NULL,
	[Login] [varchar](256) NOT NULL,
	[Email] [varchar](256) NOT NULL,
	[Senha] [varchar](256) NOT NULL,
	[StatusId] [int] NOT NULL,
	[PerfilId] [int] NOT NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO


/****** Object:  Table [dbo].[Glossario]    Script Date: 10/28/2011 11:28:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Glossario](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Conteudo] [varchar](max) NOT NULL,
 CONSTRAINT [PK_Glossario] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO


/****** Object:  ForeignKey [FK_Artigo_Status]    Script Date: 10/24/2011 13:31:35 ******/
ALTER TABLE [dbo].[Artigo]  WITH CHECK ADD  CONSTRAINT [FK_Artigo_Status] FOREIGN KEY([StatusId])
REFERENCES [dbo].[Status] ([Id])
GO
ALTER TABLE [dbo].[Artigo] CHECK CONSTRAINT [FK_Artigo_Status]
GO

/****** Object:  ForeignKey [FK_Prefeitura_Documentos]    Script Date: 10/24/2011 13:31:35 ******/
ALTER TABLE [dbo].[Prefeitura]  WITH CHECK ADD  CONSTRAINT [FK_Prefeitura_Documentos] FOREIGN KEY([DocumentosId])
REFERENCES [dbo].[Documentos] ([Id])
GO
ALTER TABLE [dbo].[Prefeitura] CHECK CONSTRAINT [FK_Prefeitura_Documentos]
GO

/****** Object:  ForeignKey [FK_Prefeitura_Status]    Script Date: 10/24/2011 13:31:35 ******/
ALTER TABLE [dbo].[Prefeitura]  WITH CHECK ADD  CONSTRAINT [FK_Prefeitura_Status] FOREIGN KEY([StatusId])
REFERENCES [dbo].[Status] ([Id])
GO
ALTER TABLE [dbo].[Prefeitura] CHECK CONSTRAINT [FK_Prefeitura_Status]
GO

/****** Object:  ForeignKey [FK_Usuario_UsuarioPerfil]    Script Date: 10/27/2011 14:42:52 ******/
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_UsuarioPerfil] FOREIGN KEY([PerfilId])
REFERENCES [dbo].[UsuarioPerfil] ([Id])
GO
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [FK_Usuario_UsuarioPerfil]
GO
