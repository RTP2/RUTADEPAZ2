IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TBL_RRETROALIMENTACION_TBL_RRESPUESTA]') AND parent_object_id = OBJECT_ID(N'[dbo].[TBL_RRETROALIMENTACION]'))
ALTER TABLE [dbo].[TBL_RRETROALIMENTACION] DROP CONSTRAINT [FK_TBL_RRETROALIMENTACION_TBL_RRESPUESTA]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TBL_RRespuestas_TBL_RRespuestas]') AND parent_object_id = OBJECT_ID(N'[dbo].[TBL_RRESPUESTA]'))
ALTER TABLE [dbo].[TBL_RRESPUESTA] DROP CONSTRAINT [FK_TBL_RRespuestas_TBL_RRespuestas]
GO
/****** Object:  Table [dbo].[TBL_RRETROALIMENTACION]    Script Date: 19/03/2016 16:46:24 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TBL_RRETROALIMENTACION]') AND type in (N'U'))
DROP TABLE [dbo].[TBL_RRETROALIMENTACION]
GO
/****** Object:  Table [dbo].[TBL_RRESPUESTA]    Script Date: 19/03/2016 16:46:24 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TBL_RRESPUESTA]') AND type in (N'U'))
DROP TABLE [dbo].[TBL_RRESPUESTA]
GO
/****** Object:  Table [dbo].[TBL_RPREGUNTA]    Script Date: 19/03/2016 16:46:24 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TBL_RPREGUNTA]') AND type in (N'U'))
DROP TABLE [dbo].[TBL_RPREGUNTA]
GO
/****** Object:  Table [dbo].[TBL_RPREGUNTA]    Script Date: 19/03/2016 16:46:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TBL_RPREGUNTA]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TBL_RPREGUNTA](
	[IdPregunta] [int] IDENTITY(1,1) NOT NULL,
	[TipoPregunta] [char](10) NOT NULL,
	[Enunciado] [varchar](max) NULL,
 CONSTRAINT [PK_TBL_RPREGUNTA] PRIMARY KEY CLUSTERED 
(
	[IdPregunta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TBL_RRESPUESTA]    Script Date: 19/03/2016 16:46:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TBL_RRESPUESTA]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TBL_RRESPUESTA](
	[IdRespuesta] [int] NOT NULL,
	[IdPregunta] [int] NOT NULL,
	[Correcta] [bit] NOT NULL,
	[Respuesta] [varchar](max) NULL,
 CONSTRAINT [PK_TBL_RRespuestas] PRIMARY KEY CLUSTERED 
(
	[IdRespuesta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TBL_RRETROALIMENTACION]    Script Date: 19/03/2016 16:46:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TBL_RRETROALIMENTACION]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TBL_RRETROALIMENTACION](
	[IdRetroalimentacion] [int] IDENTITY(1,1) NOT NULL,
	[RetroAlimentacion] [varchar](max) NOT NULL,
	[IdRespuesta] [int] NULL,
 CONSTRAINT [PK_TBL_RRetroalimentacion] PRIMARY KEY CLUSTERED 
(
	[IdRetroalimentacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[TBL_RPREGUNTA] ON 

INSERT [dbo].[TBL_RPREGUNTA] ([IdPregunta], [TipoPregunta], [Enunciado]) VALUES (1, N'B         ', N'La Apertura Democrática tiene el objetivo de  garantizar que todos los colombianos sean parte de la construcción del país que queremos tener sin intimidación, miedo o violencia.')
INSERT [dbo].[TBL_RPREGUNTA] ([IdPregunta], [TipoPregunta], [Enunciado]) VALUES (2, N'U         ', N'¿Cuál es el propósito principal de las Circunscripciones Transitorias Especiales de Paz?')
INSERT [dbo].[TBL_RPREGUNTA] ([IdPregunta], [TipoPregunta], [Enunciado]) VALUES (3, N'U         ', N'¿Cuál será el papel de los medios de comunicación en la construcción de paz?')
SET IDENTITY_INSERT [dbo].[TBL_RPREGUNTA] OFF
INSERT [dbo].[TBL_RRESPUESTA] ([IdRespuesta], [IdPregunta], [Correcta], [Respuesta]) VALUES (1, 1, 1, N'Verdadero')
INSERT [dbo].[TBL_RRESPUESTA] ([IdRespuesta], [IdPregunta], [Correcta], [Respuesta]) VALUES (2, 1, 0, N'False')
INSERT [dbo].[TBL_RRESPUESTA] ([IdRespuesta], [IdPregunta], [Correcta], [Respuesta]) VALUES (3, 2, 0, N'Fomentar la reconciliación en la sociedad.')
INSERT [dbo].[TBL_RRESPUESTA] ([IdRespuesta], [IdPregunta], [Correcta], [Respuesta]) VALUES (4, 2, 1, N'Otorgar mayor participación  a las a las zonas más afectadas por el conflicto')
INSERT [dbo].[TBL_RRESPUESTA] ([IdRespuesta], [IdPregunta], [Correcta], [Respuesta]) VALUES (5, 2, 0, N'Promover el desarrollo económico en las regiones más pobres del país.')
INSERT [dbo].[TBL_RRESPUESTA] ([IdRespuesta], [IdPregunta], [Correcta], [Respuesta]) VALUES (6, 3, 0, N'Producción y divulgación de contenidos que fomenten la cultura de paz.')
INSERT [dbo].[TBL_RRESPUESTA] ([IdRespuesta], [IdPregunta], [Correcta], [Respuesta]) VALUES (7, 3, 0, N'Divulgación del trabajo de las organizaciones y movimientos sociales.')
INSERT [dbo].[TBL_RRESPUESTA] ([IdRespuesta], [IdPregunta], [Correcta], [Respuesta]) VALUES (8, 3, 0, N'Monitoreo del cumplimiento de los acuerdos de paz.')
INSERT [dbo].[TBL_RRESPUESTA] ([IdRespuesta], [IdPregunta], [Correcta], [Respuesta]) VALUES (9, 3, 1, N'Todos los anteriores')
SET IDENTITY_INSERT [dbo].[TBL_RRETROALIMENTACION] ON 

INSERT [dbo].[TBL_RRETROALIMENTACION] ([IdRetroalimentacion], [RetroAlimentacion], [IdRespuesta]) VALUES (1, N'RESPUESTA CORRECTA-. Felicitaciones. Eres un conocedor del alcance de los acuerdos del punto de Participación Política. ', 1)
INSERT [dbo].[TBL_RRETROALIMENTACION] ([IdRetroalimentacion], [RetroAlimentacion], [IdRespuesta]) VALUES (2, N'RESPUESTA INCORRECTA- Lo sentimos. Recuerda que estos acuerdos, sumados a la finalización del conflicto y las transformaciones territoriales, son la oportunidad que necesita el país para consolidar la democracia en todo el territorio nacional. ', 2)
INSERT [dbo].[TBL_RRETROALIMENTACION] ([IdRetroalimentacion], [RetroAlimentacion], [IdRespuesta]) VALUES (3, N'RESPUESTA INCORRECTA- Si bien la reconciliación de la sociedad es un proposito de los acuerdos de la Mesa de Conversaciones, las Circunscripciones Tansitorias Especiales de Paz se constituyen como una oportunidad para otorgar mayor participación a las zonas más afectadas por el conflicto. ', 3)
INSERT [dbo].[TBL_RRETROALIMENTACION] ([IdRetroalimentacion], [RetroAlimentacion], [IdRespuesta]) VALUES (4, N'RESPUESTA CORRECTA-  las Circunscripciones Tansitorias Especiales de Paz permitirán que nuevos lideres de las comunidades más afectas por la violencia puedan presentar en la camara de representantes sus problematicas y posibles soluciones. ', 4)
INSERT [dbo].[TBL_RRETROALIMENTACION] ([IdRetroalimentacion], [RetroAlimentacion], [IdRespuesta]) VALUES (5, N'RESPUESTA INCORRECTA-  Si bien el desarrollo económico de las regiones más poblres es un proposito de los acuerdos de la Mesa de Conversaciones, las Circunscripciones Tansitorias Especiales de Paz se constituyen como una oportunidad para otorgar mayor participación a las zonas más afectadas por el conflicto.', 5)
INSERT [dbo].[TBL_RRETROALIMENTACION] ([IdRetroalimentacion], [RetroAlimentacion], [IdRespuesta]) VALUES (6, N'RESPUESTA INCORRECTA-  En las regiones las emisoras comunitarias son fundamentales para la construcción de paz. Promover la cultura de paz es tan solo una de ellas. ', 6)
INSERT [dbo].[TBL_RRETROALIMENTACION] ([IdRetroalimentacion], [RetroAlimentacion], [IdRespuesta]) VALUES (7, N'RESPUESTA INCORRECTA-  En las regiones las emisoras comunitarias son fundamentales para la construcción de paz. Visibilizar el trabajo de las organizaciones y movimientos sociales es tan solo una de ellas. ', 7)
INSERT [dbo].[TBL_RRETROALIMENTACION] ([IdRetroalimentacion], [RetroAlimentacion], [IdRespuesta]) VALUES (8, N'RESPUESTA INCORRECTA-  En las regiones las emisoras comunitarias son fundamentales para la construcción de paz. Apoyar el monitoreo del cumplimiento de los acuerdos de paz es tan solo una de ellas. ', 8)
INSERT [dbo].[TBL_RRETROALIMENTACION] ([IdRetroalimentacion], [RetroAlimentacion], [IdRespuesta]) VALUES (9, N'RESPUESTA CORRECTA-  En las regiones las emisoras comunitarias son fundamentales para la construcción de paz.', 9)
SET IDENTITY_INSERT [dbo].[TBL_RRETROALIMENTACION] OFF
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TBL_RRespuestas_TBL_RRespuestas]') AND parent_object_id = OBJECT_ID(N'[dbo].[TBL_RRESPUESTA]'))
ALTER TABLE [dbo].[TBL_RRESPUESTA]  WITH CHECK ADD  CONSTRAINT [FK_TBL_RRespuestas_TBL_RRespuestas] FOREIGN KEY([IdPregunta])
REFERENCES [dbo].[TBL_RPREGUNTA] ([IdPregunta])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TBL_RRespuestas_TBL_RRespuestas]') AND parent_object_id = OBJECT_ID(N'[dbo].[TBL_RRESPUESTA]'))
ALTER TABLE [dbo].[TBL_RRESPUESTA] CHECK CONSTRAINT [FK_TBL_RRespuestas_TBL_RRespuestas]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TBL_RRETROALIMENTACION_TBL_RRESPUESTA]') AND parent_object_id = OBJECT_ID(N'[dbo].[TBL_RRETROALIMENTACION]'))
ALTER TABLE [dbo].[TBL_RRETROALIMENTACION]  WITH CHECK ADD  CONSTRAINT [FK_TBL_RRETROALIMENTACION_TBL_RRESPUESTA] FOREIGN KEY([IdRespuesta])
REFERENCES [dbo].[TBL_RRESPUESTA] ([IdRespuesta])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TBL_RRETROALIMENTACION_TBL_RRESPUESTA]') AND parent_object_id = OBJECT_ID(N'[dbo].[TBL_RRETROALIMENTACION]'))
ALTER TABLE [dbo].[TBL_RRETROALIMENTACION] CHECK CONSTRAINT [FK_TBL_RRETROALIMENTACION_TBL_RRESPUESTA]
GO
