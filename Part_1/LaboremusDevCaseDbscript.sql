USE [master]
GO
/****** Object:  Database [LaboremusDevCaseDb]    Script Date: 9/22/2020 11:34:09 AM ******/
CREATE DATABASE [LaboremusDevCaseDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'LaboremusDevCaseDb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\LaboremusDevCaseDb.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'LaboremusDevCaseDb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\LaboremusDevCaseDb_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [LaboremusDevCaseDb] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [LaboremusDevCaseDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [LaboremusDevCaseDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [LaboremusDevCaseDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [LaboremusDevCaseDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [LaboremusDevCaseDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [LaboremusDevCaseDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [LaboremusDevCaseDb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [LaboremusDevCaseDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [LaboremusDevCaseDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [LaboremusDevCaseDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [LaboremusDevCaseDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [LaboremusDevCaseDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [LaboremusDevCaseDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [LaboremusDevCaseDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [LaboremusDevCaseDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [LaboremusDevCaseDb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [LaboremusDevCaseDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [LaboremusDevCaseDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [LaboremusDevCaseDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [LaboremusDevCaseDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [LaboremusDevCaseDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [LaboremusDevCaseDb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [LaboremusDevCaseDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [LaboremusDevCaseDb] SET RECOVERY FULL 
GO
ALTER DATABASE [LaboremusDevCaseDb] SET  MULTI_USER 
GO
ALTER DATABASE [LaboremusDevCaseDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [LaboremusDevCaseDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [LaboremusDevCaseDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [LaboremusDevCaseDb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [LaboremusDevCaseDb] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'LaboremusDevCaseDb', N'ON'
GO
ALTER DATABASE [LaboremusDevCaseDb] SET QUERY_STORE = OFF
GO
USE [LaboremusDevCaseDb]
GO
/****** Object:  UserDefinedTableType [dbo].[FileError]    Script Date: 9/22/2020 11:34:09 AM ******/
CREATE TYPE [dbo].[FileError] AS TABLE(
	[RowNumber] [varchar](max) NOT NULL,
	[FailureReason] [varchar](max) NOT NULL,
	[SourceFileID] [varchar](max) NOT NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[Sales]    Script Date: 9/22/2020 11:34:09 AM ******/
CREATE TYPE [dbo].[Sales] AS TABLE(
	[Region] [varchar](max) NOT NULL,
	[Country] [varchar](500) NOT NULL,
	[ItemType] [varchar](500) NOT NULL,
	[SalesChannel] [varchar](50) NOT NULL,
	[OrderPriority] [varchar](5) NOT NULL,
	[OrderDate] [datetime] NOT NULL,
	[OrderID] [varchar](50) NOT NULL,
	[ShipDate] [datetime] NOT NULL,
	[UnitsSold] [decimal](18, 0) NOT NULL,
	[UnitPrice] [money] NOT NULL,
	[UnitCost] [money] NOT NULL,
	[TotalRevenue] [money] NOT NULL,
	[TotalCost] [money] NOT NULL,
	[TotalProfit] [money] NOT NULL,
	[SourceFileID] [bigint] NOT NULL
)
GO
/****** Object:  Table [dbo].[FileProcessingError]    Script Date: 9/22/2020 11:34:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FileProcessingError](
	[RecordID] [bigint] IDENTITY(1,1) NOT NULL,
	[RowNumber] [varchar](500) NOT NULL,
	[FailureReason] [varchar](max) NOT NULL,
	[SourceFileID] [bigint] NOT NULL,
	[RecordDate] [datetime] NOT NULL,
 CONSTRAINT [PK_FileProcessingError] PRIMARY KEY CLUSTERED 
(
	[RecordID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sale]    Script Date: 9/22/2020 11:34:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sale](
	[RecordID] [bigint] IDENTITY(1,1) NOT NULL,
	[Region] [varchar](max) NOT NULL,
	[Country] [varchar](500) NOT NULL,
	[ItemType] [varchar](500) NOT NULL,
	[SalesChannel] [varchar](50) NOT NULL,
	[OrderPriority] [varchar](5) NOT NULL,
	[OrderDate] [date] NOT NULL,
	[OrderID] [varchar](50) NOT NULL,
	[ShipDate] [date] NOT NULL,
	[UnitsSold] [decimal](18, 0) NOT NULL,
	[UnitPrice] [money] NOT NULL,
	[UnitCost] [money] NOT NULL,
	[TotalRevenue] [money] NOT NULL,
	[TotalCost] [money] NOT NULL,
	[TotalProfit] [money] NOT NULL,
	[SourceFileID] [bigint] NOT NULL,
	[RecordDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Sale] PRIMARY KEY CLUSTERED 
(
	[RecordID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SystemError]    Script Date: 9/22/2020 11:34:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SystemError](
	[RecordID] [bigint] IDENTITY(1,1) NOT NULL,
	[SourceSystem] [varchar](50) NOT NULL,
	[MethodName] [varchar](50) NOT NULL,
	[ExceptionStack] [varchar](max) NOT NULL,
	[RecordDate] [datetime] NOT NULL,
 CONSTRAINT [PK_SystemError] PRIMARY KEY CLUSTERED 
(
	[RecordID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UploadedFile]    Script Date: 9/22/2020 11:34:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UploadedFile](
	[RecordID] [bigint] IDENTITY(1,1) NOT NULL,
	[FilePath] [varchar](max) NOT NULL,
	[UploadDateTime] [datetime] NOT NULL,
	[IsProcessed] [bit] NOT NULL,
	[ProcessDateTime] [datetime] NULL,
	[TotalFileRecords] [bigint] NOT NULL,
	[SuccessfullyProcessedRecords] [bigint] NULL,
	[FailedRecords] [bigint] NULL,
 CONSTRAINT [PK_UploadedFiles] PRIMARY KEY CLUSTERED 
(
	[RecordID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_FileProcessingError]    Script Date: 9/22/2020 11:34:09 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_FileProcessingError] ON [dbo].[FileProcessingError]
(
	[RowNumber] ASC,
	[SourceFileID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = ON, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Sale]    Script Date: 9/22/2020 11:34:09 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Sale] ON [dbo].[Sale]
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = ON, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[UploadedFile] ADD  CONSTRAINT [DF_UploadedFiles_IsProcessed]  DEFAULT ((0)) FOR [IsProcessed]
GO
ALTER TABLE [dbo].[Sale]  WITH CHECK ADD  CONSTRAINT [FK_Sale_Sale] FOREIGN KEY([RecordID])
REFERENCES [dbo].[Sale] ([RecordID])
GO
ALTER TABLE [dbo].[Sale] CHECK CONSTRAINT [FK_Sale_Sale]
GO
/****** Object:  StoredProcedure [dbo].[BulkInsertErrors]    Script Date: 9/22/2020 11:34:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[BulkInsertErrors]
(
@TableData dbo.FileError READONLY
)
As
Begin
		INSERT INTO FileProcessingError
		(	[RowNumber],
			[FailureReason],
			[SourceFileID],
			[RecordDate]
			)
		SELECT	[RowNumber],
				[FailureReason],
				CONVERT(bigint,[SourceFileID]), 
				GETDATE()
				from @TableData
End

GO
/****** Object:  StoredProcedure [dbo].[BulkInsertSuccessfulData]    Script Date: 9/22/2020 11:34:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[BulkInsertSuccessfulData]
(
@TableData dbo.Sales READONLY
)
As
Begin
		INSERT INTO Sale
		(	[Region],
			[Country],
			[ItemType],
			[SalesChannel],
			[OrderPriority],
			[OrderDate],
			[OrderID],
			[ShipDate],
			[UnitsSold],
			[UnitPrice],
			[UnitCost],
			[TotalRevenue],
			[TotalCost],
			[TotalProfit],
			[SourceFileID],
			[RecordDate]
			)
		SELECT [Region],
			[Country],
			[ItemType],
			[SalesChannel],
			[OrderPriority],
			CONVERT(DATE,[OrderDate]),
			[OrderID],
			CONVERT(DATE,[ShipDate]),
			[UnitsSold],
			[UnitPrice],
			[UnitCost],
			[TotalRevenue],
			[TotalCost],
			[TotalProfit],
			CONVERT(bigint,[SourceFileID]), 
			GETDATE()
			from @TableData
End

GO
/****** Object:  StoredProcedure [dbo].[GetUploadedFilesPendingProcessing]    Script Date: 9/22/2020 11:34:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[GetUploadedFilesPendingProcessing]

As
Begin
	select * from UploadedFile where IsProcessed=0
End

GO
/****** Object:  StoredProcedure [dbo].[LogError]    Script Date: 9/22/2020 11:34:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[LogError]
(
	@sourceSystem varchar(500),
	@method varchar(500),
	@exceptionDetails varchar(MAX)
)
As
Begin
	Insert Into SystemError
		(SourceSystem, MethodName, ExceptionStack, RecordDate)
	Values
		(@sourceSystem, @method, @exceptionDetails, GETDATE())

End

GO
/****** Object:  StoredProcedure [dbo].[LogFileDetails]    Script Date: 9/22/2020 11:34:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[LogFileDetails]
(
	@filePath varchar(MAX),
	@totalNumberOfrecords varchar(50)
)
As
Begin
	Insert Into UploadedFile
		(FilePath,TotalFileRecords, UploadDateTime, IsProcessed)
	Values
		(@filePath, @totalNumberOfrecords, GETDATE(), 0 )

End
GO
/****** Object:  StoredProcedure [dbo].[MarkFileAsProcessed]    Script Date: 9/22/2020 11:34:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[MarkFileAsProcessed]
(
	@DataBaseID varchar(MAX), 
	@SuccessfulRecords varchar(MAX),
	@Failedrecords varchar(MAX)
)
As
Begin
	UPDATE UploadedFile set SuccessfullyProcessedRecords=CONVERT(bigint,@SuccessfulRecords), FailedRecords= CONVERT(bigint,@Failedrecords),
	IsProcessed = 1
	WHERE
	RecordID=CONVERT(bigint,@Failedrecords)
End
GO
/****** Object:  StoredProcedure [dbo].[SearchSalesTable]    Script Date: 9/22/2020 11:34:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[SearchSalesTable]
(
	@fromDate varchar(50), 
	@toDate varchar(50)
)
As
Begin
	SELECT TOP 5 ItemType, sum(TotalProfit) as TotalProfit from Sale
	where
	OrderDate >= convert(date,@fromDate)  and
	OrderDate <= convert(date,@toDate) 
	group by ItemType order by sum(TotalProfit) desc

	SELECT sum(TotalProfit) as TotalProfit from Sale
	where
	OrderDate >= convert(date,@fromDate)  and
	OrderDate <= convert(date,@toDate) 
End

GO
/****** Object:  StoredProcedure [dbo].[SearchSalesTableForReport]    Script Date: 9/22/2020 11:34:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[SearchSalesTableForReport]
(
	@fromDate varchar(50), 
	@toDate varchar(50)
)
As
Begin
	SELECT convert(varchar,OrderDate), OrderPriority,UnitsSold,UnitPrice,TotalCost,TotalRevenue,ItemType from Sale
	where
	(OrderDate >= convert(date,@fromDate) or @fromDate='') and
	(OrderDate <= convert(date,@toDate)  or @toDate='')
	order by OrderDate desc
 
End

GO
USE [master]
GO
ALTER DATABASE [LaboremusDevCaseDb] SET  READ_WRITE 
GO
