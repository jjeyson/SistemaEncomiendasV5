USE [DB_A4909B_SistemaEncomiendas]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 11/06/2019 09:51:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[idCliente] [int] IDENTITY(1,1) NOT NULL,
	[TipoDocumento] [varchar](15) NULL,
	[NumDocumento] [nchar](11) NOT NULL,
	[RazonSocial] [varchar](200) NULL,
	[Nombres] [varchar](25) NULL,
	[ApellidoPaterno] [varchar](25) NULL,
	[ApellidoMaterno] [varchar](25) NULL,
	[Direccion] [varchar](100) NOT NULL,
	[Telefono] [varchar](20) NULL,
	[Activo] [bit] NOT NULL,
 CONSTRAINT [PK_Cliente] PRIMARY KEY CLUSTERED 
(
	[idCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DetalleDocumentoEnvioEncomienda]    Script Date: 11/06/2019 09:51:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetalleDocumentoEnvioEncomienda](
	[idDetalleDocumentoEnvioEncomienda] [int] IDENTITY(1,1) NOT NULL,
	[idDocumentoEnvio] [int] NOT NULL,
	[Descripción] [varchar](25) NOT NULL,
	[Peso] [int] NOT NULL,
 CONSTRAINT [PK_DetalleDocumentoEnvioEncomienda] PRIMARY KEY CLUSTERED 
(
	[idDetalleDocumentoEnvioEncomienda] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DocumentoEnvioEncomienda]    Script Date: 11/06/2019 09:51:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DocumentoEnvioEncomienda](
	[idDocumentoEnvioEncomienda] [int] IDENTITY(1,1) NOT NULL,
	[idRuta] [int] NOT NULL,
	[FechaEnvio] [date] NOT NULL,
	[FechaEntrega] [date] NULL,
	[A_Domicilio] [varchar](50) NOT NULL,
	[Estado] [varchar](20) NOT NULL,
	[idClienteEnvio] [int] NOT NULL,
	[idClienteEntrega] [int] NULL,
	[Activo] [bit] NOT NULL,
	[ConductorNombre] [nvarchar](50) NULL,
 CONSTRAINT [PK_DocumentoEnvioEncomienda_1] PRIMARY KEY CLUSTERED 
(
	[idDocumentoEnvioEncomienda] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DocumentoPago]    Script Date: 11/06/2019 09:51:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DocumentoPago](
	[idDocumentoPago] [int] IDENTITY(1,1) NOT NULL,
	[idDocumentoEnvio] [int] NOT NULL,
	[NumSerie] [char](3) NOT NULL,
	[NumDocumento] [char](8) NOT NULL,
	[TipoDocumentoPago] [varchar](25) NOT NULL,
	[Monto] [decimal](13, 2) NOT NULL,
 CONSTRAINT [PK_DocumentoPago] PRIMARY KEY CLUSTERED 
(
	[idDocumentoPago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ruta]    Script Date: 11/06/2019 09:51:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ruta](
	[idRuta] [int] IDENTITY(1,1) NOT NULL,
	[idSucursalDestino] [int] NOT NULL,
	[idSucursalOrigen] [int] NOT NULL,
	[Descripcion] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Ruta] PRIMARY KEY CLUSTERED 
(
	[idRuta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sucursal]    Script Date: 11/06/2019 09:51:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sucursal](
	[idSucursal] [int] IDENTITY(1,1) NOT NULL,
	[Ciudad] [varchar](20) NOT NULL,
	[Direccion] [varchar](50) NOT NULL,
	[Telefono] [varchar](20) NULL,
	[Activo] [bit] NOT NULL,
 CONSTRAINT [PK_Sucursal] PRIMARY KEY CLUSTERED 
(
	[idSucursal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tarifa]    Script Date: 11/06/2019 09:51:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tarifa](
	[idTarifa] [int] IDENTITY(1,1) NOT NULL,
	[idRuta] [int] NOT NULL,
	[Descripcion] [varchar](25) NOT NULL,
	[PrecioGramo] [decimal](6, 2) NOT NULL,
	[Activo] [bit] NOT NULL,
 CONSTRAINT [PK_Tarifa] PRIMARY KEY CLUSTERED 
(
	[idTarifa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoUsuario]    Script Date: 11/06/2019 09:51:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoUsuario](
	[idUsuario] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](50) NULL,
	[estado] [bit] NULL,
 CONSTRAINT [PK_TipoUsuario] PRIMARY KEY CLUSTERED 
(
	[idUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 11/06/2019 09:51:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[idUsuario] [int] IDENTITY(1,1) NOT NULL,
	[idSucursal] [int] NOT NULL,
	[Usuario] [varchar](6) NOT NULL,
	[Clave] [varchar](8) NOT NULL,
	[NombreUsuario] [varchar](25) NOT NULL,
	[ApellidosUsuario] [varchar](25) NOT NULL,
	[DNI] [varchar](8) NOT NULL,
	[Cargo] [varchar](25) NOT NULL,
	[Direccion] [varchar](50) NOT NULL,
	[Telefono] [varchar](20) NULL,
	[tipoUsuario] [int] NOT NULL,
	[Activo] [bit] NOT NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[idUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Cliente] ON 

INSERT [dbo].[Cliente] ([idCliente], [TipoDocumento], [NumDocumento], [RazonSocial], [Nombres], [ApellidoPaterno], [ApellidoMaterno], [Direccion], [Telefono], [Activo]) VALUES (1, N'RUC', N'12365498745', N'Agromaster SAC', N'', N'', N'', N'Av. Tren 451', N'987456123', 0)
INSERT [dbo].[Cliente] ([idCliente], [TipoDocumento], [NumDocumento], [RazonSocial], [Nombres], [ApellidoPaterno], [ApellidoMaterno], [Direccion], [Telefono], [Activo]) VALUES (2, N'DNI', N'78451263   ', N'', N'Juan', N'Perez', N'Sanchez', N'Jr. Juares 718', N'956321478', 0)
INSERT [dbo].[Cliente] ([idCliente], [TipoDocumento], [NumDocumento], [RazonSocial], [Nombres], [ApellidoPaterno], [ApellidoMaterno], [Direccion], [Telefono], [Activo]) VALUES (3, N'DNI', N'79654832   ', N'', N'Luis Angel', N'Agreda', N'Martinez', N'Av. America 789', N'951478245', 0)
INSERT [dbo].[Cliente] ([idCliente], [TipoDocumento], [NumDocumento], [RazonSocial], [Nombres], [ApellidoPaterno], [ApellidoMaterno], [Direccion], [Telefono], [Activo]) VALUES (4, N'RUC', N'12332156784', N'Master Solutions', N'', N'', N'', N'Monserrate 122', N'951456789', 1)
INSERT [dbo].[Cliente] ([idCliente], [TipoDocumento], [NumDocumento], [RazonSocial], [Nombres], [ApellidoPaterno], [ApellidoMaterno], [Direccion], [Telefono], [Activo]) VALUES (5, N'RUC', N'14523687959', N'Agro Casa Grande', N'', N'', N'', N'Av. Tipuanatipa 123', N'449955', 1)
INSERT [dbo].[Cliente] ([idCliente], [TipoDocumento], [NumDocumento], [RazonSocial], [Nombres], [ApellidoPaterno], [ApellidoMaterno], [Direccion], [Telefono], [Activo]) VALUES (6, N'DNI', N'78451265   ', N'', N'Juan Carlos', N'Sanchez', N'Quispe', N'Cl. Cajamarca 35', N'958654864', 0)
INSERT [dbo].[Cliente] ([idCliente], [TipoDocumento], [NumDocumento], [RazonSocial], [Nombres], [ApellidoPaterno], [ApellidoMaterno], [Direccion], [Telefono], [Activo]) VALUES (7, N'RUC', N'15987435264', N'Empresa Cartavio', N'', N'', N'', N'Cartavio 900', N'447788', 1)
INSERT [dbo].[Cliente] ([idCliente], [TipoDocumento], [NumDocumento], [RazonSocial], [Nombres], [ApellidoPaterno], [ApellidoMaterno], [Direccion], [Telefono], [Activo]) VALUES (8, N'RUC', N'18745632456', N'Señor Marcabalito', N'', N'', N'', N'Av. Tren 451', N'987456123', 0)
INSERT [dbo].[Cliente] ([idCliente], [TipoDocumento], [NumDocumento], [RazonSocial], [Nombres], [ApellidoPaterno], [ApellidoMaterno], [Direccion], [Telefono], [Activo]) VALUES (9, N'DNI', N'14785214   ', N'', N'Anthonio', N'Rodriguez', N'Juarez', N'Av. Tren 145', N'044-449236', 0)
INSERT [dbo].[Cliente] ([idCliente], [TipoDocumento], [NumDocumento], [RazonSocial], [Nombres], [ApellidoPaterno], [ApellidoMaterno], [Direccion], [Telefono], [Activo]) VALUES (10, N'RUC', N'14563289777', N'Esika ', N'', N'', N'', N'Av. Tren 143', N'044-448854', 0)
INSERT [dbo].[Cliente] ([idCliente], [TipoDocumento], [NumDocumento], [RazonSocial], [Nombres], [ApellidoPaterno], [ApellidoMaterno], [Direccion], [Telefono], [Activo]) VALUES (11, N'RUC', N'14562389777', N'Agromaster', N'', N'', N'', N'Av. Tren 145', N'443322', 1)
INSERT [dbo].[Cliente] ([idCliente], [TipoDocumento], [NumDocumento], [RazonSocial], [Nombres], [ApellidoPaterno], [ApellidoMaterno], [Direccion], [Telefono], [Activo]) VALUES (12, N'DNI', N'70937527   ', N'', N'Jason', N'Rodriguez', N'Ortiz', N'Santa Rosa #215', N'944299632', 0)
INSERT [dbo].[Cliente] ([idCliente], [TipoDocumento], [NumDocumento], [RazonSocial], [Nombres], [ApellidoPaterno], [ApellidoMaterno], [Direccion], [Telefono], [Activo]) VALUES (13, N'RUC', N'10178619751', N'Segura', N'', N'', N'', N'Trujillo', N'555555555', 1)
INSERT [dbo].[Cliente] ([idCliente], [TipoDocumento], [NumDocumento], [RazonSocial], [Nombres], [ApellidoPaterno], [ApellidoMaterno], [Direccion], [Telefono], [Activo]) VALUES (14, N'DNI', N'17861975   ', N'', N'Jason', N'Rodriguez', N'Ortiz', N'Trujillo', N'944299632', 1)
INSERT [dbo].[Cliente] ([idCliente], [TipoDocumento], [NumDocumento], [RazonSocial], [Nombres], [ApellidoPaterno], [ApellidoMaterno], [Direccion], [Telefono], [Activo]) VALUES (15, N'RUC', N'10709375271', N'Jason R', N'', N'', N'', N'Moche', N'555555555', 1)
INSERT [dbo].[Cliente] ([idCliente], [TipoDocumento], [NumDocumento], [RazonSocial], [Nombres], [ApellidoPaterno], [ApellidoMaterno], [Direccion], [Telefono], [Activo]) VALUES (16, N'RUC', N'95959595959', N'Corporacion Marley', N'', N'', N'', N'Laredo', N'959595959', 1)
INSERT [dbo].[Cliente] ([idCliente], [TipoDocumento], [NumDocumento], [RazonSocial], [Nombres], [ApellidoPaterno], [ApellidoMaterno], [Direccion], [Telefono], [Activo]) VALUES (17, N'RUC', N'10483918121', N'Negocios Segura SAC...', N'', N'', N'', N'Trujillo', N'959595959', 1)
INSERT [dbo].[Cliente] ([idCliente], [TipoDocumento], [NumDocumento], [RazonSocial], [Nombres], [ApellidoPaterno], [ApellidoMaterno], [Direccion], [Telefono], [Activo]) VALUES (18, N'DNI', N'78964512   ', N'', N'test', N'test', N'test', N'test 123', N'78456231', 1)
INSERT [dbo].[Cliente] ([idCliente], [TipoDocumento], [NumDocumento], [RazonSocial], [Nombres], [ApellidoPaterno], [ApellidoMaterno], [Direccion], [Telefono], [Activo]) VALUES (19, N'RUC', N'20538856674', N'ARTROSCOPICTRAUMA S.A.C. ', N'', N'', N'', N'CALLE AGUSTIN LARA NO. 69-B', N'91-(287)-5-27-81', 1)
INSERT [dbo].[Cliente] ([idCliente], [TipoDocumento], [NumDocumento], [RazonSocial], [Nombres], [ApellidoPaterno], [ApellidoMaterno], [Direccion], [Telefono], [Activo]) VALUES (20, N'RUC', N'20551597939', N'ASOCIACION COMUNIDAD CRIS', N'', N'', N'', N'AV. INDEPENDENCIA NO. 241', N'91-(287 )- 5-00-17', 1)
INSERT [dbo].[Cliente] ([idCliente], [TipoDocumento], [NumDocumento], [RazonSocial], [Nombres], [ApellidoPaterno], [ApellidoMaterno], [Direccion], [Telefono], [Activo]) VALUES (21, N'RUC', N'20553856451', N'BI GRAND CONFECCIONES S.A', N'', N'', N'', N'AV. 20 DE NOVIEMBRE NO.1024', N'91-(287 )-5-14-17', 1)
INSERT [dbo].[Cliente] ([idCliente], [TipoDocumento], [NumDocumento], [RazonSocial], [Nombres], [ApellidoPaterno], [ApellidoMaterno], [Direccion], [Telefono], [Activo]) VALUES (22, N'RUC', N'20525426778', N'CONCEPTOS & CONSTRUCCIONE', N'', N'', N'', N'CARRETERA A LOMA ALTA S/N.', N'91-(287)-5-39-32', 1)
INSERT [dbo].[Cliente] ([idCliente], [TipoDocumento], [NumDocumento], [RazonSocial], [Nombres], [ApellidoPaterno], [ApellidoMaterno], [Direccion], [Telefono], [Activo]) VALUES (23, N'RUC', N'20555629541', N'CORPORACION INDUSTRIAL AL', N'', N'', N'', N'AV. 20 DE NOVIEMBRE NO. 1060', N'91-(287)-50605', 1)
INSERT [dbo].[Cliente] ([idCliente], [TipoDocumento], [NumDocumento], [RazonSocial], [Nombres], [ApellidoPaterno], [ApellidoMaterno], [Direccion], [Telefono], [Activo]) VALUES (24, N'RUC', N'20480316259', N'D''AROMAS E.I.R.L. ', N'', N'', N'', N'CALLE MATAMOROS NO. 127', N'01 287 5 37 77', 1)
INSERT [dbo].[Cliente] ([idCliente], [TipoDocumento], [NumDocumento], [RazonSocial], [Nombres], [ApellidoPaterno], [ApellidoMaterno], [Direccion], [Telefono], [Activo]) VALUES (25, N'RUC', N'20601587417', N'ESTUDIO CONTABLE BUSTAMANTE & VICHARRA SOCIEDAD AN', N'', N'', N'', N'AV. 5 DE MAYO NO. 1652', N'01 287 5 35 59', 1)
INSERT [dbo].[Cliente] ([idCliente], [TipoDocumento], [NumDocumento], [RazonSocial], [Nombres], [ApellidoPaterno], [ApellidoMaterno], [Direccion], [Telefono], [Activo]) VALUES (26, N'RUC', N'20600060172', N'GARDINALLI SALUD & BIENESTAR S.A.C. ', N'', N'', N'', N'AV. 5 DE MAYO NO. 1108', N'01 287 5 35 59', 1)
INSERT [dbo].[Cliente] ([idCliente], [TipoDocumento], [NumDocumento], [RazonSocial], [Nombres], [ApellidoPaterno], [ApellidoMaterno], [Direccion], [Telefono], [Activo]) VALUES (27, N'RUC', N'20518639928', N'H & J E HIJOS E.I.R.L ', N'', N'', N'', N'AV. INDEPENDENCIA NO. 748', N'01 287 5 30 90', 1)
INSERT [dbo].[Cliente] ([idCliente], [TipoDocumento], [NumDocumento], [RazonSocial], [Nombres], [ApellidoPaterno], [ApellidoMaterno], [Direccion], [Telefono], [Activo]) VALUES (28, N'RUC', N'20558629585', N'INSUMOS PISQUEROS DEL SUR E.I.R.L. ', N'', N'', N'', N'AV. INDEPENDENCIA NO. 985-A', N'01 287 5 43 12', 1)
INSERT [dbo].[Cliente] ([idCliente], [TipoDocumento], [NumDocumento], [RazonSocial], [Nombres], [ApellidoPaterno], [ApellidoMaterno], [Direccion], [Telefono], [Activo]) VALUES (29, N'RUC', N'20543248984', N'MODAS LOREN EIRL ', N'', N'', N'', N'BLVD. BENITO JUAREZ S / N', N'91-(287)-5-25-69', 1)
INSERT [dbo].[Cliente] ([idCliente], [TipoDocumento], [NumDocumento], [RazonSocial], [Nombres], [ApellidoPaterno], [ApellidoMaterno], [Direccion], [Telefono], [Activo]) VALUES (30, N'RUC', N'20523447948', N'PLASTIMETAL INVERSIONES S.A.C. ', N'', N'', N'', N'MATAMOROS NO 149', N'91-(287)- 5-25-69', 1)
INSERT [dbo].[Cliente] ([idCliente], [TipoDocumento], [NumDocumento], [RazonSocial], [Nombres], [ApellidoPaterno], [ApellidoMaterno], [Direccion], [Telefono], [Activo]) VALUES (31, N'RUC', N'20600705114', N'RECURSOS DEL PRADO E.I.R.L. ', N'', N'', N'', N'AV. 5 DE MAYO NO 1100-A', N'91-(287)-5-15-47', 1)
INSERT [dbo].[Cliente] ([idCliente], [TipoDocumento], [NumDocumento], [RazonSocial], [Nombres], [ApellidoPaterno], [ApellidoMaterno], [Direccion], [Telefono], [Activo]) VALUES (32, N'RUC', N'20553476462', N'REPRESENTACIONES DIERA S.A.C. ', N'', N'', N'', N'AV. 20 DE NOVIEMBRE NO 1540', N'01 287 5 19 61', 1)
INSERT [dbo].[Cliente] ([idCliente], [TipoDocumento], [NumDocumento], [RazonSocial], [Nombres], [ApellidoPaterno], [ApellidoMaterno], [Direccion], [Telefono], [Activo]) VALUES (33, N'RUC', N'20556610143', N'SANDRA & ABIGAIL GENERAL SERVICE S.A.C. ', N'', N'', N'', N'CALLE OCAMPO NO 14', N'01 287 5 36 56', 1)
INSERT [dbo].[Cliente] ([idCliente], [TipoDocumento], [NumDocumento], [RazonSocial], [Nombres], [ApellidoPaterno], [ApellidoMaterno], [Direccion], [Telefono], [Activo]) VALUES (34, N'RUC', N'20553741123', N'SERVICIOS TECNICOS EL CHALANCITO SOCIEDAD ANONIMA ', N'', N'', N'', N'CALLE ALDAMA NO 156 CENTRO TUXTEPEC 68300   NICOLA', N'01 287 5 36 56', 1)
INSERT [dbo].[Cliente] ([idCliente], [TipoDocumento], [NumDocumento], [RazonSocial], [Nombres], [ApellidoPaterno], [ApellidoMaterno], [Direccion], [Telefono], [Activo]) VALUES (35, N'RUC', N'20552271794', N'SINERGIAS ECONOMICAS SOCIEDAD ANONIMA CERRADA - EC', N'', N'', N'', N'AV. INDEPENDENCIA NO 145', N'01 287 5 36 65', 1)
INSERT [dbo].[Cliente] ([idCliente], [TipoDocumento], [NumDocumento], [RazonSocial], [Nombres], [ApellidoPaterno], [ApellidoMaterno], [Direccion], [Telefono], [Activo]) VALUES (36, N'RUC', N'20551936903', N'SOLUCIONES AUTOMATICAS INTEGRALES DEL PERU S.A.C. ', N'', N'', N'', N'AV. 5 DE MAYO NO 1253', N'7578102530', 1)
INSERT [dbo].[Cliente] ([idCliente], [TipoDocumento], [NumDocumento], [RazonSocial], [Nombres], [ApellidoPaterno], [ApellidoMaterno], [Direccion], [Telefono], [Activo]) VALUES (37, N'RUC', N'20563223457', N'TRANSPORTES Y SERVICIOS MULTIPLES RONCO PERU S.A.C', N'', N'', N'', N'CALLE OCAMPO NO 14', N'6166400922', 1)
INSERT [dbo].[Cliente] ([idCliente], [TipoDocumento], [NumDocumento], [RazonSocial], [Nombres], [ApellidoPaterno], [ApellidoMaterno], [Direccion], [Telefono], [Activo]) VALUES (38, N'DNI', N'  03099602 ', N'', N'MERCEDES', N'CASTILLO', N'NAVARRO', N'CERCADO DE LIMA
', N'934957638', 1)
INSERT [dbo].[Cliente] ([idCliente], [TipoDocumento], [NumDocumento], [RazonSocial], [Nombres], [ApellidoPaterno], [ApellidoMaterno], [Direccion], [Telefono], [Activo]) VALUES (41, N'DNI', N'10666756   ', NULL, N'MARCOS ANTONIO', N'NAVARRO', N'CHAPOÑAN', N'CERCADO DE LIMA', N'779177326 ', 1)
INSERT [dbo].[Cliente] ([idCliente], [TipoDocumento], [NumDocumento], [RazonSocial], [Nombres], [ApellidoPaterno], [ApellidoMaterno], [Direccion], [Telefono], [Activo]) VALUES (43, N'DNI', N'10439512   ', NULL, N'NICOLAS HENRY', N'OLIVOS', N'CHAPOÑAN', N'CERCADO DE LIMA', N'537718185', 1)
INSERT [dbo].[Cliente] ([idCliente], [TipoDocumento], [NumDocumento], [RazonSocial], [Nombres], [ApellidoPaterno], [ApellidoMaterno], [Direccion], [Telefono], [Activo]) VALUES (45, N'DNI', N'16687420   ', NULL, N'ELIZABETH', N'REYES', N'ALDANA', N'CERCADO DE LIMA', N'993982596 ', 1)
INSERT [dbo].[Cliente] ([idCliente], [TipoDocumento], [NumDocumento], [RazonSocial], [Nombres], [ApellidoPaterno], [ApellidoMaterno], [Direccion], [Telefono], [Activo]) VALUES (46, N'DNI', N'19196272   ', NULL, N'MANUEL ESTUARDO', N'TERRONES', N'PAUCAR', N'CERCADO DE LIMA
', N'721803777', 1)
INSERT [dbo].[Cliente] ([idCliente], [TipoDocumento], [NumDocumento], [RazonSocial], [Nombres], [ApellidoPaterno], [ApellidoMaterno], [Direccion], [Telefono], [Activo]) VALUES (47, N'DNI', N'19210909   ', NULL, N'ROSA MARIA', N'QUIROZ', N'RAMIREZ', N'CERCADO DE LIMA', N'19210909', 1)
INSERT [dbo].[Cliente] ([idCliente], [TipoDocumento], [NumDocumento], [RazonSocial], [Nombres], [ApellidoPaterno], [ApellidoMaterno], [Direccion], [Telefono], [Activo]) VALUES (48, N'DNI', N'19211382   ', NULL, N'MARIA ANA', N'CRUZADO', N'CABANILLAS', N'CERCADO DE LIMA', N'690885149 ', 1)
INSERT [dbo].[Cliente] ([idCliente], [TipoDocumento], [NumDocumento], [RazonSocial], [Nombres], [ApellidoPaterno], [ApellidoMaterno], [Direccion], [Telefono], [Activo]) VALUES (50, N'DNI', N'19321425   ', NULL, N'SISY GRACIELA', N'CORREA', N'PAUCAR', N'CERCADO DE LIMA', N'784774766 ', 1)
SET IDENTITY_INSERT [dbo].[Cliente] OFF
SET IDENTITY_INSERT [dbo].[DetalleDocumentoEnvioEncomienda] ON 

INSERT [dbo].[DetalleDocumentoEnvioEncomienda] ([idDetalleDocumentoEnvioEncomienda], [idDocumentoEnvio], [Descripción], [Peso]) VALUES (1, 1, N'5 Paquetes de Papel Bond ', 40)
INSERT [dbo].[DetalleDocumentoEnvioEncomienda] ([idDetalleDocumentoEnvioEncomienda], [idDocumentoEnvio], [Descripción], [Peso]) VALUES (2, 1, N'3 Sacos de Azucar', 150)
INSERT [dbo].[DetalleDocumentoEnvioEncomienda] ([idDetalleDocumentoEnvioEncomienda], [idDocumentoEnvio], [Descripción], [Peso]) VALUES (3, 2, N'2 Sacos de Arroz', 100)
INSERT [dbo].[DetalleDocumentoEnvioEncomienda] ([idDetalleDocumentoEnvioEncomienda], [idDocumentoEnvio], [Descripción], [Peso]) VALUES (4, 2, N'1 Juego de Ollas', 8)
INSERT [dbo].[DetalleDocumentoEnvioEncomienda] ([idDetalleDocumentoEnvioEncomienda], [idDocumentoEnvio], [Descripción], [Peso]) VALUES (6, 3, N'1 Computadora Hp LE2002x', 35)
INSERT [dbo].[DetalleDocumentoEnvioEncomienda] ([idDetalleDocumentoEnvioEncomienda], [idDocumentoEnvio], [Descripción], [Peso]) VALUES (7, 4, N'Dos Sacos de Papas', 100)
INSERT [dbo].[DetalleDocumentoEnvioEncomienda] ([idDetalleDocumentoEnvioEncomienda], [idDocumentoEnvio], [Descripción], [Peso]) VALUES (8, 4, N'4 Paq. Papel Bond', 50)
INSERT [dbo].[DetalleDocumentoEnvioEncomienda] ([idDetalleDocumentoEnvioEncomienda], [idDocumentoEnvio], [Descripción], [Peso]) VALUES (9, 4, N'4 Paquetes', 30)
INSERT [dbo].[DetalleDocumentoEnvioEncomienda] ([idDetalleDocumentoEnvioEncomienda], [idDocumentoEnvio], [Descripción], [Peso]) VALUES (10, 4, N'4 Paquetes Otros', 500)
INSERT [dbo].[DetalleDocumentoEnvioEncomienda] ([idDetalleDocumentoEnvioEncomienda], [idDocumentoEnvio], [Descripción], [Peso]) VALUES (11, 5, N'4 Paquetes Otros', 500)
INSERT [dbo].[DetalleDocumentoEnvioEncomienda] ([idDetalleDocumentoEnvioEncomienda], [idDocumentoEnvio], [Descripción], [Peso]) VALUES (12, 5, N'Paquete 2', 50)
INSERT [dbo].[DetalleDocumentoEnvioEncomienda] ([idDetalleDocumentoEnvioEncomienda], [idDocumentoEnvio], [Descripción], [Peso]) VALUES (13, 6, N'4 Paquetes bond', 200)
INSERT [dbo].[DetalleDocumentoEnvioEncomienda] ([idDetalleDocumentoEnvioEncomienda], [idDocumentoEnvio], [Descripción], [Peso]) VALUES (14, 6, N'4 Paquetes Otros', 200)
INSERT [dbo].[DetalleDocumentoEnvioEncomienda] ([idDetalleDocumentoEnvioEncomienda], [idDocumentoEnvio], [Descripción], [Peso]) VALUES (15, 7, N'dfdf', 50)
INSERT [dbo].[DetalleDocumentoEnvioEncomienda] ([idDetalleDocumentoEnvioEncomienda], [idDocumentoEnvio], [Descripción], [Peso]) VALUES (16, 7, N'dfdfyy', 500)
INSERT [dbo].[DetalleDocumentoEnvioEncomienda] ([idDetalleDocumentoEnvioEncomienda], [idDocumentoEnvio], [Descripción], [Peso]) VALUES (17, 7, N'Televisor LG Led 42''''', 70)
INSERT [dbo].[DetalleDocumentoEnvioEncomienda] ([idDetalleDocumentoEnvioEncomienda], [idDocumentoEnvio], [Descripción], [Peso]) VALUES (18, 8, N'Paquetes', 500)
INSERT [dbo].[DetalleDocumentoEnvioEncomienda] ([idDetalleDocumentoEnvioEncomienda], [idDocumentoEnvio], [Descripción], [Peso]) VALUES (19, 9, N'Paquetes 1', 200)
INSERT [dbo].[DetalleDocumentoEnvioEncomienda] ([idDetalleDocumentoEnvioEncomienda], [idDocumentoEnvio], [Descripción], [Peso]) VALUES (20, 9, N'Paquetes 2', 200)
INSERT [dbo].[DetalleDocumentoEnvioEncomienda] ([idDetalleDocumentoEnvioEncomienda], [idDocumentoEnvio], [Descripción], [Peso]) VALUES (21, 10, N'Ropero 1.5 x 1.5 Marron', 80)
INSERT [dbo].[DetalleDocumentoEnvioEncomienda] ([idDetalleDocumentoEnvioEncomienda], [idDocumentoEnvio], [Descripción], [Peso]) VALUES (22, 10, N'Colchon Paraiso', 30)
INSERT [dbo].[DetalleDocumentoEnvioEncomienda] ([idDetalleDocumentoEnvioEncomienda], [idDocumentoEnvio], [Descripción], [Peso]) VALUES (23, 13, N'Colchon Paraiso', 50)
INSERT [dbo].[DetalleDocumentoEnvioEncomienda] ([idDetalleDocumentoEnvioEncomienda], [idDocumentoEnvio], [Descripción], [Peso]) VALUES (24, 13, N'Armario 1.5 x .15 mts', 110)
INSERT [dbo].[DetalleDocumentoEnvioEncomienda] ([idDetalleDocumentoEnvioEncomienda], [idDocumentoEnvio], [Descripción], [Peso]) VALUES (25, 14, N'Sofa Negro', 200)
INSERT [dbo].[DetalleDocumentoEnvioEncomienda] ([idDetalleDocumentoEnvioEncomienda], [idDocumentoEnvio], [Descripción], [Peso]) VALUES (26, 14, N'Televisor 22''''', 20)
INSERT [dbo].[DetalleDocumentoEnvioEncomienda] ([idDetalleDocumentoEnvioEncomienda], [idDocumentoEnvio], [Descripción], [Peso]) VALUES (28, 15, N'5 Paquete Papel', 30)
INSERT [dbo].[DetalleDocumentoEnvioEncomienda] ([idDetalleDocumentoEnvioEncomienda], [idDocumentoEnvio], [Descripción], [Peso]) VALUES (29, 16, N'2 Paquetes', 15)
INSERT [dbo].[DetalleDocumentoEnvioEncomienda] ([idDetalleDocumentoEnvioEncomienda], [idDocumentoEnvio], [Descripción], [Peso]) VALUES (30, 17, N'1 Paquete', 25)
INSERT [dbo].[DetalleDocumentoEnvioEncomienda] ([idDetalleDocumentoEnvioEncomienda], [idDocumentoEnvio], [Descripción], [Peso]) VALUES (31, 18, N'5 Impresoras Cannon', 70)
INSERT [dbo].[DetalleDocumentoEnvioEncomienda] ([idDetalleDocumentoEnvioEncomienda], [idDocumentoEnvio], [Descripción], [Peso]) VALUES (32, 18, N'4 Paquetes de Papel', 60)
INSERT [dbo].[DetalleDocumentoEnvioEncomienda] ([idDetalleDocumentoEnvioEncomienda], [idDocumentoEnvio], [Descripción], [Peso]) VALUES (33, 19, N'Armario 2 Plazas', 90)
INSERT [dbo].[DetalleDocumentoEnvioEncomienda] ([idDetalleDocumentoEnvioEncomienda], [idDocumentoEnvio], [Descripción], [Peso]) VALUES (34, 20, N'Paquete 1', 50)
INSERT [dbo].[DetalleDocumentoEnvioEncomienda] ([idDetalleDocumentoEnvioEncomienda], [idDocumentoEnvio], [Descripción], [Peso]) VALUES (35, 20, N'Paquete 2', 50)
INSERT [dbo].[DetalleDocumentoEnvioEncomienda] ([idDetalleDocumentoEnvioEncomienda], [idDocumentoEnvio], [Descripción], [Peso]) VALUES (36, 21, N'15 Bolsa Cemento', 150)
INSERT [dbo].[DetalleDocumentoEnvioEncomienda] ([idDetalleDocumentoEnvioEncomienda], [idDocumentoEnvio], [Descripción], [Peso]) VALUES (37, 22, N'Colchon Paraiso', 30)
INSERT [dbo].[DetalleDocumentoEnvioEncomienda] ([idDetalleDocumentoEnvioEncomienda], [idDocumentoEnvio], [Descripción], [Peso]) VALUES (38, 23, N'4 Sacos Azucar', 150)
INSERT [dbo].[DetalleDocumentoEnvioEncomienda] ([idDetalleDocumentoEnvioEncomienda], [idDocumentoEnvio], [Descripción], [Peso]) VALUES (39, 24, N'Paquete 1', 100)
INSERT [dbo].[DetalleDocumentoEnvioEncomienda] ([idDetalleDocumentoEnvioEncomienda], [idDocumentoEnvio], [Descripción], [Peso]) VALUES (40, 25, N'Paquetes 123', 50)
INSERT [dbo].[DetalleDocumentoEnvioEncomienda] ([idDetalleDocumentoEnvioEncomienda], [idDocumentoEnvio], [Descripción], [Peso]) VALUES (41, 26, N'Paquetes otros', 45)
INSERT [dbo].[DetalleDocumentoEnvioEncomienda] ([idDetalleDocumentoEnvioEncomienda], [idDocumentoEnvio], [Descripción], [Peso]) VALUES (42, 27, N'Paquetes ', 200)
INSERT [dbo].[DetalleDocumentoEnvioEncomienda] ([idDetalleDocumentoEnvioEncomienda], [idDocumentoEnvio], [Descripción], [Peso]) VALUES (43, 27, N'Paquetes 2', 200)
INSERT [dbo].[DetalleDocumentoEnvioEncomienda] ([idDetalleDocumentoEnvioEncomienda], [idDocumentoEnvio], [Descripción], [Peso]) VALUES (44, 28, N'Colchon Paraiso', 30)
INSERT [dbo].[DetalleDocumentoEnvioEncomienda] ([idDetalleDocumentoEnvioEncomienda], [idDocumentoEnvio], [Descripción], [Peso]) VALUES (45, 29, N'Paquete 123', 50)
INSERT [dbo].[DetalleDocumentoEnvioEncomienda] ([idDetalleDocumentoEnvioEncomienda], [idDocumentoEnvio], [Descripción], [Peso]) VALUES (46, 30, N'Test ', 12)
INSERT [dbo].[DetalleDocumentoEnvioEncomienda] ([idDetalleDocumentoEnvioEncomienda], [idDocumentoEnvio], [Descripción], [Peso]) VALUES (47, 31, N'Ketes', 1)
INSERT [dbo].[DetalleDocumentoEnvioEncomienda] ([idDetalleDocumentoEnvioEncomienda], [idDocumentoEnvio], [Descripción], [Peso]) VALUES (48, 31, N'Caja de facturas', 4)
INSERT [dbo].[DetalleDocumentoEnvioEncomienda] ([idDetalleDocumentoEnvioEncomienda], [idDocumentoEnvio], [Descripción], [Peso]) VALUES (49, 31, N'Paquete de Gaseosa', 8)
INSERT [dbo].[DetalleDocumentoEnvioEncomienda] ([idDetalleDocumentoEnvioEncomienda], [idDocumentoEnvio], [Descripción], [Peso]) VALUES (51, 33, N'Caja de jugos', 3)
INSERT [dbo].[DetalleDocumentoEnvioEncomienda] ([idDetalleDocumentoEnvioEncomienda], [idDocumentoEnvio], [Descripción], [Peso]) VALUES (52, 34, N'test4', 500)
INSERT [dbo].[DetalleDocumentoEnvioEncomienda] ([idDetalleDocumentoEnvioEncomienda], [idDocumentoEnvio], [Descripción], [Peso]) VALUES (53, 35, N'test4', 150)
INSERT [dbo].[DetalleDocumentoEnvioEncomienda] ([idDetalleDocumentoEnvioEncomienda], [idDocumentoEnvio], [Descripción], [Peso]) VALUES (54, 36, N'test4', 500)
INSERT [dbo].[DetalleDocumentoEnvioEncomienda] ([idDetalleDocumentoEnvioEncomienda], [idDocumentoEnvio], [Descripción], [Peso]) VALUES (55, 36, N'test411', 500)
INSERT [dbo].[DetalleDocumentoEnvioEncomienda] ([idDetalleDocumentoEnvioEncomienda], [idDocumentoEnvio], [Descripción], [Peso]) VALUES (56, 36, N'test4115', 500)
INSERT [dbo].[DetalleDocumentoEnvioEncomienda] ([idDetalleDocumentoEnvioEncomienda], [idDocumentoEnvio], [Descripción], [Peso]) VALUES (57, 37, N'Caja 1', 500)
INSERT [dbo].[DetalleDocumentoEnvioEncomienda] ([idDetalleDocumentoEnvioEncomienda], [idDocumentoEnvio], [Descripción], [Peso]) VALUES (58, 38, N'Caja 1', 500)
SET IDENTITY_INSERT [dbo].[DetalleDocumentoEnvioEncomienda] OFF
SET IDENTITY_INSERT [dbo].[DocumentoEnvioEncomienda] ON 

INSERT [dbo].[DocumentoEnvioEncomienda] ([idDocumentoEnvioEncomienda], [idRuta], [FechaEnvio], [FechaEntrega], [A_Domicilio], [Estado], [idClienteEnvio], [idClienteEntrega], [Activo], [ConductorNombre]) VALUES (1, 1, CAST(N'2015-10-10' AS Date), CAST(N'2015-11-29' AS Date), N'SIN DIRECCION', N'ENTREGADO', 1, 2, 1, NULL)
INSERT [dbo].[DocumentoEnvioEncomienda] ([idDocumentoEnvioEncomienda], [idRuta], [FechaEnvio], [FechaEntrega], [A_Domicilio], [Estado], [idClienteEnvio], [idClienteEntrega], [Activo], [ConductorNombre]) VALUES (2, 1, CAST(N'2015-10-12' AS Date), NULL, N'Jr. San Martin 784', N'ENVIADO', 2, 3, 1, NULL)
INSERT [dbo].[DocumentoEnvioEncomienda] ([idDocumentoEnvioEncomienda], [idRuta], [FechaEnvio], [FechaEntrega], [A_Domicilio], [Estado], [idClienteEnvio], [idClienteEntrega], [Activo], [ConductorNombre]) VALUES (3, 2, CAST(N'2015-10-13' AS Date), NULL, N'SIN DIRECCION', N'ENVIADO', 1, 3, 1, NULL)
INSERT [dbo].[DocumentoEnvioEncomienda] ([idDocumentoEnvioEncomienda], [idRuta], [FechaEnvio], [FechaEntrega], [A_Domicilio], [Estado], [idClienteEnvio], [idClienteEntrega], [Activo], [ConductorNombre]) VALUES (4, 1, CAST(N'2015-11-13' AS Date), CAST(N'2015-11-21' AS Date), N'SIN DIRECCION', N'ENTREGADO', 2, 4, 1, NULL)
INSERT [dbo].[DocumentoEnvioEncomienda] ([idDocumentoEnvioEncomienda], [idRuta], [FechaEnvio], [FechaEntrega], [A_Domicilio], [Estado], [idClienteEnvio], [idClienteEntrega], [Activo], [ConductorNombre]) VALUES (5, 1, CAST(N'2015-11-13' AS Date), CAST(N'2015-11-13' AS Date), N'SIN DIRECCION', N'ENTREGADO', 2, 1, 1, NULL)
INSERT [dbo].[DocumentoEnvioEncomienda] ([idDocumentoEnvioEncomienda], [idRuta], [FechaEnvio], [FechaEntrega], [A_Domicilio], [Estado], [idClienteEnvio], [idClienteEntrega], [Activo], [ConductorNombre]) VALUES (6, 1, CAST(N'2015-11-10' AS Date), CAST(N'2015-11-21' AS Date), N'SIN DIRECCION', N'ENTREGADO', 3, 4, 1, NULL)
INSERT [dbo].[DocumentoEnvioEncomienda] ([idDocumentoEnvioEncomienda], [idRuta], [FechaEnvio], [FechaEntrega], [A_Domicilio], [Estado], [idClienteEnvio], [idClienteEntrega], [Activo], [ConductorNombre]) VALUES (7, 1, CAST(N'2015-11-22' AS Date), NULL, N'SIN DIRECCION', N'ENVIADO', 2, 3, 1, NULL)
INSERT [dbo].[DocumentoEnvioEncomienda] ([idDocumentoEnvioEncomienda], [idRuta], [FechaEnvio], [FechaEntrega], [A_Domicilio], [Estado], [idClienteEnvio], [idClienteEntrega], [Activo], [ConductorNombre]) VALUES (8, 2, CAST(N'2015-11-21' AS Date), CAST(N'2015-11-22' AS Date), N'SIN DIRECCION', N'ENTREGADO', 6, 5, 1, NULL)
INSERT [dbo].[DocumentoEnvioEncomienda] ([idDocumentoEnvioEncomienda], [idRuta], [FechaEnvio], [FechaEntrega], [A_Domicilio], [Estado], [idClienteEnvio], [idClienteEntrega], [Activo], [ConductorNombre]) VALUES (9, 2, CAST(N'2015-11-20' AS Date), CAST(N'2015-11-22' AS Date), N'SIN DIRECCION', N'ENTREGADO', 1, 5, 1, NULL)
INSERT [dbo].[DocumentoEnvioEncomienda] ([idDocumentoEnvioEncomienda], [idRuta], [FechaEnvio], [FechaEntrega], [A_Domicilio], [Estado], [idClienteEnvio], [idClienteEntrega], [Activo], [ConductorNombre]) VALUES (10, 2, CAST(N'2015-11-23' AS Date), CAST(N'2015-11-23' AS Date), N'SIN DIRECCION', N'ENTREGADO', 6, 7, 1, NULL)
INSERT [dbo].[DocumentoEnvioEncomienda] ([idDocumentoEnvioEncomienda], [idRuta], [FechaEnvio], [FechaEntrega], [A_Domicilio], [Estado], [idClienteEnvio], [idClienteEntrega], [Activo], [ConductorNombre]) VALUES (13, 1, CAST(N'2015-11-23' AS Date), CAST(N'2015-11-27' AS Date), N'SIN DIRECCION', N'ENTREGADO', 9, 10, 1, NULL)
INSERT [dbo].[DocumentoEnvioEncomienda] ([idDocumentoEnvioEncomienda], [idRuta], [FechaEnvio], [FechaEntrega], [A_Domicilio], [Estado], [idClienteEnvio], [idClienteEntrega], [Activo], [ConductorNombre]) VALUES (14, 3, CAST(N'2015-11-20' AS Date), NULL, N'Av. Trujilo 456', N'ENVIADO', 4, 5, 1, NULL)
INSERT [dbo].[DocumentoEnvioEncomienda] ([idDocumentoEnvioEncomienda], [idRuta], [FechaEnvio], [FechaEntrega], [A_Domicilio], [Estado], [idClienteEnvio], [idClienteEntrega], [Activo], [ConductorNombre]) VALUES (15, 4, CAST(N'2015-11-21' AS Date), NULL, N'Av. Trujillo 587', N'ENVIADO', 7, 1, 1, NULL)
INSERT [dbo].[DocumentoEnvioEncomienda] ([idDocumentoEnvioEncomienda], [idRuta], [FechaEnvio], [FechaEntrega], [A_Domicilio], [Estado], [idClienteEnvio], [idClienteEntrega], [Activo], [ConductorNombre]) VALUES (16, 5, CAST(N'2015-10-17' AS Date), CAST(N'2015-11-27' AS Date), N'Jr La Union 415', N'ENTREGADO', 1, 10, 1, NULL)
INSERT [dbo].[DocumentoEnvioEncomienda] ([idDocumentoEnvioEncomienda], [idRuta], [FechaEnvio], [FechaEntrega], [A_Domicilio], [Estado], [idClienteEnvio], [idClienteEntrega], [Activo], [ConductorNombre]) VALUES (17, 6, CAST(N'2015-11-20' AS Date), NULL, N'Jr. Universitario 478', N'ENVIADO', 4, 6, 1, NULL)
INSERT [dbo].[DocumentoEnvioEncomienda] ([idDocumentoEnvioEncomienda], [idRuta], [FechaEnvio], [FechaEntrega], [A_Domicilio], [Estado], [idClienteEnvio], [idClienteEntrega], [Activo], [ConductorNombre]) VALUES (18, 3, CAST(N'2015-11-18' AS Date), CAST(N'2015-11-29' AS Date), N'SIN DIRECCION', N'ENTREGADO', 1, 2, 1, NULL)
INSERT [dbo].[DocumentoEnvioEncomienda] ([idDocumentoEnvioEncomienda], [idRuta], [FechaEnvio], [FechaEntrega], [A_Domicilio], [Estado], [idClienteEnvio], [idClienteEntrega], [Activo], [ConductorNombre]) VALUES (19, 3, CAST(N'2015-11-23' AS Date), CAST(N'2015-11-29' AS Date), N'SIN DIRECCION', N'ENTREGADO', 3, 2, 1, NULL)
INSERT [dbo].[DocumentoEnvioEncomienda] ([idDocumentoEnvioEncomienda], [idRuta], [FechaEnvio], [FechaEntrega], [A_Domicilio], [Estado], [idClienteEnvio], [idClienteEntrega], [Activo], [ConductorNombre]) VALUES (20, 6, CAST(N'2015-11-24' AS Date), NULL, N'SIN DIRECCION', N'ENVIADO', 6, 9, 1, NULL)
INSERT [dbo].[DocumentoEnvioEncomienda] ([idDocumentoEnvioEncomienda], [idRuta], [FechaEnvio], [FechaEntrega], [A_Domicilio], [Estado], [idClienteEnvio], [idClienteEntrega], [Activo], [ConductorNombre]) VALUES (21, 6, CAST(N'2015-11-23' AS Date), CAST(N'2015-11-27' AS Date), N'Av. Tren 178', N'ENTREGADO', 8, 10, 1, NULL)
INSERT [dbo].[DocumentoEnvioEncomienda] ([idDocumentoEnvioEncomienda], [idRuta], [FechaEnvio], [FechaEntrega], [A_Domicilio], [Estado], [idClienteEnvio], [idClienteEntrega], [Activo], [ConductorNombre]) VALUES (22, 5, CAST(N'2015-11-23' AS Date), NULL, N'SIN DIRECCION', N'ENVIADO', 1, 3, 1, NULL)
INSERT [dbo].[DocumentoEnvioEncomienda] ([idDocumentoEnvioEncomienda], [idRuta], [FechaEnvio], [FechaEntrega], [A_Domicilio], [Estado], [idClienteEnvio], [idClienteEntrega], [Activo], [ConductorNombre]) VALUES (23, 4, CAST(N'2015-11-23' AS Date), NULL, N'SIN DIRECCION', N'ENVIADO', 1, 7, 1, NULL)
INSERT [dbo].[DocumentoEnvioEncomienda] ([idDocumentoEnvioEncomienda], [idRuta], [FechaEnvio], [FechaEntrega], [A_Domicilio], [Estado], [idClienteEnvio], [idClienteEntrega], [Activo], [ConductorNombre]) VALUES (24, 6, CAST(N'2015-11-24' AS Date), NULL, N'SIN DIRECCION', N'ENVIADO', 3, 9, 1, NULL)
INSERT [dbo].[DocumentoEnvioEncomienda] ([idDocumentoEnvioEncomienda], [idRuta], [FechaEnvio], [FechaEntrega], [A_Domicilio], [Estado], [idClienteEnvio], [idClienteEntrega], [Activo], [ConductorNombre]) VALUES (25, 4, CAST(N'2015-11-24' AS Date), CAST(N'2015-11-29' AS Date), N'SIN DIRECCION', N'ENTREGADO', 6, 2, 1, NULL)
INSERT [dbo].[DocumentoEnvioEncomienda] ([idDocumentoEnvioEncomienda], [idRuta], [FechaEnvio], [FechaEntrega], [A_Domicilio], [Estado], [idClienteEnvio], [idClienteEntrega], [Activo], [ConductorNombre]) VALUES (26, 4, CAST(N'2015-11-23' AS Date), CAST(N'2015-11-29' AS Date), N'SIN DIRECCION', N'ENTREGADO', 6, 2, 1, NULL)
INSERT [dbo].[DocumentoEnvioEncomienda] ([idDocumentoEnvioEncomienda], [idRuta], [FechaEnvio], [FechaEntrega], [A_Domicilio], [Estado], [idClienteEnvio], [idClienteEntrega], [Activo], [ConductorNombre]) VALUES (27, 6, CAST(N'2015-11-24' AS Date), CAST(N'2015-11-29' AS Date), N'SIN DIRECCION', N'ENTREGADO', 6, 2, 1, NULL)
INSERT [dbo].[DocumentoEnvioEncomienda] ([idDocumentoEnvioEncomienda], [idRuta], [FechaEnvio], [FechaEntrega], [A_Domicilio], [Estado], [idClienteEnvio], [idClienteEntrega], [Activo], [ConductorNombre]) VALUES (28, 2, CAST(N'2015-11-27' AS Date), NULL, N'Jr. La Union 784', N'ENVIADO', 2, 6, 1, NULL)
INSERT [dbo].[DocumentoEnvioEncomienda] ([idDocumentoEnvioEncomienda], [idRuta], [FechaEnvio], [FechaEntrega], [A_Domicilio], [Estado], [idClienteEnvio], [idClienteEntrega], [Activo], [ConductorNombre]) VALUES (29, 2, CAST(N'2015-11-23' AS Date), CAST(N'2015-11-29' AS Date), N'SIN DIRECCION', N'ENTREGADO', 6, 2, 1, NULL)
INSERT [dbo].[DocumentoEnvioEncomienda] ([idDocumentoEnvioEncomienda], [idRuta], [FechaEnvio], [FechaEntrega], [A_Domicilio], [Estado], [idClienteEnvio], [idClienteEntrega], [Activo], [ConductorNombre]) VALUES (30, 1, CAST(N'2019-06-03' AS Date), NULL, N'6550 S Millrock Drive', N'ENVIADO', 9, 6, 1, N'Angel Parco contreras ')
INSERT [dbo].[DocumentoEnvioEncomienda] ([idDocumentoEnvioEncomienda], [idRuta], [FechaEnvio], [FechaEntrega], [A_Domicilio], [Estado], [idClienteEnvio], [idClienteEntrega], [Activo], [ConductorNombre]) VALUES (31, 2, CAST(N'2019-06-04' AS Date), CAST(N'2019-06-04' AS Date), N'Trujillo', N'ENTREGADO', 13, 15, 1, NULL)
INSERT [dbo].[DocumentoEnvioEncomienda] ([idDocumentoEnvioEncomienda], [idRuta], [FechaEnvio], [FechaEntrega], [A_Domicilio], [Estado], [idClienteEnvio], [idClienteEntrega], [Activo], [ConductorNombre]) VALUES (32, 2, CAST(N'2019-06-04' AS Date), CAST(N'2019-06-04' AS Date), N'Los Olivos n° 333', N'ENTREGADO', 17, 15, 1, N'')
INSERT [dbo].[DocumentoEnvioEncomienda] ([idDocumentoEnvioEncomienda], [idRuta], [FechaEnvio], [FechaEntrega], [A_Domicilio], [Estado], [idClienteEnvio], [idClienteEntrega], [Activo], [ConductorNombre]) VALUES (33, 2, CAST(N'2019-06-04' AS Date), CAST(N'2019-06-08' AS Date), N'SIN DIRECCION', N'ENTREGADO', 15, 17, 1, NULL)
INSERT [dbo].[DocumentoEnvioEncomienda] ([idDocumentoEnvioEncomienda], [idRuta], [FechaEnvio], [FechaEntrega], [A_Domicilio], [Estado], [idClienteEnvio], [idClienteEntrega], [Activo], [ConductorNombre]) VALUES (34, 2, CAST(N'2019-10-05' AS Date), NULL, N'6550 S Millrock Drive', N'PENDIENTE', 18, 16, 1, NULL)
INSERT [dbo].[DocumentoEnvioEncomienda] ([idDocumentoEnvioEncomienda], [idRuta], [FechaEnvio], [FechaEntrega], [A_Domicilio], [Estado], [idClienteEnvio], [idClienteEntrega], [Activo], [ConductorNombre]) VALUES (35, 2, CAST(N'2019-05-15' AS Date), NULL, N'6550 S Millrock Drive', N'PENDIENTE', 16, 18, 1, NULL)
INSERT [dbo].[DocumentoEnvioEncomienda] ([idDocumentoEnvioEncomienda], [idRuta], [FechaEnvio], [FechaEntrega], [A_Domicilio], [Estado], [idClienteEnvio], [idClienteEntrega], [Activo], [ConductorNombre]) VALUES (36, 1, CAST(N'2019-06-09' AS Date), NULL, N'6550 S Millrock Drive', N'PENDIENTE', 16, 18, 1, NULL)
INSERT [dbo].[DocumentoEnvioEncomienda] ([idDocumentoEnvioEncomienda], [idRuta], [FechaEnvio], [FechaEntrega], [A_Domicilio], [Estado], [idClienteEnvio], [idClienteEntrega], [Activo], [ConductorNombre]) VALUES (37, 2, CAST(N'2019-06-11' AS Date), NULL, N'AV. 5 DE MAYO NO 1253', N'PENDIENTE', 36, 41, 1, NULL)
INSERT [dbo].[DocumentoEnvioEncomienda] ([idDocumentoEnvioEncomienda], [idRuta], [FechaEnvio], [FechaEntrega], [A_Domicilio], [Estado], [idClienteEnvio], [idClienteEntrega], [Activo], [ConductorNombre]) VALUES (38, 2, CAST(N'2019-06-11' AS Date), NULL, N'AV. 5 DE MAYO NO 1253', N'ENVIADO', 36, 41, 1, N'Jason')
SET IDENTITY_INSERT [dbo].[DocumentoEnvioEncomienda] OFF
SET IDENTITY_INSERT [dbo].[DocumentoPago] ON 

INSERT [dbo].[DocumentoPago] ([idDocumentoPago], [idDocumentoEnvio], [NumSerie], [NumDocumento], [TipoDocumentoPago], [Monto]) VALUES (1, 1, N'001', N'00000001', N'FACTURA', CAST(57.00 AS Decimal(13, 2)))
INSERT [dbo].[DocumentoPago] ([idDocumentoPago], [idDocumentoEnvio], [NumSerie], [NumDocumento], [TipoDocumentoPago], [Monto]) VALUES (2, 2, N'002', N'00000002', N'BOLETA', CAST(32.40 AS Decimal(13, 2)))
INSERT [dbo].[DocumentoPago] ([idDocumentoPago], [idDocumentoEnvio], [NumSerie], [NumDocumento], [TipoDocumentoPago], [Monto]) VALUES (4, 3, N'003', N'00000003', N'BOLETA', CAST(17.50 AS Decimal(13, 2)))
INSERT [dbo].[DocumentoPago] ([idDocumentoPago], [idDocumentoEnvio], [NumSerie], [NumDocumento], [TipoDocumentoPago], [Monto]) VALUES (5, 4, N'005', N'00000005', N'BOLETA', CAST(163.20 AS Decimal(13, 2)))
INSERT [dbo].[DocumentoPago] ([idDocumentoPago], [idDocumentoEnvio], [NumSerie], [NumDocumento], [TipoDocumentoPago], [Monto]) VALUES (6, 5, N'006', N'00000006', N'BOLETA', CAST(148.50 AS Decimal(13, 2)))
INSERT [dbo].[DocumentoPago] ([idDocumentoPago], [idDocumentoEnvio], [NumSerie], [NumDocumento], [TipoDocumentoPago], [Monto]) VALUES (7, 6, N'007', N'00000007', N'BOLETA', CAST(108.00 AS Decimal(13, 2)))
INSERT [dbo].[DocumentoPago] ([idDocumentoPago], [idDocumentoEnvio], [NumSerie], [NumDocumento], [TipoDocumentoPago], [Monto]) VALUES (8, 7, N'002', N'00000002', N'FACTURA', CAST(167.40 AS Decimal(13, 2)))
INSERT [dbo].[DocumentoPago] ([idDocumentoPago], [idDocumentoEnvio], [NumSerie], [NumDocumento], [TipoDocumentoPago], [Monto]) VALUES (9, 8, N'003', N'00000003', N'FACTURA', CAST(348.80 AS Decimal(13, 2)))
INSERT [dbo].[DocumentoPago] ([idDocumentoPago], [idDocumentoEnvio], [NumSerie], [NumDocumento], [TipoDocumentoPago], [Monto]) VALUES (12, 9, N'004', N'00000004', N'FACTURA', CAST(180.00 AS Decimal(13, 2)))
INSERT [dbo].[DocumentoPago] ([idDocumentoPago], [idDocumentoEnvio], [NumSerie], [NumDocumento], [TipoDocumentoPago], [Monto]) VALUES (13, 10, N'005', N'00000005', N'FACTURA', CAST(55.00 AS Decimal(13, 2)))
INSERT [dbo].[DocumentoPago] ([idDocumentoPago], [idDocumentoEnvio], [NumSerie], [NumDocumento], [TipoDocumentoPago], [Monto]) VALUES (14, 13, N'006', N'00000006', N'FACTURA', CAST(48.00 AS Decimal(13, 2)))
INSERT [dbo].[DocumentoPago] ([idDocumentoPago], [idDocumentoEnvio], [NumSerie], [NumDocumento], [TipoDocumentoPago], [Monto]) VALUES (15, 14, N'001', N'00000001', N'BOLETA', CAST(120.00 AS Decimal(13, 2)))
INSERT [dbo].[DocumentoPago] ([idDocumentoPago], [idDocumentoEnvio], [NumSerie], [NumDocumento], [TipoDocumentoPago], [Monto]) VALUES (16, 15, N'001', N'00000001', N'FACTURA', CAST(15.00 AS Decimal(13, 2)))
INSERT [dbo].[DocumentoPago] ([idDocumentoPago], [idDocumentoEnvio], [NumSerie], [NumDocumento], [TipoDocumentoPago], [Monto]) VALUES (17, 16, N'001', N'00000001', N'BOLETA', CAST(12.00 AS Decimal(13, 2)))
INSERT [dbo].[DocumentoPago] ([idDocumentoPago], [idDocumentoEnvio], [NumSerie], [NumDocumento], [TipoDocumentoPago], [Monto]) VALUES (18, 17, N'001', N'00000001', N'FACTURA', CAST(135.00 AS Decimal(13, 2)))
INSERT [dbo].[DocumentoPago] ([idDocumentoPago], [idDocumentoEnvio], [NumSerie], [NumDocumento], [TipoDocumentoPago], [Monto]) VALUES (19, 18, N'002', N'00000002', N'FACTURA', CAST(32.50 AS Decimal(13, 2)))
INSERT [dbo].[DocumentoPago] ([idDocumentoPago], [idDocumentoEnvio], [NumSerie], [NumDocumento], [TipoDocumentoPago], [Monto]) VALUES (20, 19, N'002', N'00000002', N'BOLETA', CAST(55.00 AS Decimal(13, 2)))
INSERT [dbo].[DocumentoPago] ([idDocumentoPago], [idDocumentoEnvio], [NumSerie], [NumDocumento], [TipoDocumentoPago], [Monto]) VALUES (21, 20, N'002', N'00000002', N'BOLETA', CAST(30.00 AS Decimal(13, 2)))
INSERT [dbo].[DocumentoPago] ([idDocumentoPago], [idDocumentoEnvio], [NumSerie], [NumDocumento], [TipoDocumentoPago], [Monto]) VALUES (22, 21, N'003', N'00000003', N'BOLETA', CAST(45.00 AS Decimal(13, 2)))
INSERT [dbo].[DocumentoPago] ([idDocumentoPago], [idDocumentoEnvio], [NumSerie], [NumDocumento], [TipoDocumentoPago], [Monto]) VALUES (23, 22, N'004', N'00000004', N'BOLETA', CAST(18.00 AS Decimal(13, 2)))
INSERT [dbo].[DocumentoPago] ([idDocumentoPago], [idDocumentoEnvio], [NumSerie], [NumDocumento], [TipoDocumentoPago], [Monto]) VALUES (24, 23, N'003', N'00000003', N'BOLETA', CAST(37.50 AS Decimal(13, 2)))
INSERT [dbo].[DocumentoPago] ([idDocumentoPago], [idDocumentoEnvio], [NumSerie], [NumDocumento], [TipoDocumentoPago], [Monto]) VALUES (25, 24, N'005', N'00000005', N'BOLETA', CAST(30.00 AS Decimal(13, 2)))
INSERT [dbo].[DocumentoPago] ([idDocumentoPago], [idDocumentoEnvio], [NumSerie], [NumDocumento], [TipoDocumentoPago], [Monto]) VALUES (26, 25, N'004', N'00000004', N'BOLETA', CAST(12.50 AS Decimal(13, 2)))
INSERT [dbo].[DocumentoPago] ([idDocumentoPago], [idDocumentoEnvio], [NumSerie], [NumDocumento], [TipoDocumentoPago], [Monto]) VALUES (27, 26, N'003', N'00000003', N'FACTURA', CAST(11.25 AS Decimal(13, 2)))
INSERT [dbo].[DocumentoPago] ([idDocumentoPago], [idDocumentoEnvio], [NumSerie], [NumDocumento], [TipoDocumentoPago], [Monto]) VALUES (28, 27, N'002', N'00000002', N'FACTURA', CAST(108.00 AS Decimal(13, 2)))
INSERT [dbo].[DocumentoPago] ([idDocumentoPago], [idDocumentoEnvio], [NumSerie], [NumDocumento], [TipoDocumentoPago], [Monto]) VALUES (29, 28, N'007', N'00000007', N'FACTURA', CAST(15.00 AS Decimal(13, 2)))
INSERT [dbo].[DocumentoPago] ([idDocumentoPago], [idDocumentoEnvio], [NumSerie], [NumDocumento], [TipoDocumentoPago], [Monto]) VALUES (30, 29, N'008', N'00000008', N'BOLETA', CAST(25.00 AS Decimal(13, 2)))
INSERT [dbo].[DocumentoPago] ([idDocumentoPago], [idDocumentoEnvio], [NumSerie], [NumDocumento], [TipoDocumentoPago], [Monto]) VALUES (31, 30, N'009', N'00000009', N'BOLETA', CAST(3.60 AS Decimal(13, 2)))
INSERT [dbo].[DocumentoPago] ([idDocumentoPago], [idDocumentoEnvio], [NumSerie], [NumDocumento], [TipoDocumentoPago], [Monto]) VALUES (32, 31, N'010', N'00000010', N'BOLETA', CAST(6.50 AS Decimal(13, 2)))
INSERT [dbo].[DocumentoPago] ([idDocumentoPago], [idDocumentoEnvio], [NumSerie], [NumDocumento], [TipoDocumentoPago], [Monto]) VALUES (33, 32, N'008', N'00000008', N'FACTURA', CAST(17.30 AS Decimal(13, 2)))
INSERT [dbo].[DocumentoPago] ([idDocumentoPago], [idDocumentoEnvio], [NumSerie], [NumDocumento], [TipoDocumentoPago], [Monto]) VALUES (34, 33, N'009', N'00000009', N'FACTURA', CAST(19.30 AS Decimal(13, 2)))
INSERT [dbo].[DocumentoPago] ([idDocumentoPago], [idDocumentoEnvio], [NumSerie], [NumDocumento], [TipoDocumentoPago], [Monto]) VALUES (35, 34, N'011', N'00000011', N'BOLETA', CAST(200.00 AS Decimal(13, 2)))
INSERT [dbo].[DocumentoPago] ([idDocumentoPago], [idDocumentoEnvio], [NumSerie], [NumDocumento], [TipoDocumentoPago], [Monto]) VALUES (36, 35, N'010', N'00000010', N'FACTURA', CAST(75.00 AS Decimal(13, 2)))
INSERT [dbo].[DocumentoPago] ([idDocumentoPago], [idDocumentoEnvio], [NumSerie], [NumDocumento], [TipoDocumentoPago], [Monto]) VALUES (37, 36, N'011', N'00000011', N'FACTURA', CAST(360.00 AS Decimal(13, 2)))
INSERT [dbo].[DocumentoPago] ([idDocumentoPago], [idDocumentoEnvio], [NumSerie], [NumDocumento], [TipoDocumentoPago], [Monto]) VALUES (38, 37, N'012', N'00000012', N'BOLETA', CAST(200.00 AS Decimal(13, 2)))
INSERT [dbo].[DocumentoPago] ([idDocumentoPago], [idDocumentoEnvio], [NumSerie], [NumDocumento], [TipoDocumentoPago], [Monto]) VALUES (39, 38, N'012', N'00000012', N'BOLETA', CAST(200.00 AS Decimal(13, 2)))
SET IDENTITY_INSERT [dbo].[DocumentoPago] OFF
SET IDENTITY_INSERT [dbo].[Ruta] ON 

INSERT [dbo].[Ruta] ([idRuta], [idSucursalDestino], [idSucursalOrigen], [Descripcion]) VALUES (1, 2, 1, N'TRUJILLO - CHIMBOTE')
INSERT [dbo].[Ruta] ([idRuta], [idSucursalDestino], [idSucursalOrigen], [Descripcion]) VALUES (2, 3, 1, N'TRUJILLO - LIMA')
INSERT [dbo].[Ruta] ([idRuta], [idSucursalDestino], [idSucursalOrigen], [Descripcion]) VALUES (3, 1, 2, N'CHIMBOTE - TRUJILLO')
INSERT [dbo].[Ruta] ([idRuta], [idSucursalDestino], [idSucursalOrigen], [Descripcion]) VALUES (4, 3, 2, N'CHIMBOTE - LIMA')
INSERT [dbo].[Ruta] ([idRuta], [idSucursalDestino], [idSucursalOrigen], [Descripcion]) VALUES (5, 1, 3, N'LIMA - TRUJILLO ')
INSERT [dbo].[Ruta] ([idRuta], [idSucursalDestino], [idSucursalOrigen], [Descripcion]) VALUES (6, 2, 3, N'LIMA - CHIMBOTE')
SET IDENTITY_INSERT [dbo].[Ruta] OFF
SET IDENTITY_INSERT [dbo].[Sucursal] ON 

INSERT [dbo].[Sucursal] ([idSucursal], [Ciudad], [Direccion], [Telefono], [Activo]) VALUES (1, N'TRUJILLO', N'Av. America 123', N'987654321', 1)
INSERT [dbo].[Sucursal] ([idSucursal], [Ciudad], [Direccion], [Telefono], [Activo]) VALUES (2, N'CHIMBOTE', N'Av. Peru 456', N'951324687', 1)
INSERT [dbo].[Sucursal] ([idSucursal], [Ciudad], [Direccion], [Telefono], [Activo]) VALUES (3, N'LIMA', N'Jr. La union 478', N'945632178', 1)
SET IDENTITY_INSERT [dbo].[Sucursal] OFF
SET IDENTITY_INSERT [dbo].[Tarifa] ON 

INSERT [dbo].[Tarifa] ([idTarifa], [idRuta], [Descripcion], [PrecioGramo], [Activo]) VALUES (1, 1, N'Trujillo a Chimbote', CAST(0.30 AS Decimal(6, 2)), 1)
INSERT [dbo].[Tarifa] ([idTarifa], [idRuta], [Descripcion], [PrecioGramo], [Activo]) VALUES (2, 2, N'Trujillo a Lima', CAST(0.50 AS Decimal(6, 2)), 1)
INSERT [dbo].[Tarifa] ([idTarifa], [idRuta], [Descripcion], [PrecioGramo], [Activo]) VALUES (3, 3, N'Chimbote a Trujillo', CAST(0.25 AS Decimal(6, 2)), 1)
INSERT [dbo].[Tarifa] ([idTarifa], [idRuta], [Descripcion], [PrecioGramo], [Activo]) VALUES (5, 4, N'Chimbote a Lima', CAST(0.25 AS Decimal(6, 2)), 1)
INSERT [dbo].[Tarifa] ([idTarifa], [idRuta], [Descripcion], [PrecioGramo], [Activo]) VALUES (6, 5, N'Lima a Trujillo', CAST(0.60 AS Decimal(6, 2)), 1)
INSERT [dbo].[Tarifa] ([idTarifa], [idRuta], [Descripcion], [PrecioGramo], [Activo]) VALUES (7, 6, N'Lima a Chimbote', CAST(0.30 AS Decimal(6, 2)), 1)
SET IDENTITY_INSERT [dbo].[Tarifa] OFF
SET IDENTITY_INSERT [dbo].[TipoUsuario] ON 

INSERT [dbo].[TipoUsuario] ([idUsuario], [nombre], [estado]) VALUES (1, N'Administrador', 1)
INSERT [dbo].[TipoUsuario] ([idUsuario], [nombre], [estado]) VALUES (2, N'Recepcionista', 1)
INSERT [dbo].[TipoUsuario] ([idUsuario], [nombre], [estado]) VALUES (3, N'Encargado del Area de Despacho', 1)
SET IDENTITY_INSERT [dbo].[TipoUsuario] OFF
SET IDENTITY_INSERT [dbo].[Usuario] ON 

INSERT [dbo].[Usuario] ([idUsuario], [idSucursal], [Usuario], [Clave], [NombreUsuario], [ApellidosUsuario], [DNI], [Cargo], [Direccion], [Telefono], [tipoUsuario], [Activo]) VALUES (1, 1, N'nCotri', N'123456', N'Nicky', N'Cotrina de la Cruz', N'70824593', N'Administrador', N'Cl. Cajamarca 72', N'985079857', 1, 1)
INSERT [dbo].[Usuario] ([idUsuario], [idSucursal], [Usuario], [Clave], [NombreUsuario], [ApellidosUsuario], [DNI], [Cargo], [Direccion], [Telefono], [tipoUsuario], [Activo]) VALUES (2, 2, N'jPerez', N'456789', N'Juan', N'Perez Perez', N'74859623', N'Recepcionista', N'Av. Perú 45', N'987456321', 2, 1)
INSERT [dbo].[Usuario] ([idUsuario], [idSucursal], [Usuario], [Clave], [NombreUsuario], [ApellidosUsuario], [DNI], [Cargo], [Direccion], [Telefono], [tipoUsuario], [Activo]) VALUES (3, 2, N'pSanz', N'123789', N'Pedro', N'Sanz Rodriguez', N'12457895', N'Administrador', N'Av. Trujillo', N'954871236', 1, 1)
INSERT [dbo].[Usuario] ([idUsuario], [idSucursal], [Usuario], [Clave], [NombreUsuario], [ApellidosUsuario], [DNI], [Cargo], [Direccion], [Telefono], [tipoUsuario], [Activo]) VALUES (4, 2, N'pRodri', N'789456', N'Pablo', N'Rodriguez Cortez', N'14785236', N'Recepcionista', N'Cl. Libertad 45', N'963214587', 2, 1)
INSERT [dbo].[Usuario] ([idUsuario], [idSucursal], [Usuario], [Clave], [NombreUsuario], [ApellidosUsuario], [DNI], [Cargo], [Direccion], [Telefono], [tipoUsuario], [Activo]) VALUES (5, 2, N'gMayte', N'147852', N'Mayte', N'Gonzales Cueva', N'79568421', N'Administrador', N'Jr. La Union 12', N'948781236', 1, 1)
INSERT [dbo].[Usuario] ([idUsuario], [idSucursal], [Usuario], [Clave], [NombreUsuario], [ApellidosUsuario], [DNI], [Cargo], [Direccion], [Telefono], [tipoUsuario], [Activo]) VALUES (7, 3, N'aCotri', N'159874', N'Agustin', N'Cotrina Cabellos', N'78965423', N'Recepcionista', N'Av. La Merced 45', N'999394058', 2, 1)
INSERT [dbo].[Usuario] ([idUsuario], [idSucursal], [Usuario], [Clave], [NombreUsuario], [ApellidosUsuario], [DNI], [Cargo], [Direccion], [Telefono], [tipoUsuario], [Activo]) VALUES (9, 1, N'jason', N'123456', N'Jason', N'Rodriguez', N'70937527', N'Despachador', N'Santa Rosa 215', N'944299632', 1, 1)
INSERT [dbo].[Usuario] ([idUsuario], [idSucursal], [Usuario], [Clave], [NombreUsuario], [ApellidosUsuario], [DNI], [Cargo], [Direccion], [Telefono], [tipoUsuario], [Activo]) VALUES (13, 1, N'guille', N'123456', N'Guillermo', N'Segura', N'12345612', N'Despachador', N'Trujillo', N'999999999', 3, 1)
INSERT [dbo].[Usuario] ([idUsuario], [idSucursal], [Usuario], [Clave], [NombreUsuario], [ApellidosUsuario], [DNI], [Cargo], [Direccion], [Telefono], [tipoUsuario], [Activo]) VALUES (15, 1, N'marley', N'123456', N'Marley', N'Alipio', N'99999999', N'Recepcionista', N'Trujillo', N'999999999', 3, 1)
INSERT [dbo].[Usuario] ([idUsuario], [idSucursal], [Usuario], [Clave], [NombreUsuario], [ApellidosUsuario], [DNI], [Cargo], [Direccion], [Telefono], [tipoUsuario], [Activo]) VALUES (16, 3, N'agoico', N'456123', N'Alexander', N'Goicochea', N'10203020', N'Encargado del Area de Des', N'Av. Peru 123', N'451236', 3, 0)
INSERT [dbo].[Usuario] ([idUsuario], [idSucursal], [Usuario], [Clave], [NombreUsuario], [ApellidosUsuario], [DNI], [Cargo], [Direccion], [Telefono], [tipoUsuario], [Activo]) VALUES (17, 1, N'ezapat', N'456456', N'Enrique ', N'Zapata Zapata', N'15263625', N'Administrador', N'Av. Peru 123', N'449202', 1, 0)
INSERT [dbo].[Usuario] ([idUsuario], [idSucursal], [Usuario], [Clave], [NombreUsuario], [ApellidosUsuario], [DNI], [Cargo], [Direccion], [Telefono], [tipoUsuario], [Activo]) VALUES (18, 1, N'', N'', N'', N'', N'', N'Administrador', N'', N'', 1, 0)
INSERT [dbo].[Usuario] ([idUsuario], [idSucursal], [Usuario], [Clave], [NombreUsuario], [ApellidosUsuario], [DNI], [Cargo], [Direccion], [Telefono], [tipoUsuario], [Activo]) VALUES (19, 1, N'', N'', N'', N'', N'', N'Administrador', N'', N'', 1, 0)
INSERT [dbo].[Usuario] ([idUsuario], [idSucursal], [Usuario], [Clave], [NombreUsuario], [ApellidosUsuario], [DNI], [Cargo], [Direccion], [Telefono], [tipoUsuario], [Activo]) VALUES (20, 1, N'JULY', N'123456', N'JULY', N'ROJAS NIÑO', N'76321921', N'Administrador', N'}', N'', 1, 0)
INSERT [dbo].[Usuario] ([idUsuario], [idSucursal], [Usuario], [Clave], [NombreUsuario], [ApellidosUsuario], [DNI], [Cargo], [Direccion], [Telefono], [tipoUsuario], [Activo]) VALUES (21, 1, N'JULY', N'123456', N'JULY', N'NIÑO ROJAS', N'76321921', N'Recepcionista', N'BELLAVISTA', N'222952535', 2, 1)
INSERT [dbo].[Usuario] ([idUsuario], [idSucursal], [Usuario], [Clave], [NombreUsuario], [ApellidosUsuario], [DNI], [Cargo], [Direccion], [Telefono], [tipoUsuario], [Activo]) VALUES (22, 1, N'ANDRES', N'123456', N'ANDRES RONALD', N'ARONI SUMIR', N'76322349', N'Encargado del Area de Des', N'BELLAVISTA', N'779177326', 3, 1)
SET IDENTITY_INSERT [dbo].[Usuario] OFF
ALTER TABLE [dbo].[DetalleDocumentoEnvioEncomienda]  WITH CHECK ADD  CONSTRAINT [FK_DetalleDocumentoEnvioEncomienda_DocumentoEnvioEncomienda] FOREIGN KEY([idDocumentoEnvio])
REFERENCES [dbo].[DocumentoEnvioEncomienda] ([idDocumentoEnvioEncomienda])
GO
ALTER TABLE [dbo].[DetalleDocumentoEnvioEncomienda] CHECK CONSTRAINT [FK_DetalleDocumentoEnvioEncomienda_DocumentoEnvioEncomienda]
GO
ALTER TABLE [dbo].[DocumentoEnvioEncomienda]  WITH CHECK ADD  CONSTRAINT [FK_DocumentoEnvioEncomienda_Cliente] FOREIGN KEY([idClienteEnvio])
REFERENCES [dbo].[Cliente] ([idCliente])
GO
ALTER TABLE [dbo].[DocumentoEnvioEncomienda] CHECK CONSTRAINT [FK_DocumentoEnvioEncomienda_Cliente]
GO
ALTER TABLE [dbo].[DocumentoEnvioEncomienda]  WITH CHECK ADD  CONSTRAINT [FK_DocumentoEnvioEncomienda_Ruta] FOREIGN KEY([idRuta])
REFERENCES [dbo].[Ruta] ([idRuta])
GO
ALTER TABLE [dbo].[DocumentoEnvioEncomienda] CHECK CONSTRAINT [FK_DocumentoEnvioEncomienda_Ruta]
GO
ALTER TABLE [dbo].[DocumentoPago]  WITH CHECK ADD  CONSTRAINT [FK_DocumentoPago_DocumentoEnvioEncomienda] FOREIGN KEY([idDocumentoEnvio])
REFERENCES [dbo].[DocumentoEnvioEncomienda] ([idDocumentoEnvioEncomienda])
GO
ALTER TABLE [dbo].[DocumentoPago] CHECK CONSTRAINT [FK_DocumentoPago_DocumentoEnvioEncomienda]
GO
ALTER TABLE [dbo].[Ruta]  WITH CHECK ADD  CONSTRAINT [FK_Ruta_Sucursal] FOREIGN KEY([idSucursalDestino])
REFERENCES [dbo].[Sucursal] ([idSucursal])
GO
ALTER TABLE [dbo].[Ruta] CHECK CONSTRAINT [FK_Ruta_Sucursal]
GO
ALTER TABLE [dbo].[Tarifa]  WITH CHECK ADD  CONSTRAINT [FK_Tarifa_Ruta] FOREIGN KEY([idRuta])
REFERENCES [dbo].[Ruta] ([idRuta])
GO
ALTER TABLE [dbo].[Tarifa] CHECK CONSTRAINT [FK_Tarifa_Ruta]
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD FOREIGN KEY([tipoUsuario])
REFERENCES [dbo].[TipoUsuario] ([idUsuario])
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_Sucursal] FOREIGN KEY([idSucursal])
REFERENCES [dbo].[Sucursal] ([idSucursal])
GO
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [FK_Usuario_Sucursal]
GO
/****** Object:  StoredProcedure [dbo].[DocumentoEnvioEncomienda_UpdateEnvio_Sp]    Script Date: 11/06/2019 09:51:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[DocumentoEnvioEncomienda_UpdateEnvio_Sp]
@idDocumentoEnvioEncomienda int,
@FechaEnvio	datetime,
@A_Domicilio nvarchar(50),
@ConductorNombre nvarchar(50)
as
begin
Update DocumentoEnvioEncomienda
Set
FechaEnvio	=@FechaEnvio,
A_Domicilio =@A_Domicilio,
Estado='ENVIADO',
ConductorNombre =@ConductorNombre
where idDocumentoEnvioEncomienda=@idDocumentoEnvioEncomienda
end
GO
/****** Object:  StoredProcedure [dbo].[Encomienda_GetById_Sp]    Script Date: 11/06/2019 09:51:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Encomienda_GetById_Sp]      
@idEnvio int    
as      
Begin 
Declare @count int=(
 select count(*) from  [DetalleDocumentoEnvioEncomienda]
 where idDocumentoEnvio=@idEnvio ) 
select r.Descripcion,dp.TipoDocumentoPago,FORMAT(de.FechaEnvio,'dd/MM/yyyy') FechaEnvio,dp.NumSerie,dp.NumDocumento,dp.Monto  
,de.Estado  ,de.A_Domicilio  ,@count as [CantidadPaquetes]
from DocumentoPago dp         
inner join DocumentoEnvioEncomienda de on dp.idDocumentoEnvio=de.idDocumentoEnvioEncomienda        
inner join Cliente c on de.idClienteEnvio=c.idCliente        
inner join Cliente c2 on de.idClienteEntrega=c2.idCliente        
inner join Ruta r on de.idRuta=r.idRuta        
Where de.idDocumentoEnvioEncomienda=@idEnvio    and Estado='PENDIENTE'  
End  
GO
/****** Object:  StoredProcedure [dbo].[Encomienda_GetByStatus_Sp]    Script Date: 11/06/2019 09:51:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Encomienda_GetByStatus_Sp]    
@status varchar(20)    
as    
Begin    
select r.Descripcion,dp.TipoDocumentoPago,de.FechaEnvio,dp.NumSerie,dp.NumDocumento,dp.Monto,(c.Nombres+space(1)+c.ApellidoPaterno+space(1)+c.ApellidoMaterno+space(1)+c.RazonSocial) as Remitente ,      
(c2.Nombres+space(1)+c2.ApellidoPaterno+space(1)+c2.ApellidoMaterno+space(1)+c2.RazonSocial) as Destinatario      
,de.Estado  ,de.idDocumentoEnvioEncomienda
from DocumentoPago dp       
inner join DocumentoEnvioEncomienda de on dp.idDocumentoEnvio=de.idDocumentoEnvioEncomienda      
inner join Cliente c on de.idClienteEnvio=c.idCliente      
inner join Cliente c2 on de.idClienteEntrega=c2.idCliente      
inner join Ruta r on de.idRuta=r.idRuta      
Where de.Estado=@status    
End
GO
/****** Object:  StoredProcedure [dbo].[sp_ActualizarCliente]    Script Date: 11/06/2019 09:51:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_ActualizarCliente]
@TipoDocumento varchar(15),
@numDocumento  nchar(11),
@razonSocial varchar(50),
@direcciones varchar(50),
@telefono varchar(20),
@nombre varchar(25),
@apellidoPaterno varchar(25),
@apellidoMaterno varchar(25),@idCliente int
as
begin 
update Cliente
set
TipoDocumento=@TipoDocumento,
NumDocumento = @numDocumento,
RazonSocial=@razonSocial,
Direccion = @direcciones,
Telefono = @telefono,
Nombres = @nombre,
ApellidoPaterno = @apellidoPaterno,
ApellidoMaterno = @apellidoMaterno
where @idCliente = idCliente

		end	


GO
/****** Object:  StoredProcedure [dbo].[sp_buscarCliente]    Script Date: 11/06/2019 09:51:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[sp_buscarCliente]
@numDocumento nchar(11)
as
begin
select * from Cliente where NumDocumento=@numDocumento
end


GO
/****** Object:  StoredProcedure [dbo].[sp_buscarEncomienda]    Script Date: 11/06/2019 09:51:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_buscarEncomienda]  
@nDocumento nchar(11),@idSucursal int  
as  
begin  
select   
--dp.NumSerie,dp.NumDocumento,dp.TipoDocumentoPago,  
(c2.Nombres+space(1)+c2.ApellidoPaterno+space(1)+c2.ApellidoMaterno+space(1)+c2.RazonSocial) as Remitente,  
e.FechaEnvio,  
de.Descripción,  
de.Peso  
from DetalleDocumentoEnvioEncomienda  de  inner join DocumentoEnvioEncomienda e on e.idDocumentoEnvioEncomienda=de.idDocumentoEnvio  
inner join Cliente c on e.idClienteEntrega=c.idCliente   
inner join Cliente c2 on e.idClienteEnvio=c2.idCliente  
--inner join DocumentoPago dp on dp.idDocumentoEnvio=de.idDocumentoEnvio  
inner join Ruta r on e.idRuta=r.idRuta  
where c.NumDocumento=@nDocumento and e.Estado='PENDIENTE' and r.idSucursalDestino=@idSucursal  
end
GO
/****** Object:  StoredProcedure [dbo].[sp_devolverCliente]    Script Date: 11/06/2019 09:51:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_devolverCliente]
(@idCliente int)
as
begin
select * from Cliente where idCliente=@idCliente
end

GO
/****** Object:  StoredProcedure [dbo].[sp_EliminarCliente]    Script Date: 11/06/2019 09:51:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_EliminarCliente]

@idCliente int
as

update cliente
set activo = 0
where @idCliente = idCliente

GO
/****** Object:  StoredProcedure [dbo].[sp_IniciarSesion]    Script Date: 11/06/2019 09:51:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_IniciarSesion]
@usuario varchar(20),
@clave varchar(20)
as
select 
u.idUsuario,
u.usuario,
u.clave,
u.nombreUsuario,
u.apellidosUsuario,
u.DNI,
u.direccion,
u.telefono,
u.cargo,
u.idSucursal,
u.Activo,
s.Ciudad,
s.direccion as 'SucursalDireccion',
s.telefono,
u.tipoUsuario,
tu.nombre
from TipoUsuario as tu inner join Usuario u 
on tu.idUsuario = u.tipoUsuario
inner join Sucursal s
on u.idSucursal = s.idSucursal
where  @usuario = u.usuario and @clave = u.clave
and u.activo = 1

GO
/****** Object:  StoredProcedure [dbo].[sp_InsertaDetalleEnvioEncomienda]    Script Date: 11/06/2019 09:51:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE procedure [dbo].[sp_InsertaDetalleEnvioEncomienda]
--@idRuta int,@fechaEnvio date,@aDomicilio varchar(50),@idClienteEnvio int,@idClienteEntrega int
@Descripcion varchar(50),@Peso int
as

begin
declare @idEnvio int
	--insertar Envio
	--INSERT INTO DocumentoEnvioEncomienda(idRuta, FechaEnvio, A_Domicilio,Estado ,idClienteEnvio, 
	--					idClienteEntrega, Activo)values(@idRuta,@fechaEnvio,@aDomicilio,'ENVIADO',@idClienteEnvio,@idClienteEntrega,1)
	--SET @idEnvio=SCOPE_IDENTITY()
	-- declare @idEnvio int;
SELECT @idEnvio=idDocumentoEnvioEncomienda
FROM  DocumentoEnvioEncomienda
select @idEnvio
	--insertar detalle
	INSERT INTO DetalleDocumentoEnvioEncomienda(idDocumentoEnvio, Descripción, Peso)
	values(@idEnvio, @Descripcion, @Peso)
 end

GO
/****** Object:  StoredProcedure [dbo].[sp_InsertaEnvioEncomienda]    Script Date: 11/06/2019 09:51:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_InsertaEnvioEncomienda]  
@idRuta int,@fechaEnvio date,@aDomicilio varchar(50),@idClienteEnvio int,@idClienteEntrega int  
--@Descripcion varchar(50),@Peso int  
as  
--declare @idEnvio int  
begin  
 --insertar Envio  
 INSERT INTO DocumentoEnvioEncomienda(idRuta, FechaEnvio, A_Domicilio,Estado ,idClienteEnvio,   
      idClienteEntrega, Activo)values(@idRuta,@fechaEnvio,@aDomicilio,'PENDIENTE',@idClienteEnvio,@idClienteEntrega,1)  
 --SET @idEnvio=SCOPE_IDENTITY()  
 -- declare @idEnvio int;  
-- SELECT @idEnvio=MAX(idDocumentoEnvioEncomienda) + 1  
--FROM  DocumentoEnvioEncomienda  
--select @idEnvio  
 --insertar detalle  
 ---INSERT INTO DetalleDocumentoEnvioEncomienda(idDocumentoEnvio, Descripción, Peso)  
 --values(@idEnvio, @Descripcion, @Peso)  
 end  
  
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertarCliente]    Script Date: 11/06/2019 09:51:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_InsertarCliente]  
@TipoDocumento varchar(15),  
@numDocumento nchar(11),  
@razonSocial varchar(50),  
@nombres varchar(25),  
@apellidoPaterno varchar(25),  
@apellidoMaterno varchar(25),  
@direccion varchar(50),  
@telefono varchar(20)  
as  
Begin Transaction  
if( SELECT top 1 NumDocumento  
 FROM Cliente  
 Where NumDocumento = @numDocumento and Activo=1) = @numDocumento  
Begin  
 Rollback Transaction  
 return -1  
End  
  
if( SELECT top 1  RazonSocial  
 FROM Cliente  
 WHERE RazonSocial = @razonSocial  and Activo=1) = @razonSocial  
Begin  
 Rollback Transaction  
 return -2  
End  
  
  
insert into Cliente(TipoDocumento,NumDocumento,RazonSocial,nombres,ApellidoPaterno,ApellidoMaterno,direccion,telefono,Activo)  
values (@TipoDocumento,@numDocumento,@razonSocial,@nombres,@apellidoPaterno,@apellidoMaterno,@direccion,@telefono,1)  
  
  
 if @@Error<>0  
  Begin  
   rollback transaction   
   return -1   
  end   
Commit Transaction
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertarDocumentoPago]    Script Date: 11/06/2019 09:51:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE procedure [dbo].[sp_InsertarDocumentoPago]
@numSerie varchar(3),@NumDocumento varchar(8),@tipoDocumentoPago varchar(25), @monto decimal(13,2)
as
begin
declare @idEnvio int
SELECT @idEnvio=idDocumentoEnvioEncomienda
FROM  DocumentoEnvioEncomienda

	--insertar Documento
	INSERT INTO DocumentoPago(idDocumentoEnvio, NumSerie,NumDocumento,TipoDocumentoPago,Monto)
	values(@idEnvio, @numSerie,@NumDocumento,@tipoDocumentoPago,@monto)
 end

GO
/****** Object:  StoredProcedure [dbo].[sp_InsertarEncomienda]    Script Date: 11/06/2019 09:51:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_InsertarEncomienda] 
@prmcadXML varchar(max)
as
	declare @h int
	declare @idEnvio int
Begin Transaction
	exec sp_xml_preparedocument @h output, @prmcadXML


	--insertar Envio
	INSERT INTO DocumentoEnvioEncomienda(idRuta, FechaEnvio, A_Domicilio,Estado ,idClienteEnvio, 
						idClienteEntrega, Activo)
	SELECT x.idRuta, x.fechaEnvio, x.A_Domicilio,'ENVIADO',x.idClienteEnvio, x.idClienteEntrega,1
	FROM OPENXML(@h, '/root/Envio',1)WITH(
	idRuta int,
	FechaEnvio date,
	A_Domicilio varchar(50),
	idClienteEnvio int,
	idClienteEntrega int) x
		
	SET @idEnvio=SCOPE_IDENTITY()

	--insertar detalle
	INSERT INTO DetalleDocumentoEnvioEncomienda(idDocumentoEnvio, Descripción, Peso)
	SELECT @idEnvio, x.Descripción, x.Peso
	FROM openxml(@h, '/root/Envio/Det',1)WITH(
	idDocumentoEnvio int, 
	Descripción varchar(25),
	Peso int)X


	exec sp_xml_removedocument @h

	if @@Error<>0
	Begin
		rollback transaction 
		return -1 
	end
Commit Transaction
return @idEnvio



GO
/****** Object:  StoredProcedure [dbo].[sp_insertarRecepcionEncomienda]    Script Date: 11/06/2019 09:51:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_insertarRecepcionEncomienda]
@idCliente int
as
begin
update DocumentoEnvioEncomienda set Estado='ENTREGADO', FechaEntrega=GETDATE()
where idClienteEntrega=@idCliente
end

GO
/****** Object:  StoredProcedure [dbo].[sp_listarClientes]    Script Date: 11/06/2019 09:51:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_listarClientes] as
begin
select c.idCliente, c.TipoDocumento, c.NumDocumento,c.RazonSocial, c.Nombres,c.ApellidoPaterno,c.ApellidoMaterno,c.Direccion,c.Telefono from
 Cliente c 
 where c.Activo=1
 end

GO
/****** Object:  StoredProcedure [dbo].[sp_listarRutas]    Script Date: 11/06/2019 09:51:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_listarRutas]
as
begin
select * from Ruta r full join Tarifa t on r.idRuta=t.idRuta
end

GO
/****** Object:  StoredProcedure [dbo].[sp_listarTipoDocumento]    Script Date: 11/06/2019 09:51:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sp_listarTipoDocumento]
as
select idTipoDocumento, Descripcion from TipoDocumento
	ORDER BY Descripcion

GO
/****** Object:  StoredProcedure [dbo].[sp_listarUsuarios]    Script Date: 11/06/2019 09:51:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_listarUsuarios] as
begin
select u.idUsuario, u.idSucursal, u.Usuario, u.Clave, u.NombreUsuario, u.ApellidosUsuario, u.DNI, u.Cargo, u.Direccion,
u.Telefono, u.tipoUsuario, u.Activo, tu.nombre , s.ciudad From Sucursal as s full outer join Usuario as u on s.idSucursal = u.idSucursal
full outer join TipoUsuario as tu on u.tipoUsuario = tu.idUsuario
 where u.Activo=1
 end

GO
/****** Object:  StoredProcedure [dbo].[sp_obtenerNumeros]    Script Date: 11/06/2019 09:51:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE procedure [dbo].[sp_obtenerNumeros]
 @TipoDoc varchar(15),
 @idSucursal int
 as
 begin 
  declare @nD nchar(8)
 declare @nDn nchar(8)
   declare @nS nchar(3)
 declare @nSn nchar(3)
 select @nD=NumDocumento from DocumentoPago dp 
 inner join DocumentoEnvioEncomienda de on dp.idDocumentoEnvio=de.idDocumentoEnvioEncomienda
 inner join Ruta r on de.idRuta=r.idRuta --inner join Sucursal s on r.idSucursalOrigen=s.idSucursal
 where TipoDocumentoPago=@TipoDoc and r.idSucursalOrigen=@idSucursal
 select @nDn=RIGHT('0000000'+Ltrim(Rtrim(@nD+1)),8)
  select @nS=NumSerie from DocumentoPago dp 
 inner join DocumentoEnvioEncomienda de on dp.idDocumentoEnvio=de.idDocumentoEnvioEncomienda
 inner join Ruta r on de.idRuta=r.idRuta --inner join Sucursal s on r.idSucursalOrigen=s.idSucursal
 where TipoDocumentoPago=@TipoDoc and r.idSucursalOrigen=@idSucursal
 select @nSn=RIGHT('00'+Ltrim(Rtrim(@nS+1)),3)
 select distinct @nSn as 'NumSerie',@nDn as 'NumDocumento' from DocumentoPago dp 
 inner join DocumentoEnvioEncomienda de on dp.idDocumentoEnvio=de.idDocumentoEnvioEncomienda
 inner join Ruta r on de.idRuta=r.idRuta-- inner join Sucursal s on r.idSucursalOrigen=s.idSucursal
 where TipoDocumentoPago=@TipoDoc and r.idSucursalOrigen=@idSucursal
 end
GO
/****** Object:  StoredProcedure [dbo].[sp_obtenerPrecioGramo]    Script Date: 11/06/2019 09:51:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_obtenerPrecioGramo]
@idRuta int
as
begin
select * from Tarifa where idRuta=@idRuta
end

GO
/****** Object:  StoredProcedure [dbo].[sp_reporteIngresosFechas]    Script Date: 11/06/2019 09:51:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_reporteIngresosFechas] 
@fechaInicio date,
@fechaFin date
as
begin
select r.Descripcion,dp.TipoDocumentoPago,de.FechaEnvio,dp.NumSerie,dp.NumDocumento,dp.Monto,(c.Nombres+space(1)+c.ApellidoPaterno+space(1)+c.ApellidoMaterno+space(1)+c.RazonSocial) as Remitente ,
(c2.Nombres+space(1)+c2.ApellidoPaterno+space(1)+c2.ApellidoMaterno+space(1)+c2.RazonSocial) as Destinatario
from DocumentoPago dp 
inner join DocumentoEnvioEncomienda de on dp.idDocumentoEnvio=de.idDocumentoEnvioEncomienda
inner join Cliente c on de.idClienteEnvio=c.idCliente
inner join Cliente c2 on de.idClienteEntrega=c2.idCliente
inner join Ruta r on de.idRuta=r.idRuta
where (de.FechaEnvio between @fechaInicio and @fechaFin) 
order by de.FechaEnvio
 end

GO
/****** Object:  StoredProcedure [dbo].[sp_reporteMontoTotalFechas]    Script Date: 11/06/2019 09:51:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_reporteMontoTotalFechas]
@fechaInicio date,
@fechaFin date

as
begin
declare @suma decimal(13,2)
select @suma=(SUM(dp.Monto))
from DocumentoPago dp 
inner join DocumentoEnvioEncomienda de on dp.idDocumentoEnvio=de.idDocumentoEnvioEncomienda
inner join Cliente c on de.idClienteEnvio=c.idCliente
inner join Cliente c2 on de.idClienteEntrega=c2.idCliente
inner join Ruta r on de.idRuta=r.idRuta
where (de.FechaEnvio between @fechaInicio and @fechaFin) 
select distinct @suma as 'Monto'
from DocumentoPago dp 
inner join DocumentoEnvioEncomienda de on dp.idDocumentoEnvio=de.idDocumentoEnvioEncomienda
inner join Cliente c on de.idClienteEnvio=c.idCliente
inner join Cliente c2 on de.idClienteEntrega=c2.idCliente
inner join Ruta r on de.idRuta=r.idRuta
where (de.FechaEnvio between @fechaInicio and @fechaFin) 
 end
GO
/****** Object:  StoredProcedure [dbo].[sp_SeleccionarRuta]    Script Date: 11/06/2019 09:51:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_SeleccionarRuta]
@idSucursalOrigen int
as
begin
select * from Ruta where idSucursalOrigen=@idSucursalOrigen
end

GO
/****** Object:  StoredProcedure [dbo].[Sucursal_GetAll_SP]    Script Date: 11/06/2019 09:51:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Sucursal_GetAll_SP]
as
BEgin
select idSucursal,	Ciudad,	Direccion,	Telefono,	Activo from Sucursal
End
GO
/****** Object:  StoredProcedure [dbo].[TioUSuario_GetAll_SP]    Script Date: 11/06/2019 09:51:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[TioUSuario_GetAll_SP]
as
BEgin
select idUsuario	,nombre	,estado from TipoUsuario
End
GO
/****** Object:  StoredProcedure [dbo].[Usario_GetById_SP]    Script Date: 11/06/2019 09:51:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Usario_GetById_SP]
@idUSuario int
as
Begin
select idUsuario
,idSucursal
,Usuario
,Clave
,NombreUsuario
,ApellidosUsuario
,DNI
,Cargo
,Direccion
,Telefono
,tipoUsuario
,Activo
From Usuario
where idUsuario=@idUSuario
End
GO
/****** Object:  StoredProcedure [dbo].[Usuario_Delete_Sp]    Script Date: 11/06/2019 09:51:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Usuario_Delete_Sp]  
  
@idUsuario int  
as  
  Begin
update Usuario  
set activo = 0  
where @idUsuario = idUsuario  
  End
GO
/****** Object:  StoredProcedure [dbo].[Usuario_Save_Sp]    Script Date: 11/06/2019 09:51:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  
CREATE procedure [dbo].[Usuario_Save_Sp]  
@idUsuario int   
,@idSucursal int   
,@Usuario varchar (6)  
,@Clave varchar (8)  
,@NombreUsuario varchar (25)  
,@ApellidosUsuario varchar (25)  
,@DNI varchar (8)  
,@Direccion varchar (50)  
,@Telefono varchar (20)  
,@tipoUsuario int   
,@Activo bit   
As  
Declare @prmCargo  varchar (25) 
Select @prmCargo= Nombre from [dbo].[TipoUsuario] where idUsuario=@tipoUsuario


if @idUsuario=0  
begin  
Insert into Usuario (  
idSucursal  
,Usuario  
,Clave  
,NombreUsuario  
,ApellidosUsuario  
,DNI  
,Cargo  
,Direccion  
,Telefono  
,tipoUsuario  
,Activo)  
values  
(@idSucursal  
,@Usuario  
,@Clave  
,@NombreUsuario  
,@ApellidosUsuario  
,@DNI  
,@prmCargo  
,@Direccion  
,@Telefono  
,@tipoUsuario  
,@Activo)  
end  
else  
begin  
Update Usuario set  
idSucursal  =@idSucursal  
,Usuario   =@Usuario  
,Clave   =@Clave  
,NombreUsuario =@NombreUsuario  
,ApellidosUsuario=@ApellidosUsuario  
,DNI    =@DNI  
,Cargo   =@prmCargo  
,Direccion  =@Direccion  
,Telefono  =@Telefono  
,tipoUsuario  =@tipoUsuario  
,Activo   =@Activo  
where idUsuario=@idUsuario  
end
GO
