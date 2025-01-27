USE [master]
GO
/****** Object:  Database [Jinher.JAP.OPS1]    Script Date: 2020/6/23 9:34:01 ******/
CREATE DATABASE [Jinher.JAP.OPS1]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Jinher.JAP.OPS1', FILENAME = N'D:\MSDATA\Jinher.JAP.OPS1.mdf' , SIZE = 5649408KB , MAXSIZE = UNLIMITED, FILEGROWTH = 204800KB )
 LOG ON 
( NAME = N'Jinher.JAP.OPS1_log', FILENAME = N'D:\MSDATA\Jinher.JAP.OPS1_log.ldf' , SIZE = 968896KB , MAXSIZE = 2048GB , FILEGROWTH = 102400KB )
GO
ALTER DATABASE [Jinher.JAP.OPS1] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Jinher.JAP.OPS1].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Jinher.JAP.OPS1] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Jinher.JAP.OPS1] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Jinher.JAP.OPS1] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Jinher.JAP.OPS1] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Jinher.JAP.OPS1] SET ARITHABORT OFF 
GO
ALTER DATABASE [Jinher.JAP.OPS1] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Jinher.JAP.OPS1] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [Jinher.JAP.OPS1] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Jinher.JAP.OPS1] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Jinher.JAP.OPS1] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Jinher.JAP.OPS1] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Jinher.JAP.OPS1] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Jinher.JAP.OPS1] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Jinher.JAP.OPS1] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Jinher.JAP.OPS1] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Jinher.JAP.OPS1] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Jinher.JAP.OPS1] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Jinher.JAP.OPS1] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Jinher.JAP.OPS1] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Jinher.JAP.OPS1] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Jinher.JAP.OPS1] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Jinher.JAP.OPS1] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Jinher.JAP.OPS1] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Jinher.JAP.OPS1] SET RECOVERY FULL 
GO
ALTER DATABASE [Jinher.JAP.OPS1] SET  MULTI_USER 
GO
ALTER DATABASE [Jinher.JAP.OPS1] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Jinher.JAP.OPS1] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Jinher.JAP.OPS1] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Jinher.JAP.OPS1] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Jinher.JAP.OPS1', N'ON'
GO
USE [Jinher.JAP.OPS1]
GO
/****** Object:  User [ops_conn]    Script Date: 2020/6/23 9:34:01 ******/
CREATE USER [ops_conn] FOR LOGIN [ops_conn] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [ops_conn]
GO
/****** Object:  Table [dbo].[AccidentReport]    Script Date: 2020/6/23 9:34:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AccidentReport](
	[Id] [uniqueidentifier] NOT NULL,
	[ReporterType] [int] NOT NULL,
	[ReporterKey] [varchar](500) NOT NULL,
	[Title] [varchar](500) NOT NULL,
	[AccidentType] [int] NOT NULL,
	[AccidentSummary] [varchar](max) NOT NULL,
	[Message] [varchar](max) NOT NULL,
	[CustomerEmail] [varchar](500) NOT NULL,
	[OccurTime] [datetime] NOT NULL,
	[DealState] [int] NOT NULL,
	[DealtTime] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AlertDeal]    Script Date: 2020/6/23 9:34:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AlertDeal](
	[Id] [uniqueidentifier] NOT NULL,
	[AlertPolicyId] [uniqueidentifier] NOT NULL,
	[SiteDomainId] [uniqueidentifier] NOT NULL,
	[OccurTime] [datetime] NOT NULL,
	[ErrorSummary] [varchar](5000) NOT NULL,
	[DealState] [int] NOT NULL,
	[DealtTime] [datetime] NULL,
	[CaseId] [uniqueidentifier] NOT NULL,
	[ReportId] [uniqueidentifier] NOT NULL,
	[NotifyCount] [int] NULL,
	[NotifyTime] [datetime] NULL,
 CONSTRAINT [PK_AlertDeal] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AlertPolicy]    Script Date: 2020/6/23 9:34:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AlertPolicy](
	[Id] [uniqueidentifier] NOT NULL,
	[MonitorType] [int] NOT NULL,
	[ErrorCondition] [int] NOT NULL,
	[ErrorConditionValue] [varchar](50) NOT NULL,
	[AlertType] [int] NOT NULL,
	[Explain] [varchar](500) NOT NULL,
	[EnvirCode] [nvarchar](20) NULL,
 CONSTRAINT [PK_AlertPolicy] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Caller]    Script Date: 2020/6/23 9:34:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Caller](
	[Id] [uniqueidentifier] NOT NULL,
	[CallerCode] [varchar](50) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[ApiSecret] [varchar](50) NOT NULL,
	[IsEnable] [bit] NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ContextDict]    Script Date: 2020/6/23 9:34:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ContextDict](
	[Id] [uniqueidentifier] NOT NULL,
	[EnvirCode] [varchar](50) NOT NULL,
	[Account] [varchar](50) NOT NULL,
	[Pwd] [varchar](50) NOT NULL,
	[ApplicationContext] [varchar](5000) NOT NULL,
 CONSTRAINT [PK_ContextDict] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Document]    Script Date: 2020/6/23 9:34:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Document](
	[Id] [uniqueidentifier] NOT NULL,
	[DocName] [varchar](50) NOT NULL,
	[DocContent] [varchar](max) NOT NULL,
	[BrowseCount] [int] NOT NULL,
	[ModifiedOn] [datetime] NOT NULL,
	[SubId] [uniqueidentifier] NOT NULL,
	[SubTime] [datetime] NOT NULL,
 CONSTRAINT [PK_Document] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DocumentTag]    Script Date: 2020/6/23 9:34:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DocumentTag](
	[Id] [uniqueidentifier] NOT NULL,
	[DocumentId] [uniqueidentifier] NOT NULL,
	[TagId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_DocumentTag] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[EventRecord]    Script Date: 2020/6/23 9:34:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EventRecord](
	[Id] [uniqueidentifier] NOT NULL,
	[CaseType] [int] NOT NULL,
	[CaseId] [uniqueidentifier] NOT NULL,
	[EventType] [int] NOT NULL,
	[Message] [varchar](2000) NOT NULL,
	[Detail] [varchar](max) NOT NULL,
	[OccurTime] [datetime] NOT NULL,
	[SubTime] [datetime] NOT NULL,
 CONSTRAINT [PK_ErrorRecord] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[HashIdExpireSet]    Script Date: 2020/6/23 9:34:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[HashIdExpireSet](
	[Id] [uniqueidentifier] NOT NULL,
	[CachesettingId] [uniqueidentifier] NULL,
	[HashId] [varchar](50) NULL,
	[ExpireValue] [int] NULL,
	[ExpireType] [int] NULL,
	[State] [int] NULL,
	[ModifiedOn] [datetime] NULL,
	[SubTime] [datetime] NULL,
 CONSTRAINT [PK_HashIdExpireSet] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Invoke]    Script Date: 2020/6/23 9:34:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Invoke](
	[Id] [uniqueidentifier] NOT NULL,
	[MonitorPointId] [uniqueidentifier] NOT NULL,
	[EnvirCode] [varchar](50) NOT NULL,
	[Url] [varchar](5000) NOT NULL,
	[ApplicationContext] [varchar](max) NOT NULL,
	[RequestData] [varchar](5000) NOT NULL,
	[ResponseContent] [varchar](max) NOT NULL,
	[HttpStatus] [int] NOT NULL,
	[StartTime] [datetime] NOT NULL,
	[EndTime] [datetime] NOT NULL,
	[VerifyType] [int] NOT NULL,
	[VerifyContent] [varchar](500) NOT NULL,
	[DurationMsec] [int] NOT NULL,
	[IsSuccess] [bit] NOT NULL,
	[ReportId] [uniqueidentifier] NOT NULL,
	[MonitorType] [int] NOT NULL,
	[CaseId] [uniqueidentifier] NOT NULL,
	[CaseType] [int] NOT NULL,
	[SpecificPointId] [uniqueidentifier] NOT NULL,
	[MechineIp] [varchar](50) NOT NULL,
	[StaffId] [uniqueidentifier] NOT NULL,
	[YearMonthDay] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Invoke] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LoginRecord]    Script Date: 2020/6/23 9:34:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoginRecord](
	[Id] [uniqueidentifier] NOT NULL,
	[StaffId] [uniqueidentifier] NOT NULL,
	[LoginTime] [datetime] NOT NULL,
 CONSTRAINT [PK_LoginRecord] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MonitorPoint]    Script Date: 2020/6/23 9:34:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MonitorPoint](
	[Id] [uniqueidentifier] NOT NULL,
	[EnvirCode] [varchar](50) NOT NULL,
	[MonitorType] [int] NOT NULL,
	[DomainId] [uniqueidentifier] NOT NULL,
	[HttpMethod] [varchar](50) NOT NULL,
	[ApplicationContext] [varchar](max) NOT NULL,
	[ContentType] [varchar](50) NOT NULL,
	[InMonitoring] [bit] NOT NULL,
	[Url] [varchar](2000) NOT NULL,
	[RequestData] [varchar](5000) NOT NULL,
	[VerifyType] [int] NOT NULL,
	[VerifyContent] [varchar](500) NOT NULL,
	[ModifiedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_MonitorPoint] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OnlineRecord]    Script Date: 2020/6/23 9:34:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[OnlineRecord](
	[Id] [uniqueidentifier] NOT NULL,
	[RelatedProjects] [varchar](50) NOT NULL,
	[OnlineReason] [varchar](200) NOT NULL,
	[OnlineContent] [varchar](1000) NOT NULL,
	[OnlineRelatedRange] [varchar](1000) NOT NULL,
	[IsPassTest] [bit] NOT NULL,
	[IsBackup] [bit] NOT NULL,
	[IsCanRollback] [bit] NOT NULL,
	[RollbackStep] [varchar](1000) NOT NULL,
	[Operator] [uniqueidentifier] NOT NULL,
	[IsAudited] [bit] NOT NULL,
	[Auditor] [uniqueidentifier] NOT NULL,
	[RollbackReason] [varchar](1000) NOT NULL,
	[IsSmokeTested] [bit] NOT NULL,
	[IsMonitored] [bit] NOT NULL,
	[Status] [int] NOT NULL,
	[ModifiedOn] [datetime] NOT NULL,
	[SubTime] [datetime] NOT NULL,
 CONSTRAINT [PK_OnlineRecord] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Project]    Script Date: 2020/6/23 9:34:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Project](
	[Id] [uniqueidentifier] NOT NULL,
	[Code] [varchar](50) NOT NULL,
	[FullName] [varchar](50) NOT NULL,
	[Description] [varchar](200) NOT NULL,
	[AlertTeamId] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Project] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RedisCachesetting]    Script Date: 2020/6/23 9:34:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RedisCachesetting](
	[Id] [uniqueidentifier] NOT NULL,
	[HostName] [varchar](50) NULL,
	[Port] [int] NULL,
	[HasPassword] [bit] NULL,
	[Password] [varchar](50) NULL,
	[SiteList] [varchar](500) NULL,
	[Memo] [varchar](500) NULL,
 CONSTRAINT [PK_RedisCachesetting] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Report]    Script Date: 2020/6/23 9:34:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Report](
	[Id] [uniqueidentifier] NOT NULL,
	[CaseId] [uniqueidentifier] NOT NULL,
	[CaseType] [int] NOT NULL,
	[StartTime] [datetime] NOT NULL,
	[EndTime] [datetime] NOT NULL,
	[IsFinished] [bit] NOT NULL,
	[ItemCount] [int] NOT NULL,
	[ItemSuccCount] [int] NOT NULL,
	[AvgDurationMsec] [int] NOT NULL,
	[MaxDurationMsec] [int] NOT NULL,
	[ResultSummary] [varchar](5000) NOT NULL,
 CONSTRAINT [PK_Report] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SiteCase]    Script Date: 2020/6/23 9:34:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SiteCase](
	[Id] [uniqueidentifier] NOT NULL,
	[DomainId] [uniqueidentifier] NOT NULL,
	[MechineIp] [varchar](50) NOT NULL,
	[InMonitoring] [bit] NOT NULL,
	[PeriodMinute] [int] NOT NULL,
	[CaseState] [int] NOT NULL,
	[CaseType] [int] NOT NULL,
	[CreateTime] [datetime] NOT NULL,
	[ModifiedOn] [datetime] NOT NULL,
	[LastReportId] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_SiteCase] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SiteDomain]    Script Date: 2020/6/23 9:34:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SiteDomain](
	[Id] [uniqueidentifier] NOT NULL,
	[EnvirCode] [varchar](50) NOT NULL,
	[ProjectCode] [varchar](50) NOT NULL,
	[DomainName] [varchar](50) NOT NULL,
	[ApiSecret] [varchar](50) NOT NULL,
	[ContextEnvirCode] [varchar](50) NOT NULL,
	[StaffId] [uniqueidentifier] NOT NULL,
	[CreateTime] [datetime] NOT NULL,
	[ModifiedOn] [datetime] NULL,
 CONSTRAINT [PK_Site] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SpecificPoint]    Script Date: 2020/6/23 9:34:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SpecificPoint](
	[Id] [uniqueidentifier] NOT NULL,
	[DomainId] [uniqueidentifier] NOT NULL,
	[CaseId] [uniqueidentifier] NOT NULL,
	[CaseType] [int] NOT NULL,
	[MonitorType] [int] NOT NULL,
	[PointId] [uniqueidentifier] NOT NULL,
	[ModifiedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_SpecificPoint] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Staff]    Script Date: 2020/6/23 9:34:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Staff](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[LoginAccount] [varchar](50) NOT NULL,
	[Pwd] [varchar](50) NOT NULL,
	[Role] [varchar](50) NOT NULL,
	[Phone] [varchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[LastLoginTime] [datetime] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Staff] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Tag]    Script Date: 2020/6/23 9:34:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tag](
	[Id] [uniqueidentifier] NOT NULL,
	[TagName] [varchar](50) NOT NULL,
	[ModifiedOn] [datetime] NOT NULL,
	[SubId] [uniqueidentifier] NOT NULL,
	[SubTime] [datetime] NOT NULL,
 CONSTRAINT [PK_Tag] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Team]    Script Date: 2020/6/23 9:34:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Team](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[IsAdmin] [bit] NULL,
 CONSTRAINT [PK_Team] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TeamStaff]    Script Date: 2020/6/23 9:34:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TeamStaff](
	[Id] [uniqueidentifier] NOT NULL,
	[StaffId] [uniqueidentifier] NOT NULL,
	[TeamId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_TeamStaff] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Index [ix_Invoke_StartTime]    Script Date: 2020/6/23 9:34:01 ******/
CREATE NONCLUSTERED INDEX [ix_Invoke_StartTime] ON [dbo].[Invoke]
(
	[StartTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [ix_Report_StartTime]    Script Date: 2020/6/23 9:34:01 ******/
CREATE NONCLUSTERED INDEX [ix_Report_StartTime] ON [dbo].[Report]
(
	[StartTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [Jinher.JAP.OPS1] SET  READ_WRITE 
GO
