USE [master]
GO
/****** Object:  Database [CUENTAS_BANCOS]    Script Date: 23/02/2021 11:13:04 ******/
CREATE DATABASE [CUENTAS_BANCOS]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CUENTAS_BANCOS', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\CUENTAS_BANCOS.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CUENTAS_BANCOS_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\CUENTAS_BANCOS_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [CUENTAS_BANCOS] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CUENTAS_BANCOS].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CUENTAS_BANCOS] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CUENTAS_BANCOS] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CUENTAS_BANCOS] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CUENTAS_BANCOS] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CUENTAS_BANCOS] SET ARITHABORT OFF 
GO
ALTER DATABASE [CUENTAS_BANCOS] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [CUENTAS_BANCOS] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CUENTAS_BANCOS] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CUENTAS_BANCOS] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CUENTAS_BANCOS] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CUENTAS_BANCOS] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CUENTAS_BANCOS] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CUENTAS_BANCOS] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CUENTAS_BANCOS] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CUENTAS_BANCOS] SET  ENABLE_BROKER 
GO
ALTER DATABASE [CUENTAS_BANCOS] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CUENTAS_BANCOS] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CUENTAS_BANCOS] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CUENTAS_BANCOS] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CUENTAS_BANCOS] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CUENTAS_BANCOS] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CUENTAS_BANCOS] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CUENTAS_BANCOS] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [CUENTAS_BANCOS] SET  MULTI_USER 
GO
ALTER DATABASE [CUENTAS_BANCOS] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CUENTAS_BANCOS] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CUENTAS_BANCOS] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CUENTAS_BANCOS] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CUENTAS_BANCOS] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [CUENTAS_BANCOS] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [CUENTAS_BANCOS] SET QUERY_STORE = OFF
GO
USE [CUENTAS_BANCOS]
GO
/****** Object:  User [Ricardo]    Script Date: 23/02/2021 11:13:04 ******/
CREATE USER [Ricardo] FOR LOGIN [Ricardo] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [ggp]    Script Date: 23/02/2021 11:13:04 ******/
CREATE USER [ggp] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [curso2020]    Script Date: 23/02/2021 11:13:04 ******/
CREATE USER [curso2020] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [bbdd2020]    Script Date: 23/02/2021 11:13:04 ******/
CREATE USER [bbdd2020] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_securityadmin] ADD MEMBER [Ricardo]
GO
/****** Object:  UserDefinedFunction [dbo].[RENDIMIENTO]    Script Date: 23/02/2021 11:13:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[RENDIMIENTO] (
@VALOR_INVERSION MONEY,
@INTERESES_MENSUALES MONEY,
@FECHA_APERTURA DATE
)
RETURNS MONEY
AS
BEGIN
DECLARE @RENDIMIENTO MONEY;
set @RENDIMIENTO = ISNULL(@VALOR_INVERSION * 
Power((1+@INTERESES_MENSUALES),DATEDIFF(MONTH,@FECHA_APERTURA,GETDATE())),0);
RETURN @RENDIMIENTO;
END
GO
/****** Object:  Table [dbo].[CDT]    Script Date: 23/02/2021 11:13:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CDT](
	[IDINVERSION] [int] IDENTITY(1000,1) NOT NULL,
	[IDCUENTA] [int] NOT NULL,
	[FECHA_APERTURA] [date] NOT NULL,
	[INTERESES_MENSUALES] [money] NOT NULL,
	[VALOR_INVERSION] [money] NOT NULL,
	[ESTADO_CDT] [char](1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IDINVERSION] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CLIENTES]    Script Date: 23/02/2021 11:13:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CLIENTES](
	[NIF] [varchar](9) NOT NULL,
	[NOMBRE] [varchar](50) NOT NULL,
	[DIRECCION] [varchar](150) NULL,
	[MES] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[NIF] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CUENTAS]    Script Date: 23/02/2021 11:13:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CUENTAS](
	[IDCUENTA] [int] IDENTITY(1,1) NOT NULL,
	[SALDO] [money] NOT NULL,
	[NIF] [varchar](9) NOT NULL,
	[ESTADO] [char](1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IDCUENTA] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CUENTAS_AHORRO]    Script Date: 23/02/2021 11:13:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CUENTAS_AHORRO](
	[IDCUENTA] [int] NOT NULL,
	[INTERES_MENSUAL] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[IDCUENTA] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MOVIMIENTOS]    Script Date: 23/02/2021 11:13:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MOVIMIENTOS](
	[IDMOVIMIENTO] [int] IDENTITY(1,1) NOT NULL,
	[FECHA] [date] NOT NULL,
	[TIPO_MOVIMIENTO] [char](1) NOT NULL,
	[CANTIDAD] [money] NOT NULL,
	[IDCUENTA] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IDMOVIMIENTO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PRODUCTOS]    Script Date: 23/02/2021 11:13:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PRODUCTOS](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DESCRIPCION] [varchar](40) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TABLA_PRUEBA]    Script Date: 23/02/2021 11:13:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TABLA_PRUEBA](
	[IDSIMULACION] [int] IDENTITY(1,1) NOT NULL,
	[INTERESES_MENSUALES] [money] NULL,
	[VALOR_INVERSION] [money] NULL,
	[FECHA_APERTURA] [date] NULL,
	[SIMULACION]  AS ([dbo].[RENDIMIENTO]([VALOR_INVERSION],[INTERESES_MENSUALES],[FECHA_APERTURA])),
PRIMARY KEY CLUSTERED 
(
	[IDSIMULACION] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TRANSACCIONES]    Script Date: 23/02/2021 11:13:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TRANSACCIONES](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DESCRIPCION] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[CDT] ON 

INSERT [dbo].[CDT] ([IDINVERSION], [IDCUENTA], [FECHA_APERTURA], [INTERESES_MENSUALES], [VALOR_INVERSION], [ESTADO_CDT]) VALUES (1001, 3, CAST(N'2021-02-20' AS Date), 500.0000, 500.0000, N'a')
INSERT [dbo].[CDT] ([IDINVERSION], [IDCUENTA], [FECHA_APERTURA], [INTERESES_MENSUALES], [VALOR_INVERSION], [ESTADO_CDT]) VALUES (1002, 4, CAST(N'2021-02-19' AS Date), 1000.0000, 10000.0000, N'a')
INSERT [dbo].[CDT] ([IDINVERSION], [IDCUENTA], [FECHA_APERTURA], [INTERESES_MENSUALES], [VALOR_INVERSION], [ESTADO_CDT]) VALUES (1003, 3, CAST(N'2021-02-20' AS Date), 0.1000, 500.0000, N'C')
INSERT [dbo].[CDT] ([IDINVERSION], [IDCUENTA], [FECHA_APERTURA], [INTERESES_MENSUALES], [VALOR_INVERSION], [ESTADO_CDT]) VALUES (1004, 3, CAST(N'2021-02-20' AS Date), 0.0100, 10.0000, N'A')
INSERT [dbo].[CDT] ([IDINVERSION], [IDCUENTA], [FECHA_APERTURA], [INTERESES_MENSUALES], [VALOR_INVERSION], [ESTADO_CDT]) VALUES (1005, 3, CAST(N'2021-02-21' AS Date), 0.1000, 1000.0000, N'C')
INSERT [dbo].[CDT] ([IDINVERSION], [IDCUENTA], [FECHA_APERTURA], [INTERESES_MENSUALES], [VALOR_INVERSION], [ESTADO_CDT]) VALUES (1006, 4, CAST(N'2021-02-22' AS Date), 0.0100, 500.0000, N'C')
SET IDENTITY_INSERT [dbo].[CDT] OFF
GO
INSERT [dbo].[CLIENTES] ([NIF], [NOMBRE], [DIRECCION], [MES]) VALUES (N'12345678A', N'Jose Antonio', N'Leganes', 1)
INSERT [dbo].[CLIENTES] ([NIF], [NOMBRE], [DIRECCION], [MES]) VALUES (N'12345678B', N'Ana', N'Fuenlabrada', 2)
GO
SET IDENTITY_INSERT [dbo].[CUENTAS] ON 

INSERT [dbo].[CUENTAS] ([IDCUENTA], [SALDO], [NIF], [ESTADO]) VALUES (3, 3500.0000, N'12345678A', N'a')
INSERT [dbo].[CUENTAS] ([IDCUENTA], [SALDO], [NIF], [ESTADO]) VALUES (4, 2000.0000, N'12345678B', N'a')
SET IDENTITY_INSERT [dbo].[CUENTAS] OFF
GO
INSERT [dbo].[CUENTAS_AHORRO] ([IDCUENTA], [INTERES_MENSUAL]) VALUES (3, 0.0010)
INSERT [dbo].[CUENTAS_AHORRO] ([IDCUENTA], [INTERES_MENSUAL]) VALUES (4, 0.0100)
GO
SET IDENTITY_INSERT [dbo].[MOVIMIENTOS] ON 

INSERT [dbo].[MOVIMIENTOS] ([IDMOVIMIENTO], [FECHA], [TIPO_MOVIMIENTO], [CANTIDAD], [IDCUENTA]) VALUES (1, CAST(N'2021-02-20' AS Date), N'I', 500.0000, 3)
INSERT [dbo].[MOVIMIENTOS] ([IDMOVIMIENTO], [FECHA], [TIPO_MOVIMIENTO], [CANTIDAD], [IDCUENTA]) VALUES (2, CAST(N'2021-02-21' AS Date), N'I', 500.0000, 3)
INSERT [dbo].[MOVIMIENTOS] ([IDMOVIMIENTO], [FECHA], [TIPO_MOVIMIENTO], [CANTIDAD], [IDCUENTA]) VALUES (3, CAST(N'2021-02-21' AS Date), N'I', 1000.0000, 3)
INSERT [dbo].[MOVIMIENTOS] ([IDMOVIMIENTO], [FECHA], [TIPO_MOVIMIENTO], [CANTIDAD], [IDCUENTA]) VALUES (5, CAST(N'2021-02-21' AS Date), N'I', 1000.0000, 3)
INSERT [dbo].[MOVIMIENTOS] ([IDMOVIMIENTO], [FECHA], [TIPO_MOVIMIENTO], [CANTIDAD], [IDCUENTA]) VALUES (6, CAST(N'2021-02-21' AS Date), N'R', 1000.0000, 3)
INSERT [dbo].[MOVIMIENTOS] ([IDMOVIMIENTO], [FECHA], [TIPO_MOVIMIENTO], [CANTIDAD], [IDCUENTA]) VALUES (7, CAST(N'2021-02-21' AS Date), N'I', 1000.0000, 3)
INSERT [dbo].[MOVIMIENTOS] ([IDMOVIMIENTO], [FECHA], [TIPO_MOVIMIENTO], [CANTIDAD], [IDCUENTA]) VALUES (8, CAST(N'2021-02-21' AS Date), N'R', 1000.0000, 3)
INSERT [dbo].[MOVIMIENTOS] ([IDMOVIMIENTO], [FECHA], [TIPO_MOVIMIENTO], [CANTIDAD], [IDCUENTA]) VALUES (9, CAST(N'2021-02-21' AS Date), N'I', 500.0000, 4)
INSERT [dbo].[MOVIMIENTOS] ([IDMOVIMIENTO], [FECHA], [TIPO_MOVIMIENTO], [CANTIDAD], [IDCUENTA]) VALUES (10, CAST(N'2021-02-21' AS Date), N'R', 500.0000, 4)
INSERT [dbo].[MOVIMIENTOS] ([IDMOVIMIENTO], [FECHA], [TIPO_MOVIMIENTO], [CANTIDAD], [IDCUENTA]) VALUES (12, CAST(N'2021-02-22' AS Date), N'I', 500.0000, 4)
INSERT [dbo].[MOVIMIENTOS] ([IDMOVIMIENTO], [FECHA], [TIPO_MOVIMIENTO], [CANTIDAD], [IDCUENTA]) VALUES (13, CAST(N'2021-02-22' AS Date), N'I', 1000.0000, 3)
INSERT [dbo].[MOVIMIENTOS] ([IDMOVIMIENTO], [FECHA], [TIPO_MOVIMIENTO], [CANTIDAD], [IDCUENTA]) VALUES (14, CAST(N'2021-02-22' AS Date), N'R', 500.0000, 3)
SET IDENTITY_INSERT [dbo].[MOVIMIENTOS] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [I_NOMBRE]    Script Date: 23/02/2021 11:13:04 ******/
CREATE NONCLUSTERED INDEX [I_NOMBRE] ON [dbo].[CLIENTES]
(
	[NOMBRE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CUENTAS] ADD  DEFAULT ((0)) FOR [SALDO]
GO
ALTER TABLE [dbo].[CUENTAS_AHORRO] ADD  DEFAULT ((0)) FOR [INTERES_MENSUAL]
GO
ALTER TABLE [dbo].[CDT]  WITH CHECK ADD  CONSTRAINT [FK_CDT_CUENTAS] FOREIGN KEY([IDCUENTA])
REFERENCES [dbo].[CUENTAS] ([IDCUENTA])
GO
ALTER TABLE [dbo].[CDT] CHECK CONSTRAINT [FK_CDT_CUENTAS]
GO
ALTER TABLE [dbo].[CUENTAS]  WITH CHECK ADD  CONSTRAINT [FK_CUENTAS_CLIENTES] FOREIGN KEY([NIF])
REFERENCES [dbo].[CLIENTES] ([NIF])
GO
ALTER TABLE [dbo].[CUENTAS] CHECK CONSTRAINT [FK_CUENTAS_CLIENTES]
GO
ALTER TABLE [dbo].[CUENTAS_AHORRO]  WITH CHECK ADD  CONSTRAINT [FK_CUENTAS_AHORRO_CUENTAS] FOREIGN KEY([IDCUENTA])
REFERENCES [dbo].[CUENTAS] ([IDCUENTA])
GO
ALTER TABLE [dbo].[CUENTAS_AHORRO] CHECK CONSTRAINT [FK_CUENTAS_AHORRO_CUENTAS]
GO
ALTER TABLE [dbo].[MOVIMIENTOS]  WITH CHECK ADD  CONSTRAINT [FK_MOVIMIENTOS_CUENTAS] FOREIGN KEY([IDCUENTA])
REFERENCES [dbo].[CUENTAS] ([IDCUENTA])
GO
ALTER TABLE [dbo].[MOVIMIENTOS] CHECK CONSTRAINT [FK_MOVIMIENTOS_CUENTAS]
GO
ALTER TABLE [dbo].[CDT]  WITH CHECK ADD CHECK  (([ESTADO_CDT]='C' OR [ESTADO_CDT]='A'))
GO
ALTER TABLE [dbo].[CDT]  WITH CHECK ADD CHECK  (([ESTADO_CDT]='C' OR [ESTADO_CDT]='A'))
GO
ALTER TABLE [dbo].[CUENTAS]  WITH CHECK ADD CHECK  (([ESTADO]='C' OR [ESTADO]='A'))
GO
ALTER TABLE [dbo].[CUENTAS]  WITH CHECK ADD CHECK  (([ESTADO]='C' OR [ESTADO]='A'))
GO
ALTER TABLE [dbo].[MOVIMIENTOS]  WITH CHECK ADD CHECK  (([TIPO_MOVIMIENTO]='R' OR [TIPO_MOVIMIENTO]='I'))
GO
ALTER TABLE [dbo].[MOVIMIENTOS]  WITH CHECK ADD CHECK  (([TIPO_MOVIMIENTO]='R' OR [TIPO_MOVIMIENTO]='I'))
GO
/****** Object:  StoredProcedure [dbo].[ALTA_INVERSION]    Script Date: 23/02/2021 11:13:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--CREAR UN PA PARA DAR DE ALTA UNA INVERSION
--PARAMETROS DE ENTRADA IDCUENTA, INTERESES MENSUALES, VALOR DE LA INVERSION
CREATE PROCEDURE [dbo].[ALTA_INVERSION]
@IDCUENTA INT,
@INTERESES_MENSUALES MONEY,
@VALOR_INVERSION MONEY
AS
INSERT INTO CDT
(
IDCUENTA,
FECHA_APERTURA,
INTERESES_MENSUALES,
VALOR_INVERSION,
ESTADO_CDT
)
VALUES
(
@IDCUENTA,
GETDATE(),
@INTERESES_MENSUALES,
@VALOR_INVERSION,
'A'
);
GO
/****** Object:  StoredProcedure [dbo].[CERRAR_INVERSION]    Script Date: 23/02/2021 11:13:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CERRAR_INVERSION]
@IDINVERSION INT
AS
--OBTENER EL VALOR DE LAS VARIABLES
DECLARE @INTERESES_MENSUALES MONEY, @VALOR_INVERSION MONEY, @FECHA_APERTURA DATE;
DECLARE @RENDIMIENTO MONEY;
SELECT @INTERESES_MENSUALES = INTERESES_MENSUALES,
	 @VALOR_INVERSION = VALOR_INVERSION,
	 @FECHA_APERTURA = FECHA_APERTURA
FROM CDT
WHERE IDINVERSION = @IDINVERSION;
SELECT @INTERESES_MENSUALES, @VALOR_INVERSION, @FECHA_APERTURA;
set @RENDIMIENTO = ISNULL(@VALOR_INVERSION * 
Power((1+@INTERESES_MENSUALES),DATEDIFF(MONTH,@FECHA_APERTURA,GETDATE())),0);
SELECT @RENDIMIENTO;
--CAMBIAR EL ESTATUS DE LA INVERSION
UPDATE CDT
SET ESTADO_CDT = 'C'
WHERE IDINVERSION =@IDINVERSION;
--OBTENER EL ID CUENTA
DECLARE @IDCUENTA INT;
SELECT @IDCUENTA = IDCUENTA FROM CDT WHERE IDINVERSION=@IDINVERSION;
EXECUTE [dbo].[INGRESO] @IDCUENTA, @RENDIMIENTO;
GO
/****** Object:  StoredProcedure [dbo].[CONSULTA_CC]    Script Date: 23/02/2021 11:13:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--CREAR UN PROCEDIMIENTO ALMACENADO PARA MOSTRAR EL SALDO
--A PARTIR DE IDCUENTA
CREATE PROCEDURE [dbo].[CONSULTA_CC]
@IDCUENTA INT
AS
SELECT SALDO, NIF 
FROM CUENTAS WHERE IDCUENTA=@IDCUENTA;

--CREAR UN PROCEDIMIENTO ALMACENADO PARA MOSTRAR EL SALDO
--A PARTIR DEL IDINVERSION
GO
/****** Object:  StoredProcedure [dbo].[CONSULTA_CDT]    Script Date: 23/02/2021 11:13:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CONSULTA_CDT]
@IDINVERSION INT
AS
SELECT VALOR_INVERSION FROM CDT
WHERE IDINVERSION = @IDINVERSION;



--CREAR UN PA PARA DEVOLVER LA SUMATORIA DE LOS SALDOS DE LAS CUENTAS +
--LOS VALORES_INVERSION DE LAS INVERSIONES 
--PARAMETRO DE ENTRADA NIF
--PARAMETRO DE SALIDA SUMATORIA 
GO
/****** Object:  StoredProcedure [dbo].[INGRESO]    Script Date: 23/02/2021 11:13:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[INGRESO]
@IDCUENTA INT,
@CANTIDAD MONEY
AS
--INICIAR LA TRANSACCION
BEGIN TRAN 
	INSERT INTO MOVIMIENTOS
	VALUES
	(
	GETDATE(),
	'I',
	@CANTIDAD,
	@IDCUENTA
	);
	IF @@ROWCOUNT < 1
	  ROLLBACK;
	ELSE
	  BEGIN
		  UPDATE CUENTAS
		  SET SALDO = SALDO + @CANTIDAD
		  WHERE IDCUENTA = @IDCUENTA;
		  IF @@ROWCOUNT < 1
			ROLLBACK;
		  ELSE
			COMMIT;
		END;
GO
/****** Object:  StoredProcedure [dbo].[RECONSTRUIR_SALDO]    Script Date: 23/02/2021 11:13:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RECONSTRUIR_SALDO]
AS
--1. PONER A CERO LOS SALDOS DE LAS CUENTAS
UPDATE CUENTAS 
SET SALDO = 0;
--2. CREAR UN CURSOR DE LA TABLA DE MOVIMIENTOS
--1. DECLARAR CURSOR
DECLARE C_MOV CURSOR
LOCAL
FOR
SELECT TIPO_MOVIMIENTO, CANTIDAD, IDCUENTA
FROM MOVIMIENTOS ORDER BY IDCUENTA;
DECLARE @TIPO_MOVIMIENTO CHAR(1), @CANTIDAD MONEY, @IDCUENTA INT;
--2. ABRIR EL CURSOR
OPEN C_MOV;
--3. LEER EL CURSOR
FETCH NEXT FROM C_MOV INTO @TIPO_MOVIMIENTO, @CANTIDAD, @IDCUENTA;
--RECORRER EL CURSOR Y ACTUALIZAR EL SALDO DE CUENTAS
WHILE @@FETCH_STATUS=0
BEGIN
	IF @TIPO_MOVIMIENTO='I'
		UPDATE CUENTAS SET SALDO = SALDO + @CANTIDAD WHERE IDCUENTA= @IDCUENTA;
	IF @TIPO_MOVIMIENTO = 'R'
		UPDATE CUENTAS SET SALDO = SALDO - @CANTIDAD WHERE IDCUENTA = @IDCUENTA;
	FETCH NEXT FROM C_MOV INTO @TIPO_MOVIMIENTO, @CANTIDAD, @IDCUENTA;
END
--CERRAR EL CURSOR
CLOSE C_MOV;
--DESALOJAR DE LA MEMORIA
DEALLOCATE C_MOV;
GO
/****** Object:  StoredProcedure [dbo].[RECONSTRUIR_SALDO_2]    Script Date: 23/02/2021 11:13:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RECONSTRUIR_SALDO_2]
AS
--1. PONER A CERO LOS SALDOS DE LAS CUENTAS
UPDATE CUENTAS 
SET SALDO = 0;
--2. CREAR UNA TABLA TEMPORAL CON EL AGRUPAMIENTO POR MOVIMIENTO Y CUENTA SUMANDO LA CANTIDAD
SELECT IDCUENTA, TIPO_MOVIMIENTO, SUM(CANTIDAD) AS CANTIDAD
INTO #RESUMEN 
FROM MOVIMIENTOS
GROUP BY IDCUENTA, TIPO_MOVIMIENTO;

--2. CREAR UN CURSOR DE LA TABLA DE MOVIMIENTOS
--1. DECLARAR CURSOR
DECLARE C_MOV CURSOR
LOCAL
FOR
SELECT TIPO_MOVIMIENTO, CANTIDAD, IDCUENTA
FROM #RESUMEN ORDER BY IDCUENTA;
DECLARE @TIPO_MOVIMIENTO CHAR(1), @CANTIDAD MONEY, @IDCUENTA INT;
--2. ABRIR EL CURSOR
OPEN C_MOV;
--3. LEER EL CURSOR
FETCH NEXT FROM C_MOV INTO @TIPO_MOVIMIENTO, @CANTIDAD, @IDCUENTA;
--RECORRER EL CURSOR Y ACTUALIZAR EL SALDO DE CUENTAS
WHILE @@FETCH_STATUS=0
BEGIN
	IF @TIPO_MOVIMIENTO='I'
		UPDATE CUENTAS SET SALDO = SALDO + @CANTIDAD WHERE IDCUENTA= @IDCUENTA;
	IF @TIPO_MOVIMIENTO = 'R'
		UPDATE CUENTAS SET SALDO = SALDO - @CANTIDAD WHERE IDCUENTA = @IDCUENTA;
	FETCH NEXT FROM C_MOV INTO @TIPO_MOVIMIENTO, @CANTIDAD, @IDCUENTA;
END
--CERRAR EL CURSOR
CLOSE C_MOV;
--DESALOJAR DE LA MEMORIA
DEALLOCATE C_MOV;
GO
/****** Object:  StoredProcedure [dbo].[RETIRO]    Script Date: 23/02/2021 11:13:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RETIRO]
@IDCUENTA INT,
@CANTIDAD MONEY
AS
--INICIAR LA TRANSACCION
BEGIN TRAN 
	INSERT INTO MOVIMIENTOS
	VALUES
	(
	GETDATE(),
	'R',
	@CANTIDAD,
	@IDCUENTA
	);
	IF @@ROWCOUNT < 1
	  ROLLBACK;
	ELSE
	  BEGIN
		 --SI ENTRA AQUI´, ES QUE VA TODO OK
		  UPDATE CUENTAS
		  SET SALDO = SALDO - @CANTIDAD
		  WHERE IDCUENTA = @IDCUENTA
		  AND SALDO >= @CANTIDAD;
		  IF @@ROWCOUNT < 1
			ROLLBACK;
		  ELSE
			COMMIT;
		END;
GO
/****** Object:  StoredProcedure [dbo].[SALDO_TOTAL]    Script Date: 23/02/2021 11:13:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SALDO_TOTAL]
@NIF VARCHAR(9),
@SUMATORIA MONEY OUTPUT
AS
SELECT @SUMATORIA = 
ISNULL((SELECT SUM(SALDO) FROM CUENTAS WHERE NIF=@NIF),0)
					+
					ISNULL((SELECT SUM(VALOR_INVERSION) FROM CDT 
					INNER JOIN CUENTAS C ON C.IDCUENTA= CDT.IDCUENTA
					WHERE C.NIF=@NIF),0) ;
--PROBAR EL PROCEDIMIENTO ALMACENADO
GO
/****** Object:  StoredProcedure [dbo].[SIMULACION]    Script Date: 23/02/2021 11:13:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SIMULACION]
@NIF VARCHAR(9),
@SUMATORIA MONEY OUTPUT
AS
SELECT @SUMATORIA = 
ISNULL((SELECT SUM(SALDO) FROM CUENTAS WHERE NIF=@NIF),0)
					+
					ISNULL((SELECT SUM([dbo].[RENDIMIENTO]([VALOR_INVERSION], 
					[INTERESES_MENSUALES],
					[FECHA_APERTURA])) FROM CDT 
					INNER JOIN CUENTAS C ON C.IDCUENTA= CDT.IDCUENTA
					WHERE C.NIF=@NIF),0) ;
GO
USE [master]
GO
ALTER DATABASE [CUENTAS_BANCOS] SET  READ_WRITE 
GO
