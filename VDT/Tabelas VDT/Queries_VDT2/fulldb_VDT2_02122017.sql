USE [master]
GO
/****** Object:  Database [VDT2_02122017]    Script Date: 05/12/2017 15:58:22 ******/
CREATE DATABASE [VDT2_02122017]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'VDT2', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\VDT2_02122017.mdf' , SIZE = 19456KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'VDT2_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\VDT2_02122017_log.ldf' , SIZE = 8384KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [VDT2_02122017] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [VDT2_02122017].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [VDT2_02122017] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [VDT2_02122017] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [VDT2_02122017] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [VDT2_02122017] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [VDT2_02122017] SET ARITHABORT OFF 
GO
ALTER DATABASE [VDT2_02122017] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [VDT2_02122017] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [VDT2_02122017] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [VDT2_02122017] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [VDT2_02122017] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [VDT2_02122017] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [VDT2_02122017] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [VDT2_02122017] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [VDT2_02122017] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [VDT2_02122017] SET  DISABLE_BROKER 
GO
ALTER DATABASE [VDT2_02122017] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [VDT2_02122017] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [VDT2_02122017] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [VDT2_02122017] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [VDT2_02122017] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [VDT2_02122017] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [VDT2_02122017] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [VDT2_02122017] SET RECOVERY FULL 
GO
ALTER DATABASE [VDT2_02122017] SET  MULTI_USER 
GO
ALTER DATABASE [VDT2_02122017] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [VDT2_02122017] SET DB_CHAINING OFF 
GO
ALTER DATABASE [VDT2_02122017] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [VDT2_02122017] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [VDT2_02122017] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'VDT2_02122017', N'ON'
GO
USE [VDT2_02122017]
GO
/****** Object:  User [yurifx]    Script Date: 05/12/2017 15:58:23 ******/
CREATE USER [yurifx] FOR LOGIN [yurifx] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [VDT]    Script Date: 05/12/2017 15:58:23 ******/
CREATE USER [VDT] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [uservdt]    Script Date: 05/12/2017 15:58:23 ******/
CREATE USER [uservdt] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [yurifx]
GO
ALTER ROLE [db_owner] ADD MEMBER [uservdt]
GO
/****** Object:  Table [dbo].[AvArea]    Script Date: 05/12/2017 15:58:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AvArea](
	[AvArea_ID] [int] IDENTITY(1,1) NOT NULL,
	[Cliente_ID] [int] NOT NULL,
	[Codigo] [varchar](20) NULL,
	[Area_Pt] [varchar](50) NOT NULL,
	[Local_Pt] [varchar](50) NULL,
	[Lado_Pt] [varchar](50) NULL,
	[Area_En] [varchar](50) NULL,
	[Local_En] [varchar](50) NULL,
	[Lado_En] [varchar](50) NULL,
	[Area_Es] [varchar](50) NULL,
	[Local_Es] [varchar](50) NULL,
	[Lado_Es] [varchar](50) NULL,
	[Nome_Pt]  AS (rtrim(((([Area_Pt]+' ')+isnull([Local_Pt],''))+' ')+isnull([Lado_Pt],''))) PERSISTED,
	[Nome_En]  AS (rtrim((((isnull([Area_En],'')+' ')+isnull([Local_En],''))+' ')+isnull([Lado_En],''))) PERSISTED,
	[Nome_Es]  AS (rtrim((((isnull([Area_Es],'')+' ')+isnull([Local_Es],''))+' ')+isnull([Lado_Es],''))) PERSISTED,
	[Ativo] [bit] NOT NULL DEFAULT ((1)),
PRIMARY KEY CLUSTERED 
(
	[AvArea_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AvCondicao]    Script Date: 05/12/2017 15:58:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AvCondicao](
	[AvCondicao_ID] [int] IDENTITY(1,1) NOT NULL,
	[Codigo] [varchar](20) NULL,
	[Nome_Pt] [varchar](50) NOT NULL,
	[Nome_En] [varchar](50) NULL,
	[Nome_Es] [varchar](50) NULL,
	[Ativo] [bit] NOT NULL DEFAULT ((1)),
PRIMARY KEY CLUSTERED 
(
	[AvCondicao_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AvDano]    Script Date: 05/12/2017 15:58:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AvDano](
	[AvDano_ID] [int] IDENTITY(1,1) NOT NULL,
	[Cliente_ID] [int] NOT NULL,
	[Codigo] [varchar](20) NULL,
	[Nome_Pt] [varchar](50) NOT NULL,
	[Nome_En] [varchar](50) NULL,
	[Nome_Es] [varchar](50) NULL,
	[Ativo] [bit] NOT NULL DEFAULT ((1)),
PRIMARY KEY CLUSTERED 
(
	[AvDano_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AvGravidade]    Script Date: 05/12/2017 15:58:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AvGravidade](
	[AvGravidade_ID] [int] IDENTITY(1,1) NOT NULL,
	[Cliente_ID] [int] NOT NULL,
	[Codigo] [varchar](20) NULL,
	[Nome_Pt] [varchar](50) NOT NULL,
	[Nome_En] [varchar](50) NULL,
	[Nome_Es] [varchar](50) NULL,
	[Ativo] [bit] NOT NULL DEFAULT ((1)),
PRIMARY KEY CLUSTERED 
(
	[AvGravidade_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AvQuadrante]    Script Date: 05/12/2017 15:58:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AvQuadrante](
	[AvQuadrante_ID] [int] IDENTITY(1,1) NOT NULL,
	[Cliente_ID] [int] NOT NULL,
	[Codigo] [varchar](20) NULL,
	[Nome_Pt] [varchar](50) NOT NULL,
	[Nome_En] [varchar](50) NULL,
	[Nome_Es] [varchar](50) NULL,
	[Ativo] [bit] NOT NULL DEFAULT ((1)),
PRIMARY KEY CLUSTERED 
(
	[AvQuadrante_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AvSeveridade]    Script Date: 05/12/2017 15:58:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AvSeveridade](
	[AvSeveridade_ID] [int] IDENTITY(1,1) NOT NULL,
	[Cliente_ID] [int] NOT NULL,
	[Codigo] [varchar](20) NULL,
	[Nome_Pt] [varchar](50) NOT NULL,
	[Nome_En] [varchar](50) NULL,
	[Nome_Es] [varchar](50) NULL,
	[Ativo] [bit] NOT NULL DEFAULT ((1)),
PRIMARY KEY CLUSTERED 
(
	[AvSeveridade_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 05/12/2017 15:58:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Cliente](
	[Cliente_ID] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [varchar](100) NULL,
	[Ativo] [bit] NOT NULL DEFAULT ((1)),
PRIMARY KEY CLUSTERED 
(
	[Cliente_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CustoReparo]    Script Date: 05/12/2017 15:58:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CustoReparo](
	[CustoReparo_ID] [int] IDENTITY(1,1) NOT NULL,
	[AvArea_ID] [int] NULL,
	[AvGravidade_ID] [int] NULL,
	[SubstituicaoPeca] [char](1) NULL,
	[HorasReparo] [decimal](5, 2) NULL,
	[Custo] [decimal](7, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[CustoReparo_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FrotaViagem]    Script Date: 05/12/2017 15:58:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FrotaViagem](
	[FrotaViagem_ID] [int] IDENTITY(1,1) NOT NULL,
	[Transportador_ID] [int] NOT NULL,
	[Nome] [varchar](100) NOT NULL,
	[Ativo] [bit] NOT NULL DEFAULT ((1)),
PRIMARY KEY CLUSTERED 
(
	[FrotaViagem_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[InspAvaria]    Script Date: 05/12/2017 15:58:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[InspAvaria](
	[InspAvaria_ID] [int] IDENTITY(1,1) NOT NULL,
	[InspVeiculo_ID] [int] NOT NULL,
	[AvArea_ID] [int] NOT NULL,
	[AvDano_ID] [int] NOT NULL,
	[AvSeveridade_ID] [int] NOT NULL,
	[AvQuadrante_ID] [int] NOT NULL,
	[AvGravidade_ID] [int] NOT NULL,
	[AvCondicao_ID] [int] NOT NULL,
	[FabricaTransporte] [char](1) NOT NULL,
	[DanoOrigem] [bit] NOT NULL DEFAULT ((0)),
	[HorasReparo] [int] NULL,
	[CustoReparo] [decimal](7, 2) NULL DEFAULT ((0)),
	[SubstituicaoPeca] [bit] NULL DEFAULT ((0)),
	[ValorPeca] [decimal](7, 2) NULL DEFAULT ((0)),
	[CustoTotal] [decimal](7, 2) NULL DEFAULT ((0)),
PRIMARY KEY CLUSTERED 
(
	[InspAvaria_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Inspecao]    Script Date: 05/12/2017 15:58:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inspecao](
	[Inspecao_ID] [int] IDENTITY(1,1) NOT NULL,
	[Cliente_ID] [int] NOT NULL,
	[LocalInspecao_ID] [int] NOT NULL,
	[LocalCheckPoint_ID] [int] NOT NULL,
	[Transportador_ID] [int] NOT NULL,
	[FrotaViagem_ID] [int] NOT NULL,
	[Navio_ID] [int] NULL,
	[Usuario_ID] [int] NOT NULL,
	[Data] [date] NOT NULL,
	[Publicado] [int] NULL DEFAULT ((0)),
	[PublicacaoData] [datetime] NULL,
	[PublicadoPor] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Inspecao_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[InspVeiculo]    Script Date: 05/12/2017 15:58:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[InspVeiculo](
	[InspVeiculo_ID] [int] IDENTITY(1,1) NOT NULL,
	[Inspecao_ID] [int] NOT NULL,
	[Marca_ID] [int] NOT NULL,
	[Modelo_ID] [int] NOT NULL,
	[VIN_6] [varchar](6) NULL,
	[VIN] [char](17) NULL,
	[Observacoes] [varchar](1000) NULL,
	[Lote_ID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[InspVeiculo_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ListaVeiculos]    Script Date: 05/12/2017 15:58:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ListaVeiculos](
	[ListaVeiculos_ID] [int] IDENTITY(1,1) NOT NULL,
	[Cliente_ID] [int] NOT NULL,
	[Usuario_ID] [int] NOT NULL,
	[NomeArquivo] [varchar](50) NOT NULL,
	[DataHoraInclusao] [smalldatetime] NOT NULL DEFAULT (getdate()),
	[LocalInspecao_ID] [int] NOT NULL,
	[LocalCheckPoint_ID] [int] NOT NULL,
	[Tipo] [char](1) NOT NULL,
	[Lote_ID] [int] NULL,
	[DataLista] [smalldatetime] NULL DEFAULT (NULL),
PRIMARY KEY CLUSTERED 
(
	[ListaVeiculos_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ListaVeiculosVin]    Script Date: 05/12/2017 15:58:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ListaVeiculosVin](
	[ListaVeiculosVin_ID] [int] IDENTITY(1,1) NOT NULL,
	[ListaVeiculos_ID] [int] NOT NULL,
	[VIN] [char](17) NOT NULL,
	[VIN_6]  AS (right([VIN],(6))) PERSISTED,
	[Ativo] [bit] NOT NULL DEFAULT ((1)),
PRIMARY KEY CLUSTERED 
(
	[ListaVeiculosVin_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LocalCheckPoint]    Script Date: 05/12/2017 15:58:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LocalCheckPoint](
	[LocalCheckPoint_ID] [int] IDENTITY(1,1) NOT NULL,
	[LocalInspecao_ID] [int] NOT NULL,
	[Codigo] [varchar](20) NULL,
	[Nome_Pt] [varchar](50) NOT NULL,
	[Nome_En] [varchar](50) NULL,
	[Nome_Es] [varchar](50) NULL,
	[Operacao] [char](1) NOT NULL,
	[Ativo] [bit] NOT NULL DEFAULT ((1)),
	[Tipo] [char](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[LocalCheckPoint_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LocalInspecao]    Script Date: 05/12/2017 15:58:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LocalInspecao](
	[LocalInspecao_ID] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [varchar](100) NULL,
	[Ativo] [bit] NOT NULL DEFAULT ((1)),
PRIMARY KEY CLUSTERED 
(
	[LocalInspecao_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Lote]    Script Date: 05/12/2017 15:58:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Lote](
	[Lote_ID] [int] IDENTITY(1,1) NOT NULL,
	[Lote] [varchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[Lote_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Marca]    Script Date: 05/12/2017 15:58:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Marca](
	[Marca_ID] [int] IDENTITY(1,1) NOT NULL,
	[Cliente_ID] [int] NOT NULL,
	[Nome] [varchar](100) NULL,
	[Ativo] [bit] NOT NULL DEFAULT ((1)),
PRIMARY KEY CLUSTERED 
(
	[Marca_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Modelo]    Script Date: 05/12/2017 15:58:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Modelo](
	[Modelo_ID] [int] IDENTITY(1,1) NOT NULL,
	[Cliente_ID] [int] NOT NULL,
	[Nome] [varchar](100) NULL,
	[ativo] [bit] NOT NULL DEFAULT ((1)),
PRIMARY KEY CLUSTERED 
(
	[Modelo_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Navio]    Script Date: 05/12/2017 15:58:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Navio](
	[Navio_ID] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [varchar](100) NOT NULL,
	[Ativo] [bit] NOT NULL DEFAULT ((1)),
PRIMARY KEY CLUSTERED 
(
	[Navio_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Transportador]    Script Date: 05/12/2017 15:58:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Transportador](
	[Transportador_ID] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [varchar](100) NOT NULL,
	[Tipo] [char](1) NOT NULL,
	[Ativo] [bit] NOT NULL DEFAULT ((1)),
PRIMARY KEY CLUSTERED 
(
	[Transportador_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 05/12/2017 15:58:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Usuario](
	[Usuario_ID] [int] IDENTITY(1,1) NOT NULL,
	[UsuarioPerfil_ID] [smallint] NOT NULL,
	[Login] [varchar](100) NOT NULL,
	[Nome] [varchar](50) NOT NULL,
	[Senha] [varchar](50) NOT NULL,
	[Email] [varchar](100) NOT NULL,
	[Inspetor] [bit] NOT NULL DEFAULT ((0)),
	[Ativo] [bit] NOT NULL DEFAULT ((1)),
	[DataInicio] [date] NOT NULL DEFAULT (getdate()),
	[DataValidade] [date] NOT NULL DEFAULT (dateadd(day,(60),getdate())),
	[RequerTrocaSenha] [bit] NOT NULL DEFAULT ((0)),
PRIMARY KEY CLUSTERED 
(
	[Usuario_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UsuarioPerfil]    Script Date: 05/12/2017 15:58:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UsuarioPerfil](
	[UsuarioPerfil_ID] [smallint] IDENTITY(1,1) NOT NULL,
	[Clientes] [varchar](1000) NULL,
	[Locais] [varchar](1000) NULL,
	[Nome] [varchar](100) NULL,
	[Ativo] [bit] NOT NULL DEFAULT ((1)),
	[Administrador] [bit] NULL DEFAULT ((0)),
	[AcessaModuloInspecao] [bit] NULL DEFAULT ((0)),
	[AcessaModuloBackOffice] [bit] NULL DEFAULT ((0)),
	[AcessaModuloConsultas] [bit] NULL DEFAULT ((0)),
	[ConsultaInspecao] [bit] NULL DEFAULT ((0)),
	[RegistraInspecao] [bit] NULL DEFAULT ((0)),
	[AlteraInspecao] [bit] NULL DEFAULT ((0)),
	[PublicaInspecao] [bit] NULL DEFAULT ((0)),
	[DespublicaInspecao] [bit] NULL DEFAULT ((0)),
	[ImportaListas] [bit] NULL DEFAULT ((0)),
	[InsereEscritorios] [bit] NULL DEFAULT ((0)),
	[AlteraEscritorios] [bit] NULL DEFAULT ((0)),
	[InsereLocais] [bit] NULL DEFAULT ((0)),
	[AlteraLocais] [bit] NULL DEFAULT ((0)),
	[InsereCheckPoints] [bit] NULL DEFAULT ((0)),
	[AlteraCheckPoints] [bit] NULL DEFAULT ((0)),
	[InsereMarcas] [bit] NULL DEFAULT ((0)),
	[AlteraMarcas] [bit] NULL DEFAULT ((0)),
	[InsereModelos] [bit] NULL DEFAULT ((0)),
	[AlteraModelos] [bit] NULL DEFAULT ((0)),
	[InsereTabAvarias] [bit] NULL DEFAULT ((0)),
	[AlteraTabAvarias] [bit] NULL DEFAULT ((0)),
	[InsereTransportadores] [bit] NULL DEFAULT ((0)),
	[AlteraTransportadores] [bit] NULL DEFAULT ((0)),
PRIMARY KEY CLUSTERED 
(
	[UsuarioPerfil_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IDX_SUMMARY]    Script Date: 05/12/2017 15:58:24 ******/
CREATE NONCLUSTERED INDEX [IDX_SUMMARY] ON [dbo].[InspAvaria]
(
	[InspVeiculo_ID] ASC
)
INCLUDE ( 	[AvArea_ID],
	[AvDano_ID],
	[AvSeveridade_ID],
	[AvQuadrante_ID],
	[AvGravidade_ID],
	[AvCondicao_ID],
	[FabricaTransporte],
	[DanoOrigem]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IDX_SUMMARY]    Script Date: 05/12/2017 15:58:24 ******/
CREATE NONCLUSTERED INDEX [IDX_SUMMARY] ON [dbo].[InspVeiculo]
(
	[Inspecao_ID] ASC
)
INCLUDE ( 	[InspVeiculo_ID],
	[Marca_ID],
	[Modelo_ID],
	[VIN_6],
	[VIN],
	[Lote_ID]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [Ind_Login]    Script Date: 05/12/2017 15:58:24 ******/
CREATE NONCLUSTERED INDEX [Ind_Login] ON [dbo].[Usuario]
(
	[Login] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ListaVeiculos]  WITH CHECK ADD FOREIGN KEY([Lote_ID])
REFERENCES [dbo].[Lote] ([Lote_ID])
GO
ALTER TABLE [dbo].[Modelo]  WITH CHECK ADD FOREIGN KEY([Cliente_ID])
REFERENCES [dbo].[Cliente] ([Cliente_ID])
GO
/****** Object:  StoredProcedure [dbo].[AvArea_Lst]    Script Date: 05/12/2017 15:58:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Procedure [dbo].[AvArea_Lst]
----------------------------------------------------------------------------------------------------
-- Lista as áreas avariadas de um cliente
----------------------------------------------------------------------------------------------------
(
@p_Cliente_ID  Int -- Identificação do cliente
)
AS

SET NOCOUNT ON

Select AvArea_ID,
       Cliente_ID,

       Codigo,

       Nome_Pt,
       Nome_En,
       Nome_Es

From   AvArea
Where  Cliente_ID = @p_Cliente_ID

 and   Ativo = 1

Order by Codigo, AvArea_ID


GO
/****** Object:  StoredProcedure [dbo].[AvCondicao_Lst]    Script Date: 05/12/2017 15:58:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Procedure [dbo].[AvCondicao_Lst]
----------------------------------------------------------------------------------------------------
-- Lista as condições de inspeção de um cliente
----------------------------------------------------------------------------------------------------
(
@p_Cliente_ID  Int -- Identificação do cliente
)
AS

SET NOCOUNT ON

Select AvCondicao_ID,

       Codigo,

       Nome_Pt,
       Nome_En,
       Nome_Es

From   AvCondicao
Where  Ativo = 1

Order by Codigo, AvCondicao_ID


GO
/****** Object:  StoredProcedure [dbo].[AvDano_Lst]    Script Date: 05/12/2017 15:58:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Procedure [dbo].[AvDano_Lst]
----------------------------------------------------------------------------------------------------
-- Lista os tipos de danos de um cliente
----------------------------------------------------------------------------------------------------
(
@p_Cliente_ID  Int -- Identificação do cliente
)
AS

SET NOCOUNT ON

Select AvDano_ID,
       Cliente_ID,

       Codigo,

       Nome_Pt,
       Nome_En,
       Nome_Es

From   AvDano
Where  Cliente_ID = @p_Cliente_ID

 and   Ativo = 1

Order by Codigo, AvDano_ID


GO
/****** Object:  StoredProcedure [dbo].[AvGravidade_Lst]    Script Date: 05/12/2017 15:58:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Procedure [dbo].[AvGravidade_Lst]
----------------------------------------------------------------------------------------------------
-- Lista os graus de gravidade de um cliente
----------------------------------------------------------------------------------------------------
(
@p_Cliente_ID  Int -- Identificação do cliente
)
AS

SET NOCOUNT ON

Select AvGravidade_ID,
       Cliente_ID,

       Codigo,

       Nome_Pt,
       Nome_En,
       Nome_Es

From   AvGravidade
Where  Cliente_ID = @p_Cliente_ID

 and   Ativo = 1

Order by Codigo, AvGravidade_ID


GO
/****** Object:  StoredProcedure [dbo].[AvQuadrante_Lst]    Script Date: 05/12/2017 15:58:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Procedure [dbo].[AvQuadrante_Lst]
----------------------------------------------------------------------------------------------------
-- Lista os quadrantes de um cliente
----------------------------------------------------------------------------------------------------
(
@p_Cliente_ID  Int -- Identificação do cliente
)
AS

SET NOCOUNT ON

Select AvQuadrante_ID,
       Cliente_ID,

       Codigo,

       Nome_Pt,
       Nome_En,
       Nome_Es

From   AvQuadrante
Where  Cliente_ID = @p_Cliente_ID

 and   Ativo = 1

Order by Codigo, AvQuadrante_ID


GO
/****** Object:  StoredProcedure [dbo].[AvSeveridade_Lst]    Script Date: 05/12/2017 15:58:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Procedure [dbo].[AvSeveridade_Lst]
----------------------------------------------------------------------------------------------------
-- Lista os graus de severidade de um cliente
----------------------------------------------------------------------------------------------------
(
@p_Cliente_ID  Int -- Identificação do cliente
)
AS

SET NOCOUNT ON

Select AvSeveridade_ID,
       Cliente_ID,

       Codigo,

       Nome_Pt,
       Nome_En,
       Nome_Es

From   AvSeveridade
Where  Cliente_ID = @p_Cliente_ID

 and   Ativo = 1

Order by Codigo, AvSeveridade_ID


GO
/****** Object:  StoredProcedure [dbo].[ChkLogin]    Script Date: 05/12/2017 15:58:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Procedure [dbo].[ChkLogin]
----------------------------------------------------------------------------------------------------
-- Consulta os dados de um usuário para login
----------------------------------------------------------------------------------------------------
(
@p_Login  Varchar(100) -- Identificação do usuário para login
)
AS

SET NOCOUNT ON

Select u.Usuario_ID,
       u.UsuarioPerfil_ID,

       u.Login,
       u.Nome,
       u.Senha,
       u.Email,
       u.Inspetor,
       u.RequerTrocaSenha,

       p.Clientes,                -- '*' ou lista dos clientes que os usuários têm acesso, separados por pipe (|)
       p.Locais,                  -- '*' ou lista dos locais   que os usuários têm acesso, separados por pipe (|)

       p.Nome  as UsuarioPerfilNome, -- Nome do perfil

       p.Administrador,           -- Usuários podem fazer a manutenção das tabelas de usuários e de perfis de acesso

       p.AcessaModuloInspecao,    -- Usuários podem acessar o módulo de inspeção
       p.AcessaModuloBackOffice,  -- Usuários podem acessar o módulo de back-office
       p.AcessaModuloConsultas,   -- Usuários podem acessar o módulo de consultas

       p.ConsultaInspecao,        -- Usuários podem consultar dados das inspeções
       p.RegistraInspecao,        -- Usuários podem registrar (inserir) inspeções
       p.AlteraInspecao,          -- Usuários podem modificar dados das inspeções
       p.PublicaInspecao,         -- Usuários podem publicar    inspeções
       p.DespublicaInspecao,      -- Usuários podem despublicar inspeções

       p.ImportaListas,           -- Usuários podem importar pack-lists e loading-lists

       p.InsereEscritorios,       -- Usuários podem inserir novos escritórios
       p.AlteraEscritorios,       -- Usuários podem alterar       escritórios

       p.InsereLocais,            -- Usuários podem inserir novos locais de inspeção
       p.AlteraLocais,            -- Usuários podem alterar       locais

       p.InsereCheckPoints,       -- Usuários podem inserir novos check-points
       p.AlteraCheckPoints,       -- Usuários podem alterar       check-points

       p.InsereMarcas,            -- Usuários podem inserir novas marcas de veículos
       p.AlteraMarcas,            -- Usuários podem alterar       marcas de veículos

       p.InsereModelos,           -- Usuários podem inserir novos modelos de veículos
       p.AlteraModelos,           -- Usuários podem alterar       modelos de veículos

       p.InsereTabAvarias,        -- Usuários podem inserir linhas nas tabelas de áreas, danos, severidades, quadrantes, gravidades e condições de inspeção
       p.AlteraTabAvarias,        -- Usuários podem alterar áreas, danos, severidades, quadrantes, gravidades e condições de inspeção

       p.InsereTransportadores,   -- Usuários podem inserir novos transportadores
       p.AlteraTransportadores    -- Usuários podem alterar       transportadores

From       Usuario       u
Inner Join UsuarioPerfil p on u.UsuarioPerfil_ID = p.UsuarioPerfil_ID

Where u.Login = @p_Login
 and  u.Ativo = 1
 and  p.Ativo = 1

 -- Verifica a data de inicio
 and  u.DataInicio <= GetDate()

 -- Verifica a data de validade, considerando apenas dia/mês/ano (desprezando horas, minutos e segundos)
 and  u.DataValidade >= DateAdd(dd, 0, DateDiff(dd, 0, GetDate()))

GO
/****** Object:  StoredProcedure [dbo].[Cliente_Lst]    Script Date: 05/12/2017 15:58:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Procedure [dbo].[Cliente_Lst]
----------------------------------------------------------------------------------------------------
-- Lista os clientes
----------------------------------------------------------------------------------------------------
(
@p_Usuario_ID  Int, -- Identificação do usuário
@p_Ativos      Bit  -- 1:Apenas os ativos 0:Todos
)
AS

SET NOCOUNT ON

-- Monta a lista de clientes que o usuário tem acesso
Declare @Clientes Varchar(1000) -- '*' ou lista dos clientes que os usuários têm acesso, separados por pipe (|)

Select  @Clientes = Clientes
From       Usuario       u
Inner Join UsuarioPerfil p on u.UsuarioPerfil_ID = p.UsuarioPerfil_ID

Where u.Usuario_ID = @p_Usuario_ID

-- Lista os clientes
Select  Cliente_ID,
        Nome,
        Ativo

From    Cliente
Where ( @Clientes = '*'
        or  CharIndex( '|'+LTrim(RTrim(Cliente_ID))+'|' , @Clientes ) <> 0 )

 and  (    Ativo = 1
        or @p_Ativos = 0 )

Order by Cliente_ID


GO
/****** Object:  StoredProcedure [dbo].[Conferencia_Summary]    Script Date: 05/12/2017 15:58:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Procedure [dbo].[Conferencia_Summary]

----------------------------------------------------------------------------------------------------
-- 18-07-2017: Verifica a quantidade de veículos, avarias em um determinado local, checkpoint e data
----------------------------------------------------------------------------------------------------
(
@p_Cliente_ID int,
@p_LocalInspecao int,
@p_LocalCheckpoint int,
@p_Data datetime
)
AS

DECLARE @IDs table (InspVeiculo_ID int, VIN varchar(17))

Insert into @IDs (InspVeiculo_ID, VIN) 
select distinct iv.InspVeiculo_ID, IsNull(VIN, VIN_6) From InspVeiculo iv
Inner Join  Inspecao           i      on   iv.Inspecao_ID          =      i.Inspecao_ID
Left Join   InspAvaria         ia     on   iv.InspVeiculo_ID       =     ia.InspVeiculo_ID

Where 

i.Cliente_ID = @p_Cliente_ID
        
and i.LocalInspecao_ID   = @p_LocalInspecao

and i.LocalCheckPoint_ID = @p_LocalCheckPoint

and i.Data               = @p_Data


Select 'TodosVeiculos' as Tipo,  Count(VIN) Total 
From @IDs

Union

Select 'VeiculosComAvarias' as Tipo, Count(Distinct iv.InspVeiculo_ID) Total from inspVeiculo iv

Inner Join @IDs tmp      on     iv.InspVeiculo_ID = tmp.InspVeiculo_ID
Inner Join InspAvaria ia on     iv.InspVeiculo_ID = ia.InspVeiculo_ID

Union

Select 'VeiculosSemAvaria' as Tipo, Count(Distinct iv.InspVeiculo_ID) Total from inspVeiculo iv
Inner join @IDs tmp on iv.InspVeiculo_ID = tmp.InspVeiculo_ID
 Where not exists (select 1 from inspAvaria ia where ia.InspVeiculo_ID = iv.InspVeiculo_ID)

Union 

Select 'QuantidadeAvarias' as Tipo, Count(inspAvaria_id) Total from InspAvaria ia
 Inner join @IDs tmp on ia.InspVeiculo_ID = tmp.InspVeiculo_ID

Union 

Select 'QuantidadeAvariasTransporte' as Tipo, Count(inspAvaria_id) Total from InspAvaria ia
Inner Join @IDs tmp on ia.InspVeiculo_ID = tmp.InspVeiculo_ID
Where ia.FabricaTransporte = 'T'

Union

Select 'QuantidadeAvariasFabrica' as Tipo, Count(inspAvaria_id) Total from InspAvaria ia
Inner Join @IDs tmp on ia.InspVeiculo_ID = tmp.InspVeiculo_ID
Where ia.FabricaTransporte = 'F'
GO
/****** Object:  StoredProcedure [dbo].[FrotaViagem_Ins]    Script Date: 05/12/2017 15:58:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


Create Procedure [dbo].[FrotaViagem_Ins]

----------------------------------------------------------------------------------------------------
-- Insere uma nova frota/viagem
----------------------------------------------------------------------------------------------------
(
@p_Transportador_ID   Int,
@p_Nome               Varchar(100),
@p_FrotaViagem_ID     Int OUTPUT
)
AS

SET NOCOUNT ON

Select @p_FrotaViagem_ID = FrotaViagem_ID From FrotaViagem 
            Where 
                Transportador_ID   =  @p_Transportador_ID
            And Nome               = @p_Nome

if @p_FrotaViagem_ID IS NULL
    Begin
        Insert Into FrotaViagem ( Transportador_ID, Nome )
        Values ( @p_Transportador_ID,
                 @p_Nome )

        Set @p_FrotaViagem_ID = SCOPE_IDENTITY()
    End
GO
/****** Object:  StoredProcedure [dbo].[FrotaViagem_Lst]    Script Date: 05/12/2017 15:58:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Procedure [dbo].[FrotaViagem_Lst]
----------------------------------------------------------------------------------------------------
-- Lista as frotas/viagens (de um tipo de transportador ou todas / de um transportador ou todos)
----------------------------------------------------------------------------------------------------
(
@p_Tipo             Char(1), -- Tipo de transportador - *:Todos T:Terrestre M:Marítimo
@p_Transportador_ID Int,     -- NULL = todos os transportadores
@p_Ativos           Bit      -- 1:Apenas os ativos 0:Todos
)
AS

SET NOCOUNT ON

Select f.FrotaViagem_ID,
       f.Transportador_ID,
       f.Nome,
       f.Ativo,

       t.Nome  as TransportadorNome,
       t.Tipo  as TransportadorTipo,  -- T:Terrestre M:Marítimo
       t.Ativo as TransportadorAtivo

From       FrotaViagem   f
Inner Join Transportador t on f.Transportador_ID = t.Transportador_ID

Where ( @p_Tipo = '*'  or  t.Tipo = @p_Tipo )

 and  ( @p_Transportador_ID Is Null  or  f.Transportador_ID = @p_Transportador_ID)

 and  ( @p_Ativos = 0  or  ( f.Ativo = 1 and t.Ativo = 1 ) )

Order by t.Nome, f.Nome

GO
/****** Object:  StoredProcedure [dbo].[FrotaViagem_Sel]    Script Date: 05/12/2017 15:58:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Procedure [dbo].[FrotaViagem_Sel]
----------------------------------------------------------------------------------------------------
-- Consulta os dados de uma frota/viagem
----------------------------------------------------------------------------------------------------
(
@p_FrotaViagem_ID Int
)
AS

SET NOCOUNT ON

Select f.FrotaViagem_ID,
       f.Transportador_ID,
       f.Nome,
       f.Ativo,

       t.Nome  as TransportadorNome,
       t.Tipo  as TransportadorTipo,  -- T:Terrestre M:Marítimo
       t.Ativo as TransportadorAtivo

From       FrotaViagem   f
Inner Join Transportador t on f.Transportador_ID = t.Transportador_ID

Where FrotaViagem_ID = @p_FrotaViagem_ID


GO
/****** Object:  StoredProcedure [dbo].[InspAvaria_Conf]    Script Date: 05/12/2017 15:58:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Procedure [dbo].[InspAvaria_Conf]
----------------------------------------------------------------------------------------------------
-- Consulta os dados de uma avaria_conferencia
-- 23/03/2017 - DanoOrigem
-- 23/03/2017 - Adicionar filtro Cliente_ID
-- 30/03/2017 - Adicionar campo: Custo
-- 13/04/2017 - Adicionar o campo: VIN
-- 17/04/2017 - LeftJoins na Avaria
-- 17/04/2017 - Adicionar RowId
-- 20/04/2017 - Adicionar HorasReparo - tbl CustoReparo
-- 24/04/2017 - Adicionar Campos de custos de peça e valor total
-- 15/05/2017 - Adicionar Campos do transportador e lote - Versão 1.0.2
----------------------------------------------------------------------------------------------------
(
@p_Cliente_ID Int,
@p_LocalInspecao_ID Int,
@p_LocalCheckPoint_ID Int,
@p_Data DateTime
)
AS

SET NOCOUNT ON
Select 
       iv.InspVeiculo_ID*100 + ISNULL(ia.InspAvaria_ID, 0) as RowID, --Primary key
       i.Data, 
       i.Inspecao_ID,
	   
	   li.LocalInspecao_ID       as  LocalCodigo,
	   li.Nome                   as  LocalNome,
                                     
	   lc.LocalCheckPoint_ID     as  CheckPointCodigo,
	   lc.Nome_Pt                as  CheckPointNome,
       lc.Operacao               as  Operacao,
       
       t.Transportador_ID        as TransportadorCodigo,
       t.Nome                    as TransportadorNome,
       t.Tipo                    as TransportadorTipo,

       fv.FrotaViagem_ID,
       fv.Nome                   as FrotaViagemNome,
                                    
       n.Navio_ID,
       n.Nome                    as NavioNome,                                     
	   iv.InspVeiculo_ID,
       iv.VIN_6,
	   iv.VIN,

       l.Lote                    as LoteNome,
       l.Lote_ID                 as LoteCodigo,
                                     
	   ia.InspAvaria_ID,             
	   ia.FabricaTransporte,         
	   ia.DanoOrigem,
       ia.HorasReparo,
       ia.CustoReparo,
       ia.SubstituicaoPeca,
       ia.ValorPeca,
       ia.CustoTotal,

	   ma.Marca_ID               as  MarcaCodigo,
	   ma.Nome                   as  MarcaNome, 
                                     
	   mo.Modelo_ID              as  ModeloCodigo,
	   mo.Nome                   as  ModeloNome,
                                     
       a.AvArea_ID               as  AreaCodigo,
	   a.Nome_Pt                 as  Area_Pt,
                                     
	   c.AvCondicao_ID           as  CondicaoCodigo,
	   c.Nome_Pt                 as  Condicao_Pt,
                                     
	   d.AvDano_ID               as  DanoCodigo,
	   d.Nome_Pt                 as  Dano_Pt,
                                     
	   g.AvGravidade_ID          as  GravidadeCodigo,
	   g.Nome_Pt                 as  Gravidade_Pt,
                                
	   q.AvQuadrante_ID          as  QuadranteCodigo,
	   q.Nome_Pt                 as  Quadrante_Pt,
                                     
       s.AvSeveridade_ID         as  SeveridadeCodigo,
	   s.Nome_Pt                 as  Severidade_Pt
                                      
From InspVeiculo iv             

/* Junções referentes - Inspeção */
Inner Join Inspecao         i    on  iv.Inspecao_ID         =    i.Inspecao_ID
Inner Join LocalInspecao    li   on  li.LocalInspecao_ID    =    i.LocalInspecao_ID
Inner Join LocalCheckPoint  lc   on  lc.LocalCheckPoint_ID  =    i.LocalCheckPoint_ID
Inner Join Transportador    t    on  i.Transportador_ID     =    t.Transportador_ID
Inner Join FrotaViagem      fv   on  fv.FrotaViagem_ID      =    i.FrotaViagem_ID
Left Join  Navio            n    on   n.Navio_ID            =    i.Navio_ID

Left Join  Lote             l    on   iv.Lote_ID            =    l.Lote_ID

/* Junções referentes - Veículo */
Inner Join Marca           ma    on  iv.Marca_ID            =   ma.Marca_ID
Inner Join Modelo          mo    on  iv.Modelo_ID           =   mo.Modelo_ID

/* Junções referentes - Avaria */
Left  Join InspAvaria      ia    on  iv.InspVeiculo_ID      =   ia.InspVeiculo_ID
Left  Join avArea           a    on   a.AvArea_ID           =   ia.AvArea_ID
Left  Join AvCondicao       c    on   c.AvCondicao_ID       =   ia.AvCondicao_ID
Left  Join AvDano           d    on   d.AvDano_ID           =   ia.AvDano_ID
Left  Join AvGravidade      g    on   g.AvGravidade_ID      =   ia.AvGravidade_ID
Left  Join AvQuadrante      q    on   q.AvQuadrante_ID      =   ia.AvQuadrante_ID
Left  Join AvSeveridade     s    on   s.AvSeveridade_ID     =   ia.AvSeveridade_ID
Left join  Custoreparo     cr    on   cr.AvArea_ID          =   ia.AvArea_ID  
                                 and  ia.AvGravidade_ID     =   cr.AvGravidade_ID


Where  i.Data               =    @p_Data
 and   i.LocalInspecao_ID   =    @p_LocalInspecao_ID
 and   i.LocalCheckPoint_ID =    @p_LocalCheckPoint_ID
 and   i.Cliente_ID         =    @p_Cliente_ID

/*
EXEC InspAvaria_Conf 1, 2, 5, '2017-05-12'
*/

-- FIM
GO
/****** Object:  StoredProcedure [dbo].[InspAvaria_Cons]    Script Date: 05/12/2017 15:58:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


Create Procedure [dbo].[InspAvaria_Cons]
----------------------------------------------------------------------------------------------------
-- Consulta os dados de uma avaria
-- 04/09/2017 | VIN_6 para VIN
-- 26/09/2017 | Alteração no filtro de data
----------------------------------------------------------------------------------------------------
(
    @p_Cliente_ID             Int,
    @p_Chassi                 Varchar(100),
    @p_LocalInspecao          Varchar(100),
    @p_LocalCheckPoint        Varchar(100),
    @p_Transportador          Varchar(100),
	@p_Lote                   Varchar(50),
    @p_Marca                  Varchar(100),
    @p_Modelo                 Varchar(100),
    @p_Area                   Varchar(100),
    @p_Condicao               Varchar(100),
    @p_Dano                   Varchar(100),
    @p_Quadrante              Varchar(100),
    @p_Gravidade              Varchar(100),
    @p_Severidade             Varchar(100),
    @p_TipoDefeito            Varchar(100),  --Transporte/Fábrica/Todos
    @p_DanoOrigem             Varchar(100),  -- Sim/Não/Todos
    @p_TransportadorTipo      Varchar(100),  -- Marítimo/Terrestre/Todos
    @p_FrotaViagem            Varchar(100),  -- Nome da frotaviagem
    @p_Navio                  Varchar(100),
    @p_DataInicio             Date,
    @p_DataFinal              Date
)

AS

SET NOCOUNT ON

Select TOP 10000 
       iv.InspVeiculo_ID*100 + ISNULL(ia.InspAvaria_ID, 0) as RowID, --Primary key Calculada

       i.Data, 
       i.Inspecao_ID,
	   i.Cliente_ID,

	   li.LocalInspecao_ID    as LocalCodigo,
	   li.Nome                as LocalNome,
                                 
	   lc.LocalCheckPoint_ID  as CheckPointCodigo,
	   lc.Nome_Pt             as CheckPointNome,
                                 
       t.Tipo                 as TransportadorTipo, --TransportadorTipo
       t.Nome                 as TransportadorNome, --TransportadorNome
                             
       fv.FrotaViagem_ID,    
       fv.Nome                as FrotaViagemNome,
                             
       n.Navio_ID,           
       n.Nome                 as NavioNome,
                             
	   iv.InspVeiculo_ID      as InspVeiculo_ID, 
       iv.VIN_6               as VIN_6,
       iv.VIN                 as VIN,
                             
       l.Lote_ID              as Lote_ID,
       l.Lote                 as LoteNome,                                   
                             
	   ia.InspAvaria_ID,          
	   ia.FabricaTransporte, 
	   ia.DanoOrigem,        
       ia.HorasReparo,       
       ia.CustoReparo,       
       ia.SubstituicaoPeca,  
       ia.ValorPeca,         
       ia.CustoTotal,        
                             
	   ma.Marca_ID            as  MarcaCodigo,
	   ma.Nome                as  MarcaNome, 
                                  
	   mo.Modelo_ID           as  ModeloCodigo,
	   mo.Nome                as  ModeloNome,
                                  
       a.AvArea_ID            as  AreaCodigo,
	   a.Nome_Pt              as  AreaNome,
       a.Area_Pt              ,
       a.Local_Pt             ,
       a.Lado_Pt              ,
                                  
	   c.AvCondicao_ID        as  CondicaoCodigo,
	   c.Nome_Pt              as  Condicao_Pt,
                                  
	   d.AvDano_ID            as  DanoCodigo,
	   d.Nome_Pt              as  Dano_Pt,
                                  
	   g.AvGravidade_ID       as  GravidadeCodigo,
	   g.Nome_Pt              as  Gravidade_Pt,
                             
	   q.AvQuadrante_ID       as  QuadranteCodigo,
	   q.Nome_Pt              as  Quadrante_Pt,
                                  
       s.AvSeveridade_ID      as  SeveridadeCodigo,
	   s.Nome_Pt              as  Severidade_Pt
                                      
From InspVeiculo iv             

Inner Join Inspecao          i     on   iv.Inspecao_ID          =      i.Inspecao_ID
Inner Join LocalInspecao     li    on   li.LocalInspecao_ID     =      i.LocalInspecao_ID
Inner Join LocalCheckPoint   lc    on   lc.LocalCheckPoint_ID   =      i.LocalCheckPoint_ID
Inner Join Transportador     t     on    t.Transportador_ID     =      i.Transportador_ID
Inner Join FrotaViagem       fv    on   fv.FrotaViagem_ID       =      i.FrotaViagem_ID
Inner Join Marca             ma    on   iv.Marca_ID             =     ma.Marca_ID
Inner Join Modelo            mo    on   iv.Modelo_ID            =     mo.Modelo_ID

Left Join Lote                l    on   iv.Lote_ID              =      l.Lote_ID
Left Join Navio               n    on    n.Navio_ID             =      i.Navio_ID 
Left Join InspAvaria         ia    on   iv.InspVeiculo_ID       =     ia.InspVeiculo_ID

Left Join avArea              a    on    a.AvArea_ID            =     ia.AvArea_ID
Left Join AvCondicao          c    on    c.AvCondicao_ID        =     ia.AvCondicao_ID
Left Join AvDano              d    on    d.AvDano_ID            =     ia.AvDano_ID
Left Join AvGravidade         g    on    g.AvGravidade_ID       =     ia.AvGravidade_ID
Left Join AvQuadrante         q    on    q.AvQuadrante_ID       =     ia.AvQuadrante_ID
Left Join AvSeveridade        s    on    s.AvSeveridade_ID      =     ia.AvSeveridade_ID
Left Join Custoreparo        cr    on   cr.AvArea_ID            =     ia.AvArea_ID  
                                  and   ia.AvGravidade_ID       =     cr.AvGravidade_ID

Where 

i.Publicado = 1

and  @p_Cliente_ID = i.Cliente_ID

and (@p_Chassi is null
        or iv.VIN  like '%' + @p_Chassi + '%')
        
and (@p_LocalInspecao = '*'
        or CharIndex( '|'+ Cast(i.LocalInspecao_ID as Varchar) +'|', @p_LocalInspecao) > 0 )

and (@p_LocalCheckPoint = '*'
        or CharIndex( '|'+ Cast(i.LocalCheckPoint_ID as Varchar) +'|', @p_LocalCheckPoint) > 0 )

and (@p_Transportador = '*'
        or CharIndex( '|'+ Cast(i.Transportador_ID as Varchar) +'|', @p_Transportador) > 0 )

and (@p_Marca = '*'
        or CharIndex( '|'+ Cast(iv.Marca_ID as Varchar) +'|', @p_Marca) > 0 )

and (@p_Modelo = '*'
        or CharIndex( '|'+ Cast(iv.Modelo_ID as Varchar) +'|', @p_Modelo) > 0 )

and (@p_Area = '*'
        or CharIndex( '|'+ Cast(ia.AvArea_ID as Varchar) +'|', @p_Area) > 0 )

and (@p_Condicao = '*'
        or CharIndex( '|'+ Cast(ia.AvCondicao_ID as Varchar) +'|', @p_Condicao) > 0 )

and (@p_Dano = '*'
        or CharIndex( '|'+ Cast(ia.AvDano_ID as Varchar) +'|', @p_Dano) > 0 )

and (@p_Gravidade = '*'
        or CharIndex( '|'+ Cast(ia.AvGravidade_ID as Varchar) +'|', @p_Gravidade) > 0 )

and (@p_Quadrante = '*'
        or CharIndex( '|'+ Cast(ia.AvQuadrante_ID as Varchar) +'|', @p_Quadrante) > 0 )

and (@p_Severidade = '*'
        or CharIndex( '|'+ Cast(ia.AvSeveridade_ID as Varchar) +'|', @p_Severidade) > 0 )
        
and (@p_TipoDefeito = '*'
        or CharIndex( '|'+ Cast(ia.FabricaTransporte as Varchar) +'|', @p_TipoDefeito) > 0 )
        
and (@p_DanoOrigem = '*'
        or CharIndex( '|'+ Cast(ia.DanoOrigem as Varchar) +'|', @p_DanoOrigem) > 0 )

and (@p_TransportadorTipo = '*'
        or CharIndex( '|'+ Cast(t.Tipo as Varchar) +'|', @p_TransportadorTipo) > 0 )

and (@p_FrotaViagem is null
        or fv.Nome like '%' + @p_FrotaViagem + '%')

and (@p_Navio is null
        or n.Nome like '%' + @p_Navio + '%')

and (@p_Lote is null
        or l.Lote  like '%' + @p_Lote + '%')

and ( (@p_DataInicio = '0001-01-01' and @p_DataFinal = '0001-01-01')  
        or i.Data between @p_DataInicio and @p_DataFinal )

order by i.data desc, iv.VIN asc

/*
Declare @p_Cliente_ID             Int,
        @p_Chassi                 varchar(100),                                             
        @p_LocalInspecao          varchar(100),                                             
        @p_LocalCheckPoint        varchar(100),
        @p_Transportador          varchar(100),
        @p_Lote                   Varchar(50),                                             
        @p_Marca                  varchar(100),                                             
        @p_Modelo                 varchar(100),                                             
        @p_Area                   varchar(100),                                             
        @p_Condicao               varchar(100),                                             
        @p_Dano                   varchar(100),                                             
        @p_Quadrante              varchar(100),                                             
        @p_Gravidade              varchar(100),                                             
        @p_Severidade             varchar(100),                                             
      --@p_Extensoes              varchar(100),                                             
        @p_TipoDefeito            varchar(100), --Transporte/Fábrica/Todos                  
        @p_DanoOrigem             varchar(100), -- Sim/Não/Todos                            
        @p_TipoTransportador      varchar(100), -- Marítimo/Terrestre/Todos                 
        @p_FrotaViagem            varchar(100),                                                                                    
        @p_Navio                  varchar(100),                                             
        @p_DataInicio             Date,                                                     
        @p_DataFinal              Date                                                      
                                                                                            
set      @p_Cliente_ID             = 1
set      @p_Chassi                 = null
set      @p_LocalInspecao          = '*'
set      @p_LocalCheckPoint        = '*'
set      @p_Transportador          = '*'
set      @p_Lote                   = null
set      @p_Marca                  = '*'
set      @p_Modelo                 = '*'
set      @p_Area                   = '*'
set      @p_Condicao               = '*'
set      @p_Dano                   = '*'
set      @p_Quadrante              = '*'
set      @p_Gravidade              = '*'
set      @p_Severidade             = '*'
set      @p_TipoDefeito            = '*'  --|T|F|
set      @p_DanoOrigem             = '*'  --|0|1|
set      @p_TipoTransportador      = '*'  --|T|M|
set      @p_FrotaViagem            = null
set      @p_Navio                  = null
set      @p_DataInicio             = '2017-04-27'
set      @p_DataFinal              = '2017-04-27'


exec InspAvaria_Cons 
    @p_Cliente_ID         ,
    @p_Chassi             ,
    @p_LocalInspecao      ,
    @p_LocalCheckPoint    ,   
    @p_Transportador      ,
    @p_Lote               ,
    @p_Marca              ,  
    @p_Modelo             ,  
    @p_Area               ,  
    @p_Condicao           ,  
    @p_Dano               ,  
    @p_Quadrante          ,  
    @p_Gravidade          ,  
    @p_Severidade         ,  
    @p_TipoDefeito        ,  
    @p_DanoOrigem         ,  
    @p_TipoTransportador  ,
    @p_FrotaViagem        , 
    @p_Navio              , 
    @p_DataInicio         , 
    @p_DataFinal         
*/
GO
/****** Object:  StoredProcedure [dbo].[InspAvaria_Cons_Summary]    Script Date: 05/12/2017 15:58:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Procedure [dbo].[InspAvaria_Cons_Summary] 
(  
    @p_Cliente_ID             Int,
    @p_Chassi                 Varchar(100),
    @p_LocalInspecao          Varchar(100),
    @p_LocalCheckPoint        Varchar(100),
    @p_Transportador          Varchar(100),
	@p_Lote                   Varchar(50),
    @p_Marca                  Varchar(100),
    @p_Modelo                 Varchar(100),
    @p_Area                   Varchar(100),
    @p_Condicao               Varchar(100),
    @p_Dano                   Varchar(100),
    @p_Quadrante              Varchar(100),
    @p_Gravidade              Varchar(100),
    @p_Severidade             Varchar(100),
    @p_TipoDefeito            Varchar(100),  --Transporte/Fábrica/Todos
    @p_DanoOrigem             Varchar(100),  -- Sim/Não/Todos
    @p_TransportadorTipo      Varchar(100),  -- Marítimo/Terrestre/Todos
    @p_FrotaViagem            Varchar(100),  -- Nome da frotaviagem
    @p_Navio                  Varchar(100),
    @p_DataInicio             Date,
    @p_DataFinal              Date
)

AS

DECLARE @IDs table (InspVeiculo_ID int, VIN varchar(17))

Insert into @IDs (InspVeiculo_ID, VIN) 
select iv.InspVeiculo_ID, IsNull(VIN, VIN_6)From InspVeiculo iv
Inner Join  Inspecao           i      on   iv.Inspecao_ID          =      i.Inspecao_ID
Inner Join  Transportador      t      on    t.Transportador_ID     =      i.Transportador_ID
Inner Join  FrotaViagem        fv     on   fv.FrotaViagem_ID       =      i.FrotaViagem_ID
Left Join   Lote                l     on   iv.Lote_ID              =      l.Lote_ID
Left Join   Navio               n     on    n.Navio_ID             =      i.Navio_ID 
Left Join   InspAvaria         ia     on   iv.InspVeiculo_ID       =     ia.InspVeiculo_ID


Where 

i.Publicado = 1

and  @p_Cliente_ID = i.Cliente_ID

and (@p_Chassi is null
        or iv.VIN_6  like '%' + @p_Chassi + '%')
        
and (@p_LocalInspecao = '*'
        or CharIndex( '|'+ Cast(i.LocalInspecao_ID as Varchar) +'|', @p_LocalInspecao) > 0 )

and (@p_LocalCheckPoint = '*'
        or CharIndex( '|'+ Cast(i.LocalCheckPoint_ID as Varchar) +'|', @p_LocalCheckPoint) > 0 )

and (@p_Transportador = '*'
        or CharIndex( '|'+ Cast(i.Transportador_ID as Varchar) +'|', @p_Transportador) > 0 )

and (@p_Marca = '*'
        or CharIndex( '|'+ Cast(iv.Marca_ID as Varchar) +'|', @p_Marca) > 0 )

and (@p_Modelo = '*'
        or CharIndex( '|'+ Cast(iv.Modelo_ID as Varchar) +'|', @p_Modelo) > 0 )

and (@p_Area = '*'
        or CharIndex( '|'+ Cast(ia.AvArea_ID as Varchar) +'|', @p_Area) > 0 )

and (@p_Condicao = '*'
        or CharIndex( '|'+ Cast(ia.AvCondicao_ID as Varchar) +'|', @p_Condicao) > 0 )

and (@p_Dano = '*'
        or CharIndex( '|'+ Cast(ia.AvDano_ID as Varchar) +'|', @p_Dano) > 0 )

and (@p_Gravidade = '*'
        or CharIndex( '|'+ Cast(ia.AvGravidade_ID as Varchar) +'|', @p_Gravidade) > 0 )

and (@p_Quadrante = '*'
        or CharIndex( '|'+ Cast(ia.AvQuadrante_ID as Varchar) +'|', @p_Quadrante) > 0 )

and (@p_Severidade = '*'
        or CharIndex( '|'+ Cast(ia.AvSeveridade_ID as Varchar) +'|', @p_Severidade) > 0 )
        
and (@p_TipoDefeito = '*'
        or CharIndex( '|'+ Cast(ia.FabricaTransporte as Varchar) +'|', @p_TipoDefeito) > 0 )
        
and (@p_DanoOrigem = '*'
        or CharIndex( '|'+ Cast(ia.DanoOrigem as Varchar) +'|', @p_DanoOrigem) > 0 )

and (@p_TransportadorTipo = '*'
        or CharIndex( '|'+ Cast(t.Tipo as Varchar) +'|', @p_TransportadorTipo) > 0 )

and (@p_FrotaViagem is null
        or fv.Nome like '%' + @p_FrotaViagem + '%')

and (@p_Navio is null
        or n.Nome like '%' + @p_Navio + '%')

and (@p_Lote is null
        or l.Lote  like '%' + @p_Lote + '%')

and i.Data between @p_DataInicio and @p_DataFinal



select 'TodosVeiculos' as Tipo, count(distinct VIN) Total 
from @IDs

union

select 'VeiculosComAvarias' as Tipo, count(distinct iv.InspVeiculo_ID) Total from inspVeiculo iv
inner join @IDs tmp on iv.InspVeiculo_ID = tmp.InspVeiculo_ID
inner join InspAvaria ia on iv.InspVeiculo_ID = ia.InspVeiculo_ID

union

select 'VeiculosSemAvaria' as Tipo, count(distinct iv.InspVeiculo_ID) Total from inspVeiculo iv
inner join @IDs tmp on iv.InspVeiculo_ID = tmp.InspVeiculo_ID
where not exists (select 1 from inspAvaria ia where ia.InspVeiculo_ID = iv.InspVeiculo_ID)


union 

select 'QuantidadeAvarias' as Tipo, count(inspAvaria_id) Total from InspAvaria ia
inner join @IDs tmp on ia.InspVeiculo_ID = tmp.InspVeiculo_ID


union 

select 'QuantidadeAvariasTransporte' as Tipo, count(inspAvaria_id) Total from InspAvaria ia
inner join @IDs tmp on ia.InspVeiculo_ID = tmp.InspVeiculo_ID
where ia.FabricaTransporte = 'T'


union

select 'QuantidadeAvariasFabrica' as Tipo, count(inspAvaria_id) Total from InspAvaria ia
inner join @IDs tmp on ia.InspVeiculo_ID = tmp.InspVeiculo_ID
where ia.FabricaTransporte = 'F'


/*
Declare @p_Cliente_ID             Int,
        @p_Chassi                 varchar(100),                                             
        @p_LocalInspecao          varchar(100),                                             
        @p_LocalCheckPoint        varchar(100),
        @p_Transportador          varchar(100),
        @p_Lote                   Varchar(50),                                             
        @p_Marca                  varchar(100),                                             
        @p_Modelo                 varchar(100),                                             
        @p_Area                   varchar(100),                                             
        @p_Condicao               varchar(100),                                             
        @p_Dano                   varchar(100),                                             
        @p_Quadrante              varchar(100),                                             
        @p_Gravidade              varchar(100),                                             
        @p_Severidade             varchar(100),                                             
      --@p_Extensoes              varchar(100),                                             
        @p_TipoDefeito            varchar(100), --Transporte/Fábrica/Todos                  
        @p_DanoOrigem             varchar(100), -- Sim/Não/Todos                            
        @p_TipoTransportador      varchar(100), -- Marítimo/Terrestre/Todos                 
        @p_FrotaViagem            varchar(100),                                                                                    
        @p_Navio                  varchar(100),                                             
        @p_DataInicio             Date,                                                     
        @p_DataFinal              Date                                                      
                                                                                            
set      @p_Cliente_ID             = 1
set      @p_Chassi                 = null
set      @p_LocalInspecao          = '*'
set      @p_LocalCheckPoint        = '*'
set      @p_Transportador          = '*'
set      @p_Lote                   = null
set      @p_Marca                  = '*'
set      @p_Modelo                 = '*'
set      @p_Area                   = '*'
set      @p_Condicao               = '*'
set      @p_Dano                   = '*'
set      @p_Quadrante              = '*'
set      @p_Gravidade              = '*'
set      @p_Severidade             = '*'
set      @p_TipoDefeito            = '*'  --|T|F|
set      @p_DanoOrigem             = '*'  --|0|1|
set      @p_TipoTransportador      = '*'  --|T|M|
set      @p_FrotaViagem            = null
set      @p_Navio                  = null
set      @p_DataInicio             = '2017-01-01'
set      @p_DataFinal              = '2017-04-25'


exec InspAvaria_Cons_Summary
    @p_Cliente_ID         ,
    @p_Chassi             ,
    @p_LocalInspecao      ,
    @p_LocalCheckPoint    ,   
    @p_Transportador      ,
    @p_Lote               ,
    @p_Marca              ,  
    @p_Modelo             ,  
    @p_Area               ,  
    @p_Condicao           ,  
    @p_Dano               ,  
    @p_Quadrante          ,  
    @p_Gravidade          ,  
    @p_Severidade         ,  
    @p_TipoDefeito        ,  
    @p_DanoOrigem         ,  
    @p_TipoTransportador  ,
    @p_FrotaViagem        , 
    @p_Navio              , 
    @p_DataInicio         , 
    @p_DataFinal         
    
*/
GO
/****** Object:  StoredProcedure [dbo].[InspAvaria_Del]    Script Date: 05/12/2017 15:58:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Procedure [dbo].[InspAvaria_Del]
----------------------------------------------------------------------------------------------------
-- Remove um registro de avaria de um veículo
----------------------------------------------------------------------------------------------------
(
@p_InspAvaria_ID Int
)
AS

SET NOCOUNT ON

Delete From InspAvaria Where InspAvaria_ID = @p_InspAvaria_ID


GO
/****** Object:  StoredProcedure [dbo].[InspAvaria_Ins]    Script Date: 05/12/2017 15:58:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Procedure [dbo].[InspAvaria_Ins]
----------------------------------------------------------------------------------------------------
-- Insere um novo registro de avaria de um veículo
-- Atualização: 30/03/2017 Adicionando a lógica de custo
-- Atualização: 26/04/2017 Adicionando 
----------------------------------------------------------------------------------------------------
(
@p_InspVeiculo_ID     Int,
@p_AvArea_ID          Int,
@p_AvDano_ID          Int,
@p_AvSeveridade_ID    Int,
@p_AvQuadrante_ID     Int,
@p_AvGravidade_ID     Int,
@p_AvCondicao_ID      Int,
@p_FabricaTransporte  Char(1), -- F:Defeito de Fábrica  T:Avaria de Transporte
@p_DanoOrigem         Bit,
@p_InspAvaria_ID      Int OUTPUT
)
AS

SET NOCOUNT ON

Declare @Inspecao_ID Int
Select  @Inspecao_ID = Inspecao_ID From InspVeiculo Where InspVeiculo_ID = @p_InspVeiculo_ID

Declare @Cliente_ID Int
Select  @Cliente_ID = Cliente_ID From Inspecao Where Inspecao_ID = @Inspecao_ID

Declare @CustoReparo Decimal (7,2),
        @HorasReparo Int

Select  @CustoReparo = Custo, @HorasReparo = HorasReparo from CustoReparo cr where cr.AvArea_ID = @p_AvArea_ID and cr.AvGravidade_ID = @p_AvGravidade_ID

-- Verifica se a 'área' corresponde ao 'cliente'
If Not Exists ( Select 1
                From  AvArea
                Where AvArea_ID   = @p_AvArea_ID
                 and  Cliente_ID  = @Cliente_ID ) Begin

  THROW 50000, 'Área incompatível com Cliente',1
End

-- Verifica se o 'dano' corresponde ao 'cliente'
If Not Exists ( Select 1
                From  AvDano
                Where AvDano_ID   = @p_AvDano_ID
                 and  Cliente_ID  = @Cliente_ID ) Begin

  THROW 50000, 'Dano incompatível com Cliente',1
End

-- Verifica se a 'severidade' corresponde ao 'cliente'
If Not Exists ( Select 1
                From  AvSeveridade
                Where AvSeveridade_ID = @p_AvSeveridade_ID
                 and  Cliente_ID      = @Cliente_ID ) Begin

  THROW 50000, 'Severidade incompatível com Cliente',1
End

-- Verifica se o 'quadrante' corresponde ao 'cliente'
If Not Exists ( Select 1
                From  AvQuadrante
                Where AvQuadrante_ID = @p_AvQuadrante_ID
                 and  Cliente_ID     = @Cliente_ID ) Begin

  THROW 50000, 'Quadrante incompatível com Cliente',1
End

-- Verifica se a 'gravidade' corresponde ao 'cliente'
If Not Exists ( Select 1
                From  AvGravidade
                Where AvGravidade_ID = @p_AvGravidade_ID
                 and  Cliente_ID     = @Cliente_ID ) Begin

  THROW 50000, 'Gravidade incompatível com Cliente',1
End




-- Insere a nova avaria
Insert Into InspAvaria ( InspVeiculo_ID,
                         AvArea_ID,
                         AvDano_ID,
                         AvSeveridade_ID,
                         AvQuadrante_ID,
                         AvGravidade_ID,
                         AvCondicao_ID,
                         FabricaTransporte,
                         DanoOrigem,
                         HorasReparo,
                         CustoReparo,
                         CustoTotal)

Values                ( @p_InspVeiculo_ID,
                        @p_AvArea_ID,
                        @p_AvDano_ID,
                        @p_AvSeveridade_ID,
                        @p_AvQuadrante_ID,
                        @p_AvGravidade_ID,
                        @p_AvCondicao_ID,
                        @p_FabricaTransporte,
                        @p_DanoOrigem,
                        @HorasReparo,
                        @CustoReparo,
                        @CustoReparo) --Custo total, no momento da inserção sempre será = o custo do reparo

Set @p_InspAvaria_ID = SCOPE_IDENTITY()


GO
/****** Object:  StoredProcedure [dbo].[InspAvaria_Lst]    Script Date: 05/12/2017 15:58:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Procedure [dbo].[InspAvaria_Lst]
----------------------------------------------------------------------------------------------------
-- Lista as avarias de um veículo (InspVeiculo_ID)
----------------------------------------------------------------------------------------------------
(
@p_InspVeiculo_ID Int
)
AS

SET NOCOUNT ON

Select InspAvaria_ID,
       InspVeiculo_ID,
       AvArea_ID,
       AvDano_ID,
       AvSeveridade_ID,
       AvQuadrante_ID,
       AvGravidade_ID,
       AvCondicao_ID,
       FabricaTransporte,
       DanoOrigem,
       Custo

From  InspAvaria
Where InspVeiculo_ID = @p_InspVeiculo_ID


GO
/****** Object:  StoredProcedure [dbo].[InspAvaria_LstVin]    Script Date: 05/12/2017 15:58:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Procedure [dbo].[InspAvaria_LstVin]
----------------------------------------------------------------------------------------------------
-- Lista as avarias de um veículo (VIN)
-- 23/03 - Adicionando o campo DanoOrigem
-- 26/04 - Alterações Custo
----------------------------------------------------------------------------------------------------
(
@p_Cliente_ID      Int,
@p_VIN_6           Varchar(6),    -- Últimos seis caracteres do chassi
@p_VIN             Char(17)       -- Chassi completo
)
AS

SET NOCOUNT ON

Select  i.Inspecao_ID,
        i.Cliente_ID,
        i.LocalInspecao_ID,
        i.LocalCheckPoint_ID,

        v.InspVeiculo_ID,

        i.Data,
        
        v.VIN,
        v.VIN_6,

        l.Nome            as LocalInspecaoNome,

        p.Codigo          as LocalCheckPointCodigo,
        p.Nome_Pt         as LocalCheckPointNome_Pt,
        p.Nome_En         as LocalCheckPointNome_En,
        p.Nome_Es         as LocalCheckPointNome_Es,
        p.Operacao        as LocalCheckPointOperacao,

        av.InspAvaria_ID,
        av.AvArea_ID,
        av.AvDano_ID,
        av.AvSeveridade_ID,
        av.AvQuadrante_ID,
        av.AvGravidade_ID,
        av.AvCondicao_ID,
        av.FabricaTransporte,
        av.DanoOrigem,
        av.HorasReparo,
        av.CustoReparo,
        av.SubstituicaoPeca,
        av.ValorPeca,
        av.CustoTotal,

        a.Codigo    as AreaCodigo,
        a.Nome_Pt   as Area_Pt,
        a.Nome_En   as Area_En,
        a.Nome_Es   as Area_Es,
   
        d.Codigo    as DanoCodigo,
        d.Nome_Pt   as Dano_Pt,
        d.Nome_En   as Dano_En,
        d.Nome_Es   as Dano_Es,
   
        s.Codigo    as SevCodigo,
        s.Nome_Pt   as Severidade_Pt,
        s.Nome_En   as Severidade_En,
        s.Nome_Es   as Severidade_Es,
   
        q.Codigo    as QuadranteCodigo,
        q.Nome_Pt   as Quadrante_Pt,
        q.Nome_En   as Quadrante_En,
        q.Nome_Es   as Quadrante_Es,
   
        c.Codigo    as CondicaoCodigo,
        c.Nome_Pt   as Condicao_Pt,
        c.Nome_En   as Condicao_En,
        c.Nome_Es   as Condicao_Es,
   
	    g.Codigo    as GravidadeCodigo,
        g.Nome_Pt   as Gravidade_Pt,
        g.Nome_En   as Gravidade_En,
        g.Nome_Es   as Gravidade_Es

From         Inspecao            i
Inner Join   LocalInspecao       l   on i.LocalInspecao_ID    =    l.LocalInspecao_ID
Inner Join   LocalCheckPoint     p   on i.LocalCheckPoint_ID  =    p.LocalCheckPoint_ID
Inner Join   InspVeiculo         v   on i.Inspecao_ID         =    v.Inspecao_ID
Inner Join   InspAvaria         av   on v.InspVeiculo_ID      =   av.InspVeiculo_ID
Inner Join   AvArea              a   on av.AvArea_ID          =    a.AvArea_ID
Inner Join   AvDano              d   on av.AvDano_ID          =    d.AvDano_ID
Inner Join   AvSeveridade        s   on av.AvSeveridade_ID    =    s.AvSeveridade_ID
Inner Join   AvQuadrante         q   on av.AvQuadrante_ID     =    q.AvQuadrante_ID
Inner Join   AvCondicao          c   on av.AvCondicao_ID      =    c.AvCondicao_ID
Inner Join   AvGravidade	     g   on av.AvGravidade_ID	  =    g.AvGravidade_ID

Where i.Cliente_ID = @p_Cliente_ID
 and  (   ( @p_VIN    Is Not Null and v.VIN = @p_VIN )
       OR ( @p_VIN_6  Is Not Null and v.VIN_6 = @p_VIN_6 ) )


GO
/****** Object:  StoredProcedure [dbo].[InspAvaria_Sel]    Script Date: 05/12/2017 15:58:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


Create Procedure [dbo].[InspAvaria_Sel]
----------------------------------------------------------------------------------------------------
-- Consulta os dados de uma avaria
-- 08/03/2017 - Atualização: Adição dos campos com nomes: a.Nome_pt, es, en e seus respectivos joins
-- 08/03/2017 - Atualização: Adição do campos de Inspeção - ID e VIN_6
-- 09/03/2017 - Adição dos campos de codigo
-- 23/03/2017 - Adição do campo DanoOrigem
-- 30/03/2017 - Adição do campo Custo
-- 26/04/2017 - Adição dos novos campos de Custo
----------------------------------------------------------------------------------------------------
(
@p_InspAvaria_ID Int
)
AS

SET NOCOUNT ON

Select av.InspAvaria_ID,
       av.InspVeiculo_ID,
       av.AvArea_ID,
       av.AvDano_ID,
       av.AvSeveridade_ID,
       av.AvQuadrante_ID,
       av.AvGravidade_ID,
       av.AvCondicao_ID,
       av.FabricaTransporte,
       av.DanoOrigem,
       av.HorasReparo,
       av.CustoReparo,
       av.SubstituicaoPeca,
       av.ValorPeca,
       av.CustoTotal,

       a.Codigo          as AreaCodigo,
       a.Nome_Pt         as Area_Pt,
       a.Nome_En         as Area_En,
       a.Nome_Es         as Area_Es,

       c.Codigo          as CondicaoCodigo,
       c.Nome_Pt         as Condicao_Pt,
       c.Nome_En         as Condicao_En,
       c.Nome_Es         as Condicao_Es,

       d.Codigo          as DanoCodigo,
       d.Nome_Pt         as Dano_Pt,
       d.Nome_En         as Dano_En,
       d.Nome_Es         as Dano_Es,

       g.Codigo          as GravidadeCodigo,
       g.Nome_Pt         as Gravidade_Pt,
       g.Nome_En         as Gravidade_En,
       g.Nome_Es         as Gravidade_Es,

       q.Codigo          as QuadranteCodigo,
       q.Nome_Pt         as Quadrante_Pt,
       q.Nome_En         as Quadrante_En,
       q.Nome_Es         as Quadrante_Es,

       s.Codigo          as SeveridadeCodigo,
       s.Nome_Pt         as Severidade_Pt,
       s.Nome_En         as Severidade_En,
       s.Nome_Es         as Severidade_Es,

       iv.Inspecao_ID    as Inspecao_ID,
       iv.VIN_6          as VIN_6
					
From  InspAvaria av

Inner Join AvArea         a   on av.AvArea_ID       = a.AvArea_ID
Inner Join AvCondicao     c   on av.AvCondicao_ID   = c.AvCondicao_ID
Inner Join AvDano         d   on av.AvDano_ID       = d.AvDano_ID
Inner Join AvGravidade    g   on av.AvGravidade_ID  = g.AvGravidade_ID
Inner Join AvQuadrante    q   on av.AvQuadrante_ID  = q.AvQuadrante_ID
Inner Join AvSeveridade   s   on av.AvSeveridade_ID = s.AvSeveridade_ID
Inner Join InspVeiculo   iv   on iv.InspVeiculo_ID  = Av.InspVeiculo_ID

Where InspAvaria_ID = @p_InspAvaria_ID


GO
/****** Object:  StoredProcedure [dbo].[InspAvaria_Summary]    Script Date: 05/12/2017 15:58:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [dbo].[InspAvaria_Summary] 

-------------------------------------------------------------------
-- 20/04 Criação da procedure
-- 04/09/2017 | VIN_6 para VIN
-- 26/09/2017 | Filtro de data.
-------------------------------------------------------------------

(  
    @p_Cliente_ID             Int,
    @p_Chassi                 Varchar(100),
    @p_LocalInspecao          Varchar(100),
    @p_LocalCheckPoint        Varchar(100),
    @p_Transportador          Varchar(100),
	@p_Lote                   Varchar(50),
    @p_Marca                  Varchar(100),
    @p_Modelo                 Varchar(100),
    @p_Area                   Varchar(100),
    @p_Condicao               Varchar(100),
    @p_Dano                   Varchar(100),
    @p_Quadrante              Varchar(100),
    @p_Gravidade              Varchar(100),
    @p_Severidade             Varchar(100),
    @p_TipoDefeito            Varchar(100),  --Transporte/Fábrica/Todos
    @p_DanoOrigem             Varchar(100),  -- Sim/Não/Todos
    @p_TransportadorTipo      Varchar(100),  -- Marítimo/Terrestre/Todos
    @p_FrotaViagem            Varchar(100),  -- Nome da frotaviagem
    @p_Navio                  Varchar(100),
    @p_DataInicio             Date,
    @p_DataFinal              Date
)

AS

DECLARE @IDs table (InspVeiculo_ID int, VIN varchar(17))

--Insert Into @IDs (InspVeiculo_ID, VIN) 
--Select Distinct TOP 10000 iv.InspVeiculo_ID, IsNull(VIN, VIN_6) From InspVeiculo iv
--Inner Join  Inspecao           i      on   iv.Inspecao_ID          =      i.Inspecao_ID
--Inner Join  Transportador      t      on    t.Transportador_ID     =      i.Transportador_ID
--Inner Join  FrotaViagem       fv      on   fv.FrotaViagem_ID       =      i.FrotaViagem_ID
--Left  Join  Lote               l      on   iv.Lote_ID              =      l.Lote_ID
--Left  Join  Navio              n      on    n.Navio_ID             =      i.Navio_ID 
--Left  Join  InspAvaria        ia      on   iv.InspVeiculo_ID       =     ia.InspVeiculo_ID

Insert Into @IDs (InspVeiculo_ID, VIN) 
Select Distinct TOP 10000 iv.InspVeiculo_ID, IsNull(VIN, VIN_6) From Inspecao i
Inner Join  InspVeiculo        iv     on   iv.Inspecao_ID          =      i.Inspecao_ID
Inner Join  Transportador      t      on    t.Transportador_ID     =      i.Transportador_ID
Inner Join  FrotaViagem       fv      on   fv.FrotaViagem_ID       =      i.FrotaViagem_ID
Left  Join  Lote               l      on   iv.Lote_ID              =      l.Lote_ID
Left  Join  Navio              n      on    n.Navio_ID             =      i.Navio_ID 
Left  Join  InspAvaria        ia      on   iv.InspVeiculo_ID       =     ia.InspVeiculo_ID


Where 

i.Publicado = 1

and  @p_Cliente_ID = i.Cliente_ID

and (@p_Chassi is null
        or iv.VIN  like '%' + @p_Chassi + '%')
        
and (@p_LocalInspecao = '*'
        or CharIndex( '|'+ Cast(i.LocalInspecao_ID as Varchar) +'|', @p_LocalInspecao) > 0 )

and (@p_LocalCheckPoint = '*'
        or CharIndex( '|'+ Cast(i.LocalCheckPoint_ID as Varchar) +'|', @p_LocalCheckPoint) > 0 )

and (@p_Transportador = '*'
        or CharIndex( '|'+ Cast(i.Transportador_ID as Varchar) +'|', @p_Transportador) > 0 )

and (@p_Marca = '*'
        or CharIndex( '|'+ Cast(iv.Marca_ID as Varchar) +'|', @p_Marca) > 0 )

and (@p_Modelo = '*'
        or CharIndex( '|'+ Cast(iv.Modelo_ID as Varchar) +'|', @p_Modelo) > 0 )

and (@p_Area = '*'
        or CharIndex( '|'+ Cast(ia.AvArea_ID as Varchar) +'|', @p_Area) > 0 )

and (@p_Condicao = '*'
        or CharIndex( '|'+ Cast(ia.AvCondicao_ID as Varchar) +'|', @p_Condicao) > 0 )

and (@p_Dano = '*'
        or CharIndex( '|'+ Cast(ia.AvDano_ID as Varchar) +'|', @p_Dano) > 0 )

and (@p_Gravidade = '*'
        or CharIndex( '|'+ Cast(ia.AvGravidade_ID as Varchar) +'|', @p_Gravidade) > 0 )

and (@p_Quadrante = '*'
        or CharIndex( '|'+ Cast(ia.AvQuadrante_ID as Varchar) +'|', @p_Quadrante) > 0 )

and (@p_Severidade = '*'
        or CharIndex( '|'+ Cast(ia.AvSeveridade_ID as Varchar) +'|', @p_Severidade) > 0 )
        
and (@p_TipoDefeito = '*'
        or CharIndex( '|'+ Cast(ia.FabricaTransporte as Varchar) +'|', @p_TipoDefeito) > 0 )
        
and (@p_DanoOrigem = '*'
        or CharIndex( '|'+ Cast(ia.DanoOrigem as Varchar) +'|', @p_DanoOrigem) > 0 )

and (@p_TransportadorTipo = '*'
        or CharIndex( '|'+ Cast(t.Tipo as Varchar) +'|', @p_TransportadorTipo) > 0 )

and (@p_FrotaViagem is null
        or fv.Nome like '%' + @p_FrotaViagem + '%')

and (@p_Navio is null
        or n.Nome like '%' + @p_Navio + '%')

and (@p_Lote is null
        or l.Lote  like '%' + @p_Lote + '%')

and ((@p_DataInicio = '0001-01-01' and @p_DataFinal = '0001-01-01') 
        or i.Data between @p_DataInicio and @p_DataFinal)



Select 1 as ID, 'TodosVeiculos' as Tipo, count(distinct VIN) Total 
From @IDs

Union

Select 2 ID, 'VeiculosComAvarias' as Tipo, count(distinct iv.InspVeiculo_ID) Total from inspVeiculo iv
Inner Join @IDs tmp on iv.InspVeiculo_ID = tmp.InspVeiculo_ID
Inner Join InspAvaria ia on iv.InspVeiculo_ID = ia.InspVeiculo_ID

Union

Select 3 as ID, 'VeiculosSemAvaria' as Tipo, count(distinct iv.InspVeiculo_ID) Total from inspVeiculo iv
Inner Join @IDs tmp on iv.InspVeiculo_ID = tmp.InspVeiculo_ID
Where Not Exists (select 1 from inspAvaria ia where ia.InspVeiculo_ID = iv.InspVeiculo_ID)

Union 

Select 4 as ID, 'QuantidadeAvarias' as Tipo, count(inspAvaria_id) Total from InspAvaria ia
Inner Join @IDs tmp on ia.InspVeiculo_ID = tmp.InspVeiculo_ID


Union 

Select 5 as ID, 'QuantidadeAvariasTransporte' as Tipo, count(inspAvaria_id) Total from InspAvaria ia
Inner Join @IDs tmp on ia.InspVeiculo_ID = tmp.InspVeiculo_ID
Where ia.FabricaTransporte = 'T'


Union

Select 6 as ID, 'QuantidadeAvariasFabrica' as Tipo, count(inspAvaria_id) Total from InspAvaria ia
Inner Join @IDs tmp on ia.InspVeiculo_ID = tmp.InspVeiculo_ID
Where ia.FabricaTransporte = 'F'


/*
USE VDT2
Declare @p_Cliente_ID             Int,
        @p_Chassi                 varchar(100),                                             
        @p_LocalInspecao          varchar(100),                                             
        @p_LocalCheckPoint        varchar(100),
        @p_Transportador          varchar(100),
        @p_Lote                   Varchar(50),                                             
        @p_Marca                  varchar(100),                                             
        @p_Modelo                 varchar(100),                                             
        @p_Area                   varchar(100),                                             
        @p_Condicao               varchar(100),                                             
        @p_Dano                   varchar(100),                                             
        @p_Quadrante              varchar(100),                                             
        @p_Gravidade              varchar(100),                                             
        @p_Severidade             varchar(100),                                             
        @p_TipoDefeito            varchar(100),   --Transporte/Fábrica/Todos                  
        @p_DanoOrigem             varchar(100),   -- Sim/Não/Todos                            
        @p_TransportadorTipo      varchar(100),   -- Marítimo/Terrestre/Todos                 
        @p_FrotaViagem            varchar(100),                                                                                    
        @p_Navio                  varchar(100),                                             
        @p_DataInicio             Date,                                                     
        @p_DataFinal              Date                                                      
                                                                                            
set      @p_Cliente_ID             = 1
set      @p_Chassi                 = null
set      @p_LocalInspecao          = '*'
set      @p_LocalCheckPoint        = '*'
set      @p_Transportador          = '*'
set      @p_Lote                   = null
set      @p_Marca                  = '*'
set      @p_Modelo                 = '*'
set      @p_Area                   = '*'
set      @p_Condicao               = '*'
set      @p_Dano                   = '*'
set      @p_Quadrante              = '*'
set      @p_Gravidade              = '*'
set      @p_Severidade             = '*'
set      @p_TipoDefeito            = '*'  --|T|F|
set      @p_DanoOrigem             = '*'  --|0|1|
set      @p_TransportadorTipo      = '*'  --|T|M|
set      @p_FrotaViagem            = null
set      @p_Navio                  = null
set      @p_DataInicio             = '2017-04-27'
set      @p_DataFinal              = '2017-04-27'


exec InspAvaria_Summary
    @p_Cliente_ID         ,
    @p_Chassi             ,
    @p_LocalInspecao      ,
    @p_LocalCheckPoint    ,   
    @p_Transportador      ,
    @p_Lote               ,
    @p_Marca              ,  
    @p_Modelo             ,  
    @p_Area               ,  
    @p_Condicao           ,  
    @p_Dano               ,  
    @p_Quadrante          ,  
    @p_Gravidade          ,  
    @p_Severidade         ,  
    @p_TipoDefeito        ,  
    @p_DanoOrigem         ,  
    @p_TransportadorTipo  ,
    @p_FrotaViagem        , 
    @p_Navio              , 
    @p_DataInicio         , 
    @p_DataFinal         
    
*/
GO
/****** Object:  StoredProcedure [dbo].[InspAvaria_Upd]    Script Date: 05/12/2017 15:58:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Procedure [dbo].[InspAvaria_Upd]
-------------------------------------------------------------------------------------------------------
-- Modifica os dados de um registro de avaria de um veículo
-- 30/03 - Adicionando o parametro @p_CustoReparo
-- 26/04 - Adicionando os parâmetros: @p_HorasReparo, @p_SubstituicaoPeca, @p_ValorPeca, @p_CustoTotal
-------------------------------------------------------------------------------------------------------
(                                                  
@p_InspAvaria_ID      Int,                         
@p_AvArea_ID          Int,                         
@p_AvDano_ID          Int,                         
@p_AvSeveridade_ID    Int,
@p_AvQuadrante_ID     Int,
@p_AvGravidade_ID     Int,
@p_AvCondicao_ID      Int,
@p_FabricaTransporte  Char(1), -- F:Defeito de Fábrica  T:Avaria de Transporte
@p_DanoOrigem         Bit, -- 1: Sim
@p_HorasReparo        int,
@p_CustoReparo        Decimal (7,2),
@p_SubstituicaoPeca   Bit,
@p_ValorPeca          Decimal(7,2),
@p_CustoTotal         Decimal(7,2)
)

AS

SET NOCOUNT ON

Declare @InspVeiculo_ID Int
Select  @InspVeiculo_ID = InspVeiculo_ID From InspAvaria Where InspAvaria_ID = @p_InspAvaria_ID

Declare @Inspecao_ID Int
Select  @Inspecao_ID = Inspecao_ID From InspVeiculo Where InspVeiculo_ID = @InspVeiculo_ID

Declare @Cliente_ID Int
Select  @Cliente_ID = Cliente_ID From Inspecao Where Inspecao_ID = @Inspecao_ID

Declare @CustoTemp decimal(7,2),
        @HorasReparo int,
        @CustoTotal decimal(7,2)

If @p_CustoReparo IS NULL AND @p_SubstituicaoPeca = 0 AND @p_ValorPeca = 0
BEGIN
  Select @p_CustoReparo = Custo, @p_HorasReparo = HorasReparo from CustoReparo cr where cr.AvArea_ID = @p_AvArea_ID and cr.AvGravidade_ID = @p_AvGravidade_ID
  Set    @p_CustoTotal  = @p_CustoReparo
END

-- Verifica se a 'área' corresponde ao 'cliente'
If Not Exists ( Select 1
                From  AvArea
                Where AvArea_ID   = @p_AvArea_ID
                 and  Cliente_ID  = @Cliente_ID ) Begin

  THROW 50000, 'Área incompatível com Cliente',1
End

-- Verifica se o 'dano' corresponde ao 'cliente'
If Not Exists ( Select 1
                From  AvDano
                Where AvDano_ID   = @p_AvDano_ID
                 and  Cliente_ID  = @Cliente_ID ) Begin

  THROW 50000, 'Dano incompatível com Cliente',1
End

-- Verifica se a 'severidade' corresponde ao 'cliente'
If Not Exists ( Select 1
                From  AvSeveridade
                Where AvSeveridade_ID = @p_AvSeveridade_ID
                 and  Cliente_ID      = @Cliente_ID ) Begin

  THROW 50000, 'Severidade incompatível com Cliente',1
End

-- Verifica se o 'quadrante' corresponde ao 'cliente'
If Not Exists ( Select 1
                From  AvQuadrante
                Where AvQuadrante_ID = @p_AvQuadrante_ID
                 and  Cliente_ID     = @Cliente_ID ) Begin

  THROW 50000, 'Quadrante incompatível com Cliente',1
End

-- Verifica se a 'gravidade' corresponde ao 'cliente'
If Not Exists ( Select 1
                From  AvGravidade
                Where AvGravidade_ID = @p_AvGravidade_ID
                 and  Cliente_ID     = @Cliente_ID ) Begin

  THROW 50000, 'Gravidade incompatível com Cliente',1
End

-- Modifica os dados da avaria de um veículo
Update InspAvaria
   Set AvArea_ID         = @p_AvArea_ID
     , AvDano_ID         = @p_AvDano_ID
     , AvSeveridade_ID   = @p_AvSeveridade_ID
     , AvQuadrante_ID    = @p_AvQuadrante_ID
     , AvGravidade_ID    = @p_AvGravidade_ID
     , AvCondicao_ID     = @p_AvCondicao_ID
     , FabricaTransporte = @p_FabricaTransporte
     , DanoOrigem        = @p_DanoOrigem
     , HorasReparo       = @p_HorasReparo
     , CustoReparo       = @p_CustoReparo
     , SubstituicaoPeca  = @p_SubstituicaoPeca
     , ValorPeca         = @p_ValorPeca
     , CustoTotal        = @p_CustoTotal

Where InspAvaria_ID = @p_InspAvaria_ID


GO
/****** Object:  StoredProcedure [dbo].[Inspecao_Ins]    Script Date: 05/12/2017 15:58:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Procedure [dbo].[Inspecao_Ins]


----------------------------------------------------------------------------------------------------
-- Insere um novo registro de inspeção (não é uma nova inspeção)
-- Uma ou mais linhas compõem uma inspeção pois:
-- a) Vários inspetores podem registrar dados ao mesmo tempo durante a mesma operação de inspeção)
-- b) Uma inspeção pode envolver vários transportadores
-- 12/06 - Inspeção - verifica se já existe uma inspeção com aquela data, local e checkpoint informados
-- 13/06 - Adicionar também Navio/Transportador/FrotaViagem
----------------------------------------------------------------------------------------------------
(
@p_Cliente_ID         Int,
@p_LocalInspecao_ID   Int,
@p_LocalCheckPoint_ID Int,
@p_Transportador_ID   Int,
@p_FrotaViagem_ID     Int,
@p_Navio_ID           Int,
@p_Usuario_ID         Int,  -- Identificação do inspetor
@p_Data               Date, -- Data da inspeção
@p_Inspecao_ID        Int OUTPUT
)
AS

SET NOCOUNT ON

-- Verifica se o 'check-point' corresponde ao 'local'
If Not Exists ( Select 1
                From  LocalCheckPoint
                Where LocalCheckPoint_ID = @p_LocalCheckPoint_ID
                 and  LocalInspecao_ID   = @p_LocalInspecao_ID ) Begin

  THROW 50000, 'LocalCheckPoint incompatível com LocalInspecao',1
End

-- Verifica se 'frota/viagem' corresponde ao 'transportador'
If Not Exists ( Select 1
                From  FrotaViagem
                Where FrotaViagem_ID   = @p_FrotaViagem_ID
                 and  Transportador_ID = @p_Transportador_ID ) Begin

  THROW 50000, 'FrotaViagem incompatível com Transportador',1
End

--Verifica se já existe inspeção nesta data com localinspecao e localcheckpoint informados
Select @p_Inspecao_ID = Inspecao_ID From Inspecao 
            Where 
                LocalInspecao_ID   =  @p_LocalInspecao_ID
            And LocalCheckPoint_ID =  @p_LocalCheckPoint_ID
            And Cliente_ID         =  @p_Cliente_ID
            And Transportador_ID   =  @p_Transportador_ID
            And FrotaViagem_ID     =  @p_FrotaViagem_ID
            And (Navio_ID          =  @p_Navio_ID or @p_Navio_ID is null)
            And Data               =  @p_Data
            

if @p_Inspecao_ID IS NULL
    begin
        -- Insere a nova linha
        Insert Into Inspecao ( Cliente_ID,
                               LocalInspecao_ID,
                               LocalCheckPoint_ID,
                               Transportador_ID,
                               FrotaViagem_ID,
                               Navio_ID,
                               Usuario_ID,
                               Data )
        Values ( @p_Cliente_ID,
                 @p_LocalInspecao_ID,
                 @p_LocalCheckPoint_ID,
                 @p_Transportador_ID,
                 @p_FrotaViagem_ID,
                 @p_Navio_ID,
                 @p_Usuario_ID,
                 @p_Data )

        Set @p_Inspecao_ID = SCOPE_IDENTITY()
    end
GO
/****** Object:  StoredProcedure [dbo].[Inspecao_Lst]    Script Date: 05/12/2017 15:58:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Procedure [dbo].[Inspecao_Lst]
----------------------------------------------------------------------------------------------------
-- Lista as inspeções
----------------------------------------------------------------------------------------------------
(
@p_Cliente_ID         Int,
@p_LocalInspecao_ID   Int,
@p_LocalCheckPoint_ID Int,
@p_Data               Date -- Data da inspeção
)
AS

SET NOCOUNT ON

Select i.Inspecao_ID,
       i.Cliente_ID,
       i.LocalInspecao_ID,
       i.LocalCheckPoint_ID,
       i.Transportador_ID,
       i.FrotaViagem_ID,
       i.Navio_ID,
       i.Usuario_ID,           -- Identificação do inspetor
       i.Data,                 -- Data da inspeção

       c.Nome            as ClienteNome,
       l.Nome            as LocalInspecaoNome,

       p.Codigo          as LocalCheckPointCodigo,
       p.Nome_Pt         as LocalCheckPointNome_Pt,
       p.Nome_En         as LocalCheckPointNome_En,
       p.Nome_Es         as LocalCheckPointNome_Es,
       p.Operacao        as LocalCheckPointOperacao,

       t.Nome            as TransportadorNome,
       t.Tipo            as TransportadorTipo,

       f.Nome            as FrotaViagemNome,

       n.Nome            as NavioNome,

       u.Login           as UsuarioLogin,
       u.Nome            as UsuarioNome

From       Inspecao        i
Inner Join Cliente         c on i.Cliente_ID         = c.Cliente_ID
Inner Join LocalInspecao   l on i.LocalInspecao_ID   = l.LocalInspecao_ID
Inner Join LocalCheckPoint p on i.LocalCheckPoint_ID = p.LocalCheckPoint_ID
Inner Join Transportador   t on i.Transportador_ID   = t.Transportador_ID
Inner Join FrotaViagem     f on i.FrotaViagem_ID     = f.FrotaViagem_ID
Inner Join Navio           n on i.Navio_ID           = n.Navio_ID
Inner Join Usuario         u on i.Usuario_ID         = u.Usuario_ID

Where i.Cliente_ID         = @p_Cliente_ID
 and  i.LocalInspecao_ID   = @p_LocalInspecao_ID
 and  i.LocalCheckPoint_ID = @p_LocalCheckPoint_ID
 and  i.Data               = @p_Data

Order by i.Data, l.Nome, i.LocalInspecao_ID

GO
/****** Object:  StoredProcedure [dbo].[Inspecao_Sel]    Script Date: 05/12/2017 15:58:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Procedure [dbo].[Inspecao_Sel]
----------------------------------------------------------------------------------------------------
-- Consulta os dados gerais de uma inspeção
-- Atualização Yuri - 05/03/2017 -  Adicionar o campo Cliente_ID
-- Atualização Yuri - 07/03/2017 -  Adicionar Left Join no Navio
----------------------------------------------------------------------------------------------------
(
@p_Inspecao_ID Int
)
AS
SET NOCOUNT ON

Select i.Inspecao_ID,
	   i.Cliente_ID,
       i.LocalInspecao_ID,
       i.LocalCheckPoint_ID,
       i.Transportador_ID,
       i.FrotaViagem_ID,
       i.Navio_ID,
       i.Usuario_ID,           -- Identificação do inspetor
       i.Data,                 -- Data da inspeção

       c.Nome            as ClienteNome,
       l.Nome            as LocalInspecaoNome,

       p.Codigo          as LocalCheckPointCodigo,
       p.Nome_Pt         as LocalCheckPointNome_Pt,
       p.Nome_En         as LocalCheckPointNome_En,
       p.Nome_Es         as LocalCheckPointNome_Es,
       p.Operacao        as LocalCheckPointOperacao,

       t.Nome            as TransportadorNome,
       t.Tipo            as TransportadorTipo,

       f.Nome            as FrotaViagemNome,

       n.Nome            as NavioNome,

       u.Login           as UsuarioLogin,
       u.Nome            as UsuarioNome

From       Inspecao        i
Inner Join Cliente         c on i.Cliente_ID         = c.Cliente_ID
Inner Join LocalInspecao   l on i.LocalInspecao_ID   = l.LocalInspecao_ID
Inner Join LocalCheckPoint p on i.LocalCheckPoint_ID = p.LocalCheckPoint_ID
Inner Join Transportador   t on i.Transportador_ID   = t.Transportador_ID
Inner Join FrotaViagem     f on i.FrotaViagem_ID     = f.FrotaViagem_ID
Left Join  Navio           n on i.Navio_ID           = n.Navio_ID
Inner Join Usuario         u on i.Usuario_ID         = u.Usuario_ID

Where i.Inspecao_ID = @p_Inspecao_ID


GO
/****** Object:  StoredProcedure [dbo].[Inspecao_Upd]    Script Date: 05/12/2017 15:58:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Procedure [dbo].[Inspecao_Upd]
----------------------------------------------------------------------------------------------------
-- Modifica os dados de um registro de inspeção
-- 09/03/2017 Atualização: adição do Cliente_ID 
-- 17/05/2017 - Alteração na data Versão 1.0.3
----------------------------------------------------------------------------------------------------
(
@p_Inspecao_ID        Int,
@p_Cliente_ID         Int,
@p_Data               DateTime,
@p_LocalInspecao_ID   Int,
@p_LocalCheckPoint_ID Int,
@p_Transportador_ID   Int,
@p_FrotaViagem_ID     Int,
@p_Navio_ID           Int
)
AS

SET NOCOUNT ON

-- Verifica se o 'check-point' corresponde ao 'local'
If Not Exists ( Select 1
                From  LocalCheckPoint
                Where LocalCheckPoint_ID = @p_LocalCheckPoint_ID
                 and  LocalInspecao_ID   = @p_LocalInspecao_ID ) Begin

  THROW 50000, 'LocalCheckPoint incompatível com LocalInspecao',1
End

-- Verifica se 'trota/viagem' corresponde ao 'transportador'
If Not Exists ( Select 1
                From  FrotaViagem
                Where FrotaViagem_ID   = @p_FrotaViagem_ID
                 and  Transportador_ID = @p_Transportador_ID ) Begin

  THROW 50000, 'FrotaViagem incompatível com Transportador',1
End

-- Modifica os dados da inspeção
Update Inspecao
   Set LocalInspecao_ID   = @p_LocalInspecao_ID
     , Cliente_ID		  = @p_Cliente_ID
     , Data               = @p_Data
     , LocalCheckPoint_ID = @p_LocalCheckPoint_ID
     , Transportador_ID   = @p_Transportador_ID
     , FrotaViagem_ID     = @p_FrotaViagem_ID
     , Navio_ID           = @p_Navio_ID

Where  Inspecao_ID = @p_Inspecao_ID


GO
/****** Object:  StoredProcedure [dbo].[InspVeiculo_Del]    Script Date: 05/12/2017 15:58:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


Create Procedure [dbo].[InspVeiculo_Del]
----------------------------------------------------------------------------------------------------
-- Remove um veículo do banco de dados
----------------------------------------------------------------------------------------------------
(
@p_InspVeiculo_ID Int
)
AS

SET NOCOUNT ON

if exists(select 1 from InspAvaria where InspVeiculo_ID = @p_InspVeiculo_ID)
THROW 50000, 'Não é possivel deletar Veículo com Avaria',1

Delete From InspVeiculo Where InspVeiculo_ID = @p_InspVeiculo_ID





GO
/****** Object:  StoredProcedure [dbo].[InspVeiculo_Existe]    Script Date: 05/12/2017 15:58:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Procedure [dbo].[InspVeiculo_Existe]
----------------------------------------------------------------------------------------------------
-- Verifica se o veículo existe na inspeção
----------------------------------------------------------------------------------------------------
(
@p_Inspecao_ID     Int,
@p_VIN_6           Varchar(6),    -- Últimos seis caracteres do chassi
@p_VIN             Char(17),      -- Chassi completo
@p_InspVeiculo_ID  Int OUTPUT
)
AS

SET NOCOUNT ON

Set @p_InspVeiculo_ID = NULL

If @p_VIN Is Not Null Begin
   Select @p_InspVeiculo_ID = InspVeiculo_ID
   From   InspVeiculo
   Where  Inspecao_ID = @p_Inspecao_ID
    and   VIN         = @p_VIN
End
Else Begin
   Select @p_InspVeiculo_ID = InspVeiculo_ID
   From   InspVeiculo
   Where  Inspecao_ID = @p_Inspecao_ID
    and   VIN_6       = @p_VIN_6
End


GO
/****** Object:  StoredProcedure [dbo].[InspVeiculo_Ins]    Script Date: 05/12/2017 15:58:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Procedure [dbo].[InspVeiculo_Ins]
----------------------------------------------------------------------------------------------------
-- Insere um novo veículo
----------------------------------------------------------------------------------------------------
(
@p_Inspecao_ID     Int,
@p_Marca_ID        Int,
@p_Modelo_ID       Int,
@p_VIN_6           Varchar(6),    -- Últimos seis caracteres do chassi
@p_VIN             Char(17),      -- Chassi completo
@p_Observacoes     Varchar(1000), -- Observações gerais sobre o veículo
@p_InspVeiculo_ID  Int OUTPUT
)
AS

SET NOCOUNT ON

Declare @Cliente_ID Int
Select  @Cliente_ID = Cliente_ID From Inspecao Where Inspecao_ID = @p_Inspecao_ID

-- Verifica se a 'marca' corresponde ao 'cliente'
If Not Exists ( Select 1
                From  Marca
                Where Marca_ID   = @p_Marca_ID
                 and  Cliente_ID = @Cliente_ID ) Begin

  THROW 50000, 'Marca incompatível com Cliente',1
End

-- Verifica se o 'modelo' corresponde ao 'cliente'
If Not Exists ( Select 1
                From  Modelo
                Where Modelo_ID  = @p_Modelo_ID
                 and  Cliente_ID = @Cliente_ID ) Begin

  THROW 50000, 'Modelo incompatível com Cliente',1
End

Insert Into InspVeiculo ( Inspecao_ID,
                          Marca_ID,
                          Modelo_ID,
                          VIN_6,
                          VIN,
                          Observacoes )

Values ( @p_Inspecao_ID,
         @p_Marca_ID,
         @p_Modelo_ID,
         @p_VIN_6,
         @p_VIN,
         @p_Observacoes )

Set @p_InspVeiculo_ID = SCOPE_IDENTITY()


GO
/****** Object:  StoredProcedure [dbo].[InspVeiculo_Lst]    Script Date: 05/12/2017 15:58:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Procedure [dbo].[InspVeiculo_Lst]
----------------------------------------------------------------------------------------------------
-- Lista os veículos relacionados a um registro de inspeção (Inspecao_ID)
----------------------------------------------------------------------------------------------------
(
@p_Inspecao_ID Int
)
AS

SET NOCOUNT ON

Select v.InspVeiculo_ID,
       v.Inspecao_ID,
       v.Marca_ID,
       v.Modelo_ID,

       v.VIN_6,        -- Últimos seis caracteres do chassi
       v.VIN,          -- Chassi completo

       v.Observacoes,  -- Observações gerais sobre o veículo

       a.Nome      as MarcaNome,
       o.Nome      as ModeloNome

From       InspVeiculo  v
Inner Join Marca        a on v.Marca_ID  = a.Marca_ID
Inner Join Modelo       o on v.Modelo_ID = o.Modelo_ID

Where Inspecao_ID = @p_Inspecao_ID


GO
/****** Object:  StoredProcedure [dbo].[InspVeiculo_Sel]    Script Date: 05/12/2017 15:58:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Procedure [dbo].[InspVeiculo_Sel]
----------------------------------------------------------------------------------------------------
-- Consulta os dados de um veículo inspecionado
----------------------------------------------------------------------------------------------------
(
@p_InspVeiculo_ID Int
)
AS

SET NOCOUNT ON

Select v.InspVeiculo_ID,
       v.Inspecao_ID,
       v.Marca_ID,
       v.Modelo_ID,

       v.VIN_6,        -- Últimos seis caracteres do chassi
       v.VIN,          -- Chassi completo

       v.Observacoes,  -- Observações gerais sobre o veículo

       a.Nome      as MarcaNome,
       o.Nome      as ModeloNome

From       InspVeiculo  v
Inner Join Marca        a on v.Marca_ID  = a.Marca_ID
Inner Join Modelo       o on v.Modelo_ID = o.Modelo_ID

Where InspVeiculo_ID = @p_InspVeiculo_ID


GO
/****** Object:  StoredProcedure [dbo].[InspVeiculo_Upd]    Script Date: 05/12/2017 15:58:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Procedure [dbo].[InspVeiculo_Upd]
----------------------------------------------------------------------------------------------------
-- Modifica os dados de um veículo
----------------------------------------------------------------------------------------------------
(
@p_InspVeiculo_ID  Int,
@p_Marca_ID        Int,
@p_Modelo_ID       Int,
@p_VIN_6           Varchar(6),    -- Últimos seis caracteres do chassi
@p_VIN             Char(17),      -- Chassi completo
@p_Observacoes     Varchar(1000)  -- Observações gerais sobre o veículo
)
AS

SET NOCOUNT ON

Declare @Inspecao_ID Int
Select  @Inspecao_ID = Inspecao_ID From InspVeiculo Where InspVeiculo_ID = @p_InspVeiculo_ID

Declare @Cliente_ID Int
Select  @Cliente_ID = Cliente_ID From Inspecao Where Inspecao_ID = @Inspecao_ID

-- Verifica se a 'marca' corresponde ao 'cliente'
If Not Exists ( Select 1
                From  Marca
                Where Marca_ID   = @p_Marca_ID
                 and  Cliente_ID = @Cliente_ID ) Begin

  THROW 50000, 'Marca incompatível com Cliente',1
End

-- Verifica se o 'modelo' corresponde ao 'cliente'
If Not Exists ( Select 1
                From  Modelo
                Where Modelo_ID  = @p_Modelo_ID
                 and  Cliente_ID = @Cliente_ID ) Begin

  THROW 50000, 'Modelo incompatível com Cliente',1
End

Update InspVeiculo

   Set Marca_ID    = @p_Marca_ID
     , Modelo_ID   = @p_Modelo_ID
     , VIN_6       = @p_VIN_6
     , VIN         = @p_VIN
     , Observacoes = @p_Observacoes

Where InspVeiculo_ID = @p_InspVeiculo_ID


GO
/****** Object:  StoredProcedure [dbo].[IntegraVinVeiculos]    Script Date: 05/12/2017 15:58:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Procedure [dbo].[IntegraVinVeiculos]
----------------------------------------------------------------------------------------------------
-- Realiza update do VIN na tabela InspVeiculo recebendo os dados da Tabela ListaVeiculos 
-- 17/04/17 Alterações para mostrar pendências após update
-- 19/04/17 Alterações para registrar o lote
-- 19/07/17 Alterações para update considerar também o LocalCheckPoint
-- 19/07/17 Alterações para pegar o mais recente.
-- 24/10/17 Alterações para incluir filtros no updade: LocalCheckpoint e Data
-- 08/11/17 Alterações para substituir os filtros de Data para DataLista.
----------------------------------------------------------------------------------------------------
(
@p_Cliente_ID  Int,
@p_LocalInspecao_ID Int,
@p_LocalCheckPoint_ID Int,
@p_DataInspecao DateTime
)
AS

SET NOCOUNT ON

Update InspVeiculo  
 Set   VIN     = lvv.VIN, 
       Lote_ID =  lv.Lote_ID


   
From InspVeiculo v

Inner Join Inspecao            i     on     i.Inspecao_ID       =     v.Inspecao_ID
Inner Join ListaVeiculos      lv     on     i.Cliente_ID        =    lv.Cliente_ID 
                                    and    lv.LocalInspecao_ID  =     i.LocalInspecao_ID
Inner Join ListaVeiculosVin  lvv     on    lv.ListaVeiculos_ID  =   lvv.ListaVeiculos_ID

Where  i.Cliente_ID                                   = @p_Cliente_ID
 And   i.LocalInspecao_ID                             = @p_LocalInspecao_ID
 And   i.LocalCheckPoint_ID                           = @p_LocalCheckPoint_ID
 And   cast(lv.DataLista as date)                     = cast(@p_DataInspecao as date)
 And   v.VIN_6                                        = lvv.VIN_6
 And   (v.VIN IS NULL or v.Lote_ID IS NULL)
 And   lvv.Ativo = 1

 
--Recebe a lista de Veículos encontrados na tabela ListaVeículosVin, porém sem registros de Inspeção
Select 'L' as Tipo, lvv.VIN_6
From ListaVeiculosVin lvv
Inner Join ListaVeiculos lv on lv.ListaVeiculos_ID = lvv.ListaVeiculos_ID
Left  Join ( Select iv.InspVeiculo_ID, iv.vin_6 from InspVeiculo iv 
                   inner join Inspecao i        on iv.Inspecao_ID = i.Inspecao_ID 
                   Where i.LocalInspecao_ID   = @p_LocalInspecao_ID
                    and  i.LocalCheckPoint_ID = @p_LocalCheckPoint_ID) as Veiculos
  on lvv.VIN_6 = Veiculos.VIN_6

  Where lv.LocalInspecao_ID       = @p_LocalInspecao_ID
   And  lv.LocalCheckPoint_ID     = @p_LocalCheckPoint_ID
   And  Veiculos.InspVeiculo_ID   is null

Union 

--Recebe a lista de veículos encontrados que não estão em nenhuma lista, ou seja, não tem VIN;
Select 'V' as Tipo, iv.VIN_6 from InspVeiculo iv
Inner Join Inspecao i on i.Inspecao_ID = iv.Inspecao_ID
    Where iv.VIN is null
		  And i.LocalInspecao_ID    = @p_LocalInspecao_ID
		  And i.LocalCheckPoint_ID  = @p_LocalCheckPoint_ID
	      And i.Data                = @p_DataInspecao

/*
exec IntegraVinVeiculos 1, 2,5, '2017-04-17'*/

GO
/****** Object:  StoredProcedure [dbo].[ListaVeiculos_Del]    Script Date: 05/12/2017 15:58:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Procedure [dbo].[ListaVeiculos_Del]
----------------------------------------------------------------------------------------------------
-- Remove uma lista de veículos (e todos os dados nas tabelas relacionadas)
----------------------------------------------------------------------------------------------------
(
@p_ListaVeiculos_ID Int
)
AS

SET NOCOUNT ON

Delete From ListaVeiculosVin Where ListaVeiculos_ID = @p_ListaVeiculos_ID

Delete From ListaVeiculos    Where ListaVeiculos_ID = @p_ListaVeiculos_ID


GO
/****** Object:  StoredProcedure [dbo].[ListaVeiculos_Ins]    Script Date: 05/12/2017 15:58:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Procedure [dbo].[ListaVeiculos_Ins]
----------------------------------------------------------------------------------------------------
-- Insere os dados gerais de uma lista de veículos
-- 22/03/17 - Inclusão dos campos LocalInspecao_ID e Tipo
-- 17/04/17 - Inclusão do campo LocalCheckPoint_ID
-- 18/04/17 - Inclusão do campo Lote e alterações
-- 08/11/17 - Alterações para substituir os filtros de Data para DataLista.
----------------------------------------------------------------------------------------------------
(
@p_Cliente_ID          Int,
@p_Usuario_ID          Int,          -- Identificação do usuário que está incluindoi os dados do arquivo na base de dados
@p_NomeArquivo         Varchar(50),  -- Nome do arquivo sem as pastas
@p_LocalInspecao_ID    Int,
@p_LocalCheckPoint_ID  Int,
@p_Tipo                Char(1),
@p_Lote                Varchar(50),
@p_DataLista           DateTime,
@p_ListaVeiculos_ID    Int OUTPUT,
@p_Lote_ID             Int OUTPUT
)
AS

SET NOCOUNT ON

--Verifica se existe um lote com o nome informado, caso não exista insere novo;
if @p_Lote is not null Begin

Select @p_Lote_ID = Lote_ID from Lote where Lote = @p_Lote

    if @p_Lote_ID is null Begin
        Insert into Lote (Lote) values (@p_Lote)
        Set @p_Lote_ID = SCOPE_IDENTITY()
    End

End

Insert Into ListaVeiculos ( Cliente_ID, Usuario_ID, NomeArquivo, LocalInspecao_ID, Tipo, Lote_ID, LocalCheckPoint_ID, DataLista)

Values ( @p_Cliente_ID,
         @p_Usuario_ID,
         @p_NomeArquivo,
		 @p_LocalInspecao_ID,
         @p_Tipo,
         @p_Lote_ID,
		 @p_LocalCheckPoint_ID,
         @p_DataLista )

Set @p_ListaVeiculos_ID = SCOPE_IDENTITY()


GO
/****** Object:  StoredProcedure [dbo].[ListaVeiculos_Lst]    Script Date: 05/12/2017 15:58:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Procedure [dbo].[ListaVeiculos_Lst]
----------------------------------------------------------------------------------------------------
-- Lista as 'lista de veículos' (packing list ou loading list)
----------------------------------------------------------------------------------------------------
(
@p_Cliente_ID           Int,   -- NULL: todos os clientes
@p_DataHoraInclusao_Ini Date,
@p_DataHoraInclusao_Fim Date
)
AS

SET NOCOUNT ON

Set @p_DataHoraInclusao_Fim = DateAdd(d, 1, @p_DataHoraInclusao_Fim)

Select l.ListaVeiculos_ID,
       l.Cliente_ID,
       l.Usuario_ID,
       l.NomeArquivo,
       l.DataHoraInclusao,

       c.Nome             as ClienteNome,
       u.Nome             as UsuarioNome

From       ListaVeiculos l
Inner Join Cliente       c on l.Cliente_ID = c.Cliente_ID
Inner Join Usuario       u on l.Usuario_ID = u.Usuario_ID

Where ( @p_Cliente_ID Is Null  or  l.Cliente_ID = @p_Cliente_ID )

 and  l.DataHoraInclusao  >=  @p_DataHoraInclusao_Ini
 and  l.DataHoraInclusao  <   @p_DataHoraInclusao_Fim


GO
/****** Object:  StoredProcedure [dbo].[ListaVeiculos_Sel]    Script Date: 05/12/2017 15:58:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Procedure [dbo].[ListaVeiculos_Sel]
----------------------------------------------------------------------------------------------------
-- Consulta os dados de uma lista de veículos (packing list ou loading list)
----------------------------------------------------------------------------------------------------
(
@p_ListaVeiculos_ID Int
)
AS

SET NOCOUNT ON

Select l.ListaVeiculos_ID,
       l.Cliente_ID,
       l.Usuario_ID,
       l.NomeArquivo,
       l.DataHoraInclusao,

       c.Nome             as ClienteNome,
       u.Nome             as UsuarioNome

From       ListaVeiculos l
Inner Join Cliente       c on l.Cliente_ID = c.Cliente_ID
Inner Join Usuario       u on l.Usuario_ID = u.Usuario_ID

Where l.ListaVeiculos_ID = @p_ListaVeiculos_ID


GO
/****** Object:  StoredProcedure [dbo].[ListaVeiculosVin_Ins]    Script Date: 05/12/2017 15:58:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Procedure [dbo].[ListaVeiculosVin_Ins]
----------------------------------------------------------------------------------------------------
-- Procedure ListaVeiculosVin_Ins
-- Insere um veículo em uma 'lista de veículos'
-- Alteração: 19-07-2017 (Verificação se veículo já existe)
----------------------------------------------------------------------------------------------------
(
@p_ListaVeiculos_ID    Int,
@p_VIN                 Char(17),
@p_ListaVeiculosVin_ID Int OUTPUT
)
AS

SET NOCOUNT ON

If Exists (Select 1 From ListaVeiculosVin Where VIN = @p_VIN)

Begin
    Update ListaVeiculosVin set Ativo = 0 where VIN = @p_VIN
End


Insert Into ListaVeiculosVin( ListaVeiculos_ID, VIN)

Values ( @p_ListaVeiculos_ID,
         @p_VIN )

Set @p_ListaVeiculosVin_ID = SCOPE_IDENTITY()


GO
/****** Object:  StoredProcedure [dbo].[ListaVeiculosVin_Lst]    Script Date: 05/12/2017 15:58:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Procedure [dbo].[ListaVeiculosVin_Lst]
----------------------------------------------------------------------------------------------------
-- Lista os veículos de uma 'lista de veículos' (packing list ou loading list)
----------------------------------------------------------------------------------------------------
(
@p_ListaVeiculos_ID Int
)
AS

SET NOCOUNT ON

Select ListaVeiculosVin_ID,
       ListaVeiculos_ID,
       VIN,                 -- Chassi completo
       VIN_6                -- Últimos seis caracteres do chassi

From       ListaVeiculosVin

Where ListaVeiculos_ID = @p_ListaVeiculos_ID


GO
/****** Object:  StoredProcedure [dbo].[LocalCheckPoint_Lst]    Script Date: 05/12/2017 15:58:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Procedure [dbo].[LocalCheckPoint_Lst]
----------------------------------------------------------------------------------------------------
-- Lista os check-points dos locais que o usuário tem permissão de acesso
----------------------------------------------------------------------------------------------------
(
@p_Usuario_ID  Int, -- Identificação do usuário
@p_Ativos      Bit  -- 1:Apenas os ativos 0:Todos
)
AS

SET NOCOUNT ON

-- Monta a lista de locais que o usuário tem acesso
Declare @Locais Varchar(1000) -- '*' ou lista dos locais que o usuário tem acesso, separados por pipe (|)

Select  @Locais = Locais
From       Usuario       u
Inner Join UsuarioPerfil p on u.UsuarioPerfil_ID = p.UsuarioPerfil_ID

Where u.Usuario_ID = @p_Usuario_ID

-- Lista os check-points
Select   c.LocalCheckPoint_ID,
         c.LocalInspecao_ID,

         c.Codigo,

         c.Nome_Pt,
         c.Nome_En,
         c.Nome_Es,
         c.Tipo,

         l.Nome      as LocalInspecaoNome,

         c.Operacao,            -- E:Exportação I:Importacao

         c.Ativo

From       LocalCheckPoint c
Inner Join LocalInspecao   l on c.LocalInspecao_ID = l.LocalInspecao_ID

Where ( @Locais = '*'
        or  CharIndex( '|'+LTrim(RTrim(l.LocalInspecao_ID))+'|' , @Locais ) <> 0 )

 and  (    c.Ativo = 1
        or @p_Ativos = 0 )

 and  (    l.Ativo = 1
        or @p_Ativos = 0 )

Order by c.LocalInspecao_ID, c.LocalCheckPoint_ID


GO
/****** Object:  StoredProcedure [dbo].[LocalInspecao_Lst]    Script Date: 05/12/2017 15:58:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Procedure [dbo].[LocalInspecao_Lst]
----------------------------------------------------------------------------------------------------
-- Lista os locais que o usuário tem permissão de acesso
----------------------------------------------------------------------------------------------------
(
@p_Usuario_ID  Int, -- Identificação do usuário
@p_Ativos      Bit  -- 1:Apenas os ativos 0:Todos
)
AS

SET NOCOUNT ON

-- Monta a lista de locais que o usuário tem acesso
Declare @Locais Varchar(1000) -- '*' ou lista dos locais que o usuário tem acesso, separados por pipe (|)

Select  @Locais = Locais
From       Usuario       u
Inner Join UsuarioPerfil p on u.UsuarioPerfil_ID = p.UsuarioPerfil_ID

Where u.Usuario_ID = @p_Usuario_ID

-- Lista os locais
Select LocalInspecao_ID,
       Nome,
       Ativo

From   LocalInspecao

Where ( @Locais = '*'
        or  CharIndex( '|'+LTrim(RTrim(LocalInspecao_ID))+'|' , @Locais ) <> 0 )

 and  (    Ativo = 1
        or @p_Ativos = 0 )

Order by Nome


GO
/****** Object:  StoredProcedure [dbo].[Marca_Ins]    Script Date: 05/12/2017 15:58:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Procedure [dbo].[Marca_Ins]
----------------------------------------------------------------------------------------------------
-- Insere uma nova Marca
----------------------------------------------------------------------------------------------------
(
@p_Cliente_ID  Int,
@p_Nome        Varchar(100),
@p_Ativo       Int,
@p_Marca_ID    Int OUTPUT
)
AS

SET NOCOUNT ON

Insert Into Marca ( Cliente_ID, Nome, Ativo )
Values ( @p_Cliente_ID,
         @p_Nome,
         @p_Ativo)

Set @p_Marca_ID = SCOPE_IDENTITY()


GO
/****** Object:  StoredProcedure [dbo].[Marca_Lst]    Script Date: 05/12/2017 15:58:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Procedure [dbo].[Marca_Lst]
----------------------------------------------------------------------------------------------------
-- Lista as marcas de um cliente
----------------------------------------------------------------------------------------------------
(
@p_Cliente_ID  Int, -- Identificação do cliente
@p_Ativos      Bit  -- 1:Apenas as marcas ativas 0:Todos
)
AS

SET NOCOUNT ON

Select Marca_ID,
       Nome,
       Ativo

From   Marca
Where  Cliente_ID = @p_Cliente_ID

 and  (    Ativo = 1
        or @p_Ativos = 0 )

Order by Nome


GO
/****** Object:  StoredProcedure [dbo].[Modelo_Ins]    Script Date: 05/12/2017 15:58:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Procedure [dbo].[Modelo_Ins]
----------------------------------------------------------------------------------------------------
-- Insere um novo Modelo
----------------------------------------------------------------------------------------------------
(
@p_Cliente_ID  Int,
@p_Nome        Varchar(100),
@p_Ativo       Int,
@p_Modelo_ID   Int OUTPUT
)
AS

SET NOCOUNT ON

Insert Into Modelo ( Cliente_ID, Nome, Ativo )
Values ( @p_Cliente_ID,
         @p_Nome,
         @p_Ativo)

Set @p_Modelo_ID = SCOPE_IDENTITY()


GO
/****** Object:  StoredProcedure [dbo].[Modelo_Lst]    Script Date: 05/12/2017 15:58:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Procedure [dbo].[Modelo_Lst]
----------------------------------------------------------------------------------------------------
-- Lista as Modelos de um cliente
----------------------------------------------------------------------------------------------------
(
@p_Cliente_ID  Int, -- Identificação do cliente
@p_Ativos      Bit  -- 1:Apenas os modelos ativos 0:Todos
)
AS

SET NOCOUNT ON

Select Modelo_ID,
       Nome,
       Ativo

From   Modelo
Where  Cliente_ID = @p_Cliente_ID

 and  (    Ativo = 1
        or @p_Ativos = 0 )

Order by Nome


GO
/****** Object:  StoredProcedure [dbo].[Navio_Ins]    Script Date: 05/12/2017 15:58:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


Create Procedure [dbo].[Navio_Ins]
----------------------------------------------------------------------------------------------------
-- Insere um novo navio
-- 13/06 - Verifica se já existe navio com este nome
----------------------------------------------------------------------------------------------------
(
@p_Nome     Varchar(100),
@p_Navio_ID Int OUTPUT
)
AS

SET NOCOUNT ON

Select  @p_Navio_ID = Navio_Id from Navio 
 Where  Nome = @p_Nome

IF @p_Navio_ID IS NULL
    Begin
        Insert Into Navio ( Nome )
        Values ( @p_Nome )
        Set @p_Navio_ID = SCOPE_IDENTITY()
    End
GO
/****** Object:  StoredProcedure [dbo].[Navio_Lst]    Script Date: 05/12/2017 15:58:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Procedure [dbo].[Navio_Lst]
----------------------------------------------------------------------------------------------------
-- Lista os navios
----------------------------------------------------------------------------------------------------
(
@p_Ativos Bit  -- 1:Apenas os navios ativos 0:Todos
)
AS

SET NOCOUNT ON

Select Navio_ID,
       Nome,
       Ativo

From   Navio
Where (    Ativo = 1
        or @p_Ativos = 0 )

Order by Nome


GO
/****** Object:  StoredProcedure [dbo].[Navio_Sel]    Script Date: 05/12/2017 15:58:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Procedure [dbo].[Navio_Sel]
----------------------------------------------------------------------------------------------------
-- Consulta os dados do Navio
----------------------------------------------------------------------------------------------------
(
@p_Navio_ID Int
)
AS

SET NOCOUNT ON

Select Navio_ID,
       Nome,
       Ativo

From   Navio

Where Navio_ID = @p_Navio_ID


GO
/****** Object:  StoredProcedure [dbo].[Publicar]    Script Date: 05/12/2017 15:58:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Procedure [dbo].[Publicar]
----------------------------------------------------------------------------------------------------
-- Realiza a publicação das inspeções
-- 17/04/2017 Criação
-------------------------------------------------------------------------------
(
@p_Usuario_ID Int,
@p_Inspecoes  Varchar(4000)  --String contendo a concatenação de inspeções delimitadas por ;  Ex: 1;2;3...100;
)
AS

SET NOCOUNT ON

DECLARE @Tamanho     Int,
        @Posicao     Int,
        @Inspecao    Int,
        @InspecaoAux VarChar(4000)

Set     @InspecaoAux =  @p_Inspecoes
Set     @Tamanho     =  Len(@p_Inspecoes)
Set     @Posicao     =  CharIndex(';', @p_Inspecoes)

While @Posicao > 0 Begin

 Set @Inspecao = LEFT(@InspecaoAux, @Posicao-1)

  Update Inspecao
  Set   Publicado = 1, 
        PublicadoPor = @p_Usuario_ID, 
        PublicacaoData = SYSDATETIME()
  Where Inspecao_Id = @Inspecao

  --Pega a próxima Inspeção dentro da string de concatenação
  Set @InspecaoAux =  SUBSTRING(@InspecaoAux, @Posicao+1, Len(@InspecaoAux))

  --Verifica se existe mais algum ponto e virgula, caso não exista sai do loop
  Set @Posicao =  CharIndex(';', @InspecaoAux)
End

/*
declare @p_inspecoes varchar(40)
set @p_inspecoes = '0005;23;33;'
exec publicar 6, @p_inspecoes
go
select * from Inspecao where inspecao_id in (5,13,23,33)
*/


GO
/****** Object:  StoredProcedure [dbo].[TodasInfoAvaria]    Script Date: 05/12/2017 15:58:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Procedure [dbo].[TodasInfoAvaria] (@InspAvaria_ID int)
AS 

Select 
        a.Data
      , a.Usuario_ID
      , a.Cliente_ID,                 ac.Nome             as NomeCliente
      , a.LocalInspecao_ID,           al.Nome             as LocalInspecao
      , a.LocalCheckPoint_ID,         alc.Nome_Pt         as LocalCheckPoint
      , a.Transportador_ID,           at.Nome             as Transportador
      , a.FrotaViagem_ID,             af.Nome             as FrotaViagem
      , a.Navio_ID,                   an.Nome             as Navio
      , b.Marca_ID,                   bma.Nome            as Marca
      , b.Modelo_ID,                  bmo.Nome            as Modelo
      , c.AvArea_ID,                  ca.Nome_Pt          as Area
      , c.AvCondicao_ID,              cc.Nome_Pt          as Condicao
      , c.AvDano_ID,                  cd.Nome_Pt          as Dano
      , c.AvQuadrante_ID,             cq.Nome_Pt          as Quadrante
      , c.AvGravidade_ID,             cg.Nome_Pt          as Gravidade,    cg.Codigo CodigoGravidade
      , c.AvSeveridade_ID,            cs.Nome_Pt          as Severidade
      , c.Custo


from Inspecao a
  
inner join InspVeiculo b on b.Inspecao_ID = a.Inspecao_ID

--Dados Inspecao
inner join Cliente              ac     on ac.Cliente_ID           = a.Cliente_ID
inner join LocalInspecao	    al     on al.LocalInspecao_ID     = a.LocalInspecao_ID
inner join LocalCheckPoint     alc     on alc.LocalCheckPoint_ID  = a.LocalCheckPoint_ID
inner join Transportador        at     on at.Transportador_ID     = a.Transportador_ID
inner join Navio	            an     on an.Navio_ID             = a.Navio_ID
inner join FrotaViagem          af     on af.FrotaViagem_ID       = a.FrotaViagem_ID 
							      
--Dados Veiculo				      
inner join Marca	           bma     on b.Marca_ID              = bma.Marca_ID
inner join Modelo	           bmo     on b.Modelo_ID             = bmo.Modelo_ID

--Dados Avaria
inner join InspAvaria            c     on c.InspVeiculo_ID        = b.InspVeiculo_ID
inner join AvArea	            ca     on ca.AvArea_ID            = c.AvArea_ID
inner join AvCondicao           cc     on cc.AvCondicao_ID        = c.AvCondicao_ID
inner join AvDano	            cd     on cd.AvDano_ID            = c.AvDano_ID
inner join AvGravidade          cg     on cg.AvGravidade_ID       = c.AvGravidade_ID
inner join AvQuadrante          cq     on cq.AvQuadrante_ID       = c.AvQuadrante_ID
inner join AvSeveridade         cs     on cs.AvSeveridade_ID      = c.AvSeveridade_ID


where c.InspAvaria_ID = @InspAvaria_ID



GO
/****** Object:  StoredProcedure [dbo].[TodasInfoAvarias]    Script Date: 05/12/2017 15:58:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Procedure [dbo].[TodasInfoAvarias] (@InspAvaria_ID int)
AS 

Select 
        a.Data
      , a.Usuario_ID
      , a.Cliente_ID,                 ac.Nome             as NomeCliente
      , a.LocalInspecao_ID,           al.Nome             as LocalInspecao
      , a.LocalCheckPoint_ID,         alc.Nome_Pt         as LocalCheckPoint
      , a.Transportador_ID,           at.Nome             as Transportador
      , a.FrotaViagem_ID,             af.Nome             as FrotaViagem
      , a.Navio_ID,                   an.Nome             as Navio
      , b.Marca_ID,                   bma.Nome            as Marca
      , b.Modelo_ID,                  bmo.Nome            as Modelo
      , c.AvArea_ID,                  ca.Nome_Pt          as Area
      , c.AvCondicao_ID,              cc.Nome_Pt          as Condicao
      , c.AvDano_ID,                  cd.Nome_Pt          as Dano
      , c.AvQuadrante_ID,             cq.Nome_Pt          as Quadrante
      , c.AvGravidade_ID,             cg.Nome_Pt          as Gravidade
      , c.AvSeveridade_ID,            cs.Nome_Pt          as Severidade


from Inspecao a
  
inner join InspVeiculo b on b.Inspecao_ID = a.Inspecao_ID

--Dados Inspecao
inner join Cliente              ac     on ac.Cliente_ID           = a.Cliente_ID
inner join LocalInspecao	al     on al.LocalInspecao_ID     = a.LocalInspecao_ID
inner join LocalCheckPoint     alc     on alc.LocalCheckPoint_ID  = a.LocalCheckPoint_ID
inner join Transportador        at     on at.Transportador_ID     = a.Transportador_ID
inner join Navio	        an     on an.Navio_ID             = a.Navio_ID
inner join FrotaViagem          af     on af.FrotaViagem_ID       = a.FrotaViagem_ID 
							      
--Dados Veiculo				      
inner join Marca	        bma    on b.Marca_ID              = bma.Marca_ID
inner join Modelo	        bmo    on b.Modelo_ID             = bmo.Modelo_ID

--Dados Avaria
inner join InspAvaria            c     on c.InspVeiculo_ID       = b.InspVeiculo_ID
inner join AvArea	        ca     on ca.AvArea_ID           = c.AvArea_ID
inner join AvCondicao           cc     on cc.AvCondicao_ID       = c.AvCondicao_ID
inner join AvDano	        cd     on cd.AvDano_ID           = c.AvDano_ID
inner join AvGravidade          cg     on cg.AvGravidade_ID      = c.AvGravidade_ID
inner join AvQuadrante          cq     on cq.AvQuadrante_ID      = c.AvQuadrante_ID
inner join AvSeveridade         cs     on cs.AvSeveridade_ID     = c.AvSeveridade_ID


where c.InspAvaria_ID = @InspAvaria_ID



GO
/****** Object:  StoredProcedure [dbo].[Transportador_Ins]    Script Date: 05/12/2017 15:58:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Procedure [dbo].[Transportador_Ins]
----------------------------------------------------------------------------------------------------
-- Insere um novo transportador
----------------------------------------------------------------------------------------------------
(
@p_Nome             Varchar(100),
@p_Tipo             Char(1),      -- T:Terrestre M:Marítimo
@p_Transportador_ID Int OUTPUT
)
AS

SET NOCOUNT ON

Insert Into Transportador ( Nome, Tipo )
Values ( @p_Nome,
         @p_Tipo )

Set @p_Transportador_ID = SCOPE_IDENTITY()


GO
/****** Object:  StoredProcedure [dbo].[Transportador_Lst]    Script Date: 05/12/2017 15:58:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Procedure [dbo].[Transportador_Lst]
----------------------------------------------------------------------------------------------------
-- Lista os transportadores
----------------------------------------------------------------------------------------------------
(
@p_Ativos      Bit  -- 1:Apenas os ativos 0:Todos
)
AS

SET NOCOUNT ON

Select Transportador_ID,
       Nome,
       Tipo,  -- T:Terrestre M:Marítimo
       Ativo

From   Transportador

Where (    Ativo = 1
        or @p_Ativos = 0 )

Order by Nome


GO
/****** Object:  StoredProcedure [dbo].[Transportador_Sel]    Script Date: 05/12/2017 15:58:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Procedure [dbo].[Transportador_Sel]
----------------------------------------------------------------------------------------------------
-- Consulta os dados de um transportador
----------------------------------------------------------------------------------------------------
(
@p_Transportador_ID Int
)
AS

SET NOCOUNT ON

Select Transportador_ID,
       Nome,
       Tipo,  -- T:Terrestre M:Marítimo
       Ativo

From   Transportador

Where Transportador_ID = @p_Transportador_ID


GO
USE [master]
GO
ALTER DATABASE [VDT2_02122017] SET  READ_WRITE 
GO
