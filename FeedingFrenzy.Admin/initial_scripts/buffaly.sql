USE [master]
GO
ALTER DATABASE [buffaly] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [buffaly].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [buffaly] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [buffaly] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [buffaly] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [buffaly] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [buffaly] SET ARITHABORT OFF 
GO
ALTER DATABASE [buffaly] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [buffaly] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [buffaly] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [buffaly] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [buffaly] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [buffaly] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [buffaly] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [buffaly] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [buffaly] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [buffaly] SET  DISABLE_BROKER 
GO
ALTER DATABASE [buffaly] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [buffaly] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [buffaly] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [buffaly] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [buffaly] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [buffaly] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [buffaly] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [buffaly] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [buffaly] SET  MULTI_USER 
GO
ALTER DATABASE [buffaly] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [buffaly] SET DB_CHAINING OFF 
GO
ALTER DATABASE [buffaly] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [buffaly] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [buffaly] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [buffaly] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [buffaly] SET QUERY_STORE = OFF
GO
USE [buffaly]
GO
/****** Object:  Table [dbo].[Apis]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Apis](
	[ApiID] [int] IDENTITY(1,1) NOT NULL,
	[ApiKey] [nvarchar](255) NOT NULL,
	[Data] [nvarchar](max) NULL,
	[DateCreated] [datetime] NOT NULL,
	[LastUpdated] [datetime] NOT NULL,
 CONSTRAINT [PK_Apis] PRIMARY KEY CLUSTERED 
(
	[ApiID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ApiUsageLimits]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApiUsageLimits](
	[ApiUsageLimitID] [int] IDENTITY(1,1) NOT NULL,
	[ApiID] [int] NOT NULL,
	[TierID] [int] NOT NULL,
	[UsageDimensionID] [int] NOT NULL,
	[Limit] [decimal](18, 4) NOT NULL,
	[Data] [nvarchar](max) NULL,
	[DateCreated] [datetime] NOT NULL,
	[LastUpdated] [datetime] NOT NULL,
 CONSTRAINT [PK_ApiUsageLimits] PRIMARY KEY CLUSTERED 
(
	[ApiUsageLimitID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ApiUsages]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApiUsages](
	[ApiUsageID] [int] IDENTITY(1,1) NOT NULL,
	[UsageDimensionID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[AuthorizationID] [int] NOT NULL,
	[ApiID] [int] NOT NULL,
	[Usage] [decimal](18, 4) NOT NULL,
	[CostPerUnit] [money] NOT NULL,
	[Data] [nvarchar](max) NULL,
	[DateCreated] [datetime] NOT NULL,
	[LastUpdated] [datetime] NOT NULL,
 CONSTRAINT [PK_ApiUsages] PRIMARY KEY CLUSTERED 
(
	[ApiUsageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Applications]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Applications](
	[ApplicationID] [int] IDENTITY(1,1) NOT NULL,
	[ApplicationName] [nvarchar](255) NOT NULL,
	[URL] [nvarchar](512) NOT NULL,
	[ApplicationType] [nvarchar](255) NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[LastUpdated] [datetime] NOT NULL,
	[Data] [nvarchar](max) NULL,
	[UserID] [int] NOT NULL,
 CONSTRAINT [PK_Applications] PRIMARY KEY CLUSTERED 
(
	[ApplicationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Authorizations]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Authorizations](
	[AuthorizationID] [int] IDENTITY(1,1) NOT NULL,
	[AuthorizationToken] [nvarchar](255) NOT NULL,
	[RefreshToken] [nvarchar](255) NOT NULL,
	[Expiration] [datetime] NULL,
	[UserID] [int] NOT NULL,
	[LastRefreshedDate] [datetime] NULL,
	[LastActivityDate] [datetime] NULL,
	[IsExpired] [bit] NOT NULL,
	[IsRevoked] [bit] NOT NULL,
	[IsEncrypted] [bit] NOT NULL,
	[Data] [nvarchar](max) NULL,
	[DateCreated] [datetime] NOT NULL,
	[LastUpdated] [datetime] NOT NULL,
 CONSTRAINT [PK_Authorizations] PRIMARY KEY CLUSTERED 
(
	[AuthorizationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BlockedEmails]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BlockedEmails](
	[BlockedEmailID] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](255) NOT NULL,
	[Notes] [nvarchar](max) NULL,
	[Data] [nvarchar](max) NULL,
	[DateCreated] [datetime] NOT NULL,
	[LastUpdated] [datetime] NOT NULL,
 CONSTRAINT [PK_BlockedEmails] PRIMARY KEY CLUSTERED 
(
	[BlockedEmailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contents]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contents](
	[ContentID] [int] IDENTITY(1,1) NOT NULL,
	[ContentName] [nvarchar](255) NOT NULL,
	[Content] [nvarchar](max) NULL,
	[LastUpdated] [datetime] NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[Data] [nvarchar](max) NULL,
	[ContentTypeID] [int] NULL,
 CONSTRAINT [PK_Contents] PRIMARY KEY CLUSTERED 
(
	[ContentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ContentTypes]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContentTypes](
	[ContentTypeID] [int] IDENTITY(1,1) NOT NULL,
	[ContentTypeName] [nvarchar](255) NOT NULL,
	[Data] [nvarchar](max) NULL,
	[DateCreated] [datetime] NOT NULL,
	[LastUpdated] [datetime] NOT NULL,
 CONSTRAINT [PK_ContentTypes] PRIMARY KEY CLUSTERED 
(
	[ContentTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmailHistories]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmailHistories](
	[EmailHistoryID] [int] IDENTITY(1,1) NOT NULL,
	[To] [nvarchar](255) NOT NULL,
	[From] [nvarchar](255) NOT NULL,
	[EmailTemplateID] [int] NOT NULL,
	[Subject] [nvarchar](255) NOT NULL,
	[Email] [nvarchar](max) NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[IsPending] [bit] NOT NULL,
	[IsSent] [bit] NOT NULL,
	[Data] [nvarchar](max) NULL,
	[LastUpdated] [datetime] NOT NULL,
 CONSTRAINT [PK_EmailHistories] PRIMARY KEY CLUSTERED 
(
	[EmailHistoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmailTemplates]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmailTemplates](
	[EmailTemplateID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[EmailSubject] [nvarchar](255) NOT NULL,
	[EmailText] [nvarchar](max) NOT NULL,
	[EmailParams] [nvarchar](255) NOT NULL,
	[FromAddress] [nvarchar](255) NULL,
	[DateCreated] [datetime] NOT NULL,
	[LastUpdated] [datetime] NOT NULL,
	[Data] [nvarchar](max) NULL,
 CONSTRAINT [PK_EmailTemplates] PRIMARY KEY CLUSTERED 
(
	[EmailTemplateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Features]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Features](
	[FeatureID] [int] IDENTITY(1,1) NOT NULL,
	[FeatureName] [nvarchar](255) NOT NULL,
	[Version] [nvarchar](255) NULL,
	[IsEnabled] [bit] NOT NULL,
	[SettingsAssembly] [nvarchar](255) NULL,
	[SettingsClass] [nvarchar](255) NOT NULL,
	[Settings] [nvarchar](max) NULL,
	[DateCreated] [datetime] NOT NULL,
	[LastUpdated] [datetime] NOT NULL,
	[Data] [nvarchar](max) NULL,
 CONSTRAINT [PK_Features] PRIMARY KEY CLUSTERED 
(
	[FeatureID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PageLayouts]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PageLayouts](
	[PageLayoutID] [int] IDENTITY(1,1) NOT NULL,
	[LayoutID] [int] NULL,
	[Url] [nvarchar](512) NOT NULL,
	[Handler] [nvarchar](512) NOT NULL,
	[IsEnabled] [bit] NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[LastUpdated] [datetime] NOT NULL,
	[KeywordsMetaTag] [nvarchar](255) NULL,
	[DescriptionMetaTag] [nvarchar](255) NULL,
	[PageTitle] [nvarchar](255) NULL,
	[RoleID] [int] NULL,
	[Priority] [int] NULL,
	[SiteID] [int] NULL,
 CONSTRAINT [PK_PageLayouts] PRIMARY KEY CLUSTERED 
(
	[PageLayoutID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](255) NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[LastUpdated] [datetime] NOT NULL,
	[Data] [nvarchar](max) NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tiers]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tiers](
	[TierID] [int] IDENTITY(1,1) NOT NULL,
	[TierName] [nvarchar](255) NOT NULL,
	[Data] [nvarchar](max) NULL,
	[DateCreated] [datetime] NOT NULL,
	[LastUpdated] [datetime] NOT NULL,
 CONSTRAINT [PK_Tiers] PRIMARY KEY CLUSTERED 
(
	[TierID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UsageDimensions]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsageDimensions](
	[UsageDimensionID] [int] IDENTITY(1,1) NOT NULL,
	[UsageDimension] [nvarchar](255) NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[LastUpdated] [datetime] NOT NULL,
	[Data] [nvarchar](max) NULL,
 CONSTRAINT [PK_UsageDimensions] PRIMARY KEY CLUSTERED 
(
	[UsageDimensionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserRoles]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRoles](
	[UserRoleID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[RoleID] [int] NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[LastUpdated] [datetime] NOT NULL,
	[Data] [nvarchar](max) NULL,
 CONSTRAINT [PK_UserRoles] PRIMARY KEY CLUSTERED 
(
	[UserRoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[IsEnabled] [bit] NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[LastUpdated] [datetime] NOT NULL,
	[Data] [nvarchar](max) NULL,
	[Email] [nvarchar](255) NOT NULL,
	[Phone] [nvarchar](255) NULL,
	[Password] [nvarchar](max) NULL,
	[HasLoggedIn] [bit] NOT NULL,
	[LastLoginDate] [datetime] NULL,
	[IsLockedOut] [bit] NOT NULL,
	[InvitationCode] [nvarchar](255) NULL,
	[InvitationExpiration] [datetime] NULL,
	[IsInvited] [bit] NOT NULL,
	[InvitedDate] [datetime] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Apis_ApiKey]    Script Date: 1/21/2025 4:10:39 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Apis_ApiKey] ON [dbo].[Apis]
(
	[ApiKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Applications_ApplicationName]    Script Date: 1/21/2025 4:10:39 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Applications_ApplicationName] ON [dbo].[Applications]
(
	[ApplicationName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Authorizations_AuthorizationToken]    Script Date: 1/21/2025 4:10:39 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Authorizations_AuthorizationToken] ON [dbo].[Authorizations]
(
	[AuthorizationToken] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Authorizations_RefreshToken]    Script Date: 1/21/2025 4:10:39 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Authorizations_RefreshToken] ON [dbo].[Authorizations]
(
	[RefreshToken] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_BlockedEmails_Email]    Script Date: 1/21/2025 4:10:39 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_BlockedEmails_Email] ON [dbo].[BlockedEmails]
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Contents_ContentName]    Script Date: 1/21/2025 4:10:39 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Contents_ContentName] ON [dbo].[Contents]
(
	[ContentName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_ContentTypes_ContentTypeName]    Script Date: 1/21/2025 4:10:39 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_ContentTypes_ContentTypeName] ON [dbo].[ContentTypes]
(
	[ContentTypeName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_EmailTemplates_Name]    Script Date: 1/21/2025 4:10:39 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_EmailTemplates_Name] ON [dbo].[EmailTemplates]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Features_FeatureName]    Script Date: 1/21/2025 4:10:39 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Features_FeatureName] ON [dbo].[Features]
(
	[FeatureName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_PageLayouts_Url]    Script Date: 1/21/2025 4:10:39 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_PageLayouts_Url] ON [dbo].[PageLayouts]
(
	[Url] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Roles_RoleName]    Script Date: 1/21/2025 4:10:39 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Roles_RoleName] ON [dbo].[Roles]
(
	[RoleName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Tiers_TierName]    Script Date: 1/21/2025 4:10:39 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Tiers_TierName] ON [dbo].[Tiers]
(
	[TierName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UsageDimensions_UsageDimension]    Script Date: 1/21/2025 4:10:39 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_UsageDimensions_UsageDimension] ON [dbo].[UsageDimensions]
(
	[UsageDimension] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserRoles_UserID_RoleID]    Script Date: 1/21/2025 4:10:39 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_UserRoles_UserID_RoleID] ON [dbo].[UserRoles]
(
	[UserID] ASC,
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Users_Email]    Script Date: 1/21/2025 4:10:39 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Users_Email] ON [dbo].[Users]
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Apis] ADD  CONSTRAINT [DF_Apis_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [dbo].[Apis] ADD  CONSTRAINT [DF_Apis_LastUpdated]  DEFAULT (getdate()) FOR [LastUpdated]
GO
ALTER TABLE [dbo].[ApiUsageLimits] ADD  CONSTRAINT [DF_ApiUsageLimits_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [dbo].[ApiUsageLimits] ADD  CONSTRAINT [DF_ApiUsageLimits_LastUpdated]  DEFAULT (getdate()) FOR [LastUpdated]
GO
ALTER TABLE [dbo].[ApiUsages] ADD  CONSTRAINT [DF_ApiUsages_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [dbo].[ApiUsages] ADD  CONSTRAINT [DF_ApiUsages_LastUpdated]  DEFAULT (getdate()) FOR [LastUpdated]
GO
ALTER TABLE [dbo].[Applications] ADD  CONSTRAINT [DF_Applications_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [dbo].[Applications] ADD  CONSTRAINT [DF_Applications_LastUpdated]  DEFAULT (getdate()) FOR [LastUpdated]
GO
ALTER TABLE [dbo].[Authorizations] ADD  CONSTRAINT [DF_Authorizations_IsExpired]  DEFAULT ((0)) FOR [IsExpired]
GO
ALTER TABLE [dbo].[Authorizations] ADD  CONSTRAINT [DF_Authorizations_IsRevoked]  DEFAULT ((0)) FOR [IsRevoked]
GO
ALTER TABLE [dbo].[Authorizations] ADD  CONSTRAINT [DF_Authorizations_IsEncrypted]  DEFAULT ((0)) FOR [IsEncrypted]
GO
ALTER TABLE [dbo].[Authorizations] ADD  CONSTRAINT [DF_Authorizations_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [dbo].[Authorizations] ADD  CONSTRAINT [DF_Authorizations_LastUpdated]  DEFAULT (getdate()) FOR [LastUpdated]
GO
ALTER TABLE [dbo].[BlockedEmails] ADD  CONSTRAINT [DF_BlockedEmails_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [dbo].[BlockedEmails] ADD  CONSTRAINT [DF_BlockedEmails_LastUpdated]  DEFAULT (getdate()) FOR [LastUpdated]
GO
ALTER TABLE [dbo].[Contents] ADD  CONSTRAINT [DF_Contents_LastUpdated]  DEFAULT (getdate()) FOR [LastUpdated]
GO
ALTER TABLE [dbo].[Contents] ADD  CONSTRAINT [DF_Contents_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [dbo].[ContentTypes] ADD  CONSTRAINT [DF_ContentTypes_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [dbo].[ContentTypes] ADD  CONSTRAINT [DF_ContentTypes_LastUpdated]  DEFAULT (getdate()) FOR [LastUpdated]
GO
ALTER TABLE [dbo].[EmailHistories] ADD  CONSTRAINT [DF_EmailHistories_LastUpdated]  DEFAULT (getdate()) FOR [LastUpdated]
GO
ALTER TABLE [dbo].[EmailTemplates] ADD  CONSTRAINT [DF_EmailTemplates_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [dbo].[EmailTemplates] ADD  CONSTRAINT [DF_EmailTemplates_LastUpdated]  DEFAULT (getdate()) FOR [LastUpdated]
GO
ALTER TABLE [dbo].[Features] ADD  CONSTRAINT [DF_Features_IsEnabled]  DEFAULT ((1)) FOR [IsEnabled]
GO
ALTER TABLE [dbo].[Roles] ADD  CONSTRAINT [DF_Roles_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [dbo].[Roles] ADD  CONSTRAINT [DF_Roles_LastUpdated]  DEFAULT (getdate()) FOR [LastUpdated]
GO
ALTER TABLE [dbo].[Tiers] ADD  CONSTRAINT [DF_Tiers_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [dbo].[Tiers] ADD  CONSTRAINT [DF_Tiers_LastUpdated]  DEFAULT (getdate()) FOR [LastUpdated]
GO
ALTER TABLE [dbo].[UsageDimensions] ADD  CONSTRAINT [DF_UsageDimensions_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [dbo].[UsageDimensions] ADD  CONSTRAINT [DF_UsageDimensions_LastUpdated]  DEFAULT (getdate()) FOR [LastUpdated]
GO
ALTER TABLE [dbo].[UserRoles] ADD  CONSTRAINT [DF_UserRoles_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [dbo].[UserRoles] ADD  CONSTRAINT [DF_UserRoles_LastUpdated]  DEFAULT (getdate()) FOR [LastUpdated]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_IsEnabled]  DEFAULT ((1)) FOR [IsEnabled]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_HasLoggedIn]  DEFAULT ((0)) FOR [HasLoggedIn]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_IsLockedOut]  DEFAULT ((0)) FOR [IsLockedOut]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_IsInvited]  DEFAULT ((0)) FOR [IsInvited]
GO
ALTER TABLE [dbo].[ApiUsageLimits]  WITH CHECK ADD  CONSTRAINT [FK_ApiUsageLimits_ApiID_Apis] FOREIGN KEY([ApiID])
REFERENCES [dbo].[Apis] ([ApiID])
GO
ALTER TABLE [dbo].[ApiUsageLimits] CHECK CONSTRAINT [FK_ApiUsageLimits_ApiID_Apis]
GO
ALTER TABLE [dbo].[ApiUsageLimits]  WITH CHECK ADD  CONSTRAINT [FK_ApiUsageLimits_TierID_Tiers] FOREIGN KEY([TierID])
REFERENCES [dbo].[Tiers] ([TierID])
GO
ALTER TABLE [dbo].[ApiUsageLimits] CHECK CONSTRAINT [FK_ApiUsageLimits_TierID_Tiers]
GO
ALTER TABLE [dbo].[ApiUsageLimits]  WITH CHECK ADD  CONSTRAINT [FK_ApiUsageLimits_UsageDimensionID_UsageDimensions] FOREIGN KEY([UsageDimensionID])
REFERENCES [dbo].[UsageDimensions] ([UsageDimensionID])
GO
ALTER TABLE [dbo].[ApiUsageLimits] CHECK CONSTRAINT [FK_ApiUsageLimits_UsageDimensionID_UsageDimensions]
GO
ALTER TABLE [dbo].[ApiUsages]  WITH CHECK ADD  CONSTRAINT [FK_ApiUsages_ApiID_Apis] FOREIGN KEY([ApiID])
REFERENCES [dbo].[Apis] ([ApiID])
GO
ALTER TABLE [dbo].[ApiUsages] CHECK CONSTRAINT [FK_ApiUsages_ApiID_Apis]
GO
ALTER TABLE [dbo].[ApiUsages]  WITH CHECK ADD  CONSTRAINT [FK_ApiUsages_AuthorizationID_Authorizations] FOREIGN KEY([AuthorizationID])
REFERENCES [dbo].[Authorizations] ([AuthorizationID])
GO
ALTER TABLE [dbo].[ApiUsages] CHECK CONSTRAINT [FK_ApiUsages_AuthorizationID_Authorizations]
GO
ALTER TABLE [dbo].[ApiUsages]  WITH CHECK ADD  CONSTRAINT [FK_ApiUsages_UsageDimensionID_UsageDimensions] FOREIGN KEY([UsageDimensionID])
REFERENCES [dbo].[UsageDimensions] ([UsageDimensionID])
GO
ALTER TABLE [dbo].[ApiUsages] CHECK CONSTRAINT [FK_ApiUsages_UsageDimensionID_UsageDimensions]
GO
ALTER TABLE [dbo].[ApiUsages]  WITH CHECK ADD  CONSTRAINT [FK_ApiUsages_UserID_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[ApiUsages] CHECK CONSTRAINT [FK_ApiUsages_UserID_Users]
GO
ALTER TABLE [dbo].[Applications]  WITH CHECK ADD  CONSTRAINT [FK_Applications_UserID_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Applications] CHECK CONSTRAINT [FK_Applications_UserID_Users]
GO
ALTER TABLE [dbo].[Authorizations]  WITH CHECK ADD  CONSTRAINT [FK_Authorizations_UserID_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Authorizations] CHECK CONSTRAINT [FK_Authorizations_UserID_Users]
GO
ALTER TABLE [dbo].[Contents]  WITH CHECK ADD  CONSTRAINT [FK_Contents_ContentTypeID_ContentTypes] FOREIGN KEY([ContentTypeID])
REFERENCES [dbo].[ContentTypes] ([ContentTypeID])
GO
ALTER TABLE [dbo].[Contents] CHECK CONSTRAINT [FK_Contents_ContentTypeID_ContentTypes]
GO
ALTER TABLE [dbo].[EmailHistories]  WITH CHECK ADD  CONSTRAINT [FK_EmailHistories_EmailTemplateID_EmailTemplates] FOREIGN KEY([EmailTemplateID])
REFERENCES [dbo].[EmailTemplates] ([EmailTemplateID])
GO
ALTER TABLE [dbo].[EmailHistories] CHECK CONSTRAINT [FK_EmailHistories_EmailTemplateID_EmailTemplates]
GO
ALTER TABLE [dbo].[UserRoles]  WITH CHECK ADD  CONSTRAINT [FK_UserRoles_RoleID_Roles] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Roles] ([RoleID])
GO
ALTER TABLE [dbo].[UserRoles] CHECK CONSTRAINT [FK_UserRoles_RoleID_Roles]
GO
ALTER TABLE [dbo].[UserRoles]  WITH CHECK ADD  CONSTRAINT [FK_UserRoles_UserID_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[UserRoles] CHECK CONSTRAINT [FK_UserRoles_UserID_Users]
GO
/****** Object:  StoredProcedure [dbo].[ApiUsages_GetByUserID_Sp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[ApiUsages_GetByUserID_Sp]
	@UserID [int]
AS

    
    SELECT au.*, ud.UsageDimension, a.ApiKey, a2.Data as AuthorizationData
    FROM ApiUsages au WITH (NOLOCK) 
	JOIN UsageDimensions ud with (nolock) on au.UsageDimensionID = ud.UsageDimensionID
	JOIN Apis a with (nolock) on a.ApiID = au.ApiID
	JOIN Authorizations a2 with (nolock) on au.AuthorizationID = a2.AuthorizationID
    WHERE au.[UserID] = @UserID
GO
/****** Object:  StoredProcedure [dbo].[ApiUsages_GetByUserID_Sp_CountSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[ApiUsages_GetByUserID_Sp_CountSp]
	@UserID [int],
	@Search [nvarchar](255)
AS


	SET NOCOUNT ON

	
	SELECT		COUNT(*) as Total
	FROM		(
				SELECT au.*, ud.UsageDimension, a.ApiKey, a2.Data as AuthorizationData
    FROM ApiUsages au WITH (NOLOCK) 
	JOIN UsageDimensions ud with (nolock) on au.UsageDimensionID = ud.UsageDimensionID
	JOIN Apis a with (nolock) on a.ApiID = au.ApiID
	JOIN Authorizations a2 with (nolock) on au.AuthorizationID = a2.AuthorizationID
    WHERE au.[UserID] = @UserID
				) sub
	where		
					[ApiUsageID] like '%' + @Search + '%' or
					[UsageDimension] like '%' + @Search + '%' or
					[ApiKey] like '%' + @Search + '%' or
					[AuthorizationData] like '%' + @Search + '%' 
		
GO
/****** Object:  StoredProcedure [dbo].[ApiUsages_GetByUserID_Sp_PagingSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[ApiUsages_GetByUserID_Sp_PagingSp]
	@UserID [int],
	@Search [nvarchar](255),
	@SortColumn [nvarchar](255),
	@SortAscending [bit],
	@SkipRows [int],
	@NumRows [int]
AS


	SET NOCOUNT ON

	DECLARE	@FirstRow INT,
	@LastRow INT

	set @FirstRow = @SkipRows + 1;
	set @LastRow = @SkipRows + @NumRows;
	
	with SearchTable as
	(
	
		SELECT		ROW_NUMBER() OVER (
					ORDER BY
					
			
						case when @SortColumn = 'ApiUsageID' and @SortAscending = 1 then 
							[ApiUsageID]
						end ASC,
						case when @SortColumn = 'ApiUsageID' and @SortAscending = 0 then 
							[ApiUsageID]
						end DESC,
			
						case when @SortColumn = 'UsageDimensionID' and @SortAscending = 1 then 
							[UsageDimensionID]
						end ASC,
						case when @SortColumn = 'UsageDimensionID' and @SortAscending = 0 then 
							[UsageDimensionID]
						end DESC,
			
						case when @SortColumn = 'UserID' and @SortAscending = 1 then 
							[UserID]
						end ASC,
						case when @SortColumn = 'UserID' and @SortAscending = 0 then 
							[UserID]
						end DESC,
			
						case when @SortColumn = 'AuthorizationID' and @SortAscending = 1 then 
							[AuthorizationID]
						end ASC,
						case when @SortColumn = 'AuthorizationID' and @SortAscending = 0 then 
							[AuthorizationID]
						end DESC,
			
						case when @SortColumn = 'ApiID' and @SortAscending = 1 then 
							[ApiID]
						end ASC,
						case when @SortColumn = 'ApiID' and @SortAscending = 0 then 
							[ApiID]
						end DESC,
			
						case when @SortColumn = 'Usage' and @SortAscending = 1 then 
							[Usage]
						end ASC,
						case when @SortColumn = 'Usage' and @SortAscending = 0 then 
							[Usage]
						end DESC,
			
						case when @SortColumn = 'CostPerUnit' and @SortAscending = 1 then 
							[CostPerUnit]
						end ASC,
						case when @SortColumn = 'CostPerUnit' and @SortAscending = 0 then 
							[CostPerUnit]
						end DESC,
			
						case when @SortColumn = 'Data' and @SortAscending = 1 then 
							[Data]
						end ASC,
						case when @SortColumn = 'Data' and @SortAscending = 0 then 
							[Data]
						end DESC,
			
						case when @SortColumn = 'DateCreated' and @SortAscending = 1 then 
							[DateCreated]
						end ASC,
						case when @SortColumn = 'DateCreated' and @SortAscending = 0 then 
							[DateCreated]
						end DESC,
			
						case when @SortColumn = 'LastUpdated' and @SortAscending = 1 then 
							[LastUpdated]
						end ASC,
						case when @SortColumn = 'LastUpdated' and @SortAscending = 0 then 
							[LastUpdated]
						end DESC,
			
						case when @SortColumn = 'UsageDimension' and @SortAscending = 1 then 
							[UsageDimension]
						end ASC,
						case when @SortColumn = 'UsageDimension' and @SortAscending = 0 then 
							[UsageDimension]
						end DESC,
			
						case when @SortColumn = 'ApiKey' and @SortAscending = 1 then 
							[ApiKey]
						end ASC,
						case when @SortColumn = 'ApiKey' and @SortAscending = 0 then 
							[ApiKey]
						end DESC,
			
						case when @SortColumn = 'AuthorizationData' and @SortAscending = 1 then 
							[AuthorizationData]
						end ASC,
						case when @SortColumn = 'AuthorizationData' and @SortAscending = 0 then 
							[AuthorizationData]
						end DESC									
					) AS RowNumber,
					*
		FROM		(
					SELECT au.*, ud.UsageDimension, a.ApiKey, a2.Data as AuthorizationData
    FROM ApiUsages au WITH (NOLOCK) 
	JOIN UsageDimensions ud with (nolock) on au.UsageDimensionID = ud.UsageDimensionID
	JOIN Apis a with (nolock) on a.ApiID = au.ApiID
	JOIN Authorizations a2 with (nolock) on au.AuthorizationID = a2.AuthorizationID
    WHERE au.[UserID] = @UserID
					) sub
		where		
					[ApiUsageID] like '%' + @Search + '%' or
					[UsageDimension] like '%' + @Search + '%' or
					[ApiKey] like '%' + @Search + '%' or
					[AuthorizationData] like '%' + @Search + '%' 
	)
			
	SELECT	*
	FROM	SearchTable
	WHERE	RowNumber BETWEEN @FirstRow AND @LastRow
	ORDER BY RowNumber ASC
	OPTION (recompile);
	
	
		
GO
/****** Object:  StoredProcedure [dbo].[Authorization_Get_Sp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
create PROCEDURE [dbo].[Authorization_Get_Sp]
	@AuthorizationToken [nvarchar](255)
AS

    declare @AuthorizationID int 

	
    SELECT @AuthorizationID = AuthorizationID
    FROM Authorizations WITH (NOLOCK) 
    WHERE [AuthorizationToken] = @AuthorizationToken


	update Authorizations 
	set LastActivityDate = getdate(),
		IsExpired = iif(Expiration < getdate(), 1, 0)
	where AuthorizationID = @AuthorizationID

	SELECT *
    FROM Authorizations WITH (NOLOCK) 
    WHERE AuthorizationID = @AuthorizationID
GO
/****** Object:  StoredProcedure [dbo].[CopyApiSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CopyApiSp]
	@ApiID [int]
AS

    -- Automatically generated on 1/31/2024 10:23:40 AM.
    
    INSERT INTO Apis
    (
            [ApiKey], 
            [Data], 
            [DateCreated], 
            [LastUpdated]
    )
    SELECT
            [ApiKey] + ' - Copy', 
            [Data], 
            getdate(), 
            getdate()
    FROM [Apis]
    WHERE ApiID = @ApiID
    SELECT scope_identity() as ApiID

GO
/****** Object:  StoredProcedure [dbo].[CopyApiUsageLimitSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CopyApiUsageLimitSp]
	@ApiUsageLimitID [int]
AS

    -- Automatically generated on 1/31/2024 10:23:40 AM.
    
    INSERT INTO ApiUsageLimits
    (
            [ApiID], 
            [TierID], 
            [UsageDimensionID], 
            [Limit], 
            [Data], 
            [DateCreated], 
            [LastUpdated]
    )
    SELECT
            [ApiID], 
            [TierID], 
            [UsageDimensionID], 
            [Limit], 
            [Data], 
            getdate(), 
            getdate()
    FROM [ApiUsageLimits]
    WHERE ApiUsageLimitID = @ApiUsageLimitID
    SELECT scope_identity() as ApiUsageLimitID

GO
/****** Object:  StoredProcedure [dbo].[CopyApiUsageSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CopyApiUsageSp]
	@ApiUsageID [int]
AS

    -- Automatically generated on 1/31/2024 10:23:40 AM.
    
    INSERT INTO ApiUsages
    (
            [UsageDimensionID], 
            [UserID], 
            [AuthorizationID], 
            [ApiID], 
            [Usage], 
            [CostPerUnit], 
            [Data], 
            [DateCreated], 
            [LastUpdated]
    )
    SELECT
            [UsageDimensionID], 
            [UserID], 
            [AuthorizationID], 
            [ApiID], 
            [Usage], 
            [CostPerUnit], 
            [Data], 
            getdate(), 
            getdate()
    FROM [ApiUsages]
    WHERE ApiUsageID = @ApiUsageID
    SELECT scope_identity() as ApiUsageID

GO
/****** Object:  StoredProcedure [dbo].[CopyApplicationSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CopyApplicationSp]
	@ApplicationID [int]
AS

    -- Automatically generated on 6/19/2024 1:57:54 PM.
    
    INSERT INTO Applications
    (
            [ApplicationName], 
            [URL], 
            [ApplicationType], 
            [DateCreated], 
            [LastUpdated], 
            [Data], 
            [UserID]
    )
    SELECT
            [ApplicationName] + ' - Copy', 
            [URL], 
            [ApplicationType], 
            getdate(), 
            getdate(), 
            [Data], 
            [UserID]
    FROM [Applications]
    WHERE ApplicationID = @ApplicationID
    SELECT scope_identity() as ApplicationID

GO
/****** Object:  StoredProcedure [dbo].[CopyAuthorizationSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CopyAuthorizationSp]
	@AuthorizationID [int]
AS

    -- Automatically generated on 1/31/2024 10:23:40 AM.
    
    INSERT INTO Authorizations
    (
            [AuthorizationToken], 
            [RefreshToken], 
            [Expiration], 
            [UserID], 
            [LastRefreshedDate], 
            [LastActivityDate], 
            [IsExpired], 
            [IsRevoked], 
            [IsEncrypted], 
            [Data], 
            [DateCreated], 
            [LastUpdated]
    )
    SELECT
            [AuthorizationToken] + ' - Copy', 
            [RefreshToken] + ' - Copy', 
            [Expiration], 
            [UserID], 
            [LastRefreshedDate], 
            [LastActivityDate], 
            [IsExpired], 
            [IsRevoked], 
            [IsEncrypted], 
            [Data], 
            getdate(), 
            getdate()
    FROM [Authorizations]
    WHERE AuthorizationID = @AuthorizationID
    SELECT scope_identity() as AuthorizationID
GO
/****** Object:  StoredProcedure [dbo].[CopyBlockedEmailSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CopyBlockedEmailSp]
	@BlockedEmailID [int]
AS

    -- Automatically generated on 7/18/2024 5:57:46 PM.
    
    INSERT INTO BlockedEmails
    (
            [Email], 
            [Notes], 
            [Data], 
            [DateCreated], 
            [LastUpdated]
    )
    SELECT
            [Email] + ' - Copy', 
            [Notes], 
            [Data], 
            getdate(), 
            getdate()
    FROM [BlockedEmails]
    WHERE BlockedEmailID = @BlockedEmailID
    SELECT scope_identity() as BlockedEmailID

GO
/****** Object:  StoredProcedure [dbo].[CopyContentSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CopyContentSp]
	@ContentID [int]
AS

    -- Automatically generated on 8/23/2024 9:58:34 AM.
    
    INSERT INTO Contents
    (
            [ContentName], 
            [Content], 
            [LastUpdated], 
            [DateCreated], 
            [Data], 
            [ContentTypeID]
    )
    SELECT
            [ContentName] + ' - Copy', 
            [Content], 
            getdate(), 
            getdate(), 
            [Data], 
            [ContentTypeID]
    FROM [Contents]
    WHERE ContentID = @ContentID
    SELECT scope_identity() as ContentID

GO
/****** Object:  StoredProcedure [dbo].[CopyContentTypeSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CopyContentTypeSp]
	@ContentTypeID [int]
AS

    -- Automatically generated on 8/23/2024 9:58:34 AM.
    
    INSERT INTO ContentTypes
    (
            [ContentTypeName], 
            [Data], 
            [DateCreated], 
            [LastUpdated]
    )
    SELECT
            [ContentTypeName] + ' - Copy', 
            [Data], 
            getdate(), 
            getdate()
    FROM [ContentTypes]
    WHERE ContentTypeID = @ContentTypeID
    SELECT scope_identity() as ContentTypeID

GO
/****** Object:  StoredProcedure [dbo].[CopyEmailHistorySp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CopyEmailHistorySp]
	@EmailHistoryID [int]
AS

    -- Automatically generated on 7/18/2024 5:57:46 PM.
    
    INSERT INTO EmailHistories
    (
            [To], 
            [From], 
            [EmailTemplateID], 
            [Subject], 
            [Email], 
            [DateCreated], 
            [IsPending], 
            [IsSent], 
            [Data], 
            [LastUpdated]
    )
    SELECT
            [To], 
            [From], 
            [EmailTemplateID], 
            [Subject], 
            [Email], 
            getdate(), 
            [IsPending], 
            [IsSent], 
            [Data], 
            getdate()
    FROM [EmailHistories]
    WHERE EmailHistoryID = @EmailHistoryID
    SELECT scope_identity() as EmailHistoryID

GO
/****** Object:  StoredProcedure [dbo].[CopyEmailTemplateSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CopyEmailTemplateSp]
	@EmailTemplateID [int]
AS

    -- Automatically generated on 7/18/2024 5:57:46 PM.
    
    INSERT INTO EmailTemplates
    (
            [Name], 
            [EmailSubject], 
            [EmailText], 
            [EmailParams], 
            [FromAddress], 
            [DateCreated], 
            [LastUpdated], 
            [Data]
    )
    SELECT
            [Name] + ' - Copy', 
            [EmailSubject], 
            [EmailText], 
            [EmailParams], 
            [FromAddress], 
            getdate(), 
            getdate(), 
            [Data]
    FROM [EmailTemplates]
    WHERE EmailTemplateID = @EmailTemplateID
    SELECT scope_identity() as EmailTemplateID

GO
/****** Object:  StoredProcedure [dbo].[CopyFeatureSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CopyFeatureSp]
	@FeatureID [int]
AS

    -- Automatically generated on 1/20/2024 5:38:31 AM.
    
    INSERT INTO Features
    (
            [FeatureName], 
            [Version], 
            [IsEnabled], 
            [SettingsAssembly], 
            [SettingsClass], 
            [Settings], 
            [DateCreated], 
            [LastUpdated], 
            [Data]
    )
    SELECT
            [FeatureName] + ' - Copy', 
            [Version], 
            [IsEnabled], 
            [SettingsAssembly], 
            [SettingsClass], 
            [Settings], 
            getdate(), 
            getdate(), 
            [Data]
    FROM [Features]
    WHERE FeatureID = @FeatureID
    SELECT scope_identity() as FeatureID
GO
/****** Object:  StoredProcedure [dbo].[CopyPageLayoutSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CopyPageLayoutSp]
	@PageLayoutID [int]
AS

    -- Automatically generated on 1/20/2024 5:38:31 AM.
    
    INSERT INTO PageLayouts
    (
            [LayoutID], 
            [Url], 
            [Handler], 
            [IsEnabled], 
            [DateCreated], 
            [LastUpdated], 
            [KeywordsMetaTag], 
            [DescriptionMetaTag], 
            [PageTitle], 
            [RoleID], 
            [Priority], 
            [SiteID]
    )
    SELECT
            [LayoutID], 
            [Url] + ' - Copy', 
            [Handler], 
            [IsEnabled], 
            getdate(), 
            getdate(), 
            [KeywordsMetaTag], 
            [DescriptionMetaTag], 
            [PageTitle], 
            [RoleID], 
            [Priority], 
            [SiteID]
    FROM [PageLayouts]
    WHERE PageLayoutID = @PageLayoutID
    SELECT scope_identity() as PageLayoutID
GO
/****** Object:  StoredProcedure [dbo].[CopyRoleSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CopyRoleSp]
	@RoleID [int]
AS

    -- Automatically generated on 1/31/2024 10:23:40 AM.
    
    INSERT INTO Roles
    (
            [RoleName], 
            [DateCreated], 
            [LastUpdated], 
            [Data]
    )
    SELECT
            [RoleName] + ' - Copy', 
            getdate(), 
            getdate(), 
            [Data]
    FROM [Roles]
    WHERE RoleID = @RoleID
    SELECT scope_identity() as RoleID
GO
/****** Object:  StoredProcedure [dbo].[CopyTierSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CopyTierSp]
	@TierID [int]
AS

    -- Automatically generated on 1/31/2024 10:23:40 AM.
    
    INSERT INTO Tiers
    (
            [TierName], 
            [Data], 
            [DateCreated], 
            [LastUpdated]
    )
    SELECT
            [TierName] + ' - Copy', 
            [Data], 
            getdate(), 
            getdate()
    FROM [Tiers]
    WHERE TierID = @TierID
    SELECT scope_identity() as TierID

GO
/****** Object:  StoredProcedure [dbo].[CopyUsageDimensionSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CopyUsageDimensionSp]
	@UsageDimensionID [int]
AS

    -- Automatically generated on 1/31/2024 10:23:40 AM.
    
    INSERT INTO UsageDimensions
    (
            [UsageDimension], 
            [DateCreated], 
            [LastUpdated], 
            [Data]
    )
    SELECT
            [UsageDimension] + ' - Copy', 
            getdate(), 
            getdate(), 
            [Data]
    FROM [UsageDimensions]
    WHERE UsageDimensionID = @UsageDimensionID
    SELECT scope_identity() as UsageDimensionID

GO
/****** Object:  StoredProcedure [dbo].[CopyUserRoleSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CopyUserRoleSp]
	@UserRoleID [int]
AS

    -- Automatically generated on 1/31/2024 10:23:40 AM.
    
    INSERT INTO UserRoles
    (
            [UserID], 
            [RoleID], 
            [DateCreated], 
            [LastUpdated], 
            [Data]
    )
    SELECT
            [UserID], 
            [RoleID], 
            getdate(), 
            getdate(), 
            [Data]
    FROM [UserRoles]
    WHERE UserRoleID = @UserRoleID
    SELECT scope_identity() as UserRoleID
GO
/****** Object:  StoredProcedure [dbo].[CopyUserSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CopyUserSp]
	@UserID [int]
AS

    -- Automatically generated on 1/31/2024 10:23:40 AM.
    
    INSERT INTO Users
    (
            [IsEnabled], 
            [DateCreated], 
            [LastUpdated], 
            [Data], 
            [Email], 
            [Phone], 
            [Password], 
            [HasLoggedIn], 
            [LastLoginDate], 
            [IsLockedOut], 
            [InvitationCode], 
            [InvitationExpiration], 
            [IsInvited], 
            [InvitedDate]
    )
    SELECT
            [IsEnabled], 
            getdate(), 
            getdate(), 
            [Data], 
            [Email] + ' - Copy', 
            [Phone], 
            [Password], 
            [HasLoggedIn], 
            [LastLoginDate], 
            [IsLockedOut], 
            [InvitationCode], 
            [InvitationExpiration], 
            [IsInvited], 
            [InvitedDate]
    FROM [Users]
    WHERE UserID = @UserID
    SELECT scope_identity() as UserID
GO
/****** Object:  StoredProcedure [dbo].[GetApiByApiKeySp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[GetApiByApiKeySp]
	@ApiKey [nvarchar](255)
AS

    -- Automatically generated on 1/31/2024 10:23:40 AM.
    
    SELECT *
    FROM Apis WITH (NOLOCK) 
    WHERE [ApiKey] = @ApiKey
GO
/****** Object:  StoredProcedure [dbo].[GetApiSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[GetApiSp]
	@ApiID [int]
AS

    -- Automatically generated on 1/31/2024 10:23:40 AM.
    
    SELECT *
    FROM Apis WITH (NOLOCK) 
     WHERE ApiID = @ApiID

GO
/****** Object:  StoredProcedure [dbo].[GetApisSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[GetApisSp]
AS

    -- Automatically generated on 1/31/2024 10:23:40 AM.
    
    SELECT *
    FROM Apis WITH (NOLOCK) 
GO
/****** Object:  StoredProcedure [dbo].[GetApisSp_CountSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[GetApisSp_CountSp]
	@Search [nvarchar](255)
AS


	SET NOCOUNT ON

	
	SELECT		COUNT(*) as Total
	FROM		(
				-- Automatically generated on 1/31/2024 10:23:40 AM.
    
    SELECT *
    FROM Apis WITH (NOLOCK) 
				) sub
	where		
					[ApiID] like '%' + @Search + '%' or
					[ApiKey] like '%' + @Search + '%' 
		
GO
/****** Object:  StoredProcedure [dbo].[GetApisSp_PagingSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[GetApisSp_PagingSp]
	@Search [nvarchar](255),
	@SortColumn [nvarchar](255),
	@SortAscending [bit],
	@SkipRows [int],
	@NumRows [int]
AS


	SET NOCOUNT ON

	DECLARE	@FirstRow INT,
	@LastRow INT

	set @FirstRow = @SkipRows + 1;
	set @LastRow = @SkipRows + @NumRows;
	
	with SearchTable as
	(
	
		SELECT		ROW_NUMBER() OVER (
					ORDER BY
					
			
						case when @SortColumn = 'ApiID' and @SortAscending = 1 then 
							[ApiID]
						end ASC,
						case when @SortColumn = 'ApiID' and @SortAscending = 0 then 
							[ApiID]
						end DESC,
			
						case when @SortColumn = 'ApiKey' and @SortAscending = 1 then 
							[ApiKey]
						end ASC,
						case when @SortColumn = 'ApiKey' and @SortAscending = 0 then 
							[ApiKey]
						end DESC,
			
						case when @SortColumn = 'Data' and @SortAscending = 1 then 
							[Data]
						end ASC,
						case when @SortColumn = 'Data' and @SortAscending = 0 then 
							[Data]
						end DESC,
			
						case when @SortColumn = 'DateCreated' and @SortAscending = 1 then 
							[DateCreated]
						end ASC,
						case when @SortColumn = 'DateCreated' and @SortAscending = 0 then 
							[DateCreated]
						end DESC,
			
						case when @SortColumn = 'LastUpdated' and @SortAscending = 1 then 
							[LastUpdated]
						end ASC,
						case when @SortColumn = 'LastUpdated' and @SortAscending = 0 then 
							[LastUpdated]
						end DESC									
					) AS RowNumber,
					*
		FROM		(
					-- Automatically generated on 1/31/2024 10:23:40 AM.
    
    SELECT *
    FROM Apis WITH (NOLOCK) 
					) sub
		where		
					[ApiID] like '%' + @Search + '%' or
					[ApiKey] like '%' + @Search + '%' 
	)
			
	SELECT	*
	FROM	SearchTable
	WHERE	RowNumber BETWEEN @FirstRow AND @LastRow
	ORDER BY RowNumber ASC
	OPTION (recompile);
	
	
		
GO
/****** Object:  StoredProcedure [dbo].[GetApiUsageLimitsByApiIDSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[GetApiUsageLimitsByApiIDSp]
	@ApiID [int]
AS

    -- Automatically generated on 1/31/2024 10:23:40 AM.
    
    SELECT *
    FROM ApiUsageLimits WITH (NOLOCK) 
    WHERE [ApiID] = @ApiID
GO
/****** Object:  StoredProcedure [dbo].[GetApiUsageLimitsByApiIDSp_CountSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[GetApiUsageLimitsByApiIDSp_CountSp]
	@ApiID [int],
	@Search [nvarchar](255)
AS


	SET NOCOUNT ON

	
	SELECT		COUNT(*) as Total
	FROM		(
				-- Automatically generated on 1/31/2024 10:23:40 AM.
    
    SELECT *
    FROM ApiUsageLimits WITH (NOLOCK) 
    WHERE [ApiID] = @ApiID
				) sub
	where		
					[ApiUsageLimitID] like '%' + @Search + '%' 
		
GO
/****** Object:  StoredProcedure [dbo].[GetApiUsageLimitsByApiIDSp_PagingSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[GetApiUsageLimitsByApiIDSp_PagingSp]
	@ApiID [int],
	@Search [nvarchar](255),
	@SortColumn [nvarchar](255),
	@SortAscending [bit],
	@SkipRows [int],
	@NumRows [int]
AS


	SET NOCOUNT ON

	DECLARE	@FirstRow INT,
	@LastRow INT

	set @FirstRow = @SkipRows + 1;
	set @LastRow = @SkipRows + @NumRows;
	
	with SearchTable as
	(
	
		SELECT		ROW_NUMBER() OVER (
					ORDER BY
					
			
						case when @SortColumn = 'ApiUsageLimitID' and @SortAscending = 1 then 
							[ApiUsageLimitID]
						end ASC,
						case when @SortColumn = 'ApiUsageLimitID' and @SortAscending = 0 then 
							[ApiUsageLimitID]
						end DESC,
			
						case when @SortColumn = 'ApiID' and @SortAscending = 1 then 
							[ApiID]
						end ASC,
						case when @SortColumn = 'ApiID' and @SortAscending = 0 then 
							[ApiID]
						end DESC,
			
						case when @SortColumn = 'TierID' and @SortAscending = 1 then 
							[TierID]
						end ASC,
						case when @SortColumn = 'TierID' and @SortAscending = 0 then 
							[TierID]
						end DESC,
			
						case when @SortColumn = 'UsageDimensionID' and @SortAscending = 1 then 
							[UsageDimensionID]
						end ASC,
						case when @SortColumn = 'UsageDimensionID' and @SortAscending = 0 then 
							[UsageDimensionID]
						end DESC,
			
						case when @SortColumn = 'Limit' and @SortAscending = 1 then 
							[Limit]
						end ASC,
						case when @SortColumn = 'Limit' and @SortAscending = 0 then 
							[Limit]
						end DESC,
			
						case when @SortColumn = 'Data' and @SortAscending = 1 then 
							[Data]
						end ASC,
						case when @SortColumn = 'Data' and @SortAscending = 0 then 
							[Data]
						end DESC,
			
						case when @SortColumn = 'DateCreated' and @SortAscending = 1 then 
							[DateCreated]
						end ASC,
						case when @SortColumn = 'DateCreated' and @SortAscending = 0 then 
							[DateCreated]
						end DESC,
			
						case when @SortColumn = 'LastUpdated' and @SortAscending = 1 then 
							[LastUpdated]
						end ASC,
						case when @SortColumn = 'LastUpdated' and @SortAscending = 0 then 
							[LastUpdated]
						end DESC									
					) AS RowNumber,
					*
		FROM		(
					-- Automatically generated on 1/31/2024 10:23:40 AM.
    
    SELECT *
    FROM ApiUsageLimits WITH (NOLOCK) 
    WHERE [ApiID] = @ApiID
					) sub
		where		
					[ApiUsageLimitID] like '%' + @Search + '%' 
	)
			
	SELECT	*
	FROM	SearchTable
	WHERE	RowNumber BETWEEN @FirstRow AND @LastRow
	ORDER BY RowNumber ASC
	OPTION (recompile);
	
	
		
GO
/****** Object:  StoredProcedure [dbo].[GetApiUsageLimitsByTierIDSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[GetApiUsageLimitsByTierIDSp]
	@TierID [int]
AS

    -- Automatically generated on 1/31/2024 10:23:40 AM.
    
    SELECT *
    FROM ApiUsageLimits WITH (NOLOCK) 
    WHERE [TierID] = @TierID
GO
/****** Object:  StoredProcedure [dbo].[GetApiUsageLimitsByTierIDSp_CountSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[GetApiUsageLimitsByTierIDSp_CountSp]
	@TierID [int],
	@Search [nvarchar](255)
AS


	SET NOCOUNT ON

	
	SELECT		COUNT(*) as Total
	FROM		(
				-- Automatically generated on 1/31/2024 10:23:40 AM.
    
    SELECT *
    FROM ApiUsageLimits WITH (NOLOCK) 
    WHERE [TierID] = @TierID
				) sub
	where		
					[ApiUsageLimitID] like '%' + @Search + '%' 
		
GO
/****** Object:  StoredProcedure [dbo].[GetApiUsageLimitsByTierIDSp_PagingSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[GetApiUsageLimitsByTierIDSp_PagingSp]
	@TierID [int],
	@Search [nvarchar](255),
	@SortColumn [nvarchar](255),
	@SortAscending [bit],
	@SkipRows [int],
	@NumRows [int]
AS


	SET NOCOUNT ON

	DECLARE	@FirstRow INT,
	@LastRow INT

	set @FirstRow = @SkipRows + 1;
	set @LastRow = @SkipRows + @NumRows;
	
	with SearchTable as
	(
	
		SELECT		ROW_NUMBER() OVER (
					ORDER BY
					
			
						case when @SortColumn = 'ApiUsageLimitID' and @SortAscending = 1 then 
							[ApiUsageLimitID]
						end ASC,
						case when @SortColumn = 'ApiUsageLimitID' and @SortAscending = 0 then 
							[ApiUsageLimitID]
						end DESC,
			
						case when @SortColumn = 'ApiID' and @SortAscending = 1 then 
							[ApiID]
						end ASC,
						case when @SortColumn = 'ApiID' and @SortAscending = 0 then 
							[ApiID]
						end DESC,
			
						case when @SortColumn = 'TierID' and @SortAscending = 1 then 
							[TierID]
						end ASC,
						case when @SortColumn = 'TierID' and @SortAscending = 0 then 
							[TierID]
						end DESC,
			
						case when @SortColumn = 'UsageDimensionID' and @SortAscending = 1 then 
							[UsageDimensionID]
						end ASC,
						case when @SortColumn = 'UsageDimensionID' and @SortAscending = 0 then 
							[UsageDimensionID]
						end DESC,
			
						case when @SortColumn = 'Limit' and @SortAscending = 1 then 
							[Limit]
						end ASC,
						case when @SortColumn = 'Limit' and @SortAscending = 0 then 
							[Limit]
						end DESC,
			
						case when @SortColumn = 'Data' and @SortAscending = 1 then 
							[Data]
						end ASC,
						case when @SortColumn = 'Data' and @SortAscending = 0 then 
							[Data]
						end DESC,
			
						case when @SortColumn = 'DateCreated' and @SortAscending = 1 then 
							[DateCreated]
						end ASC,
						case when @SortColumn = 'DateCreated' and @SortAscending = 0 then 
							[DateCreated]
						end DESC,
			
						case when @SortColumn = 'LastUpdated' and @SortAscending = 1 then 
							[LastUpdated]
						end ASC,
						case when @SortColumn = 'LastUpdated' and @SortAscending = 0 then 
							[LastUpdated]
						end DESC									
					) AS RowNumber,
					*
		FROM		(
					-- Automatically generated on 1/31/2024 10:23:40 AM.
    
    SELECT *
    FROM ApiUsageLimits WITH (NOLOCK) 
    WHERE [TierID] = @TierID
					) sub
		where		
					[ApiUsageLimitID] like '%' + @Search + '%' 
	)
			
	SELECT	*
	FROM	SearchTable
	WHERE	RowNumber BETWEEN @FirstRow AND @LastRow
	ORDER BY RowNumber ASC
	OPTION (recompile);
	
	
		
GO
/****** Object:  StoredProcedure [dbo].[GetApiUsageLimitsByUsageDimensionIDSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[GetApiUsageLimitsByUsageDimensionIDSp]
	@UsageDimensionID [int]
AS

    -- Automatically generated on 1/31/2024 10:23:40 AM.
    
    SELECT *
    FROM ApiUsageLimits WITH (NOLOCK) 
    WHERE [UsageDimensionID] = @UsageDimensionID
GO
/****** Object:  StoredProcedure [dbo].[GetApiUsageLimitsByUsageDimensionIDSp_CountSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[GetApiUsageLimitsByUsageDimensionIDSp_CountSp]
	@UsageDimensionID [int],
	@Search [nvarchar](255)
AS


	SET NOCOUNT ON

	
	SELECT		COUNT(*) as Total
	FROM		(
				-- Automatically generated on 1/31/2024 10:23:40 AM.
    
    SELECT *
    FROM ApiUsageLimits WITH (NOLOCK) 
    WHERE [UsageDimensionID] = @UsageDimensionID
				) sub
	where		
					[ApiUsageLimitID] like '%' + @Search + '%' 
		
GO
/****** Object:  StoredProcedure [dbo].[GetApiUsageLimitsByUsageDimensionIDSp_PagingSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[GetApiUsageLimitsByUsageDimensionIDSp_PagingSp]
	@UsageDimensionID [int],
	@Search [nvarchar](255),
	@SortColumn [nvarchar](255),
	@SortAscending [bit],
	@SkipRows [int],
	@NumRows [int]
AS


	SET NOCOUNT ON

	DECLARE	@FirstRow INT,
	@LastRow INT

	set @FirstRow = @SkipRows + 1;
	set @LastRow = @SkipRows + @NumRows;
	
	with SearchTable as
	(
	
		SELECT		ROW_NUMBER() OVER (
					ORDER BY
					
			
						case when @SortColumn = 'ApiUsageLimitID' and @SortAscending = 1 then 
							[ApiUsageLimitID]
						end ASC,
						case when @SortColumn = 'ApiUsageLimitID' and @SortAscending = 0 then 
							[ApiUsageLimitID]
						end DESC,
			
						case when @SortColumn = 'ApiID' and @SortAscending = 1 then 
							[ApiID]
						end ASC,
						case when @SortColumn = 'ApiID' and @SortAscending = 0 then 
							[ApiID]
						end DESC,
			
						case when @SortColumn = 'TierID' and @SortAscending = 1 then 
							[TierID]
						end ASC,
						case when @SortColumn = 'TierID' and @SortAscending = 0 then 
							[TierID]
						end DESC,
			
						case when @SortColumn = 'UsageDimensionID' and @SortAscending = 1 then 
							[UsageDimensionID]
						end ASC,
						case when @SortColumn = 'UsageDimensionID' and @SortAscending = 0 then 
							[UsageDimensionID]
						end DESC,
			
						case when @SortColumn = 'Limit' and @SortAscending = 1 then 
							[Limit]
						end ASC,
						case when @SortColumn = 'Limit' and @SortAscending = 0 then 
							[Limit]
						end DESC,
			
						case when @SortColumn = 'Data' and @SortAscending = 1 then 
							[Data]
						end ASC,
						case when @SortColumn = 'Data' and @SortAscending = 0 then 
							[Data]
						end DESC,
			
						case when @SortColumn = 'DateCreated' and @SortAscending = 1 then 
							[DateCreated]
						end ASC,
						case when @SortColumn = 'DateCreated' and @SortAscending = 0 then 
							[DateCreated]
						end DESC,
			
						case when @SortColumn = 'LastUpdated' and @SortAscending = 1 then 
							[LastUpdated]
						end ASC,
						case when @SortColumn = 'LastUpdated' and @SortAscending = 0 then 
							[LastUpdated]
						end DESC									
					) AS RowNumber,
					*
		FROM		(
					-- Automatically generated on 1/31/2024 10:23:40 AM.
    
    SELECT *
    FROM ApiUsageLimits WITH (NOLOCK) 
    WHERE [UsageDimensionID] = @UsageDimensionID
					) sub
		where		
					[ApiUsageLimitID] like '%' + @Search + '%' 
	)
			
	SELECT	*
	FROM	SearchTable
	WHERE	RowNumber BETWEEN @FirstRow AND @LastRow
	ORDER BY RowNumber ASC
	OPTION (recompile);
	
	
		
GO
/****** Object:  StoredProcedure [dbo].[GetApiUsageLimitSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[GetApiUsageLimitSp]
	@ApiUsageLimitID [int]
AS

    -- Automatically generated on 1/31/2024 10:23:40 AM.
    
    SELECT *
    FROM ApiUsageLimits WITH (NOLOCK) 
     WHERE ApiUsageLimitID = @ApiUsageLimitID

GO
/****** Object:  StoredProcedure [dbo].[GetApiUsageLimitsSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[GetApiUsageLimitsSp]
AS

    -- Automatically generated on 1/31/2024 10:23:40 AM.
    
    SELECT *
    FROM ApiUsageLimits WITH (NOLOCK) 
GO
/****** Object:  StoredProcedure [dbo].[GetApiUsageLimitsSp_CountSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[GetApiUsageLimitsSp_CountSp]
	@Search [nvarchar](255)
AS


	SET NOCOUNT ON

	
	SELECT		COUNT(*) as Total
	FROM		(
				-- Automatically generated on 1/31/2024 10:23:40 AM.
    
    SELECT *
    FROM ApiUsageLimits WITH (NOLOCK) 
				) sub
	where		
					[ApiUsageLimitID] like '%' + @Search + '%' 
		
GO
/****** Object:  StoredProcedure [dbo].[GetApiUsageLimitsSp_PagingSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[GetApiUsageLimitsSp_PagingSp]
	@Search [nvarchar](255),
	@SortColumn [nvarchar](255),
	@SortAscending [bit],
	@SkipRows [int],
	@NumRows [int]
AS


	SET NOCOUNT ON

	DECLARE	@FirstRow INT,
	@LastRow INT

	set @FirstRow = @SkipRows + 1;
	set @LastRow = @SkipRows + @NumRows;
	
	with SearchTable as
	(
	
		SELECT		ROW_NUMBER() OVER (
					ORDER BY
					
			
						case when @SortColumn = 'ApiUsageLimitID' and @SortAscending = 1 then 
							[ApiUsageLimitID]
						end ASC,
						case when @SortColumn = 'ApiUsageLimitID' and @SortAscending = 0 then 
							[ApiUsageLimitID]
						end DESC,
			
						case when @SortColumn = 'ApiID' and @SortAscending = 1 then 
							[ApiID]
						end ASC,
						case when @SortColumn = 'ApiID' and @SortAscending = 0 then 
							[ApiID]
						end DESC,
			
						case when @SortColumn = 'TierID' and @SortAscending = 1 then 
							[TierID]
						end ASC,
						case when @SortColumn = 'TierID' and @SortAscending = 0 then 
							[TierID]
						end DESC,
			
						case when @SortColumn = 'UsageDimensionID' and @SortAscending = 1 then 
							[UsageDimensionID]
						end ASC,
						case when @SortColumn = 'UsageDimensionID' and @SortAscending = 0 then 
							[UsageDimensionID]
						end DESC,
			
						case when @SortColumn = 'Limit' and @SortAscending = 1 then 
							[Limit]
						end ASC,
						case when @SortColumn = 'Limit' and @SortAscending = 0 then 
							[Limit]
						end DESC,
			
						case when @SortColumn = 'Data' and @SortAscending = 1 then 
							[Data]
						end ASC,
						case when @SortColumn = 'Data' and @SortAscending = 0 then 
							[Data]
						end DESC,
			
						case when @SortColumn = 'DateCreated' and @SortAscending = 1 then 
							[DateCreated]
						end ASC,
						case when @SortColumn = 'DateCreated' and @SortAscending = 0 then 
							[DateCreated]
						end DESC,
			
						case when @SortColumn = 'LastUpdated' and @SortAscending = 1 then 
							[LastUpdated]
						end ASC,
						case when @SortColumn = 'LastUpdated' and @SortAscending = 0 then 
							[LastUpdated]
						end DESC									
					) AS RowNumber,
					*
		FROM		(
					-- Automatically generated on 1/31/2024 10:23:40 AM.
    
    SELECT *
    FROM ApiUsageLimits WITH (NOLOCK) 
					) sub
		where		
					[ApiUsageLimitID] like '%' + @Search + '%' 
	)
			
	SELECT	*
	FROM	SearchTable
	WHERE	RowNumber BETWEEN @FirstRow AND @LastRow
	ORDER BY RowNumber ASC
	OPTION (recompile);
	
	
		
GO
/****** Object:  StoredProcedure [dbo].[GetApiUsagesByApiIDSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[GetApiUsagesByApiIDSp]
	@ApiID [int]
AS

    -- Automatically generated on 1/31/2024 10:23:40 AM.
    
    SELECT *
    FROM ApiUsages WITH (NOLOCK) 
    WHERE [ApiID] = @ApiID
GO
/****** Object:  StoredProcedure [dbo].[GetApiUsagesByApiIDSp_CountSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[GetApiUsagesByApiIDSp_CountSp]
	@ApiID [int],
	@Search [nvarchar](255)
AS


	SET NOCOUNT ON

	
	SELECT		COUNT(*) as Total
	FROM		(
				-- Automatically generated on 1/31/2024 10:23:40 AM.
    
    SELECT *
    FROM ApiUsages WITH (NOLOCK) 
    WHERE [ApiID] = @ApiID
				) sub
	where		
					[ApiUsageID] like '%' + @Search + '%' 
		
GO
/****** Object:  StoredProcedure [dbo].[GetApiUsagesByApiIDSp_PagingSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[GetApiUsagesByApiIDSp_PagingSp]
	@ApiID [int],
	@Search [nvarchar](255),
	@SortColumn [nvarchar](255),
	@SortAscending [bit],
	@SkipRows [int],
	@NumRows [int]
AS


	SET NOCOUNT ON

	DECLARE	@FirstRow INT,
	@LastRow INT

	set @FirstRow = @SkipRows + 1;
	set @LastRow = @SkipRows + @NumRows;
	
	with SearchTable as
	(
	
		SELECT		ROW_NUMBER() OVER (
					ORDER BY
					
			
						case when @SortColumn = 'ApiUsageID' and @SortAscending = 1 then 
							[ApiUsageID]
						end ASC,
						case when @SortColumn = 'ApiUsageID' and @SortAscending = 0 then 
							[ApiUsageID]
						end DESC,
			
						case when @SortColumn = 'UsageDimensionID' and @SortAscending = 1 then 
							[UsageDimensionID]
						end ASC,
						case when @SortColumn = 'UsageDimensionID' and @SortAscending = 0 then 
							[UsageDimensionID]
						end DESC,
			
						case when @SortColumn = 'UserID' and @SortAscending = 1 then 
							[UserID]
						end ASC,
						case when @SortColumn = 'UserID' and @SortAscending = 0 then 
							[UserID]
						end DESC,
			
						case when @SortColumn = 'AuthorizationID' and @SortAscending = 1 then 
							[AuthorizationID]
						end ASC,
						case when @SortColumn = 'AuthorizationID' and @SortAscending = 0 then 
							[AuthorizationID]
						end DESC,
			
						case when @SortColumn = 'ApiID' and @SortAscending = 1 then 
							[ApiID]
						end ASC,
						case when @SortColumn = 'ApiID' and @SortAscending = 0 then 
							[ApiID]
						end DESC,
			
						case when @SortColumn = 'Usage' and @SortAscending = 1 then 
							[Usage]
						end ASC,
						case when @SortColumn = 'Usage' and @SortAscending = 0 then 
							[Usage]
						end DESC,
			
						case when @SortColumn = 'CostPerUnit' and @SortAscending = 1 then 
							[CostPerUnit]
						end ASC,
						case when @SortColumn = 'CostPerUnit' and @SortAscending = 0 then 
							[CostPerUnit]
						end DESC,
			
						case when @SortColumn = 'Data' and @SortAscending = 1 then 
							[Data]
						end ASC,
						case when @SortColumn = 'Data' and @SortAscending = 0 then 
							[Data]
						end DESC,
			
						case when @SortColumn = 'DateCreated' and @SortAscending = 1 then 
							[DateCreated]
						end ASC,
						case when @SortColumn = 'DateCreated' and @SortAscending = 0 then 
							[DateCreated]
						end DESC,
			
						case when @SortColumn = 'LastUpdated' and @SortAscending = 1 then 
							[LastUpdated]
						end ASC,
						case when @SortColumn = 'LastUpdated' and @SortAscending = 0 then 
							[LastUpdated]
						end DESC									
					) AS RowNumber,
					*
		FROM		(
					-- Automatically generated on 1/31/2024 10:23:40 AM.
    
    SELECT *
    FROM ApiUsages WITH (NOLOCK) 
    WHERE [ApiID] = @ApiID
					) sub
		where		
					[ApiUsageID] like '%' + @Search + '%' 
	)
			
	SELECT	*
	FROM	SearchTable
	WHERE	RowNumber BETWEEN @FirstRow AND @LastRow
	ORDER BY RowNumber ASC
	OPTION (recompile);
	
	
		
GO
/****** Object:  StoredProcedure [dbo].[GetApiUsagesByAuthorizationIDSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[GetApiUsagesByAuthorizationIDSp]
	@AuthorizationID [int]
AS

    -- Automatically generated on 1/31/2024 10:23:40 AM.
    
    SELECT *
    FROM ApiUsages WITH (NOLOCK) 
    WHERE [AuthorizationID] = @AuthorizationID
GO
/****** Object:  StoredProcedure [dbo].[GetApiUsagesByAuthorizationIDSp_CountSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[GetApiUsagesByAuthorizationIDSp_CountSp]
	@AuthorizationID [int],
	@Search [nvarchar](255)
AS


	SET NOCOUNT ON

	
	SELECT		COUNT(*) as Total
	FROM		(
				-- Automatically generated on 1/31/2024 10:23:40 AM.
    
    SELECT *
    FROM ApiUsages WITH (NOLOCK) 
    WHERE [AuthorizationID] = @AuthorizationID
				) sub
	where		
					[ApiUsageID] like '%' + @Search + '%' 
		
GO
/****** Object:  StoredProcedure [dbo].[GetApiUsagesByAuthorizationIDSp_PagingSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[GetApiUsagesByAuthorizationIDSp_PagingSp]
	@AuthorizationID [int],
	@Search [nvarchar](255),
	@SortColumn [nvarchar](255),
	@SortAscending [bit],
	@SkipRows [int],
	@NumRows [int]
AS


	SET NOCOUNT ON

	DECLARE	@FirstRow INT,
	@LastRow INT

	set @FirstRow = @SkipRows + 1;
	set @LastRow = @SkipRows + @NumRows;
	
	with SearchTable as
	(
	
		SELECT		ROW_NUMBER() OVER (
					ORDER BY
					
			
						case when @SortColumn = 'ApiUsageID' and @SortAscending = 1 then 
							[ApiUsageID]
						end ASC,
						case when @SortColumn = 'ApiUsageID' and @SortAscending = 0 then 
							[ApiUsageID]
						end DESC,
			
						case when @SortColumn = 'UsageDimensionID' and @SortAscending = 1 then 
							[UsageDimensionID]
						end ASC,
						case when @SortColumn = 'UsageDimensionID' and @SortAscending = 0 then 
							[UsageDimensionID]
						end DESC,
			
						case when @SortColumn = 'UserID' and @SortAscending = 1 then 
							[UserID]
						end ASC,
						case when @SortColumn = 'UserID' and @SortAscending = 0 then 
							[UserID]
						end DESC,
			
						case when @SortColumn = 'AuthorizationID' and @SortAscending = 1 then 
							[AuthorizationID]
						end ASC,
						case when @SortColumn = 'AuthorizationID' and @SortAscending = 0 then 
							[AuthorizationID]
						end DESC,
			
						case when @SortColumn = 'ApiID' and @SortAscending = 1 then 
							[ApiID]
						end ASC,
						case when @SortColumn = 'ApiID' and @SortAscending = 0 then 
							[ApiID]
						end DESC,
			
						case when @SortColumn = 'Usage' and @SortAscending = 1 then 
							[Usage]
						end ASC,
						case when @SortColumn = 'Usage' and @SortAscending = 0 then 
							[Usage]
						end DESC,
			
						case when @SortColumn = 'CostPerUnit' and @SortAscending = 1 then 
							[CostPerUnit]
						end ASC,
						case when @SortColumn = 'CostPerUnit' and @SortAscending = 0 then 
							[CostPerUnit]
						end DESC,
			
						case when @SortColumn = 'Data' and @SortAscending = 1 then 
							[Data]
						end ASC,
						case when @SortColumn = 'Data' and @SortAscending = 0 then 
							[Data]
						end DESC,
			
						case when @SortColumn = 'DateCreated' and @SortAscending = 1 then 
							[DateCreated]
						end ASC,
						case when @SortColumn = 'DateCreated' and @SortAscending = 0 then 
							[DateCreated]
						end DESC,
			
						case when @SortColumn = 'LastUpdated' and @SortAscending = 1 then 
							[LastUpdated]
						end ASC,
						case when @SortColumn = 'LastUpdated' and @SortAscending = 0 then 
							[LastUpdated]
						end DESC									
					) AS RowNumber,
					*
		FROM		(
					-- Automatically generated on 1/31/2024 10:23:40 AM.
    
    SELECT *
    FROM ApiUsages WITH (NOLOCK) 
    WHERE [AuthorizationID] = @AuthorizationID
					) sub
		where		
					[ApiUsageID] like '%' + @Search + '%' 
	)
			
	SELECT	*
	FROM	SearchTable
	WHERE	RowNumber BETWEEN @FirstRow AND @LastRow
	ORDER BY RowNumber ASC
	OPTION (recompile);
	
	
		
GO
/****** Object:  StoredProcedure [dbo].[GetApiUsagesByUsageDimensionIDSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[GetApiUsagesByUsageDimensionIDSp]
	@UsageDimensionID [int]
AS

    -- Automatically generated on 1/31/2024 10:23:40 AM.
    
    SELECT *
    FROM ApiUsages WITH (NOLOCK) 
    WHERE [UsageDimensionID] = @UsageDimensionID
GO
/****** Object:  StoredProcedure [dbo].[GetApiUsagesByUsageDimensionIDSp_CountSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[GetApiUsagesByUsageDimensionIDSp_CountSp]
	@UsageDimensionID [int],
	@Search [nvarchar](255)
AS


	SET NOCOUNT ON

	
	SELECT		COUNT(*) as Total
	FROM		(
				-- Automatically generated on 1/31/2024 10:23:40 AM.
    
    SELECT *
    FROM ApiUsages WITH (NOLOCK) 
    WHERE [UsageDimensionID] = @UsageDimensionID
				) sub
	where		
					[ApiUsageID] like '%' + @Search + '%' 
		
GO
/****** Object:  StoredProcedure [dbo].[GetApiUsagesByUsageDimensionIDSp_PagingSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[GetApiUsagesByUsageDimensionIDSp_PagingSp]
	@UsageDimensionID [int],
	@Search [nvarchar](255),
	@SortColumn [nvarchar](255),
	@SortAscending [bit],
	@SkipRows [int],
	@NumRows [int]
AS


	SET NOCOUNT ON

	DECLARE	@FirstRow INT,
	@LastRow INT

	set @FirstRow = @SkipRows + 1;
	set @LastRow = @SkipRows + @NumRows;
	
	with SearchTable as
	(
	
		SELECT		ROW_NUMBER() OVER (
					ORDER BY
					
			
						case when @SortColumn = 'ApiUsageID' and @SortAscending = 1 then 
							[ApiUsageID]
						end ASC,
						case when @SortColumn = 'ApiUsageID' and @SortAscending = 0 then 
							[ApiUsageID]
						end DESC,
			
						case when @SortColumn = 'UsageDimensionID' and @SortAscending = 1 then 
							[UsageDimensionID]
						end ASC,
						case when @SortColumn = 'UsageDimensionID' and @SortAscending = 0 then 
							[UsageDimensionID]
						end DESC,
			
						case when @SortColumn = 'UserID' and @SortAscending = 1 then 
							[UserID]
						end ASC,
						case when @SortColumn = 'UserID' and @SortAscending = 0 then 
							[UserID]
						end DESC,
			
						case when @SortColumn = 'AuthorizationID' and @SortAscending = 1 then 
							[AuthorizationID]
						end ASC,
						case when @SortColumn = 'AuthorizationID' and @SortAscending = 0 then 
							[AuthorizationID]
						end DESC,
			
						case when @SortColumn = 'ApiID' and @SortAscending = 1 then 
							[ApiID]
						end ASC,
						case when @SortColumn = 'ApiID' and @SortAscending = 0 then 
							[ApiID]
						end DESC,
			
						case when @SortColumn = 'Usage' and @SortAscending = 1 then 
							[Usage]
						end ASC,
						case when @SortColumn = 'Usage' and @SortAscending = 0 then 
							[Usage]
						end DESC,
			
						case when @SortColumn = 'CostPerUnit' and @SortAscending = 1 then 
							[CostPerUnit]
						end ASC,
						case when @SortColumn = 'CostPerUnit' and @SortAscending = 0 then 
							[CostPerUnit]
						end DESC,
			
						case when @SortColumn = 'Data' and @SortAscending = 1 then 
							[Data]
						end ASC,
						case when @SortColumn = 'Data' and @SortAscending = 0 then 
							[Data]
						end DESC,
			
						case when @SortColumn = 'DateCreated' and @SortAscending = 1 then 
							[DateCreated]
						end ASC,
						case when @SortColumn = 'DateCreated' and @SortAscending = 0 then 
							[DateCreated]
						end DESC,
			
						case when @SortColumn = 'LastUpdated' and @SortAscending = 1 then 
							[LastUpdated]
						end ASC,
						case when @SortColumn = 'LastUpdated' and @SortAscending = 0 then 
							[LastUpdated]
						end DESC									
					) AS RowNumber,
					*
		FROM		(
					-- Automatically generated on 1/31/2024 10:23:40 AM.
    
    SELECT *
    FROM ApiUsages WITH (NOLOCK) 
    WHERE [UsageDimensionID] = @UsageDimensionID
					) sub
		where		
					[ApiUsageID] like '%' + @Search + '%' 
	)
			
	SELECT	*
	FROM	SearchTable
	WHERE	RowNumber BETWEEN @FirstRow AND @LastRow
	ORDER BY RowNumber ASC
	OPTION (recompile);
	
	
		
GO
/****** Object:  StoredProcedure [dbo].[GetApiUsagesByUserIDSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[GetApiUsagesByUserIDSp]
	@UserID [int]
AS

    -- Automatically generated on 1/31/2024 10:23:40 AM.
    
    SELECT *
    FROM ApiUsages WITH (NOLOCK) 
    WHERE [UserID] = @UserID
GO
/****** Object:  StoredProcedure [dbo].[GetApiUsagesByUserIDSp_CountSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[GetApiUsagesByUserIDSp_CountSp]
	@UserID [int],
	@Search [nvarchar](255)
AS


	SET NOCOUNT ON

	
	SELECT		COUNT(*) as Total
	FROM		(
				-- Automatically generated on 1/31/2024 10:23:40 AM.
    
    SELECT *
    FROM ApiUsages WITH (NOLOCK) 
    WHERE [UserID] = @UserID
				) sub
	where		
					[ApiUsageID] like '%' + @Search + '%' 
		
GO
/****** Object:  StoredProcedure [dbo].[GetApiUsagesByUserIDSp_PagingSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[GetApiUsagesByUserIDSp_PagingSp]
	@UserID [int],
	@Search [nvarchar](255),
	@SortColumn [nvarchar](255),
	@SortAscending [bit],
	@SkipRows [int],
	@NumRows [int]
AS


	SET NOCOUNT ON

	DECLARE	@FirstRow INT,
	@LastRow INT

	set @FirstRow = @SkipRows + 1;
	set @LastRow = @SkipRows + @NumRows;
	
	with SearchTable as
	(
	
		SELECT		ROW_NUMBER() OVER (
					ORDER BY
					
			
						case when @SortColumn = 'ApiUsageID' and @SortAscending = 1 then 
							[ApiUsageID]
						end ASC,
						case when @SortColumn = 'ApiUsageID' and @SortAscending = 0 then 
							[ApiUsageID]
						end DESC,
			
						case when @SortColumn = 'UsageDimensionID' and @SortAscending = 1 then 
							[UsageDimensionID]
						end ASC,
						case when @SortColumn = 'UsageDimensionID' and @SortAscending = 0 then 
							[UsageDimensionID]
						end DESC,
			
						case when @SortColumn = 'UserID' and @SortAscending = 1 then 
							[UserID]
						end ASC,
						case when @SortColumn = 'UserID' and @SortAscending = 0 then 
							[UserID]
						end DESC,
			
						case when @SortColumn = 'AuthorizationID' and @SortAscending = 1 then 
							[AuthorizationID]
						end ASC,
						case when @SortColumn = 'AuthorizationID' and @SortAscending = 0 then 
							[AuthorizationID]
						end DESC,
			
						case when @SortColumn = 'ApiID' and @SortAscending = 1 then 
							[ApiID]
						end ASC,
						case when @SortColumn = 'ApiID' and @SortAscending = 0 then 
							[ApiID]
						end DESC,
			
						case when @SortColumn = 'Usage' and @SortAscending = 1 then 
							[Usage]
						end ASC,
						case when @SortColumn = 'Usage' and @SortAscending = 0 then 
							[Usage]
						end DESC,
			
						case when @SortColumn = 'CostPerUnit' and @SortAscending = 1 then 
							[CostPerUnit]
						end ASC,
						case when @SortColumn = 'CostPerUnit' and @SortAscending = 0 then 
							[CostPerUnit]
						end DESC,
			
						case when @SortColumn = 'Data' and @SortAscending = 1 then 
							[Data]
						end ASC,
						case when @SortColumn = 'Data' and @SortAscending = 0 then 
							[Data]
						end DESC,
			
						case when @SortColumn = 'DateCreated' and @SortAscending = 1 then 
							[DateCreated]
						end ASC,
						case when @SortColumn = 'DateCreated' and @SortAscending = 0 then 
							[DateCreated]
						end DESC,
			
						case when @SortColumn = 'LastUpdated' and @SortAscending = 1 then 
							[LastUpdated]
						end ASC,
						case when @SortColumn = 'LastUpdated' and @SortAscending = 0 then 
							[LastUpdated]
						end DESC									
					) AS RowNumber,
					*
		FROM		(
					-- Automatically generated on 1/31/2024 10:23:40 AM.
    
    SELECT *
    FROM ApiUsages WITH (NOLOCK) 
    WHERE [UserID] = @UserID
					) sub
		where		
					[ApiUsageID] like '%' + @Search + '%' 
	)
			
	SELECT	*
	FROM	SearchTable
	WHERE	RowNumber BETWEEN @FirstRow AND @LastRow
	ORDER BY RowNumber ASC
	OPTION (recompile);
	
	
		
GO
/****** Object:  StoredProcedure [dbo].[GetApiUsageSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[GetApiUsageSp]
	@ApiUsageID [int]
AS

    -- Automatically generated on 1/31/2024 10:23:40 AM.
    
    SELECT *
    FROM ApiUsages WITH (NOLOCK) 
     WHERE ApiUsageID = @ApiUsageID

GO
/****** Object:  StoredProcedure [dbo].[GetApiUsagesSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[GetApiUsagesSp]
AS

    -- Automatically generated on 1/31/2024 10:23:40 AM.
    
    SELECT *
    FROM ApiUsages WITH (NOLOCK) 
GO
/****** Object:  StoredProcedure [dbo].[GetApiUsagesSp_CountSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[GetApiUsagesSp_CountSp]
	@Search [nvarchar](255)
AS


	SET NOCOUNT ON

	
	SELECT		COUNT(*) as Total
	FROM		(
				-- Automatically generated on 1/31/2024 10:23:40 AM.
    
    SELECT *
    FROM ApiUsages WITH (NOLOCK) 
				) sub
	where		
					[ApiUsageID] like '%' + @Search + '%' 
		
GO
/****** Object:  StoredProcedure [dbo].[GetApiUsagesSp_PagingSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[GetApiUsagesSp_PagingSp]
	@Search [nvarchar](255),
	@SortColumn [nvarchar](255),
	@SortAscending [bit],
	@SkipRows [int],
	@NumRows [int]
AS


	SET NOCOUNT ON

	DECLARE	@FirstRow INT,
	@LastRow INT

	set @FirstRow = @SkipRows + 1;
	set @LastRow = @SkipRows + @NumRows;
	
	with SearchTable as
	(
	
		SELECT		ROW_NUMBER() OVER (
					ORDER BY
					
			
						case when @SortColumn = 'ApiUsageID' and @SortAscending = 1 then 
							[ApiUsageID]
						end ASC,
						case when @SortColumn = 'ApiUsageID' and @SortAscending = 0 then 
							[ApiUsageID]
						end DESC,
			
						case when @SortColumn = 'UsageDimensionID' and @SortAscending = 1 then 
							[UsageDimensionID]
						end ASC,
						case when @SortColumn = 'UsageDimensionID' and @SortAscending = 0 then 
							[UsageDimensionID]
						end DESC,
			
						case when @SortColumn = 'UserID' and @SortAscending = 1 then 
							[UserID]
						end ASC,
						case when @SortColumn = 'UserID' and @SortAscending = 0 then 
							[UserID]
						end DESC,
			
						case when @SortColumn = 'AuthorizationID' and @SortAscending = 1 then 
							[AuthorizationID]
						end ASC,
						case when @SortColumn = 'AuthorizationID' and @SortAscending = 0 then 
							[AuthorizationID]
						end DESC,
			
						case when @SortColumn = 'ApiID' and @SortAscending = 1 then 
							[ApiID]
						end ASC,
						case when @SortColumn = 'ApiID' and @SortAscending = 0 then 
							[ApiID]
						end DESC,
			
						case when @SortColumn = 'Usage' and @SortAscending = 1 then 
							[Usage]
						end ASC,
						case when @SortColumn = 'Usage' and @SortAscending = 0 then 
							[Usage]
						end DESC,
			
						case when @SortColumn = 'CostPerUnit' and @SortAscending = 1 then 
							[CostPerUnit]
						end ASC,
						case when @SortColumn = 'CostPerUnit' and @SortAscending = 0 then 
							[CostPerUnit]
						end DESC,
			
						case when @SortColumn = 'Data' and @SortAscending = 1 then 
							[Data]
						end ASC,
						case when @SortColumn = 'Data' and @SortAscending = 0 then 
							[Data]
						end DESC,
			
						case when @SortColumn = 'DateCreated' and @SortAscending = 1 then 
							[DateCreated]
						end ASC,
						case when @SortColumn = 'DateCreated' and @SortAscending = 0 then 
							[DateCreated]
						end DESC,
			
						case when @SortColumn = 'LastUpdated' and @SortAscending = 1 then 
							[LastUpdated]
						end ASC,
						case when @SortColumn = 'LastUpdated' and @SortAscending = 0 then 
							[LastUpdated]
						end DESC									
					) AS RowNumber,
					*
		FROM		(
					-- Automatically generated on 1/31/2024 10:23:40 AM.
    
    SELECT *
    FROM ApiUsages WITH (NOLOCK) 
					) sub
		where		
					[ApiUsageID] like '%' + @Search + '%' 
	)
			
	SELECT	*
	FROM	SearchTable
	WHERE	RowNumber BETWEEN @FirstRow AND @LastRow
	ORDER BY RowNumber ASC
	OPTION (recompile);
	
	
		
GO
/****** Object:  StoredProcedure [dbo].[GetApplicationByApplicationNameSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[GetApplicationByApplicationNameSp]
	@ApplicationName [nvarchar](255)
AS

    -- Automatically generated on 6/19/2024 1:57:54 PM.
    
    SELECT *
    FROM Applications WITH (NOLOCK) 
    WHERE [ApplicationName] = @ApplicationName
GO
/****** Object:  StoredProcedure [dbo].[GetApplicationsByUserIDSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[GetApplicationsByUserIDSp]
	@UserID [int]
AS

    -- Automatically generated on 6/19/2024 1:57:54 PM.
    
    SELECT *
    FROM Applications WITH (NOLOCK) 
    WHERE [UserID] = @UserID
GO
/****** Object:  StoredProcedure [dbo].[GetApplicationsByUserIDSp_CountSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[GetApplicationsByUserIDSp_CountSp]
	@UserID [int],
	@Search [nvarchar](255)
AS


	SET NOCOUNT ON

	
	SELECT		COUNT(*) as Total
	FROM		(
				-- Automatically generated on 6/19/2024 1:57:54 PM.
    
    SELECT *
    FROM Applications WITH (NOLOCK) 
    WHERE [UserID] = @UserID
				) sub
	where		
					[ApplicationID] like '%' + @Search + '%' or
					[ApplicationName] like '%' + @Search + '%' or
					[URL] like '%' + @Search + '%' or
					[ApplicationType] like '%' + @Search + '%' 
		
GO
/****** Object:  StoredProcedure [dbo].[GetApplicationsByUserIDSp_PagingSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[GetApplicationsByUserIDSp_PagingSp]
	@UserID [int],
	@Search [nvarchar](255),
	@SortColumn [nvarchar](255),
	@SortAscending [bit],
	@SkipRows [int],
	@NumRows [int]
AS


	SET NOCOUNT ON

	DECLARE	@FirstRow INT,
	@LastRow INT

	set @FirstRow = @SkipRows + 1;
	set @LastRow = @SkipRows + @NumRows;
	
	with SearchTable as
	(
	
		SELECT		ROW_NUMBER() OVER (
					ORDER BY
					
			
						case when @SortColumn = 'ApplicationID' and @SortAscending = 1 then 
							[ApplicationID]
						end ASC,
						case when @SortColumn = 'ApplicationID' and @SortAscending = 0 then 
							[ApplicationID]
						end DESC,
			
						case when @SortColumn = 'ApplicationName' and @SortAscending = 1 then 
							[ApplicationName]
						end ASC,
						case when @SortColumn = 'ApplicationName' and @SortAscending = 0 then 
							[ApplicationName]
						end DESC,
			
						case when @SortColumn = 'URL' and @SortAscending = 1 then 
							[URL]
						end ASC,
						case when @SortColumn = 'URL' and @SortAscending = 0 then 
							[URL]
						end DESC,
			
						case when @SortColumn = 'ApplicationType' and @SortAscending = 1 then 
							[ApplicationType]
						end ASC,
						case when @SortColumn = 'ApplicationType' and @SortAscending = 0 then 
							[ApplicationType]
						end DESC,
			
						case when @SortColumn = 'DateCreated' and @SortAscending = 1 then 
							[DateCreated]
						end ASC,
						case when @SortColumn = 'DateCreated' and @SortAscending = 0 then 
							[DateCreated]
						end DESC,
			
						case when @SortColumn = 'LastUpdated' and @SortAscending = 1 then 
							[LastUpdated]
						end ASC,
						case when @SortColumn = 'LastUpdated' and @SortAscending = 0 then 
							[LastUpdated]
						end DESC,
			
						case when @SortColumn = 'Data' and @SortAscending = 1 then 
							[Data]
						end ASC,
						case when @SortColumn = 'Data' and @SortAscending = 0 then 
							[Data]
						end DESC,
			
						case when @SortColumn = 'UserID' and @SortAscending = 1 then 
							[UserID]
						end ASC,
						case when @SortColumn = 'UserID' and @SortAscending = 0 then 
							[UserID]
						end DESC									
					) AS RowNumber,
					*
		FROM		(
					-- Automatically generated on 6/19/2024 1:57:54 PM.
    
    SELECT *
    FROM Applications WITH (NOLOCK) 
    WHERE [UserID] = @UserID
					) sub
		where		
					[ApplicationID] like '%' + @Search + '%' or
					[ApplicationName] like '%' + @Search + '%' or
					[URL] like '%' + @Search + '%' or
					[ApplicationType] like '%' + @Search + '%' 
	)
			
	SELECT	*
	FROM	SearchTable
	WHERE	RowNumber BETWEEN @FirstRow AND @LastRow
	ORDER BY RowNumber ASC
	OPTION (recompile);
	
	
		
GO
/****** Object:  StoredProcedure [dbo].[GetApplicationSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[GetApplicationSp]
	@ApplicationID [int]
AS

    -- Automatically generated on 6/19/2024 1:57:54 PM.
    
    SELECT *
    FROM Applications WITH (NOLOCK) 
     WHERE ApplicationID = @ApplicationID

GO
/****** Object:  StoredProcedure [dbo].[GetApplicationsSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[GetApplicationsSp]
AS

    -- Automatically generated on 6/19/2024 1:57:54 PM.
    
    SELECT *
    FROM Applications WITH (NOLOCK) 
GO
/****** Object:  StoredProcedure [dbo].[GetApplicationsSp_CountSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[GetApplicationsSp_CountSp]
	@Search [nvarchar](255)
AS


	SET NOCOUNT ON

	
	SELECT		COUNT(*) as Total
	FROM		(
				-- Automatically generated on 6/19/2024 1:57:54 PM.
    
    SELECT *
    FROM Applications WITH (NOLOCK) 
				) sub
	where		
					[ApplicationID] like '%' + @Search + '%' or
					[ApplicationName] like '%' + @Search + '%' or
					[URL] like '%' + @Search + '%' or
					[ApplicationType] like '%' + @Search + '%' 
		
GO
/****** Object:  StoredProcedure [dbo].[GetApplicationsSp_PagingSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[GetApplicationsSp_PagingSp]
	@Search [nvarchar](255),
	@SortColumn [nvarchar](255),
	@SortAscending [bit],
	@SkipRows [int],
	@NumRows [int]
AS


	SET NOCOUNT ON

	DECLARE	@FirstRow INT,
	@LastRow INT

	set @FirstRow = @SkipRows + 1;
	set @LastRow = @SkipRows + @NumRows;
	
	with SearchTable as
	(
	
		SELECT		ROW_NUMBER() OVER (
					ORDER BY
					
			
						case when @SortColumn = 'ApplicationID' and @SortAscending = 1 then 
							[ApplicationID]
						end ASC,
						case when @SortColumn = 'ApplicationID' and @SortAscending = 0 then 
							[ApplicationID]
						end DESC,
			
						case when @SortColumn = 'ApplicationName' and @SortAscending = 1 then 
							[ApplicationName]
						end ASC,
						case when @SortColumn = 'ApplicationName' and @SortAscending = 0 then 
							[ApplicationName]
						end DESC,
			
						case when @SortColumn = 'URL' and @SortAscending = 1 then 
							[URL]
						end ASC,
						case when @SortColumn = 'URL' and @SortAscending = 0 then 
							[URL]
						end DESC,
			
						case when @SortColumn = 'ApplicationType' and @SortAscending = 1 then 
							[ApplicationType]
						end ASC,
						case when @SortColumn = 'ApplicationType' and @SortAscending = 0 then 
							[ApplicationType]
						end DESC,
			
						case when @SortColumn = 'DateCreated' and @SortAscending = 1 then 
							[DateCreated]
						end ASC,
						case when @SortColumn = 'DateCreated' and @SortAscending = 0 then 
							[DateCreated]
						end DESC,
			
						case when @SortColumn = 'LastUpdated' and @SortAscending = 1 then 
							[LastUpdated]
						end ASC,
						case when @SortColumn = 'LastUpdated' and @SortAscending = 0 then 
							[LastUpdated]
						end DESC,
			
						case when @SortColumn = 'Data' and @SortAscending = 1 then 
							[Data]
						end ASC,
						case when @SortColumn = 'Data' and @SortAscending = 0 then 
							[Data]
						end DESC,
			
						case when @SortColumn = 'UserID' and @SortAscending = 1 then 
							[UserID]
						end ASC,
						case when @SortColumn = 'UserID' and @SortAscending = 0 then 
							[UserID]
						end DESC									
					) AS RowNumber,
					*
		FROM		(
					-- Automatically generated on 6/19/2024 1:57:54 PM.
    
    SELECT *
    FROM Applications WITH (NOLOCK) 
					) sub
		where		
					[ApplicationID] like '%' + @Search + '%' or
					[ApplicationName] like '%' + @Search + '%' or
					[URL] like '%' + @Search + '%' or
					[ApplicationType] like '%' + @Search + '%' 
	)
			
	SELECT	*
	FROM	SearchTable
	WHERE	RowNumber BETWEEN @FirstRow AND @LastRow
	ORDER BY RowNumber ASC
	OPTION (recompile);
	
	
		
GO
/****** Object:  StoredProcedure [dbo].[GetAuthorizationByAuthorizationTokenSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetAuthorizationByAuthorizationTokenSp]
	@AuthorizationToken [nvarchar](255)
AS

    -- Automatically generated on 1/31/2024 10:23:40 AM.
    
    SELECT *
    FROM Authorizations WITH (NOLOCK) 
    WHERE [AuthorizationToken] = @AuthorizationToken
GO
/****** Object:  StoredProcedure [dbo].[GetAuthorizationsByRefreshTokenSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetAuthorizationsByRefreshTokenSp]
	@RefreshToken [nvarchar](255)
AS

    -- Automatically generated on 1/31/2024 10:23:40 AM.
    
    SELECT *
    FROM Authorizations WITH (NOLOCK) 
    WHERE [RefreshToken] = @RefreshToken
GO
/****** Object:  StoredProcedure [dbo].[GetAuthorizationsByUserIDSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetAuthorizationsByUserIDSp]
	@UserID [int]
AS

    -- Automatically generated on 1/31/2024 10:23:40 AM.
    
    SELECT *
    FROM Authorizations WITH (NOLOCK) 
    WHERE [UserID] = @UserID
GO
/****** Object:  StoredProcedure [dbo].[GetAuthorizationsByUserIDSp_CountSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetAuthorizationsByUserIDSp_CountSp]
	@UserID [int],
	@Search [nvarchar](255)
AS


	SET NOCOUNT ON

	
	SELECT		COUNT(*) as Total
	FROM		(
				-- Automatically generated on 1/31/2024 10:23:40 AM.
    
    SELECT *
    FROM Authorizations WITH (NOLOCK) 
    WHERE [UserID] = @UserID
				) sub
	where		
					[AuthorizationID] like '%' + @Search + '%' or
					[AuthorizationToken] like '%' + @Search + '%' or
					[RefreshToken] like '%' + @Search + '%' 
		
GO
/****** Object:  StoredProcedure [dbo].[GetAuthorizationsByUserIDSp_PagingSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetAuthorizationsByUserIDSp_PagingSp]
	@UserID [int],
	@Search [nvarchar](255),
	@SortColumn [nvarchar](255),
	@SortAscending [bit],
	@SkipRows [int],
	@NumRows [int]
AS


	SET NOCOUNT ON

	DECLARE	@FirstRow INT,
	@LastRow INT

	set @FirstRow = @SkipRows + 1;
	set @LastRow = @SkipRows + @NumRows;
	
	with SearchTable as
	(
	
		SELECT		ROW_NUMBER() OVER (
					ORDER BY
					
			
						case when @SortColumn = 'AuthorizationID' and @SortAscending = 1 then 
							[AuthorizationID]
						end ASC,
						case when @SortColumn = 'AuthorizationID' and @SortAscending = 0 then 
							[AuthorizationID]
						end DESC,
			
						case when @SortColumn = 'AuthorizationToken' and @SortAscending = 1 then 
							[AuthorizationToken]
						end ASC,
						case when @SortColumn = 'AuthorizationToken' and @SortAscending = 0 then 
							[AuthorizationToken]
						end DESC,
			
						case when @SortColumn = 'RefreshToken' and @SortAscending = 1 then 
							[RefreshToken]
						end ASC,
						case when @SortColumn = 'RefreshToken' and @SortAscending = 0 then 
							[RefreshToken]
						end DESC,
			
						case when @SortColumn = 'Expiration' and @SortAscending = 1 then 
							[Expiration]
						end ASC,
						case when @SortColumn = 'Expiration' and @SortAscending = 0 then 
							[Expiration]
						end DESC,
			
						case when @SortColumn = 'UserID' and @SortAscending = 1 then 
							[UserID]
						end ASC,
						case when @SortColumn = 'UserID' and @SortAscending = 0 then 
							[UserID]
						end DESC,
			
						case when @SortColumn = 'LastRefreshedDate' and @SortAscending = 1 then 
							[LastRefreshedDate]
						end ASC,
						case when @SortColumn = 'LastRefreshedDate' and @SortAscending = 0 then 
							[LastRefreshedDate]
						end DESC,
			
						case when @SortColumn = 'LastActivityDate' and @SortAscending = 1 then 
							[LastActivityDate]
						end ASC,
						case when @SortColumn = 'LastActivityDate' and @SortAscending = 0 then 
							[LastActivityDate]
						end DESC,
			
						case when @SortColumn = 'IsExpired' and @SortAscending = 1 then 
							[IsExpired]
						end ASC,
						case when @SortColumn = 'IsExpired' and @SortAscending = 0 then 
							[IsExpired]
						end DESC,
			
						case when @SortColumn = 'IsRevoked' and @SortAscending = 1 then 
							[IsRevoked]
						end ASC,
						case when @SortColumn = 'IsRevoked' and @SortAscending = 0 then 
							[IsRevoked]
						end DESC,
			
						case when @SortColumn = 'IsEncrypted' and @SortAscending = 1 then 
							[IsEncrypted]
						end ASC,
						case when @SortColumn = 'IsEncrypted' and @SortAscending = 0 then 
							[IsEncrypted]
						end DESC,
			
						case when @SortColumn = 'Data' and @SortAscending = 1 then 
							[Data]
						end ASC,
						case when @SortColumn = 'Data' and @SortAscending = 0 then 
							[Data]
						end DESC,
			
						case when @SortColumn = 'DateCreated' and @SortAscending = 1 then 
							[DateCreated]
						end ASC,
						case when @SortColumn = 'DateCreated' and @SortAscending = 0 then 
							[DateCreated]
						end DESC,
			
						case when @SortColumn = 'LastUpdated' and @SortAscending = 1 then 
							[LastUpdated]
						end ASC,
						case when @SortColumn = 'LastUpdated' and @SortAscending = 0 then 
							[LastUpdated]
						end DESC									
					) AS RowNumber,
					*
		FROM		(
					-- Automatically generated on 1/31/2024 10:23:40 AM.
    
    SELECT *
    FROM Authorizations WITH (NOLOCK) 
    WHERE [UserID] = @UserID
					) sub
		where		
					[AuthorizationID] like '%' + @Search + '%' or
					[AuthorizationToken] like '%' + @Search + '%' or
					[RefreshToken] like '%' + @Search + '%' 
	)
			
	SELECT	*
	FROM	SearchTable
	WHERE	RowNumber BETWEEN @FirstRow AND @LastRow
	ORDER BY RowNumber ASC
	OPTION (recompile);
	
	
		
GO
/****** Object:  StoredProcedure [dbo].[GetAuthorizationSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetAuthorizationSp]
	@AuthorizationID [int]
AS

    -- Automatically generated on 1/31/2024 10:23:40 AM.
    
    SELECT *
    FROM Authorizations WITH (NOLOCK) 
     WHERE AuthorizationID = @AuthorizationID
GO
/****** Object:  StoredProcedure [dbo].[GetAuthorizationsSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetAuthorizationsSp]
AS

    -- Automatically generated on 1/31/2024 10:23:40 AM.
    
    SELECT *
    FROM Authorizations WITH (NOLOCK) 
GO
/****** Object:  StoredProcedure [dbo].[GetAuthorizationsSp_CountSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetAuthorizationsSp_CountSp]
	@Search [nvarchar](255)
AS


	SET NOCOUNT ON

	
	SELECT		COUNT(*) as Total
	FROM		(
				-- Automatically generated on 1/31/2024 10:23:40 AM.
    
    SELECT *
    FROM Authorizations WITH (NOLOCK) 
				) sub
	where		
					[AuthorizationID] like '%' + @Search + '%' or
					[AuthorizationToken] like '%' + @Search + '%' or
					[RefreshToken] like '%' + @Search + '%' 
		
GO
/****** Object:  StoredProcedure [dbo].[GetAuthorizationsSp_PagingSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetAuthorizationsSp_PagingSp]
	@Search [nvarchar](255),
	@SortColumn [nvarchar](255),
	@SortAscending [bit],
	@SkipRows [int],
	@NumRows [int]
AS


	SET NOCOUNT ON

	DECLARE	@FirstRow INT,
	@LastRow INT

	set @FirstRow = @SkipRows + 1;
	set @LastRow = @SkipRows + @NumRows;
	
	with SearchTable as
	(
	
		SELECT		ROW_NUMBER() OVER (
					ORDER BY
					
			
						case when @SortColumn = 'AuthorizationID' and @SortAscending = 1 then 
							[AuthorizationID]
						end ASC,
						case when @SortColumn = 'AuthorizationID' and @SortAscending = 0 then 
							[AuthorizationID]
						end DESC,
			
						case when @SortColumn = 'AuthorizationToken' and @SortAscending = 1 then 
							[AuthorizationToken]
						end ASC,
						case when @SortColumn = 'AuthorizationToken' and @SortAscending = 0 then 
							[AuthorizationToken]
						end DESC,
			
						case when @SortColumn = 'RefreshToken' and @SortAscending = 1 then 
							[RefreshToken]
						end ASC,
						case when @SortColumn = 'RefreshToken' and @SortAscending = 0 then 
							[RefreshToken]
						end DESC,
			
						case when @SortColumn = 'Expiration' and @SortAscending = 1 then 
							[Expiration]
						end ASC,
						case when @SortColumn = 'Expiration' and @SortAscending = 0 then 
							[Expiration]
						end DESC,
			
						case when @SortColumn = 'UserID' and @SortAscending = 1 then 
							[UserID]
						end ASC,
						case when @SortColumn = 'UserID' and @SortAscending = 0 then 
							[UserID]
						end DESC,
			
						case when @SortColumn = 'LastRefreshedDate' and @SortAscending = 1 then 
							[LastRefreshedDate]
						end ASC,
						case when @SortColumn = 'LastRefreshedDate' and @SortAscending = 0 then 
							[LastRefreshedDate]
						end DESC,
			
						case when @SortColumn = 'LastActivityDate' and @SortAscending = 1 then 
							[LastActivityDate]
						end ASC,
						case when @SortColumn = 'LastActivityDate' and @SortAscending = 0 then 
							[LastActivityDate]
						end DESC,
			
						case when @SortColumn = 'IsExpired' and @SortAscending = 1 then 
							[IsExpired]
						end ASC,
						case when @SortColumn = 'IsExpired' and @SortAscending = 0 then 
							[IsExpired]
						end DESC,
			
						case when @SortColumn = 'IsRevoked' and @SortAscending = 1 then 
							[IsRevoked]
						end ASC,
						case when @SortColumn = 'IsRevoked' and @SortAscending = 0 then 
							[IsRevoked]
						end DESC,
			
						case when @SortColumn = 'IsEncrypted' and @SortAscending = 1 then 
							[IsEncrypted]
						end ASC,
						case when @SortColumn = 'IsEncrypted' and @SortAscending = 0 then 
							[IsEncrypted]
						end DESC,
			
						case when @SortColumn = 'Data' and @SortAscending = 1 then 
							[Data]
						end ASC,
						case when @SortColumn = 'Data' and @SortAscending = 0 then 
							[Data]
						end DESC,
			
						case when @SortColumn = 'DateCreated' and @SortAscending = 1 then 
							[DateCreated]
						end ASC,
						case when @SortColumn = 'DateCreated' and @SortAscending = 0 then 
							[DateCreated]
						end DESC,
			
						case when @SortColumn = 'LastUpdated' and @SortAscending = 1 then 
							[LastUpdated]
						end ASC,
						case when @SortColumn = 'LastUpdated' and @SortAscending = 0 then 
							[LastUpdated]
						end DESC									
					) AS RowNumber,
					*
		FROM		(
					-- Automatically generated on 1/31/2024 10:23:40 AM.
    
    SELECT *
    FROM Authorizations WITH (NOLOCK) 
					) sub
		where		
					[AuthorizationID] like '%' + @Search + '%' or
					[AuthorizationToken] like '%' + @Search + '%' or
					[RefreshToken] like '%' + @Search + '%' 
	)
			
	SELECT	*
	FROM	SearchTable
	WHERE	RowNumber BETWEEN @FirstRow AND @LastRow
	ORDER BY RowNumber ASC
	OPTION (recompile);
	
	
		
GO
/****** Object:  StoredProcedure [dbo].[GetBlockedEmailByEmailSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[GetBlockedEmailByEmailSp]
	@Email [nvarchar](255)
AS

    -- Automatically generated on 7/18/2024 5:57:46 PM.
    
    SELECT *
    FROM BlockedEmails WITH (NOLOCK) 
    WHERE [Email] = @Email
GO
/****** Object:  StoredProcedure [dbo].[GetBlockedEmailSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[GetBlockedEmailSp]
	@BlockedEmailID [int]
AS

    -- Automatically generated on 7/18/2024 5:57:46 PM.
    
    SELECT *
    FROM BlockedEmails WITH (NOLOCK) 
     WHERE BlockedEmailID = @BlockedEmailID

GO
/****** Object:  StoredProcedure [dbo].[GetBlockedEmailsSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[GetBlockedEmailsSp]
AS

    -- Automatically generated on 7/18/2024 5:57:46 PM.
    
    SELECT *
    FROM BlockedEmails WITH (NOLOCK) 
GO
/****** Object:  StoredProcedure [dbo].[GetBlockedEmailsSp_CountSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[GetBlockedEmailsSp_CountSp]
	@Search [nvarchar](255)
AS


	SET NOCOUNT ON

	
	SELECT		COUNT(*) as Total
	FROM		(
				-- Automatically generated on 7/18/2024 5:57:46 PM.
    
    SELECT *
    FROM BlockedEmails WITH (NOLOCK) 
				) sub
	where		
					[BlockedEmailID] like '%' + @Search + '%' or
					[Email] like '%' + @Search + '%' 
		
GO
/****** Object:  StoredProcedure [dbo].[GetBlockedEmailsSp_PagingSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[GetBlockedEmailsSp_PagingSp]
	@Search [nvarchar](255),
	@SortColumn [nvarchar](255),
	@SortAscending [bit],
	@SkipRows [int],
	@NumRows [int]
AS


	SET NOCOUNT ON

	DECLARE	@FirstRow INT,
	@LastRow INT

	set @FirstRow = @SkipRows + 1;
	set @LastRow = @SkipRows + @NumRows;
	
	with SearchTable as
	(
	
		SELECT		ROW_NUMBER() OVER (
					ORDER BY
					
			
						case when @SortColumn = 'BlockedEmailID' and @SortAscending = 1 then 
							[BlockedEmailID]
						end ASC,
						case when @SortColumn = 'BlockedEmailID' and @SortAscending = 0 then 
							[BlockedEmailID]
						end DESC,
			
						case when @SortColumn = 'Email' and @SortAscending = 1 then 
							[Email]
						end ASC,
						case when @SortColumn = 'Email' and @SortAscending = 0 then 
							[Email]
						end DESC,
			
						case when @SortColumn = 'Data' and @SortAscending = 1 then 
							[Data]
						end ASC,
						case when @SortColumn = 'Data' and @SortAscending = 0 then 
							[Data]
						end DESC,
			
						case when @SortColumn = 'DateCreated' and @SortAscending = 1 then 
							[DateCreated]
						end ASC,
						case when @SortColumn = 'DateCreated' and @SortAscending = 0 then 
							[DateCreated]
						end DESC,
			
						case when @SortColumn = 'LastUpdated' and @SortAscending = 1 then 
							[LastUpdated]
						end ASC,
						case when @SortColumn = 'LastUpdated' and @SortAscending = 0 then 
							[LastUpdated]
						end DESC									
					) AS RowNumber,
					*
		FROM		(
					-- Automatically generated on 7/18/2024 5:57:46 PM.
    
    SELECT *
    FROM BlockedEmails WITH (NOLOCK) 
					) sub
		where		
					[BlockedEmailID] like '%' + @Search + '%' or
					[Email] like '%' + @Search + '%' 
	)
			
	SELECT	*
	FROM	SearchTable
	WHERE	RowNumber BETWEEN @FirstRow AND @LastRow
	ORDER BY RowNumber ASC
	OPTION (recompile);
	
	
		
GO
/****** Object:  StoredProcedure [dbo].[GetContentByContentNameSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[GetContentByContentNameSp]
	@ContentName [nvarchar](255)
AS

    -- Automatically generated on 8/23/2024 9:58:34 AM.
    
    SELECT *
    FROM Contents WITH (NOLOCK) 
    WHERE [ContentName] = @ContentName
GO
/****** Object:  StoredProcedure [dbo].[GetContentsByContentTypeIDSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[GetContentsByContentTypeIDSp]
	@ContentTypeID [int]
AS

    -- Automatically generated on 8/23/2024 9:58:34 AM.
    
    SELECT *
    FROM Contents WITH (NOLOCK) 
    WHERE [ContentTypeID] = @ContentTypeID
GO
/****** Object:  StoredProcedure [dbo].[GetContentsByContentTypeIDSp_CountSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[GetContentsByContentTypeIDSp_CountSp]
	@ContentTypeID [int],
	@Search [nvarchar](255)
AS


	SET NOCOUNT ON

	
	SELECT		COUNT(*) as Total
	FROM		(
				-- Automatically generated on 8/23/2024 9:58:34 AM.
    
    SELECT *
    FROM Contents WITH (NOLOCK) 
    WHERE [ContentTypeID] = @ContentTypeID
				) sub
	where		
					[ContentID] like '%' + @Search + '%' or
					[ContentName] like '%' + @Search + '%' 
		
GO
/****** Object:  StoredProcedure [dbo].[GetContentsByContentTypeIDSp_PagingSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[GetContentsByContentTypeIDSp_PagingSp]
	@ContentTypeID [int],
	@Search [nvarchar](255),
	@SortColumn [nvarchar](255),
	@SortAscending [bit],
	@SkipRows [int],
	@NumRows [int]
AS


	SET NOCOUNT ON

	DECLARE	@FirstRow INT,
	@LastRow INT

	set @FirstRow = @SkipRows + 1;
	set @LastRow = @SkipRows + @NumRows;
	
	with SearchTable as
	(
	
		SELECT		ROW_NUMBER() OVER (
					ORDER BY
					
			
						case when @SortColumn = 'ContentID' and @SortAscending = 1 then 
							[ContentID]
						end ASC,
						case when @SortColumn = 'ContentID' and @SortAscending = 0 then 
							[ContentID]
						end DESC,
			
						case when @SortColumn = 'ContentName' and @SortAscending = 1 then 
							[ContentName]
						end ASC,
						case when @SortColumn = 'ContentName' and @SortAscending = 0 then 
							[ContentName]
						end DESC,
			
						case when @SortColumn = 'LastUpdated' and @SortAscending = 1 then 
							[LastUpdated]
						end ASC,
						case when @SortColumn = 'LastUpdated' and @SortAscending = 0 then 
							[LastUpdated]
						end DESC,
			
						case when @SortColumn = 'DateCreated' and @SortAscending = 1 then 
							[DateCreated]
						end ASC,
						case when @SortColumn = 'DateCreated' and @SortAscending = 0 then 
							[DateCreated]
						end DESC,
			
						case when @SortColumn = 'Data' and @SortAscending = 1 then 
							[Data]
						end ASC,
						case when @SortColumn = 'Data' and @SortAscending = 0 then 
							[Data]
						end DESC,
			
						case when @SortColumn = 'ContentTypeID' and @SortAscending = 1 then 
							[ContentTypeID]
						end ASC,
						case when @SortColumn = 'ContentTypeID' and @SortAscending = 0 then 
							[ContentTypeID]
						end DESC									
					) AS RowNumber,
					*
		FROM		(
					-- Automatically generated on 8/23/2024 9:58:34 AM.
    
    SELECT *
    FROM Contents WITH (NOLOCK) 
    WHERE [ContentTypeID] = @ContentTypeID
					) sub
		where		
					[ContentID] like '%' + @Search + '%' or
					[ContentName] like '%' + @Search + '%' 
	)
			
	SELECT	*
	FROM	SearchTable
	WHERE	RowNumber BETWEEN @FirstRow AND @LastRow
	ORDER BY RowNumber ASC
	OPTION (recompile);
	
	
		
GO
/****** Object:  StoredProcedure [dbo].[GetContentSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[GetContentSp]
	@ContentID [int]
AS

    -- Automatically generated on 8/23/2024 9:58:34 AM.
    
    SELECT *
    FROM Contents WITH (NOLOCK) 
     WHERE ContentID = @ContentID

GO
/****** Object:  StoredProcedure [dbo].[GetContentsSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[GetContentsSp]
AS

    -- Automatically generated on 8/23/2024 9:58:34 AM.
    
    SELECT *
    FROM Contents WITH (NOLOCK) 
GO
/****** Object:  StoredProcedure [dbo].[GetContentsSp_CountSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[GetContentsSp_CountSp]
	@Search [nvarchar](255)
AS


	SET NOCOUNT ON

	
	SELECT		COUNT(*) as Total
	FROM		(
				-- Automatically generated on 8/23/2024 9:58:34 AM.
    
    SELECT *
    FROM Contents WITH (NOLOCK) 
				) sub
	where		
					[ContentID] like '%' + @Search + '%' or
					[ContentName] like '%' + @Search + '%' 
		
GO
/****** Object:  StoredProcedure [dbo].[GetContentsSp_PagingSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[GetContentsSp_PagingSp]
	@Search [nvarchar](255),
	@SortColumn [nvarchar](255),
	@SortAscending [bit],
	@SkipRows [int],
	@NumRows [int]
AS


	SET NOCOUNT ON

	DECLARE	@FirstRow INT,
	@LastRow INT

	set @FirstRow = @SkipRows + 1;
	set @LastRow = @SkipRows + @NumRows;
	
	with SearchTable as
	(
	
		SELECT		ROW_NUMBER() OVER (
					ORDER BY
					
			
						case when @SortColumn = 'ContentID' and @SortAscending = 1 then 
							[ContentID]
						end ASC,
						case when @SortColumn = 'ContentID' and @SortAscending = 0 then 
							[ContentID]
						end DESC,
			
						case when @SortColumn = 'ContentName' and @SortAscending = 1 then 
							[ContentName]
						end ASC,
						case when @SortColumn = 'ContentName' and @SortAscending = 0 then 
							[ContentName]
						end DESC,
			
						case when @SortColumn = 'LastUpdated' and @SortAscending = 1 then 
							[LastUpdated]
						end ASC,
						case when @SortColumn = 'LastUpdated' and @SortAscending = 0 then 
							[LastUpdated]
						end DESC,
			
						case when @SortColumn = 'DateCreated' and @SortAscending = 1 then 
							[DateCreated]
						end ASC,
						case when @SortColumn = 'DateCreated' and @SortAscending = 0 then 
							[DateCreated]
						end DESC,
			
						case when @SortColumn = 'Data' and @SortAscending = 1 then 
							[Data]
						end ASC,
						case when @SortColumn = 'Data' and @SortAscending = 0 then 
							[Data]
						end DESC,
			
						case when @SortColumn = 'ContentTypeID' and @SortAscending = 1 then 
							[ContentTypeID]
						end ASC,
						case when @SortColumn = 'ContentTypeID' and @SortAscending = 0 then 
							[ContentTypeID]
						end DESC									
					) AS RowNumber,
					*
		FROM		(
					-- Automatically generated on 8/23/2024 9:58:34 AM.
    
    SELECT *
    FROM Contents WITH (NOLOCK) 
					) sub
		where		
					[ContentID] like '%' + @Search + '%' or
					[ContentName] like '%' + @Search + '%' 
	)
			
	SELECT	*
	FROM	SearchTable
	WHERE	RowNumber BETWEEN @FirstRow AND @LastRow
	ORDER BY RowNumber ASC
	OPTION (recompile);
	
	
		
GO
/****** Object:  StoredProcedure [dbo].[GetContentTypeByContentTypeNameSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[GetContentTypeByContentTypeNameSp]
	@ContentTypeName [nvarchar](255)
AS

    -- Automatically generated on 8/23/2024 9:58:34 AM.
    
    SELECT *
    FROM ContentTypes WITH (NOLOCK) 
    WHERE [ContentTypeName] = @ContentTypeName
GO
/****** Object:  StoredProcedure [dbo].[GetContentTypeSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[GetContentTypeSp]
	@ContentTypeID [int]
AS

    -- Automatically generated on 8/23/2024 9:58:34 AM.
    
    SELECT *
    FROM ContentTypes WITH (NOLOCK) 
     WHERE ContentTypeID = @ContentTypeID

GO
/****** Object:  StoredProcedure [dbo].[GetContentTypesSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[GetContentTypesSp]
AS

    -- Automatically generated on 8/23/2024 9:58:34 AM.
    
    SELECT *
    FROM ContentTypes WITH (NOLOCK) 
GO
/****** Object:  StoredProcedure [dbo].[GetContentTypesSp_CountSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[GetContentTypesSp_CountSp]
	@Search [nvarchar](255)
AS


	SET NOCOUNT ON

	
	SELECT		COUNT(*) as Total
	FROM		(
				-- Automatically generated on 8/23/2024 9:58:34 AM.
    
    SELECT *
    FROM ContentTypes WITH (NOLOCK) 
				) sub
	where		
					[ContentTypeID] like '%' + @Search + '%' or
					[ContentTypeName] like '%' + @Search + '%' 
		
GO
/****** Object:  StoredProcedure [dbo].[GetContentTypesSp_PagingSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[GetContentTypesSp_PagingSp]
	@Search [nvarchar](255),
	@SortColumn [nvarchar](255),
	@SortAscending [bit],
	@SkipRows [int],
	@NumRows [int]
AS


	SET NOCOUNT ON

	DECLARE	@FirstRow INT,
	@LastRow INT

	set @FirstRow = @SkipRows + 1;
	set @LastRow = @SkipRows + @NumRows;
	
	with SearchTable as
	(
	
		SELECT		ROW_NUMBER() OVER (
					ORDER BY
					
			
						case when @SortColumn = 'ContentTypeID' and @SortAscending = 1 then 
							[ContentTypeID]
						end ASC,
						case when @SortColumn = 'ContentTypeID' and @SortAscending = 0 then 
							[ContentTypeID]
						end DESC,
			
						case when @SortColumn = 'ContentTypeName' and @SortAscending = 1 then 
							[ContentTypeName]
						end ASC,
						case when @SortColumn = 'ContentTypeName' and @SortAscending = 0 then 
							[ContentTypeName]
						end DESC,
			
						case when @SortColumn = 'Data' and @SortAscending = 1 then 
							[Data]
						end ASC,
						case when @SortColumn = 'Data' and @SortAscending = 0 then 
							[Data]
						end DESC,
			
						case when @SortColumn = 'DateCreated' and @SortAscending = 1 then 
							[DateCreated]
						end ASC,
						case when @SortColumn = 'DateCreated' and @SortAscending = 0 then 
							[DateCreated]
						end DESC,
			
						case when @SortColumn = 'LastUpdated' and @SortAscending = 1 then 
							[LastUpdated]
						end ASC,
						case when @SortColumn = 'LastUpdated' and @SortAscending = 0 then 
							[LastUpdated]
						end DESC									
					) AS RowNumber,
					*
		FROM		(
					-- Automatically generated on 8/23/2024 9:58:34 AM.
    
    SELECT *
    FROM ContentTypes WITH (NOLOCK) 
					) sub
		where		
					[ContentTypeID] like '%' + @Search + '%' or
					[ContentTypeName] like '%' + @Search + '%' 
	)
			
	SELECT	*
	FROM	SearchTable
	WHERE	RowNumber BETWEEN @FirstRow AND @LastRow
	ORDER BY RowNumber ASC
	OPTION (recompile);
	
	
		
GO
/****** Object:  StoredProcedure [dbo].[GetEmailHistoriesByEmailTemplateIDSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[GetEmailHistoriesByEmailTemplateIDSp]
	@EmailTemplateID [int]
AS

    -- Automatically generated on 7/18/2024 5:57:46 PM.
    
    SELECT *
    FROM EmailHistories WITH (NOLOCK) 
    WHERE [EmailTemplateID] = @EmailTemplateID
GO
/****** Object:  StoredProcedure [dbo].[GetEmailHistoriesByEmailTemplateIDSp_CountSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[GetEmailHistoriesByEmailTemplateIDSp_CountSp]
	@EmailTemplateID [int],
	@Search [nvarchar](255)
AS


	SET NOCOUNT ON

	
	SELECT		COUNT(*) as Total
	FROM		(
				-- Automatically generated on 7/18/2024 5:57:46 PM.
    
    SELECT *
    FROM EmailHistories WITH (NOLOCK) 
    WHERE [EmailTemplateID] = @EmailTemplateID
				) sub
	where		
					[EmailHistoryID] like '%' + @Search + '%' or
					[To] like '%' + @Search + '%' or
					[From] like '%' + @Search + '%' or
					[Subject] like '%' + @Search + '%' 
		
GO
/****** Object:  StoredProcedure [dbo].[GetEmailHistoriesByEmailTemplateIDSp_PagingSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[GetEmailHistoriesByEmailTemplateIDSp_PagingSp]
	@EmailTemplateID [int],
	@Search [nvarchar](255),
	@SortColumn [nvarchar](255),
	@SortAscending [bit],
	@SkipRows [int],
	@NumRows [int]
AS


	SET NOCOUNT ON

	DECLARE	@FirstRow INT,
	@LastRow INT

	set @FirstRow = @SkipRows + 1;
	set @LastRow = @SkipRows + @NumRows;
	
	with SearchTable as
	(
	
		SELECT		ROW_NUMBER() OVER (
					ORDER BY
					
			
						case when @SortColumn = 'EmailHistoryID' and @SortAscending = 1 then 
							[EmailHistoryID]
						end ASC,
						case when @SortColumn = 'EmailHistoryID' and @SortAscending = 0 then 
							[EmailHistoryID]
						end DESC,
			
						case when @SortColumn = 'To' and @SortAscending = 1 then 
							[To]
						end ASC,
						case when @SortColumn = 'To' and @SortAscending = 0 then 
							[To]
						end DESC,
			
						case when @SortColumn = 'From' and @SortAscending = 1 then 
							[From]
						end ASC,
						case when @SortColumn = 'From' and @SortAscending = 0 then 
							[From]
						end DESC,
			
						case when @SortColumn = 'EmailTemplateID' and @SortAscending = 1 then 
							[EmailTemplateID]
						end ASC,
						case when @SortColumn = 'EmailTemplateID' and @SortAscending = 0 then 
							[EmailTemplateID]
						end DESC,
			
						case when @SortColumn = 'Subject' and @SortAscending = 1 then 
							[Subject]
						end ASC,
						case when @SortColumn = 'Subject' and @SortAscending = 0 then 
							[Subject]
						end DESC,
			
						case when @SortColumn = 'DateCreated' and @SortAscending = 1 then 
							[DateCreated]
						end ASC,
						case when @SortColumn = 'DateCreated' and @SortAscending = 0 then 
							[DateCreated]
						end DESC,
			
						case when @SortColumn = 'IsPending' and @SortAscending = 1 then 
							[IsPending]
						end ASC,
						case when @SortColumn = 'IsPending' and @SortAscending = 0 then 
							[IsPending]
						end DESC,
			
						case when @SortColumn = 'IsSent' and @SortAscending = 1 then 
							[IsSent]
						end ASC,
						case when @SortColumn = 'IsSent' and @SortAscending = 0 then 
							[IsSent]
						end DESC,
			
						case when @SortColumn = 'Data' and @SortAscending = 1 then 
							[Data]
						end ASC,
						case when @SortColumn = 'Data' and @SortAscending = 0 then 
							[Data]
						end DESC,
			
						case when @SortColumn = 'LastUpdated' and @SortAscending = 1 then 
							[LastUpdated]
						end ASC,
						case when @SortColumn = 'LastUpdated' and @SortAscending = 0 then 
							[LastUpdated]
						end DESC									
					) AS RowNumber,
					*
		FROM		(
					-- Automatically generated on 7/18/2024 5:57:46 PM.
    
    SELECT *
    FROM EmailHistories WITH (NOLOCK) 
    WHERE [EmailTemplateID] = @EmailTemplateID
					) sub
		where		
					[EmailHistoryID] like '%' + @Search + '%' or
					[To] like '%' + @Search + '%' or
					[From] like '%' + @Search + '%' or
					[Subject] like '%' + @Search + '%' 
	)
			
	SELECT	*
	FROM	SearchTable
	WHERE	RowNumber BETWEEN @FirstRow AND @LastRow
	ORDER BY RowNumber ASC
	OPTION (recompile);
	
	
		
GO
/****** Object:  StoredProcedure [dbo].[GetEmailHistoriesSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[GetEmailHistoriesSp]
AS

    -- Automatically generated on 7/18/2024 5:57:46 PM.
    
    SELECT *
    FROM EmailHistories WITH (NOLOCK) 
GO
/****** Object:  StoredProcedure [dbo].[GetEmailHistoriesSp_CountSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[GetEmailHistoriesSp_CountSp]
	@Search [nvarchar](255)
AS


	SET NOCOUNT ON

	
	SELECT		COUNT(*) as Total
	FROM		(
				-- Automatically generated on 7/18/2024 5:57:46 PM.
    
    SELECT *
    FROM EmailHistories WITH (NOLOCK) 
				) sub
	where		
					[EmailHistoryID] like '%' + @Search + '%' or
					[To] like '%' + @Search + '%' or
					[From] like '%' + @Search + '%' or
					[Subject] like '%' + @Search + '%' 
		
GO
/****** Object:  StoredProcedure [dbo].[GetEmailHistoriesSp_PagingSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[GetEmailHistoriesSp_PagingSp]
	@Search [nvarchar](255),
	@SortColumn [nvarchar](255),
	@SortAscending [bit],
	@SkipRows [int],
	@NumRows [int]
AS


	SET NOCOUNT ON

	DECLARE	@FirstRow INT,
	@LastRow INT

	set @FirstRow = @SkipRows + 1;
	set @LastRow = @SkipRows + @NumRows;
	
	with SearchTable as
	(
	
		SELECT		ROW_NUMBER() OVER (
					ORDER BY
					
			
						case when @SortColumn = 'EmailHistoryID' and @SortAscending = 1 then 
							[EmailHistoryID]
						end ASC,
						case when @SortColumn = 'EmailHistoryID' and @SortAscending = 0 then 
							[EmailHistoryID]
						end DESC,
			
						case when @SortColumn = 'To' and @SortAscending = 1 then 
							[To]
						end ASC,
						case when @SortColumn = 'To' and @SortAscending = 0 then 
							[To]
						end DESC,
			
						case when @SortColumn = 'From' and @SortAscending = 1 then 
							[From]
						end ASC,
						case when @SortColumn = 'From' and @SortAscending = 0 then 
							[From]
						end DESC,
			
						case when @SortColumn = 'EmailTemplateID' and @SortAscending = 1 then 
							[EmailTemplateID]
						end ASC,
						case when @SortColumn = 'EmailTemplateID' and @SortAscending = 0 then 
							[EmailTemplateID]
						end DESC,
			
						case when @SortColumn = 'Subject' and @SortAscending = 1 then 
							[Subject]
						end ASC,
						case when @SortColumn = 'Subject' and @SortAscending = 0 then 
							[Subject]
						end DESC,
			
						case when @SortColumn = 'DateCreated' and @SortAscending = 1 then 
							[DateCreated]
						end ASC,
						case when @SortColumn = 'DateCreated' and @SortAscending = 0 then 
							[DateCreated]
						end DESC,
			
						case when @SortColumn = 'IsPending' and @SortAscending = 1 then 
							[IsPending]
						end ASC,
						case when @SortColumn = 'IsPending' and @SortAscending = 0 then 
							[IsPending]
						end DESC,
			
						case when @SortColumn = 'IsSent' and @SortAscending = 1 then 
							[IsSent]
						end ASC,
						case when @SortColumn = 'IsSent' and @SortAscending = 0 then 
							[IsSent]
						end DESC,
			
						case when @SortColumn = 'Data' and @SortAscending = 1 then 
							[Data]
						end ASC,
						case when @SortColumn = 'Data' and @SortAscending = 0 then 
							[Data]
						end DESC,
			
						case when @SortColumn = 'LastUpdated' and @SortAscending = 1 then 
							[LastUpdated]
						end ASC,
						case when @SortColumn = 'LastUpdated' and @SortAscending = 0 then 
							[LastUpdated]
						end DESC									
					) AS RowNumber,
					*
		FROM		(
					-- Automatically generated on 7/18/2024 5:57:46 PM.
    
    SELECT *
    FROM EmailHistories WITH (NOLOCK) 
					) sub
		where		
					[EmailHistoryID] like '%' + @Search + '%' or
					[To] like '%' + @Search + '%' or
					[From] like '%' + @Search + '%' or
					[Subject] like '%' + @Search + '%' 
	)
			
	SELECT	*
	FROM	SearchTable
	WHERE	RowNumber BETWEEN @FirstRow AND @LastRow
	ORDER BY RowNumber ASC
	OPTION (recompile);
	
	
		
GO
/****** Object:  StoredProcedure [dbo].[GetEmailHistorySp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[GetEmailHistorySp]
	@EmailHistoryID [int]
AS

    -- Automatically generated on 7/18/2024 5:57:46 PM.
    
    SELECT *
    FROM EmailHistories WITH (NOLOCK) 
     WHERE EmailHistoryID = @EmailHistoryID

GO
/****** Object:  StoredProcedure [dbo].[GetEmailTemplateByNameSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[GetEmailTemplateByNameSp]
	@Name [nvarchar](255)
AS

    -- Automatically generated on 7/18/2024 5:57:46 PM.
    
    SELECT *
    FROM EmailTemplates WITH (NOLOCK) 
    WHERE [Name] = @Name
GO
/****** Object:  StoredProcedure [dbo].[GetEmailTemplateSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[GetEmailTemplateSp]
	@EmailTemplateID [int]
AS

    -- Automatically generated on 7/18/2024 5:57:46 PM.
    
    SELECT *
    FROM EmailTemplates WITH (NOLOCK) 
     WHERE EmailTemplateID = @EmailTemplateID

GO
/****** Object:  StoredProcedure [dbo].[GetEmailTemplatesSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[GetEmailTemplatesSp]
AS

    -- Automatically generated on 7/18/2024 5:57:46 PM.
    
    SELECT *
    FROM EmailTemplates WITH (NOLOCK) 
GO
/****** Object:  StoredProcedure [dbo].[GetEmailTemplatesSp_CountSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[GetEmailTemplatesSp_CountSp]
	@Search [nvarchar](255)
AS


	SET NOCOUNT ON

	
	SELECT		COUNT(*) as Total
	FROM		(
				-- Automatically generated on 7/18/2024 5:57:46 PM.
    
    SELECT *
    FROM EmailTemplates WITH (NOLOCK) 
				) sub
	where		
					[EmailTemplateID] like '%' + @Search + '%' or
					[Name] like '%' + @Search + '%' or
					[EmailSubject] like '%' + @Search + '%' or
					[EmailParams] like '%' + @Search + '%' or
					[FromAddress] like '%' + @Search + '%' 
		
GO
/****** Object:  StoredProcedure [dbo].[GetEmailTemplatesSp_PagingSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[GetEmailTemplatesSp_PagingSp]
	@Search [nvarchar](255),
	@SortColumn [nvarchar](255),
	@SortAscending [bit],
	@SkipRows [int],
	@NumRows [int]
AS


	SET NOCOUNT ON

	DECLARE	@FirstRow INT,
	@LastRow INT

	set @FirstRow = @SkipRows + 1;
	set @LastRow = @SkipRows + @NumRows;
	
	with SearchTable as
	(
	
		SELECT		ROW_NUMBER() OVER (
					ORDER BY
					
			
						case when @SortColumn = 'EmailTemplateID' and @SortAscending = 1 then 
							[EmailTemplateID]
						end ASC,
						case when @SortColumn = 'EmailTemplateID' and @SortAscending = 0 then 
							[EmailTemplateID]
						end DESC,
			
						case when @SortColumn = 'Name' and @SortAscending = 1 then 
							[Name]
						end ASC,
						case when @SortColumn = 'Name' and @SortAscending = 0 then 
							[Name]
						end DESC,
			
						case when @SortColumn = 'EmailSubject' and @SortAscending = 1 then 
							[EmailSubject]
						end ASC,
						case when @SortColumn = 'EmailSubject' and @SortAscending = 0 then 
							[EmailSubject]
						end DESC,
			
						case when @SortColumn = 'EmailParams' and @SortAscending = 1 then 
							[EmailParams]
						end ASC,
						case when @SortColumn = 'EmailParams' and @SortAscending = 0 then 
							[EmailParams]
						end DESC,
			
						case when @SortColumn = 'FromAddress' and @SortAscending = 1 then 
							[FromAddress]
						end ASC,
						case when @SortColumn = 'FromAddress' and @SortAscending = 0 then 
							[FromAddress]
						end DESC,
			
						case when @SortColumn = 'DateCreated' and @SortAscending = 1 then 
							[DateCreated]
						end ASC,
						case when @SortColumn = 'DateCreated' and @SortAscending = 0 then 
							[DateCreated]
						end DESC,
			
						case when @SortColumn = 'LastUpdated' and @SortAscending = 1 then 
							[LastUpdated]
						end ASC,
						case when @SortColumn = 'LastUpdated' and @SortAscending = 0 then 
							[LastUpdated]
						end DESC,
			
						case when @SortColumn = 'Data' and @SortAscending = 1 then 
							[Data]
						end ASC,
						case when @SortColumn = 'Data' and @SortAscending = 0 then 
							[Data]
						end DESC									
					) AS RowNumber,
					*
		FROM		(
					-- Automatically generated on 7/18/2024 5:57:46 PM.
    
    SELECT *
    FROM EmailTemplates WITH (NOLOCK) 
					) sub
		where		
					[EmailTemplateID] like '%' + @Search + '%' or
					[Name] like '%' + @Search + '%' or
					[EmailSubject] like '%' + @Search + '%' or
					[EmailParams] like '%' + @Search + '%' or
					[FromAddress] like '%' + @Search + '%' 
	)
			
	SELECT	*
	FROM	SearchTable
	WHERE	RowNumber BETWEEN @FirstRow AND @LastRow
	ORDER BY RowNumber ASC
	OPTION (recompile);
	
	
		
GO
/****** Object:  StoredProcedure [dbo].[GetFeatureByFeatureNameSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetFeatureByFeatureNameSp]
	@FeatureName [nvarchar](255)
AS

    -- Automatically generated on 1/20/2024 5:38:31 AM.
    
    SELECT *
    FROM Features WITH (NOLOCK) 
    WHERE [FeatureName] = @FeatureName
GO
/****** Object:  StoredProcedure [dbo].[GetFeatureSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetFeatureSp]
	@FeatureID [int]
AS

    -- Automatically generated on 1/20/2024 5:38:31 AM.
    
    SELECT *
    FROM Features WITH (NOLOCK) 
     WHERE FeatureID = @FeatureID
GO
/****** Object:  StoredProcedure [dbo].[GetFeaturesSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetFeaturesSp]
AS

    -- Automatically generated on 1/20/2024 5:38:31 AM.
    
    SELECT *
    FROM Features WITH (NOLOCK) 
GO
/****** Object:  StoredProcedure [dbo].[GetFeaturesSp_CountSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetFeaturesSp_CountSp]
	@Search [nvarchar](255)
AS


	SET NOCOUNT ON

	
	SELECT		COUNT(*) as Total
	FROM		(
				-- Automatically generated on 1/20/2024 5:38:31 AM.
    
    SELECT *
    FROM Features WITH (NOLOCK) 
				) sub
	where		
					[FeatureID] like '%' + @Search + '%' or
					[FeatureName] like '%' + @Search + '%' or
					[Version] like '%' + @Search + '%' or
					[SettingsAssembly] like '%' + @Search + '%' or
					[SettingsClass] like '%' + @Search + '%' 
		
GO
/****** Object:  StoredProcedure [dbo].[GetFeaturesSp_PagingSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetFeaturesSp_PagingSp]
	@Search [nvarchar](255),
	@SortColumn [nvarchar](255),
	@SortAscending [bit],
	@SkipRows [int],
	@NumRows [int]
AS


	SET NOCOUNT ON

	DECLARE	@FirstRow INT,
	@LastRow INT

	set @FirstRow = @SkipRows + 1;
	set @LastRow = @SkipRows + @NumRows;
	
	with SearchTable as
	(
	
		SELECT		ROW_NUMBER() OVER (
					ORDER BY
					
			
						case when @SortColumn = 'FeatureID' and @SortAscending = 1 then 
							[FeatureID]
						end ASC,
						case when @SortColumn = 'FeatureID' and @SortAscending = 0 then 
							[FeatureID]
						end DESC,
			
						case when @SortColumn = 'FeatureName' and @SortAscending = 1 then 
							[FeatureName]
						end ASC,
						case when @SortColumn = 'FeatureName' and @SortAscending = 0 then 
							[FeatureName]
						end DESC,
			
						case when @SortColumn = 'Version' and @SortAscending = 1 then 
							[Version]
						end ASC,
						case when @SortColumn = 'Version' and @SortAscending = 0 then 
							[Version]
						end DESC,
			
						case when @SortColumn = 'IsEnabled' and @SortAscending = 1 then 
							[IsEnabled]
						end ASC,
						case when @SortColumn = 'IsEnabled' and @SortAscending = 0 then 
							[IsEnabled]
						end DESC,
			
						case when @SortColumn = 'SettingsAssembly' and @SortAscending = 1 then 
							[SettingsAssembly]
						end ASC,
						case when @SortColumn = 'SettingsAssembly' and @SortAscending = 0 then 
							[SettingsAssembly]
						end DESC,
			
						case when @SortColumn = 'SettingsClass' and @SortAscending = 1 then 
							[SettingsClass]
						end ASC,
						case when @SortColumn = 'SettingsClass' and @SortAscending = 0 then 
							[SettingsClass]
						end DESC,
			
						case when @SortColumn = 'Settings' and @SortAscending = 1 then 
							[Settings]
						end ASC,
						case when @SortColumn = 'Settings' and @SortAscending = 0 then 
							[Settings]
						end DESC,
			
						case when @SortColumn = 'DateCreated' and @SortAscending = 1 then 
							[DateCreated]
						end ASC,
						case when @SortColumn = 'DateCreated' and @SortAscending = 0 then 
							[DateCreated]
						end DESC,
			
						case when @SortColumn = 'LastUpdated' and @SortAscending = 1 then 
							[LastUpdated]
						end ASC,
						case when @SortColumn = 'LastUpdated' and @SortAscending = 0 then 
							[LastUpdated]
						end DESC,
			
						case when @SortColumn = 'Data' and @SortAscending = 1 then 
							[Data]
						end ASC,
						case when @SortColumn = 'Data' and @SortAscending = 0 then 
							[Data]
						end DESC									
					) AS RowNumber,
					*
		FROM		(
					-- Automatically generated on 1/20/2024 5:38:31 AM.
    
    SELECT *
    FROM Features WITH (NOLOCK) 
					) sub
		where		
					[FeatureID] like '%' + @Search + '%' or
					[FeatureName] like '%' + @Search + '%' or
					[Version] like '%' + @Search + '%' or
					[SettingsAssembly] like '%' + @Search + '%' or
					[SettingsClass] like '%' + @Search + '%' 
	)
			
	SELECT	*
	FROM	SearchTable
	WHERE	RowNumber BETWEEN @FirstRow AND @LastRow
	ORDER BY RowNumber ASC
	OPTION (recompile);
	
	
		
GO
/****** Object:  StoredProcedure [dbo].[GetPageLayoutByUrlSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetPageLayoutByUrlSp]
	@Url [nvarchar](512)
AS

    -- Automatically generated on 1/20/2024 5:38:31 AM.
    
    SELECT *
    FROM PageLayouts WITH (NOLOCK) 
    WHERE [Url] = @Url
GO
/****** Object:  StoredProcedure [dbo].[GetPageLayoutsByHandlerSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetPageLayoutsByHandlerSp]
	@Handler [nvarchar](512)
AS

    -- Automatically generated on 1/20/2024 5:38:31 AM.
    
    SELECT *
    FROM PageLayouts WITH (NOLOCK) 
    WHERE [Handler] = @Handler
GO
/****** Object:  StoredProcedure [dbo].[GetPageLayoutsByLayoutIDSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetPageLayoutsByLayoutIDSp]
	@LayoutID [int]
AS

    -- Automatically generated on 1/20/2024 5:38:31 AM.
    
    SELECT *
    FROM PageLayouts WITH (NOLOCK) 
    WHERE [LayoutID] = @LayoutID
GO
/****** Object:  StoredProcedure [dbo].[GetPageLayoutsByLayoutIDSp_CountSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetPageLayoutsByLayoutIDSp_CountSp]
	@LayoutID [int],
	@Search [nvarchar](255)
AS


	SET NOCOUNT ON

	
	SELECT		COUNT(*) as Total
	FROM		(
				-- Automatically generated on 1/20/2024 5:38:31 AM.
    
    SELECT *
    FROM PageLayouts WITH (NOLOCK) 
    WHERE [LayoutID] = @LayoutID
				) sub
	where		
					[PageLayoutID] like '%' + @Search + '%' or
					[Url] like '%' + @Search + '%' or
					[Handler] like '%' + @Search + '%' or
					[KeywordsMetaTag] like '%' + @Search + '%' or
					[DescriptionMetaTag] like '%' + @Search + '%' or
					[PageTitle] like '%' + @Search + '%' 
		
GO
/****** Object:  StoredProcedure [dbo].[GetPageLayoutsByLayoutIDSp_PagingSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetPageLayoutsByLayoutIDSp_PagingSp]
	@LayoutID [int],
	@Search [nvarchar](255),
	@SortColumn [nvarchar](255),
	@SortAscending [bit],
	@SkipRows [int],
	@NumRows [int]
AS


	SET NOCOUNT ON

	DECLARE	@FirstRow INT,
	@LastRow INT

	set @FirstRow = @SkipRows + 1;
	set @LastRow = @SkipRows + @NumRows;
	
	with SearchTable as
	(
	
		SELECT		ROW_NUMBER() OVER (
					ORDER BY
					
			
						case when @SortColumn = 'PageLayoutID' and @SortAscending = 1 then 
							[PageLayoutID]
						end ASC,
						case when @SortColumn = 'PageLayoutID' and @SortAscending = 0 then 
							[PageLayoutID]
						end DESC,
			
						case when @SortColumn = 'LayoutID' and @SortAscending = 1 then 
							[LayoutID]
						end ASC,
						case when @SortColumn = 'LayoutID' and @SortAscending = 0 then 
							[LayoutID]
						end DESC,
			
						case when @SortColumn = 'Url' and @SortAscending = 1 then 
							[Url]
						end ASC,
						case when @SortColumn = 'Url' and @SortAscending = 0 then 
							[Url]
						end DESC,
			
						case when @SortColumn = 'Handler' and @SortAscending = 1 then 
							[Handler]
						end ASC,
						case when @SortColumn = 'Handler' and @SortAscending = 0 then 
							[Handler]
						end DESC,
			
						case when @SortColumn = 'IsEnabled' and @SortAscending = 1 then 
							[IsEnabled]
						end ASC,
						case when @SortColumn = 'IsEnabled' and @SortAscending = 0 then 
							[IsEnabled]
						end DESC,
			
						case when @SortColumn = 'DateCreated' and @SortAscending = 1 then 
							[DateCreated]
						end ASC,
						case when @SortColumn = 'DateCreated' and @SortAscending = 0 then 
							[DateCreated]
						end DESC,
			
						case when @SortColumn = 'LastUpdated' and @SortAscending = 1 then 
							[LastUpdated]
						end ASC,
						case when @SortColumn = 'LastUpdated' and @SortAscending = 0 then 
							[LastUpdated]
						end DESC,
			
						case when @SortColumn = 'KeywordsMetaTag' and @SortAscending = 1 then 
							[KeywordsMetaTag]
						end ASC,
						case when @SortColumn = 'KeywordsMetaTag' and @SortAscending = 0 then 
							[KeywordsMetaTag]
						end DESC,
			
						case when @SortColumn = 'DescriptionMetaTag' and @SortAscending = 1 then 
							[DescriptionMetaTag]
						end ASC,
						case when @SortColumn = 'DescriptionMetaTag' and @SortAscending = 0 then 
							[DescriptionMetaTag]
						end DESC,
			
						case when @SortColumn = 'PageTitle' and @SortAscending = 1 then 
							[PageTitle]
						end ASC,
						case when @SortColumn = 'PageTitle' and @SortAscending = 0 then 
							[PageTitle]
						end DESC,
			
						case when @SortColumn = 'RoleID' and @SortAscending = 1 then 
							[RoleID]
						end ASC,
						case when @SortColumn = 'RoleID' and @SortAscending = 0 then 
							[RoleID]
						end DESC,
			
						case when @SortColumn = 'Priority' and @SortAscending = 1 then 
							[Priority]
						end ASC,
						case when @SortColumn = 'Priority' and @SortAscending = 0 then 
							[Priority]
						end DESC,
			
						case when @SortColumn = 'SiteID' and @SortAscending = 1 then 
							[SiteID]
						end ASC,
						case when @SortColumn = 'SiteID' and @SortAscending = 0 then 
							[SiteID]
						end DESC									
					) AS RowNumber,
					*
		FROM		(
					-- Automatically generated on 1/20/2024 5:38:31 AM.
    
    SELECT *
    FROM PageLayouts WITH (NOLOCK) 
    WHERE [LayoutID] = @LayoutID
					) sub
		where		
					[PageLayoutID] like '%' + @Search + '%' or
					[Url] like '%' + @Search + '%' or
					[Handler] like '%' + @Search + '%' or
					[KeywordsMetaTag] like '%' + @Search + '%' or
					[DescriptionMetaTag] like '%' + @Search + '%' or
					[PageTitle] like '%' + @Search + '%' 
	)
			
	SELECT	*
	FROM	SearchTable
	WHERE	RowNumber BETWEEN @FirstRow AND @LastRow
	ORDER BY RowNumber ASC
	OPTION (recompile);
	
	
		
GO
/****** Object:  StoredProcedure [dbo].[GetPageLayoutsByRoleIDSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetPageLayoutsByRoleIDSp]
	@RoleID [int]
AS

    -- Automatically generated on 1/20/2024 5:38:31 AM.
    
    SELECT *
    FROM PageLayouts WITH (NOLOCK) 
    WHERE [RoleID] = @RoleID
GO
/****** Object:  StoredProcedure [dbo].[GetPageLayoutsByRoleIDSp_CountSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetPageLayoutsByRoleIDSp_CountSp]
	@RoleID [int],
	@Search [nvarchar](255)
AS


	SET NOCOUNT ON

	
	SELECT		COUNT(*) as Total
	FROM		(
				-- Automatically generated on 1/20/2024 5:38:31 AM.
    
    SELECT *
    FROM PageLayouts WITH (NOLOCK) 
    WHERE [RoleID] = @RoleID
				) sub
	where		
					[PageLayoutID] like '%' + @Search + '%' or
					[Url] like '%' + @Search + '%' or
					[Handler] like '%' + @Search + '%' or
					[KeywordsMetaTag] like '%' + @Search + '%' or
					[DescriptionMetaTag] like '%' + @Search + '%' or
					[PageTitle] like '%' + @Search + '%' 
		
GO
/****** Object:  StoredProcedure [dbo].[GetPageLayoutsByRoleIDSp_PagingSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetPageLayoutsByRoleIDSp_PagingSp]
	@RoleID [int],
	@Search [nvarchar](255),
	@SortColumn [nvarchar](255),
	@SortAscending [bit],
	@SkipRows [int],
	@NumRows [int]
AS


	SET NOCOUNT ON

	DECLARE	@FirstRow INT,
	@LastRow INT

	set @FirstRow = @SkipRows + 1;
	set @LastRow = @SkipRows + @NumRows;
	
	with SearchTable as
	(
	
		SELECT		ROW_NUMBER() OVER (
					ORDER BY
					
			
						case when @SortColumn = 'PageLayoutID' and @SortAscending = 1 then 
							[PageLayoutID]
						end ASC,
						case when @SortColumn = 'PageLayoutID' and @SortAscending = 0 then 
							[PageLayoutID]
						end DESC,
			
						case when @SortColumn = 'LayoutID' and @SortAscending = 1 then 
							[LayoutID]
						end ASC,
						case when @SortColumn = 'LayoutID' and @SortAscending = 0 then 
							[LayoutID]
						end DESC,
			
						case when @SortColumn = 'Url' and @SortAscending = 1 then 
							[Url]
						end ASC,
						case when @SortColumn = 'Url' and @SortAscending = 0 then 
							[Url]
						end DESC,
			
						case when @SortColumn = 'Handler' and @SortAscending = 1 then 
							[Handler]
						end ASC,
						case when @SortColumn = 'Handler' and @SortAscending = 0 then 
							[Handler]
						end DESC,
			
						case when @SortColumn = 'IsEnabled' and @SortAscending = 1 then 
							[IsEnabled]
						end ASC,
						case when @SortColumn = 'IsEnabled' and @SortAscending = 0 then 
							[IsEnabled]
						end DESC,
			
						case when @SortColumn = 'DateCreated' and @SortAscending = 1 then 
							[DateCreated]
						end ASC,
						case when @SortColumn = 'DateCreated' and @SortAscending = 0 then 
							[DateCreated]
						end DESC,
			
						case when @SortColumn = 'LastUpdated' and @SortAscending = 1 then 
							[LastUpdated]
						end ASC,
						case when @SortColumn = 'LastUpdated' and @SortAscending = 0 then 
							[LastUpdated]
						end DESC,
			
						case when @SortColumn = 'KeywordsMetaTag' and @SortAscending = 1 then 
							[KeywordsMetaTag]
						end ASC,
						case when @SortColumn = 'KeywordsMetaTag' and @SortAscending = 0 then 
							[KeywordsMetaTag]
						end DESC,
			
						case when @SortColumn = 'DescriptionMetaTag' and @SortAscending = 1 then 
							[DescriptionMetaTag]
						end ASC,
						case when @SortColumn = 'DescriptionMetaTag' and @SortAscending = 0 then 
							[DescriptionMetaTag]
						end DESC,
			
						case when @SortColumn = 'PageTitle' and @SortAscending = 1 then 
							[PageTitle]
						end ASC,
						case when @SortColumn = 'PageTitle' and @SortAscending = 0 then 
							[PageTitle]
						end DESC,
			
						case when @SortColumn = 'RoleID' and @SortAscending = 1 then 
							[RoleID]
						end ASC,
						case when @SortColumn = 'RoleID' and @SortAscending = 0 then 
							[RoleID]
						end DESC,
			
						case when @SortColumn = 'Priority' and @SortAscending = 1 then 
							[Priority]
						end ASC,
						case when @SortColumn = 'Priority' and @SortAscending = 0 then 
							[Priority]
						end DESC,
			
						case when @SortColumn = 'SiteID' and @SortAscending = 1 then 
							[SiteID]
						end ASC,
						case when @SortColumn = 'SiteID' and @SortAscending = 0 then 
							[SiteID]
						end DESC									
					) AS RowNumber,
					*
		FROM		(
					-- Automatically generated on 1/20/2024 5:38:31 AM.
    
    SELECT *
    FROM PageLayouts WITH (NOLOCK) 
    WHERE [RoleID] = @RoleID
					) sub
		where		
					[PageLayoutID] like '%' + @Search + '%' or
					[Url] like '%' + @Search + '%' or
					[Handler] like '%' + @Search + '%' or
					[KeywordsMetaTag] like '%' + @Search + '%' or
					[DescriptionMetaTag] like '%' + @Search + '%' or
					[PageTitle] like '%' + @Search + '%' 
	)
			
	SELECT	*
	FROM	SearchTable
	WHERE	RowNumber BETWEEN @FirstRow AND @LastRow
	ORDER BY RowNumber ASC
	OPTION (recompile);
	
	
		
GO
/****** Object:  StoredProcedure [dbo].[GetPageLayoutsBySiteIDSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetPageLayoutsBySiteIDSp]
	@SiteID [int]
AS

    -- Automatically generated on 1/20/2024 5:38:31 AM.
    
    SELECT *
    FROM PageLayouts WITH (NOLOCK) 
    WHERE [SiteID] = @SiteID
GO
/****** Object:  StoredProcedure [dbo].[GetPageLayoutsBySiteIDSp_CountSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetPageLayoutsBySiteIDSp_CountSp]
	@SiteID [int],
	@Search [nvarchar](255)
AS


	SET NOCOUNT ON

	
	SELECT		COUNT(*) as Total
	FROM		(
				-- Automatically generated on 1/20/2024 5:38:31 AM.
    
    SELECT *
    FROM PageLayouts WITH (NOLOCK) 
    WHERE [SiteID] = @SiteID
				) sub
	where		
					[PageLayoutID] like '%' + @Search + '%' or
					[Url] like '%' + @Search + '%' or
					[Handler] like '%' + @Search + '%' or
					[KeywordsMetaTag] like '%' + @Search + '%' or
					[DescriptionMetaTag] like '%' + @Search + '%' or
					[PageTitle] like '%' + @Search + '%' 
		
GO
/****** Object:  StoredProcedure [dbo].[GetPageLayoutsBySiteIDSp_PagingSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetPageLayoutsBySiteIDSp_PagingSp]
	@SiteID [int],
	@Search [nvarchar](255),
	@SortColumn [nvarchar](255),
	@SortAscending [bit],
	@SkipRows [int],
	@NumRows [int]
AS


	SET NOCOUNT ON

	DECLARE	@FirstRow INT,
	@LastRow INT

	set @FirstRow = @SkipRows + 1;
	set @LastRow = @SkipRows + @NumRows;
	
	with SearchTable as
	(
	
		SELECT		ROW_NUMBER() OVER (
					ORDER BY
					
			
						case when @SortColumn = 'PageLayoutID' and @SortAscending = 1 then 
							[PageLayoutID]
						end ASC,
						case when @SortColumn = 'PageLayoutID' and @SortAscending = 0 then 
							[PageLayoutID]
						end DESC,
			
						case when @SortColumn = 'LayoutID' and @SortAscending = 1 then 
							[LayoutID]
						end ASC,
						case when @SortColumn = 'LayoutID' and @SortAscending = 0 then 
							[LayoutID]
						end DESC,
			
						case when @SortColumn = 'Url' and @SortAscending = 1 then 
							[Url]
						end ASC,
						case when @SortColumn = 'Url' and @SortAscending = 0 then 
							[Url]
						end DESC,
			
						case when @SortColumn = 'Handler' and @SortAscending = 1 then 
							[Handler]
						end ASC,
						case when @SortColumn = 'Handler' and @SortAscending = 0 then 
							[Handler]
						end DESC,
			
						case when @SortColumn = 'IsEnabled' and @SortAscending = 1 then 
							[IsEnabled]
						end ASC,
						case when @SortColumn = 'IsEnabled' and @SortAscending = 0 then 
							[IsEnabled]
						end DESC,
			
						case when @SortColumn = 'DateCreated' and @SortAscending = 1 then 
							[DateCreated]
						end ASC,
						case when @SortColumn = 'DateCreated' and @SortAscending = 0 then 
							[DateCreated]
						end DESC,
			
						case when @SortColumn = 'LastUpdated' and @SortAscending = 1 then 
							[LastUpdated]
						end ASC,
						case when @SortColumn = 'LastUpdated' and @SortAscending = 0 then 
							[LastUpdated]
						end DESC,
			
						case when @SortColumn = 'KeywordsMetaTag' and @SortAscending = 1 then 
							[KeywordsMetaTag]
						end ASC,
						case when @SortColumn = 'KeywordsMetaTag' and @SortAscending = 0 then 
							[KeywordsMetaTag]
						end DESC,
			
						case when @SortColumn = 'DescriptionMetaTag' and @SortAscending = 1 then 
							[DescriptionMetaTag]
						end ASC,
						case when @SortColumn = 'DescriptionMetaTag' and @SortAscending = 0 then 
							[DescriptionMetaTag]
						end DESC,
			
						case when @SortColumn = 'PageTitle' and @SortAscending = 1 then 
							[PageTitle]
						end ASC,
						case when @SortColumn = 'PageTitle' and @SortAscending = 0 then 
							[PageTitle]
						end DESC,
			
						case when @SortColumn = 'RoleID' and @SortAscending = 1 then 
							[RoleID]
						end ASC,
						case when @SortColumn = 'RoleID' and @SortAscending = 0 then 
							[RoleID]
						end DESC,
			
						case when @SortColumn = 'Priority' and @SortAscending = 1 then 
							[Priority]
						end ASC,
						case when @SortColumn = 'Priority' and @SortAscending = 0 then 
							[Priority]
						end DESC,
			
						case when @SortColumn = 'SiteID' and @SortAscending = 1 then 
							[SiteID]
						end ASC,
						case when @SortColumn = 'SiteID' and @SortAscending = 0 then 
							[SiteID]
						end DESC									
					) AS RowNumber,
					*
		FROM		(
					-- Automatically generated on 1/20/2024 5:38:31 AM.
    
    SELECT *
    FROM PageLayouts WITH (NOLOCK) 
    WHERE [SiteID] = @SiteID
					) sub
		where		
					[PageLayoutID] like '%' + @Search + '%' or
					[Url] like '%' + @Search + '%' or
					[Handler] like '%' + @Search + '%' or
					[KeywordsMetaTag] like '%' + @Search + '%' or
					[DescriptionMetaTag] like '%' + @Search + '%' or
					[PageTitle] like '%' + @Search + '%' 
	)
			
	SELECT	*
	FROM	SearchTable
	WHERE	RowNumber BETWEEN @FirstRow AND @LastRow
	ORDER BY RowNumber ASC
	OPTION (recompile);
	
	
		
GO
/****** Object:  StoredProcedure [dbo].[GetPageLayoutSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetPageLayoutSp]
	@PageLayoutID [int]
AS

    -- Automatically generated on 1/20/2024 5:38:31 AM.
    
    SELECT *
    FROM PageLayouts WITH (NOLOCK) 
     WHERE PageLayoutID = @PageLayoutID
GO
/****** Object:  StoredProcedure [dbo].[GetPageLayoutsSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetPageLayoutsSp]
AS

    -- Automatically generated on 1/20/2024 5:38:31 AM.
    
    SELECT *
    FROM PageLayouts WITH (NOLOCK) 
GO
/****** Object:  StoredProcedure [dbo].[GetPageLayoutsSp_CountSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
create PROCEDURE [dbo].[GetPageLayoutsSp_CountSp]
	@Search [nvarchar](255)
AS


	SET NOCOUNT ON

	
	SELECT		COUNT(*) as Total
	FROM		(
				-- Automatically generated on 3/11/2020 5:07:05 PM.
    
    SELECT *
    FROM PageLayouts WITH (NOLOCK) 
				) sub
	where		
					[PageLayoutID] like '%' + @Search + '%' or
					[Url] like '%' + @Search + '%' or
					[Handler] like '%' + @Search + '%' or
					[KeywordsMetaTag] like '%' + @Search + '%' or
					[DescriptionMetaTag] like '%' + @Search + '%' or
					[PageTitle] like '%' + @Search + '%' 
		
GO
/****** Object:  StoredProcedure [dbo].[GetPageLayoutsSp_PagingSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[GetPageLayoutsSp_PagingSp]
	@Search [nvarchar](255),
	@SortColumn [nvarchar](255),
	@SortAscending [bit],
	@SkipRows [int],
	@NumRows [int]
AS


	SET NOCOUNT ON

	DECLARE	@FirstRow INT,
	@LastRow INT

	set @FirstRow = @SkipRows + 1;
	set @LastRow = @SkipRows + @NumRows;
	
	with SearchTable as
	(
	
		SELECT		ROW_NUMBER() OVER (
					ORDER BY
					
			
						case when @SortColumn = 'PageLayoutID' and @SortAscending = 1 then 
							[PageLayoutID]
						end ASC,
						case when @SortColumn = 'PageLayoutID' and @SortAscending = 0 then 
							[PageLayoutID]
						end DESC,
			
						case when @SortColumn = 'LayoutID' and @SortAscending = 1 then 
							[LayoutID]
						end ASC,
						case when @SortColumn = 'LayoutID' and @SortAscending = 0 then 
							[LayoutID]
						end DESC,
			
						case when @SortColumn = 'Url' and @SortAscending = 1 then 
							[Url]
						end ASC,
						case when @SortColumn = 'Url' and @SortAscending = 0 then 
							[Url]
						end DESC,
			
						case when @SortColumn = 'Handler' and @SortAscending = 1 then 
							[Handler]
						end ASC,
						case when @SortColumn = 'Handler' and @SortAscending = 0 then 
							[Handler]
						end DESC,
			
						case when @SortColumn = 'IsEnabled' and @SortAscending = 1 then 
							[IsEnabled]
						end ASC,
						case when @SortColumn = 'IsEnabled' and @SortAscending = 0 then 
							[IsEnabled]
						end DESC,
			
						case when @SortColumn = 'DateCreated' and @SortAscending = 1 then 
							[DateCreated]
						end ASC,
						case when @SortColumn = 'DateCreated' and @SortAscending = 0 then 
							[DateCreated]
						end DESC,
			
						case when @SortColumn = 'LastUpdated' and @SortAscending = 1 then 
							[LastUpdated]
						end ASC,
						case when @SortColumn = 'LastUpdated' and @SortAscending = 0 then 
							[LastUpdated]
						end DESC,
			
						case when @SortColumn = 'KeywordsMetaTag' and @SortAscending = 1 then 
							[KeywordsMetaTag]
						end ASC,
						case when @SortColumn = 'KeywordsMetaTag' and @SortAscending = 0 then 
							[KeywordsMetaTag]
						end DESC,
			
						case when @SortColumn = 'DescriptionMetaTag' and @SortAscending = 1 then 
							[DescriptionMetaTag]
						end ASC,
						case when @SortColumn = 'DescriptionMetaTag' and @SortAscending = 0 then 
							[DescriptionMetaTag]
						end DESC,
			
						case when @SortColumn = 'PageTitle' and @SortAscending = 1 then 
							[PageTitle]
						end ASC,
						case when @SortColumn = 'PageTitle' and @SortAscending = 0 then 
							[PageTitle]
						end DESC,
			
						case when @SortColumn = 'RoleID' and @SortAscending = 1 then 
							[RoleID]
						end ASC,
						case when @SortColumn = 'RoleID' and @SortAscending = 0 then 
							[RoleID]
						end DESC,
			
						case when @SortColumn = 'Priority' and @SortAscending = 1 then 
							[Priority]
						end ASC,
						case when @SortColumn = 'Priority' and @SortAscending = 0 then 
							[Priority]
						end DESC,
			
						case when @SortColumn = 'SiteID' and @SortAscending = 1 then 
							[SiteID]
						end ASC,
						case when @SortColumn = 'SiteID' and @SortAscending = 0 then 
							[SiteID]
						end DESC									
					) AS RowNumber,
					*
		FROM		(
					-- Automatically generated on 3/11/2020 5:07:05 PM.
    
    SELECT *
    FROM PageLayouts WITH (NOLOCK) 
					) sub
		where		
					[PageLayoutID] like '%' + @Search + '%' or
					[Url] like '%' + @Search + '%' or
					[Handler] like '%' + @Search + '%' or
					[KeywordsMetaTag] like '%' + @Search + '%' or
					[DescriptionMetaTag] like '%' + @Search + '%' or
					[PageTitle] like '%' + @Search + '%' 
	)
			
	SELECT	*
	FROM	SearchTable
	WHERE	RowNumber BETWEEN @FirstRow AND @LastRow
	ORDER BY RowNumber ASC
	OPTION (recompile);
	
	
		
GO
/****** Object:  StoredProcedure [dbo].[GetRoleByRoleNameSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetRoleByRoleNameSp]
	@RoleName [nvarchar](255)
AS

    -- Automatically generated on 1/31/2024 10:23:40 AM.
    
    SELECT *
    FROM Roles WITH (NOLOCK) 
    WHERE [RoleName] = @RoleName
GO
/****** Object:  StoredProcedure [dbo].[GetRolesByUserRoleUserIDSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetRolesByUserRoleUserIDSp]
	@UserID [int]
AS

    -- Automatically generated on 1/31/2024 10:23:40 AM.
    
    SELECT t2.*
    FROM UserRoles t1 WITH (NOLOCK) 
    JOIN Roles t2 WITH (NOLOCK) 
    ON t1.RoleID = t2.RoleID
    WHERE t1.[UserID] = @UserID
GO
/****** Object:  StoredProcedure [dbo].[GetRolesByUserRoleUserIDSp_CountSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO


CREATE PROCEDURE [dbo].[GetRolesByUserRoleUserIDSp_CountSp]
	@UserID [int],
	@Search [nvarchar](255)
AS


	SET NOCOUNT ON

	
	SELECT		COUNT(*) as Total
	FROM		(
				-- Automatically generated on 1/24/2023 7:44:21 AM.
    
    SELECT t2.*
    FROM UserRoles t1 WITH (NOLOCK) 
    JOIN Roles t2 WITH (NOLOCK) 
    ON t1.RoleID = t2.RoleID
    WHERE t1.[UserID] = @UserID
				) sub
	where		
					[RoleID] like '%' + @Search + '%' or
					[RoleName] like '%' + @Search + '%' 
		
GO
/****** Object:  StoredProcedure [dbo].[GetRolesByUserRoleUserIDSp_PagingSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO


CREATE PROCEDURE [dbo].[GetRolesByUserRoleUserIDSp_PagingSp]
	@UserID [int],
	@Search [nvarchar](255),
	@SortColumn [nvarchar](255),
	@SortAscending [bit],
	@SkipRows [int],
	@NumRows [int]
AS


	SET NOCOUNT ON

	DECLARE	@FirstRow INT,
	@LastRow INT

	set @FirstRow = @SkipRows + 1;
	set @LastRow = @SkipRows + @NumRows;
	
	with SearchTable as
	(
	
		SELECT		ROW_NUMBER() OVER (
					ORDER BY
					
			
						case when @SortColumn = 'RoleID' and @SortAscending = 1 then 
							[RoleID]
						end ASC,
						case when @SortColumn = 'RoleID' and @SortAscending = 0 then 
							[RoleID]
						end DESC,
			
						case when @SortColumn = 'RoleName' and @SortAscending = 1 then 
							[RoleName]
						end ASC,
						case when @SortColumn = 'RoleName' and @SortAscending = 0 then 
							[RoleName]
						end DESC,
			
						case when @SortColumn = 'DateCreated' and @SortAscending = 1 then 
							[DateCreated]
						end ASC,
						case when @SortColumn = 'DateCreated' and @SortAscending = 0 then 
							[DateCreated]
						end DESC,
			
						case when @SortColumn = 'LastUpdated' and @SortAscending = 1 then 
							[LastUpdated]
						end ASC,
						case when @SortColumn = 'LastUpdated' and @SortAscending = 0 then 
							[LastUpdated]
						end DESC,
			
						case when @SortColumn = 'Data' and @SortAscending = 1 then 
							[Data]
						end ASC,
						case when @SortColumn = 'Data' and @SortAscending = 0 then 
							[Data]
						end DESC									
					) AS RowNumber,
					*
		FROM		(
					-- Automatically generated on 1/24/2023 7:44:21 AM.
    
    SELECT t2.*
    FROM UserRoles t1 WITH (NOLOCK) 
    JOIN Roles t2 WITH (NOLOCK) 
    ON t1.RoleID = t2.RoleID
    WHERE t1.[UserID] = @UserID
					) sub
		where		
					[RoleID] like '%' + @Search + '%' or
					[RoleName] like '%' + @Search + '%' 
	)
			
	SELECT	*
	FROM	SearchTable
	WHERE	RowNumber BETWEEN @FirstRow AND @LastRow
	ORDER BY RowNumber ASC
	OPTION (recompile);
	
	
		
GO
/****** Object:  StoredProcedure [dbo].[GetRoleSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetRoleSp]
	@RoleID [int]
AS

    -- Automatically generated on 1/31/2024 10:23:40 AM.
    
    SELECT *
    FROM Roles WITH (NOLOCK) 
     WHERE RoleID = @RoleID
GO
/****** Object:  StoredProcedure [dbo].[GetRolesSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetRolesSp]
AS

    -- Automatically generated on 1/31/2024 10:23:40 AM.
    
    SELECT *
    FROM Roles WITH (NOLOCK) 
GO
/****** Object:  StoredProcedure [dbo].[GetRolesSp_CountSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetRolesSp_CountSp]
	@Search [nvarchar](255)
AS


	SET NOCOUNT ON

	
	SELECT		COUNT(*) as Total
	FROM		(
				-- Automatically generated on 1/31/2024 10:23:40 AM.
    
    SELECT *
    FROM Roles WITH (NOLOCK) 
				) sub
	where		
					[RoleID] like '%' + @Search + '%' or
					[RoleName] like '%' + @Search + '%' 
		
GO
/****** Object:  StoredProcedure [dbo].[GetRolesSp_PagingSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetRolesSp_PagingSp]
	@Search [nvarchar](255),
	@SortColumn [nvarchar](255),
	@SortAscending [bit],
	@SkipRows [int],
	@NumRows [int]
AS


	SET NOCOUNT ON

	DECLARE	@FirstRow INT,
	@LastRow INT

	set @FirstRow = @SkipRows + 1;
	set @LastRow = @SkipRows + @NumRows;
	
	with SearchTable as
	(
	
		SELECT		ROW_NUMBER() OVER (
					ORDER BY
					
			
						case when @SortColumn = 'RoleID' and @SortAscending = 1 then 
							[RoleID]
						end ASC,
						case when @SortColumn = 'RoleID' and @SortAscending = 0 then 
							[RoleID]
						end DESC,
			
						case when @SortColumn = 'RoleName' and @SortAscending = 1 then 
							[RoleName]
						end ASC,
						case when @SortColumn = 'RoleName' and @SortAscending = 0 then 
							[RoleName]
						end DESC,
			
						case when @SortColumn = 'DateCreated' and @SortAscending = 1 then 
							[DateCreated]
						end ASC,
						case when @SortColumn = 'DateCreated' and @SortAscending = 0 then 
							[DateCreated]
						end DESC,
			
						case when @SortColumn = 'LastUpdated' and @SortAscending = 1 then 
							[LastUpdated]
						end ASC,
						case when @SortColumn = 'LastUpdated' and @SortAscending = 0 then 
							[LastUpdated]
						end DESC,
			
						case when @SortColumn = 'Data' and @SortAscending = 1 then 
							[Data]
						end ASC,
						case when @SortColumn = 'Data' and @SortAscending = 0 then 
							[Data]
						end DESC									
					) AS RowNumber,
					*
		FROM		(
					-- Automatically generated on 1/31/2024 10:23:40 AM.
    
    SELECT *
    FROM Roles WITH (NOLOCK) 
					) sub
		where		
					[RoleID] like '%' + @Search + '%' or
					[RoleName] like '%' + @Search + '%' 
	)
			
	SELECT	*
	FROM	SearchTable
	WHERE	RowNumber BETWEEN @FirstRow AND @LastRow
	ORDER BY RowNumber ASC
	OPTION (recompile);
	
	
		
GO
/****** Object:  StoredProcedure [dbo].[GetTierByTierNameSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[GetTierByTierNameSp]
	@TierName [nvarchar](255)
AS

    -- Automatically generated on 1/31/2024 10:23:40 AM.
    
    SELECT *
    FROM Tiers WITH (NOLOCK) 
    WHERE [TierName] = @TierName
GO
/****** Object:  StoredProcedure [dbo].[GetTierSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[GetTierSp]
	@TierID [int]
AS

    -- Automatically generated on 1/31/2024 10:23:40 AM.
    
    SELECT *
    FROM Tiers WITH (NOLOCK) 
     WHERE TierID = @TierID

GO
/****** Object:  StoredProcedure [dbo].[GetTiersSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[GetTiersSp]
AS

    -- Automatically generated on 1/31/2024 10:23:40 AM.
    
    SELECT *
    FROM Tiers WITH (NOLOCK) 
GO
/****** Object:  StoredProcedure [dbo].[GetTiersSp_CountSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[GetTiersSp_CountSp]
	@Search [nvarchar](255)
AS


	SET NOCOUNT ON

	
	SELECT		COUNT(*) as Total
	FROM		(
				-- Automatically generated on 1/31/2024 10:23:40 AM.
    
    SELECT *
    FROM Tiers WITH (NOLOCK) 
				) sub
	where		
					[TierID] like '%' + @Search + '%' or
					[TierName] like '%' + @Search + '%' 
		
GO
/****** Object:  StoredProcedure [dbo].[GetTiersSp_PagingSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[GetTiersSp_PagingSp]
	@Search [nvarchar](255),
	@SortColumn [nvarchar](255),
	@SortAscending [bit],
	@SkipRows [int],
	@NumRows [int]
AS


	SET NOCOUNT ON

	DECLARE	@FirstRow INT,
	@LastRow INT

	set @FirstRow = @SkipRows + 1;
	set @LastRow = @SkipRows + @NumRows;
	
	with SearchTable as
	(
	
		SELECT		ROW_NUMBER() OVER (
					ORDER BY
					
			
						case when @SortColumn = 'TierID' and @SortAscending = 1 then 
							[TierID]
						end ASC,
						case when @SortColumn = 'TierID' and @SortAscending = 0 then 
							[TierID]
						end DESC,
			
						case when @SortColumn = 'TierName' and @SortAscending = 1 then 
							[TierName]
						end ASC,
						case when @SortColumn = 'TierName' and @SortAscending = 0 then 
							[TierName]
						end DESC,
			
						case when @SortColumn = 'Data' and @SortAscending = 1 then 
							[Data]
						end ASC,
						case when @SortColumn = 'Data' and @SortAscending = 0 then 
							[Data]
						end DESC,
			
						case when @SortColumn = 'DateCreated' and @SortAscending = 1 then 
							[DateCreated]
						end ASC,
						case when @SortColumn = 'DateCreated' and @SortAscending = 0 then 
							[DateCreated]
						end DESC,
			
						case when @SortColumn = 'LastUpdated' and @SortAscending = 1 then 
							[LastUpdated]
						end ASC,
						case when @SortColumn = 'LastUpdated' and @SortAscending = 0 then 
							[LastUpdated]
						end DESC									
					) AS RowNumber,
					*
		FROM		(
					-- Automatically generated on 1/31/2024 10:23:40 AM.
    
    SELECT *
    FROM Tiers WITH (NOLOCK) 
					) sub
		where		
					[TierID] like '%' + @Search + '%' or
					[TierName] like '%' + @Search + '%' 
	)
			
	SELECT	*
	FROM	SearchTable
	WHERE	RowNumber BETWEEN @FirstRow AND @LastRow
	ORDER BY RowNumber ASC
	OPTION (recompile);
	
	
		
GO
/****** Object:  StoredProcedure [dbo].[GetUsageDimensionByUsageDimensionSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[GetUsageDimensionByUsageDimensionSp]
	@UsageDimension [nvarchar](255)
AS

    -- Automatically generated on 1/31/2024 10:23:40 AM.
    
    SELECT *
    FROM UsageDimensions WITH (NOLOCK) 
    WHERE [UsageDimension] = @UsageDimension
GO
/****** Object:  StoredProcedure [dbo].[GetUsageDimensionSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[GetUsageDimensionSp]
	@UsageDimensionID [int]
AS

    -- Automatically generated on 1/31/2024 10:23:40 AM.
    
    SELECT *
    FROM UsageDimensions WITH (NOLOCK) 
     WHERE UsageDimensionID = @UsageDimensionID

GO
/****** Object:  StoredProcedure [dbo].[GetUsageDimensionsSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[GetUsageDimensionsSp]
AS

    -- Automatically generated on 1/31/2024 10:23:40 AM.
    
    SELECT *
    FROM UsageDimensions WITH (NOLOCK) 
GO
/****** Object:  StoredProcedure [dbo].[GetUsageDimensionsSp_CountSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[GetUsageDimensionsSp_CountSp]
	@Search [nvarchar](255)
AS


	SET NOCOUNT ON

	
	SELECT		COUNT(*) as Total
	FROM		(
				-- Automatically generated on 1/31/2024 10:23:40 AM.
    
    SELECT *
    FROM UsageDimensions WITH (NOLOCK) 
				) sub
	where		
					[UsageDimensionID] like '%' + @Search + '%' or
					[UsageDimension] like '%' + @Search + '%' 
		
GO
/****** Object:  StoredProcedure [dbo].[GetUsageDimensionsSp_PagingSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[GetUsageDimensionsSp_PagingSp]
	@Search [nvarchar](255),
	@SortColumn [nvarchar](255),
	@SortAscending [bit],
	@SkipRows [int],
	@NumRows [int]
AS


	SET NOCOUNT ON

	DECLARE	@FirstRow INT,
	@LastRow INT

	set @FirstRow = @SkipRows + 1;
	set @LastRow = @SkipRows + @NumRows;
	
	with SearchTable as
	(
	
		SELECT		ROW_NUMBER() OVER (
					ORDER BY
					
			
						case when @SortColumn = 'UsageDimensionID' and @SortAscending = 1 then 
							[UsageDimensionID]
						end ASC,
						case when @SortColumn = 'UsageDimensionID' and @SortAscending = 0 then 
							[UsageDimensionID]
						end DESC,
			
						case when @SortColumn = 'UsageDimension' and @SortAscending = 1 then 
							[UsageDimension]
						end ASC,
						case when @SortColumn = 'UsageDimension' and @SortAscending = 0 then 
							[UsageDimension]
						end DESC,
			
						case when @SortColumn = 'DateCreated' and @SortAscending = 1 then 
							[DateCreated]
						end ASC,
						case when @SortColumn = 'DateCreated' and @SortAscending = 0 then 
							[DateCreated]
						end DESC,
			
						case when @SortColumn = 'LastUpdated' and @SortAscending = 1 then 
							[LastUpdated]
						end ASC,
						case when @SortColumn = 'LastUpdated' and @SortAscending = 0 then 
							[LastUpdated]
						end DESC,
			
						case when @SortColumn = 'Data' and @SortAscending = 1 then 
							[Data]
						end ASC,
						case when @SortColumn = 'Data' and @SortAscending = 0 then 
							[Data]
						end DESC									
					) AS RowNumber,
					*
		FROM		(
					-- Automatically generated on 1/31/2024 10:23:40 AM.
    
    SELECT *
    FROM UsageDimensions WITH (NOLOCK) 
					) sub
		where		
					[UsageDimensionID] like '%' + @Search + '%' or
					[UsageDimension] like '%' + @Search + '%' 
	)
			
	SELECT	*
	FROM	SearchTable
	WHERE	RowNumber BETWEEN @FirstRow AND @LastRow
	ORDER BY RowNumber ASC
	OPTION (recompile);
	
	
		
GO
/****** Object:  StoredProcedure [dbo].[GetUserByEmailSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetUserByEmailSp]
	@Email [nvarchar](255)
AS

    -- Automatically generated on 1/31/2024 10:23:40 AM.
    
    SELECT *
    FROM Users WITH (NOLOCK) 
    WHERE [Email] = @Email
GO
/****** Object:  StoredProcedure [dbo].[GetUserRolesByRoleIDSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetUserRolesByRoleIDSp]
	@RoleID [int]
AS

    -- Automatically generated on 1/31/2024 10:23:40 AM.
    
    SELECT *
    FROM UserRoles WITH (NOLOCK) 
    WHERE [RoleID] = @RoleID
GO
/****** Object:  StoredProcedure [dbo].[GetUserRolesByRoleIDSp_CountSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetUserRolesByRoleIDSp_CountSp]
	@RoleID [int],
	@Search [nvarchar](255)
AS


	SET NOCOUNT ON

	
	SELECT		COUNT(*) as Total
	FROM		(
				-- Automatically generated on 1/31/2024 10:23:40 AM.
    
    SELECT *
    FROM UserRoles WITH (NOLOCK) 
    WHERE [RoleID] = @RoleID
				) sub
	where		
					[UserRoleID] like '%' + @Search + '%' 
		
GO
/****** Object:  StoredProcedure [dbo].[GetUserRolesByRoleIDSp_PagingSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetUserRolesByRoleIDSp_PagingSp]
	@RoleID [int],
	@Search [nvarchar](255),
	@SortColumn [nvarchar](255),
	@SortAscending [bit],
	@SkipRows [int],
	@NumRows [int]
AS


	SET NOCOUNT ON

	DECLARE	@FirstRow INT,
	@LastRow INT

	set @FirstRow = @SkipRows + 1;
	set @LastRow = @SkipRows + @NumRows;
	
	with SearchTable as
	(
	
		SELECT		ROW_NUMBER() OVER (
					ORDER BY
					
			
						case when @SortColumn = 'UserRoleID' and @SortAscending = 1 then 
							[UserRoleID]
						end ASC,
						case when @SortColumn = 'UserRoleID' and @SortAscending = 0 then 
							[UserRoleID]
						end DESC,
			
						case when @SortColumn = 'UserID' and @SortAscending = 1 then 
							[UserID]
						end ASC,
						case when @SortColumn = 'UserID' and @SortAscending = 0 then 
							[UserID]
						end DESC,
			
						case when @SortColumn = 'RoleID' and @SortAscending = 1 then 
							[RoleID]
						end ASC,
						case when @SortColumn = 'RoleID' and @SortAscending = 0 then 
							[RoleID]
						end DESC,
			
						case when @SortColumn = 'DateCreated' and @SortAscending = 1 then 
							[DateCreated]
						end ASC,
						case when @SortColumn = 'DateCreated' and @SortAscending = 0 then 
							[DateCreated]
						end DESC,
			
						case when @SortColumn = 'LastUpdated' and @SortAscending = 1 then 
							[LastUpdated]
						end ASC,
						case when @SortColumn = 'LastUpdated' and @SortAscending = 0 then 
							[LastUpdated]
						end DESC,
			
						case when @SortColumn = 'Data' and @SortAscending = 1 then 
							[Data]
						end ASC,
						case when @SortColumn = 'Data' and @SortAscending = 0 then 
							[Data]
						end DESC									
					) AS RowNumber,
					*
		FROM		(
					-- Automatically generated on 1/31/2024 10:23:40 AM.
    
    SELECT *
    FROM UserRoles WITH (NOLOCK) 
    WHERE [RoleID] = @RoleID
					) sub
		where		
					[UserRoleID] like '%' + @Search + '%' 
	)
			
	SELECT	*
	FROM	SearchTable
	WHERE	RowNumber BETWEEN @FirstRow AND @LastRow
	ORDER BY RowNumber ASC
	OPTION (recompile);
	
	
		
GO
/****** Object:  StoredProcedure [dbo].[GetUserRolesByRoleIDUserIDSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetUserRolesByRoleIDUserIDSp]
	@RoleID [int],
	@UserID [int]
AS

    -- Automatically generated on 1/31/2024 10:23:40 AM.
    
    SELECT *
    FROM UserRoles WITH (NOLOCK) 
    WHERE [RoleID] = @RoleID AND [UserID] = @UserID
GO
/****** Object:  StoredProcedure [dbo].[GetUserRolesByUserIDSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetUserRolesByUserIDSp]
	@UserID [int]
AS

    -- Automatically generated on 1/31/2024 10:23:40 AM.
    
    SELECT *
    FROM UserRoles WITH (NOLOCK) 
    WHERE [UserID] = @UserID
GO
/****** Object:  StoredProcedure [dbo].[GetUserRolesByUserIDSp_CountSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetUserRolesByUserIDSp_CountSp]
	@UserID [int],
	@Search [nvarchar](255)
AS


	SET NOCOUNT ON

	
	SELECT		COUNT(*) as Total
	FROM		(
				-- Automatically generated on 1/31/2024 10:23:40 AM.
    
    SELECT *
    FROM UserRoles WITH (NOLOCK) 
    WHERE [UserID] = @UserID
				) sub
	where		
					[UserRoleID] like '%' + @Search + '%' 
		
GO
/****** Object:  StoredProcedure [dbo].[GetUserRolesByUserIDSp_PagingSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetUserRolesByUserIDSp_PagingSp]
	@UserID [int],
	@Search [nvarchar](255),
	@SortColumn [nvarchar](255),
	@SortAscending [bit],
	@SkipRows [int],
	@NumRows [int]
AS


	SET NOCOUNT ON

	DECLARE	@FirstRow INT,
	@LastRow INT

	set @FirstRow = @SkipRows + 1;
	set @LastRow = @SkipRows + @NumRows;
	
	with SearchTable as
	(
	
		SELECT		ROW_NUMBER() OVER (
					ORDER BY
					
			
						case when @SortColumn = 'UserRoleID' and @SortAscending = 1 then 
							[UserRoleID]
						end ASC,
						case when @SortColumn = 'UserRoleID' and @SortAscending = 0 then 
							[UserRoleID]
						end DESC,
			
						case when @SortColumn = 'UserID' and @SortAscending = 1 then 
							[UserID]
						end ASC,
						case when @SortColumn = 'UserID' and @SortAscending = 0 then 
							[UserID]
						end DESC,
			
						case when @SortColumn = 'RoleID' and @SortAscending = 1 then 
							[RoleID]
						end ASC,
						case when @SortColumn = 'RoleID' and @SortAscending = 0 then 
							[RoleID]
						end DESC,
			
						case when @SortColumn = 'DateCreated' and @SortAscending = 1 then 
							[DateCreated]
						end ASC,
						case when @SortColumn = 'DateCreated' and @SortAscending = 0 then 
							[DateCreated]
						end DESC,
			
						case when @SortColumn = 'LastUpdated' and @SortAscending = 1 then 
							[LastUpdated]
						end ASC,
						case when @SortColumn = 'LastUpdated' and @SortAscending = 0 then 
							[LastUpdated]
						end DESC,
			
						case when @SortColumn = 'Data' and @SortAscending = 1 then 
							[Data]
						end ASC,
						case when @SortColumn = 'Data' and @SortAscending = 0 then 
							[Data]
						end DESC									
					) AS RowNumber,
					*
		FROM		(
					-- Automatically generated on 1/31/2024 10:23:40 AM.
    
    SELECT *
    FROM UserRoles WITH (NOLOCK) 
    WHERE [UserID] = @UserID
					) sub
		where		
					[UserRoleID] like '%' + @Search + '%' 
	)
			
	SELECT	*
	FROM	SearchTable
	WHERE	RowNumber BETWEEN @FirstRow AND @LastRow
	ORDER BY RowNumber ASC
	OPTION (recompile);
	
	
		
GO
/****** Object:  StoredProcedure [dbo].[GetUserRoleSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetUserRoleSp]
	@UserRoleID [int]
AS

    -- Automatically generated on 1/31/2024 10:23:40 AM.
    
    SELECT *
    FROM UserRoles WITH (NOLOCK) 
     WHERE UserRoleID = @UserRoleID
GO
/****** Object:  StoredProcedure [dbo].[GetUserRolesSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetUserRolesSp]
AS

    -- Automatically generated on 1/31/2024 10:23:40 AM.
    
    SELECT *
    FROM UserRoles WITH (NOLOCK) 
GO
/****** Object:  StoredProcedure [dbo].[GetUserRolesSp_CountSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetUserRolesSp_CountSp]
	@Search [nvarchar](255)
AS


	SET NOCOUNT ON

	
	SELECT		COUNT(*) as Total
	FROM		(
				-- Automatically generated on 1/31/2024 10:23:40 AM.
    
    SELECT *
    FROM UserRoles WITH (NOLOCK) 
				) sub
	where		
					[UserRoleID] like '%' + @Search + '%' 
		
GO
/****** Object:  StoredProcedure [dbo].[GetUserRolesSp_PagingSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetUserRolesSp_PagingSp]
	@Search [nvarchar](255),
	@SortColumn [nvarchar](255),
	@SortAscending [bit],
	@SkipRows [int],
	@NumRows [int]
AS


	SET NOCOUNT ON

	DECLARE	@FirstRow INT,
	@LastRow INT

	set @FirstRow = @SkipRows + 1;
	set @LastRow = @SkipRows + @NumRows;
	
	with SearchTable as
	(
	
		SELECT		ROW_NUMBER() OVER (
					ORDER BY
					
			
						case when @SortColumn = 'UserRoleID' and @SortAscending = 1 then 
							[UserRoleID]
						end ASC,
						case when @SortColumn = 'UserRoleID' and @SortAscending = 0 then 
							[UserRoleID]
						end DESC,
			
						case when @SortColumn = 'UserID' and @SortAscending = 1 then 
							[UserID]
						end ASC,
						case when @SortColumn = 'UserID' and @SortAscending = 0 then 
							[UserID]
						end DESC,
			
						case when @SortColumn = 'RoleID' and @SortAscending = 1 then 
							[RoleID]
						end ASC,
						case when @SortColumn = 'RoleID' and @SortAscending = 0 then 
							[RoleID]
						end DESC,
			
						case when @SortColumn = 'DateCreated' and @SortAscending = 1 then 
							[DateCreated]
						end ASC,
						case when @SortColumn = 'DateCreated' and @SortAscending = 0 then 
							[DateCreated]
						end DESC,
			
						case when @SortColumn = 'LastUpdated' and @SortAscending = 1 then 
							[LastUpdated]
						end ASC,
						case when @SortColumn = 'LastUpdated' and @SortAscending = 0 then 
							[LastUpdated]
						end DESC,
			
						case when @SortColumn = 'Data' and @SortAscending = 1 then 
							[Data]
						end ASC,
						case when @SortColumn = 'Data' and @SortAscending = 0 then 
							[Data]
						end DESC									
					) AS RowNumber,
					*
		FROM		(
					-- Automatically generated on 1/31/2024 10:23:40 AM.
    
    SELECT *
    FROM UserRoles WITH (NOLOCK) 
					) sub
		where		
					[UserRoleID] like '%' + @Search + '%' 
	)
			
	SELECT	*
	FROM	SearchTable
	WHERE	RowNumber BETWEEN @FirstRow AND @LastRow
	ORDER BY RowNumber ASC
	OPTION (recompile);
	
	
		
GO
/****** Object:  StoredProcedure [dbo].[GetUsersByUserRoleRoleIDSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetUsersByUserRoleRoleIDSp]
	@RoleID [int]
AS

    -- Automatically generated on 1/31/2024 10:23:40 AM.
    
    SELECT t2.*
    FROM UserRoles t1 WITH (NOLOCK) 
    JOIN Users t2 WITH (NOLOCK) 
    ON t1.UserID = t2.UserID
    WHERE t1.[RoleID] = @RoleID
GO
/****** Object:  StoredProcedure [dbo].[GetUsersByUserRoleRoleIDSp_CountSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO


CREATE PROCEDURE [dbo].[GetUsersByUserRoleRoleIDSp_CountSp]
	@RoleID [int],
	@Search [nvarchar](255)
AS


	SET NOCOUNT ON

	
	SELECT		COUNT(*) as Total
	FROM		(
				-- Automatically generated on 1/24/2023 7:44:21 AM.
    
    SELECT t2.*
    FROM UserRoles t1 WITH (NOLOCK) 
    JOIN Users t2 WITH (NOLOCK) 
    ON t1.UserID = t2.UserID
    WHERE t1.[RoleID] = @RoleID
				) sub
	where		
					[UserID] like '%' + @Search + '%' or
					[Email] like '%' + @Search + '%' or
					[Phone] like '%' + @Search + '%' or
					[InvitationCode] like '%' + @Search + '%' 
		
GO
/****** Object:  StoredProcedure [dbo].[GetUsersByUserRoleRoleIDSp_PagingSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO


CREATE PROCEDURE [dbo].[GetUsersByUserRoleRoleIDSp_PagingSp]
	@RoleID [int],
	@Search [nvarchar](255),
	@SortColumn [nvarchar](255),
	@SortAscending [bit],
	@SkipRows [int],
	@NumRows [int]
AS


	SET NOCOUNT ON

	DECLARE	@FirstRow INT,
	@LastRow INT

	set @FirstRow = @SkipRows + 1;
	set @LastRow = @SkipRows + @NumRows;
	
	with SearchTable as
	(
	
		SELECT		ROW_NUMBER() OVER (
					ORDER BY
					
			
						case when @SortColumn = 'UserID' and @SortAscending = 1 then 
							[UserID]
						end ASC,
						case when @SortColumn = 'UserID' and @SortAscending = 0 then 
							[UserID]
						end DESC,
			
						case when @SortColumn = 'IsEnabled' and @SortAscending = 1 then 
							[IsEnabled]
						end ASC,
						case when @SortColumn = 'IsEnabled' and @SortAscending = 0 then 
							[IsEnabled]
						end DESC,
			
						case when @SortColumn = 'DateCreated' and @SortAscending = 1 then 
							[DateCreated]
						end ASC,
						case when @SortColumn = 'DateCreated' and @SortAscending = 0 then 
							[DateCreated]
						end DESC,
			
						case when @SortColumn = 'LastUpdated' and @SortAscending = 1 then 
							[LastUpdated]
						end ASC,
						case when @SortColumn = 'LastUpdated' and @SortAscending = 0 then 
							[LastUpdated]
						end DESC,
			
						case when @SortColumn = 'Data' and @SortAscending = 1 then 
							[Data]
						end ASC,
						case when @SortColumn = 'Data' and @SortAscending = 0 then 
							[Data]
						end DESC,
			
						case when @SortColumn = 'Email' and @SortAscending = 1 then 
							[Email]
						end ASC,
						case when @SortColumn = 'Email' and @SortAscending = 0 then 
							[Email]
						end DESC,
			
						case when @SortColumn = 'Phone' and @SortAscending = 1 then 
							[Phone]
						end ASC,
						case when @SortColumn = 'Phone' and @SortAscending = 0 then 
							[Phone]
						end DESC,
			
						case when @SortColumn = 'HasLoggedIn' and @SortAscending = 1 then 
							[HasLoggedIn]
						end ASC,
						case when @SortColumn = 'HasLoggedIn' and @SortAscending = 0 then 
							[HasLoggedIn]
						end DESC,
			
						case when @SortColumn = 'LastLoginDate' and @SortAscending = 1 then 
							[LastLoginDate]
						end ASC,
						case when @SortColumn = 'LastLoginDate' and @SortAscending = 0 then 
							[LastLoginDate]
						end DESC,
			
						case when @SortColumn = 'IsLockedOut' and @SortAscending = 1 then 
							[IsLockedOut]
						end ASC,
						case when @SortColumn = 'IsLockedOut' and @SortAscending = 0 then 
							[IsLockedOut]
						end DESC,
			
						case when @SortColumn = 'InvitationCode' and @SortAscending = 1 then 
							[InvitationCode]
						end ASC,
						case when @SortColumn = 'InvitationCode' and @SortAscending = 0 then 
							[InvitationCode]
						end DESC,
			
						case when @SortColumn = 'InvitationExpiration' and @SortAscending = 1 then 
							[InvitationExpiration]
						end ASC,
						case when @SortColumn = 'InvitationExpiration' and @SortAscending = 0 then 
							[InvitationExpiration]
						end DESC,
			
						case when @SortColumn = 'IsInvited' and @SortAscending = 1 then 
							[IsInvited]
						end ASC,
						case when @SortColumn = 'IsInvited' and @SortAscending = 0 then 
							[IsInvited]
						end DESC,
			
						case when @SortColumn = 'InvitedDate' and @SortAscending = 1 then 
							[InvitedDate]
						end ASC,
						case when @SortColumn = 'InvitedDate' and @SortAscending = 0 then 
							[InvitedDate]
						end DESC									
					) AS RowNumber,
					*
		FROM		(
					-- Automatically generated on 1/24/2023 7:44:21 AM.
    
    SELECT t2.*
    FROM UserRoles t1 WITH (NOLOCK) 
    JOIN Users t2 WITH (NOLOCK) 
    ON t1.UserID = t2.UserID
    WHERE t1.[RoleID] = @RoleID
					) sub
		where		
					[UserID] like '%' + @Search + '%' or
					[Email] like '%' + @Search + '%' or
					[Phone] like '%' + @Search + '%' or
					[InvitationCode] like '%' + @Search + '%' 
	)
			
	SELECT	*
	FROM	SearchTable
	WHERE	RowNumber BETWEEN @FirstRow AND @LastRow
	ORDER BY RowNumber ASC
	OPTION (recompile);
	
	
		
GO
/****** Object:  StoredProcedure [dbo].[GetUserSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetUserSp]
	@UserID [int]
AS

    -- Automatically generated on 1/31/2024 10:23:40 AM.
    
    SELECT *
    FROM Users WITH (NOLOCK) 
     WHERE UserID = @UserID
GO
/****** Object:  StoredProcedure [dbo].[GetUsersSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetUsersSp]
AS

    -- Automatically generated on 1/31/2024 10:23:40 AM.
    
    SELECT *
    FROM Users WITH (NOLOCK) 
GO
/****** Object:  StoredProcedure [dbo].[GetUsersSp_CountSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetUsersSp_CountSp]
	@Search [nvarchar](255)
AS


	SET NOCOUNT ON

	
	SELECT		COUNT(*) as Total
	FROM		(
				-- Automatically generated on 1/31/2024 10:23:40 AM.
    
    SELECT *
    FROM Users WITH (NOLOCK) 
				) sub
	where		
					[UserID] like '%' + @Search + '%' or
					[Email] like '%' + @Search + '%' or
					[Phone] like '%' + @Search + '%' or
					[InvitationCode] like '%' + @Search + '%' 
		
GO
/****** Object:  StoredProcedure [dbo].[GetUsersSp_PagingSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetUsersSp_PagingSp]
	@Search [nvarchar](255),
	@SortColumn [nvarchar](255),
	@SortAscending [bit],
	@SkipRows [int],
	@NumRows [int]
AS


	SET NOCOUNT ON

	DECLARE	@FirstRow INT,
	@LastRow INT

	set @FirstRow = @SkipRows + 1;
	set @LastRow = @SkipRows + @NumRows;
	
	with SearchTable as
	(
	
		SELECT		ROW_NUMBER() OVER (
					ORDER BY
					
			
						case when @SortColumn = 'UserID' and @SortAscending = 1 then 
							[UserID]
						end ASC,
						case when @SortColumn = 'UserID' and @SortAscending = 0 then 
							[UserID]
						end DESC,
			
						case when @SortColumn = 'IsEnabled' and @SortAscending = 1 then 
							[IsEnabled]
						end ASC,
						case when @SortColumn = 'IsEnabled' and @SortAscending = 0 then 
							[IsEnabled]
						end DESC,
			
						case when @SortColumn = 'DateCreated' and @SortAscending = 1 then 
							[DateCreated]
						end ASC,
						case when @SortColumn = 'DateCreated' and @SortAscending = 0 then 
							[DateCreated]
						end DESC,
			
						case when @SortColumn = 'LastUpdated' and @SortAscending = 1 then 
							[LastUpdated]
						end ASC,
						case when @SortColumn = 'LastUpdated' and @SortAscending = 0 then 
							[LastUpdated]
						end DESC,
			
						case when @SortColumn = 'Data' and @SortAscending = 1 then 
							[Data]
						end ASC,
						case when @SortColumn = 'Data' and @SortAscending = 0 then 
							[Data]
						end DESC,
			
						case when @SortColumn = 'Email' and @SortAscending = 1 then 
							[Email]
						end ASC,
						case when @SortColumn = 'Email' and @SortAscending = 0 then 
							[Email]
						end DESC,
			
						case when @SortColumn = 'Phone' and @SortAscending = 1 then 
							[Phone]
						end ASC,
						case when @SortColumn = 'Phone' and @SortAscending = 0 then 
							[Phone]
						end DESC,
			
						case when @SortColumn = 'HasLoggedIn' and @SortAscending = 1 then 
							[HasLoggedIn]
						end ASC,
						case when @SortColumn = 'HasLoggedIn' and @SortAscending = 0 then 
							[HasLoggedIn]
						end DESC,
			
						case when @SortColumn = 'LastLoginDate' and @SortAscending = 1 then 
							[LastLoginDate]
						end ASC,
						case when @SortColumn = 'LastLoginDate' and @SortAscending = 0 then 
							[LastLoginDate]
						end DESC,
			
						case when @SortColumn = 'IsLockedOut' and @SortAscending = 1 then 
							[IsLockedOut]
						end ASC,
						case when @SortColumn = 'IsLockedOut' and @SortAscending = 0 then 
							[IsLockedOut]
						end DESC,
			
						case when @SortColumn = 'InvitationCode' and @SortAscending = 1 then 
							[InvitationCode]
						end ASC,
						case when @SortColumn = 'InvitationCode' and @SortAscending = 0 then 
							[InvitationCode]
						end DESC,
			
						case when @SortColumn = 'InvitationExpiration' and @SortAscending = 1 then 
							[InvitationExpiration]
						end ASC,
						case when @SortColumn = 'InvitationExpiration' and @SortAscending = 0 then 
							[InvitationExpiration]
						end DESC,
			
						case when @SortColumn = 'IsInvited' and @SortAscending = 1 then 
							[IsInvited]
						end ASC,
						case when @SortColumn = 'IsInvited' and @SortAscending = 0 then 
							[IsInvited]
						end DESC,
			
						case when @SortColumn = 'InvitedDate' and @SortAscending = 1 then 
							[InvitedDate]
						end ASC,
						case when @SortColumn = 'InvitedDate' and @SortAscending = 0 then 
							[InvitedDate]
						end DESC									
					) AS RowNumber,
					*
		FROM		(
					-- Automatically generated on 1/31/2024 10:23:40 AM.
    
    SELECT *
    FROM Users WITH (NOLOCK) 
					) sub
		where		
					[UserID] like '%' + @Search + '%' or
					[Email] like '%' + @Search + '%' or
					[Phone] like '%' + @Search + '%' or
					[InvitationCode] like '%' + @Search + '%' 
	)
			
	SELECT	*
	FROM	SearchTable
	WHERE	RowNumber BETWEEN @FirstRow AND @LastRow
	ORDER BY RowNumber ASC
	OPTION (recompile);
	
	
		
GO
/****** Object:  StoredProcedure [dbo].[InsertApiSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[InsertApiSp]
	@ApiKey [nvarchar](255),
	@Data [nvarchar](max)
AS

    -- Automatically generated on 1/31/2024 10:23:40 AM.
    
    INSERT INTO Apis
    (
            [ApiKey], 
            [Data], 
            [DateCreated], 
            [LastUpdated]
    )
    VALUES
    (
            @ApiKey, 
            @Data, 
            getdate(), 
            getdate()
    )
    SELECT scope_identity() as ApiID

GO
/****** Object:  StoredProcedure [dbo].[InsertApiUsageLimitSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[InsertApiUsageLimitSp]
	@ApiID [int],
	@TierID [int],
	@UsageDimensionID [int],
	@Limit [decimal](18, 4),
	@Data [nvarchar](max)
AS

    -- Automatically generated on 1/31/2024 10:23:40 AM.
    
    INSERT INTO ApiUsageLimits
    (
            [ApiID], 
            [TierID], 
            [UsageDimensionID], 
            [Limit], 
            [Data], 
            [DateCreated], 
            [LastUpdated]
    )
    VALUES
    (
            @ApiID, 
            @TierID, 
            @UsageDimensionID, 
            @Limit, 
            @Data, 
            getdate(), 
            getdate()
    )
    SELECT scope_identity() as ApiUsageLimitID

GO
/****** Object:  StoredProcedure [dbo].[InsertApiUsageSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[InsertApiUsageSp]
	@UsageDimensionID [int],
	@UserID [int],
	@AuthorizationID [int],
	@ApiID [int],
	@Usage [decimal](18, 4),
	@CostPerUnit [money],
	@Data [nvarchar](max)
AS

    -- Automatically generated on 1/31/2024 10:23:40 AM.
    
    INSERT INTO ApiUsages
    (
            [UsageDimensionID], 
            [UserID], 
            [AuthorizationID], 
            [ApiID], 
            [Usage], 
            [CostPerUnit], 
            [Data], 
            [DateCreated], 
            [LastUpdated]
    )
    VALUES
    (
            @UsageDimensionID, 
            @UserID, 
            @AuthorizationID, 
            @ApiID, 
            @Usage, 
            @CostPerUnit, 
            @Data, 
            getdate(), 
            getdate()
    )
    SELECT scope_identity() as ApiUsageID

GO
/****** Object:  StoredProcedure [dbo].[InsertApplicationSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[InsertApplicationSp]
	@ApplicationName [nvarchar](255),
	@URL [nvarchar](512),
	@ApplicationType [nvarchar](255),
	@Data [nvarchar](max),
	@UserID [int]
AS

    -- Automatically generated on 6/19/2024 1:57:54 PM.
    
    INSERT INTO Applications
    (
            [ApplicationName], 
            [URL], 
            [ApplicationType], 
            [DateCreated], 
            [LastUpdated], 
            [Data], 
            [UserID]
    )
    VALUES
    (
            @ApplicationName, 
            @URL, 
            @ApplicationType, 
            getdate(), 
            getdate(), 
            @Data, 
            @UserID
    )
    SELECT scope_identity() as ApplicationID

GO
/****** Object:  StoredProcedure [dbo].[InsertAuthorizationSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertAuthorizationSp]
	@AuthorizationToken [nvarchar](255),
	@RefreshToken [nvarchar](255),
	@Expiration [datetime],
	@UserID [int],
	@LastRefreshedDate [datetime],
	@LastActivityDate [datetime],
	@IsExpired [bit],
	@IsRevoked [bit],
	@IsEncrypted [bit],
	@Data [nvarchar](max)
AS

    -- Automatically generated on 1/31/2024 10:23:40 AM.
    
    INSERT INTO Authorizations
    (
            [AuthorizationToken], 
            [RefreshToken], 
            [Expiration], 
            [UserID], 
            [LastRefreshedDate], 
            [LastActivityDate], 
            [IsExpired], 
            [IsRevoked], 
            [IsEncrypted], 
            [Data], 
            [DateCreated], 
            [LastUpdated]
    )
    VALUES
    (
            @AuthorizationToken, 
            @RefreshToken, 
            @Expiration, 
            @UserID, 
            @LastRefreshedDate, 
            @LastActivityDate, 
            @IsExpired, 
            @IsRevoked, 
            @IsEncrypted, 
            @Data, 
            getdate(), 
            getdate()
    )
    SELECT scope_identity() as AuthorizationID
GO
/****** Object:  StoredProcedure [dbo].[InsertBlockedEmailSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[InsertBlockedEmailSp]
	@Email [nvarchar](255),
	@Notes [nvarchar](max),
	@Data [nvarchar](max)
AS

    -- Automatically generated on 7/18/2024 5:57:46 PM.
    
    INSERT INTO BlockedEmails
    (
            [Email], 
            [Notes], 
            [Data], 
            [DateCreated], 
            [LastUpdated]
    )
    VALUES
    (
            @Email, 
            @Notes, 
            @Data, 
            getdate(), 
            getdate()
    )
    SELECT scope_identity() as BlockedEmailID

GO
/****** Object:  StoredProcedure [dbo].[InsertContentSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[InsertContentSp]
	@ContentName [nvarchar](255),
	@Content [nvarchar](max),
	@Data [nvarchar](max),
	@ContentTypeID [int]
AS

    -- Automatically generated on 8/23/2024 9:58:34 AM.
    
    INSERT INTO Contents
    (
            [ContentName], 
            [Content], 
            [LastUpdated], 
            [DateCreated], 
            [Data], 
            [ContentTypeID]
    )
    VALUES
    (
            @ContentName, 
            @Content, 
            getdate(), 
            getdate(), 
            @Data, 
            @ContentTypeID
    )
    SELECT scope_identity() as ContentID

GO
/****** Object:  StoredProcedure [dbo].[InsertContentTypeSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[InsertContentTypeSp]
	@ContentTypeName [nvarchar](255),
	@Data [nvarchar](max)
AS

    -- Automatically generated on 8/23/2024 9:58:34 AM.
    
    INSERT INTO ContentTypes
    (
            [ContentTypeName], 
            [Data], 
            [DateCreated], 
            [LastUpdated]
    )
    VALUES
    (
            @ContentTypeName, 
            @Data, 
            getdate(), 
            getdate()
    )
    SELECT scope_identity() as ContentTypeID

GO
/****** Object:  StoredProcedure [dbo].[InsertEmailHistorySp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[InsertEmailHistorySp]
	@To [nvarchar](255),
	@From [nvarchar](255),
	@EmailTemplateID [int],
	@Subject [nvarchar](255),
	@Email [nvarchar](max),
	@IsPending [bit],
	@IsSent [bit],
	@Data [nvarchar](max)
AS

    -- Automatically generated on 7/18/2024 5:57:46 PM.
    
    INSERT INTO EmailHistories
    (
            [To], 
            [From], 
            [EmailTemplateID], 
            [Subject], 
            [Email], 
            [DateCreated], 
            [IsPending], 
            [IsSent], 
            [Data], 
            [LastUpdated]
    )
    VALUES
    (
            @To, 
            @From, 
            @EmailTemplateID, 
            @Subject, 
            @Email, 
            getdate(), 
            @IsPending, 
            @IsSent, 
            @Data, 
            getdate()
    )
    SELECT scope_identity() as EmailHistoryID

GO
/****** Object:  StoredProcedure [dbo].[InsertEmailTemplateSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[InsertEmailTemplateSp]
	@Name [nvarchar](255),
	@EmailSubject [nvarchar](255),
	@EmailText [nvarchar](max),
	@EmailParams [nvarchar](255),
	@FromAddress [nvarchar](255),
	@Data [nvarchar](max)
AS

    -- Automatically generated on 7/18/2024 5:57:46 PM.
    
    INSERT INTO EmailTemplates
    (
            [Name], 
            [EmailSubject], 
            [EmailText], 
            [EmailParams], 
            [FromAddress], 
            [DateCreated], 
            [LastUpdated], 
            [Data]
    )
    VALUES
    (
            @Name, 
            @EmailSubject, 
            @EmailText, 
            @EmailParams, 
            @FromAddress, 
            getdate(), 
            getdate(), 
            @Data
    )
    SELECT scope_identity() as EmailTemplateID

GO
/****** Object:  StoredProcedure [dbo].[InsertFeatureSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertFeatureSp]
	@FeatureName [nvarchar](255),
	@Version [nvarchar](255),
	@IsEnabled [bit],
	@SettingsAssembly [nvarchar](255),
	@SettingsClass [nvarchar](255),
	@Settings [nvarchar](max),
	@Data [nvarchar](max)
AS

    -- Automatically generated on 1/20/2024 5:38:31 AM.
    
    INSERT INTO Features
    (
            [FeatureName], 
            [Version], 
            [IsEnabled], 
            [SettingsAssembly], 
            [SettingsClass], 
            [Settings], 
            [DateCreated], 
            [LastUpdated], 
            [Data]
    )
    VALUES
    (
            @FeatureName, 
            @Version, 
            @IsEnabled, 
            @SettingsAssembly, 
            @SettingsClass, 
            @Settings, 
            getdate(), 
            getdate(), 
            @Data
    )
    SELECT scope_identity() as FeatureID
GO
/****** Object:  StoredProcedure [dbo].[InsertPageLayoutSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[InsertPageLayoutSp]
	@LayoutID [int] = null,
	@Url [nvarchar](512),
	@Handler [nvarchar](512),
	@IsEnabled [bit],
	@KeywordsMetaTag [nvarchar](255) = null,
	@DescriptionMetaTag [nvarchar](255) = null,
	@PageTitle [nvarchar](255),
	@RoleID [int] = null,
	@Priority [int] = null,
	@SiteID [int]
AS

    -- Automatically generated on 1/20/2024 5:38:31 AM.
    
    INSERT INTO PageLayouts
    (
            [LayoutID], 
            [Url], 
            [Handler], 
            [IsEnabled], 
            [DateCreated], 
            [LastUpdated], 
            [KeywordsMetaTag], 
            [DescriptionMetaTag], 
            [PageTitle], 
            [RoleID], 
            [Priority], 
            [SiteID]
    )
    VALUES
    (
            @LayoutID, 
            @Url, 
            @Handler, 
            @IsEnabled, 
            getdate(), 
            getdate(), 
            @KeywordsMetaTag, 
            @DescriptionMetaTag, 
            @PageTitle, 
            @RoleID, 
            @Priority, 
            @SiteID
    )
    SELECT scope_identity() as PageLayoutID

GO
/****** Object:  StoredProcedure [dbo].[InsertRoleSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertRoleSp]
	@RoleName [nvarchar](255),
	@Data [nvarchar](max)
AS

    -- Automatically generated on 1/31/2024 10:23:40 AM.
    
    INSERT INTO Roles
    (
            [RoleName], 
            [DateCreated], 
            [LastUpdated], 
            [Data]
    )
    VALUES
    (
            @RoleName, 
            getdate(), 
            getdate(), 
            @Data
    )
    SELECT scope_identity() as RoleID
GO
/****** Object:  StoredProcedure [dbo].[InsertTierSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[InsertTierSp]
	@TierName [nvarchar](255),
	@Data [nvarchar](max)
AS

    -- Automatically generated on 1/31/2024 10:23:40 AM.
    
    INSERT INTO Tiers
    (
            [TierName], 
            [Data], 
            [DateCreated], 
            [LastUpdated]
    )
    VALUES
    (
            @TierName, 
            @Data, 
            getdate(), 
            getdate()
    )
    SELECT scope_identity() as TierID

GO
/****** Object:  StoredProcedure [dbo].[InsertUsageDimensionSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[InsertUsageDimensionSp]
	@UsageDimension [nvarchar](255),
	@Data [nvarchar](max)
AS

    -- Automatically generated on 1/31/2024 10:23:40 AM.
    
    INSERT INTO UsageDimensions
    (
            [UsageDimension], 
            [DateCreated], 
            [LastUpdated], 
            [Data]
    )
    VALUES
    (
            @UsageDimension, 
            getdate(), 
            getdate(), 
            @Data
    )
    SELECT scope_identity() as UsageDimensionID

GO
/****** Object:  StoredProcedure [dbo].[InsertUserRoleSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertUserRoleSp]
	@UserID [int],
	@RoleID [int],
	@Data [nvarchar](max)
AS

    -- Automatically generated on 1/31/2024 10:23:40 AM.
    
    INSERT INTO UserRoles
    (
            [UserID], 
            [RoleID], 
            [DateCreated], 
            [LastUpdated], 
            [Data]
    )
    VALUES
    (
            @UserID, 
            @RoleID, 
            getdate(), 
            getdate(), 
            @Data
    )
    SELECT scope_identity() as UserRoleID
GO
/****** Object:  StoredProcedure [dbo].[InsertUserSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertUserSp]
	@IsEnabled [bit],
	@Data [nvarchar](max),
	@Email [nvarchar](255),
	@Phone [nvarchar](255),
	@Password [nvarchar](max),
	@HasLoggedIn [bit],
	@LastLoginDate [datetime],
	@IsLockedOut [bit],
	@InvitationCode [nvarchar](255),
	@InvitationExpiration [datetime],
	@IsInvited [bit],
	@InvitedDate [datetime]
AS

    -- Automatically generated on 1/31/2024 10:23:40 AM.
    
    INSERT INTO Users
    (
            [IsEnabled], 
            [DateCreated], 
            [LastUpdated], 
            [Data], 
            [Email], 
            [Phone], 
            [Password], 
            [HasLoggedIn], 
            [LastLoginDate], 
            [IsLockedOut], 
            [InvitationCode], 
            [InvitationExpiration], 
            [IsInvited], 
            [InvitedDate]
    )
    VALUES
    (
            @IsEnabled, 
            getdate(), 
            getdate(), 
            @Data, 
            @Email, 
            @Phone, 
            @Password, 
            @HasLoggedIn, 
            @LastLoginDate, 
            @IsLockedOut, 
            @InvitationCode, 
            @InvitationExpiration, 
            @IsInvited, 
            @InvitedDate
    )
    SELECT scope_identity() as UserID
GO
/****** Object:  StoredProcedure [dbo].[MarkAuthorizationAsEncryptedSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[MarkAuthorizationAsEncryptedSp] (
	@AuthorizationID int
)
AS

    UPDATE Authorizations SET IsEncrypted = 1 ,
    LastUpdated = getdate()
    WHERE AuthorizationID = @AuthorizationID	

GO
/****** Object:  StoredProcedure [dbo].[MarkAuthorizationAsExpiredSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[MarkAuthorizationAsExpiredSp] (
	@AuthorizationID int
)
AS

    UPDATE Authorizations SET IsExpired = 1 ,
    LastUpdated = getdate()
    WHERE AuthorizationID = @AuthorizationID	

GO
/****** Object:  StoredProcedure [dbo].[MarkAuthorizationAsNotEncryptedSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[MarkAuthorizationAsNotEncryptedSp] (
	@AuthorizationID int
)
AS

    UPDATE Authorizations SET IsEncrypted = 0 ,
    LastUpdated = getdate()
    WHERE AuthorizationID = @AuthorizationID	

GO
/****** Object:  StoredProcedure [dbo].[MarkAuthorizationAsNotExpiredSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[MarkAuthorizationAsNotExpiredSp] (
	@AuthorizationID int
)
AS

    UPDATE Authorizations SET IsExpired = 0 ,
    LastUpdated = getdate()
    WHERE AuthorizationID = @AuthorizationID	

GO
/****** Object:  StoredProcedure [dbo].[MarkAuthorizationAsNotRevokedSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[MarkAuthorizationAsNotRevokedSp] (
	@AuthorizationID int
)
AS

    UPDATE Authorizations SET IsRevoked = 0 ,
    LastUpdated = getdate()
    WHERE AuthorizationID = @AuthorizationID	

GO
/****** Object:  StoredProcedure [dbo].[MarkAuthorizationAsRevokedSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[MarkAuthorizationAsRevokedSp] (
	@AuthorizationID int
)
AS

    UPDATE Authorizations SET IsRevoked = 1 ,
    LastUpdated = getdate()
    WHERE AuthorizationID = @AuthorizationID	

GO
/****** Object:  StoredProcedure [dbo].[MarkEmailHistoryAsNotPendingSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[MarkEmailHistoryAsNotPendingSp] (
	@EmailHistoryID int
)
AS

    UPDATE EmailHistories SET IsPending = 0 ,
    LastUpdated = getdate()
    WHERE EmailHistoryID = @EmailHistoryID	


GO
/****** Object:  StoredProcedure [dbo].[MarkEmailHistoryAsNotSentSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[MarkEmailHistoryAsNotSentSp] (
	@EmailHistoryID int
)
AS

    UPDATE EmailHistories SET IsSent = 0 ,
    LastUpdated = getdate()
    WHERE EmailHistoryID = @EmailHistoryID	


GO
/****** Object:  StoredProcedure [dbo].[MarkEmailHistoryAsPendingSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[MarkEmailHistoryAsPendingSp] (
	@EmailHistoryID int
)
AS

    UPDATE EmailHistories SET IsPending = 1 ,
    LastUpdated = getdate()
    WHERE EmailHistoryID = @EmailHistoryID	


GO
/****** Object:  StoredProcedure [dbo].[MarkEmailHistoryAsSentSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[MarkEmailHistoryAsSentSp] (
	@EmailHistoryID int
)
AS

    UPDATE EmailHistories SET IsSent = 1 ,
    LastUpdated = getdate()
    WHERE EmailHistoryID = @EmailHistoryID	


GO
/****** Object:  StoredProcedure [dbo].[MarkFeatureAsEnabledSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[MarkFeatureAsEnabledSp] (
	@FeatureID int
)
AS

    UPDATE Features SET IsEnabled = 1 ,
    LastUpdated = getdate()
    WHERE FeatureID = @FeatureID	

GO
/****** Object:  StoredProcedure [dbo].[MarkFeatureAsNotEnabledSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[MarkFeatureAsNotEnabledSp] (
	@FeatureID int
)
AS

    UPDATE Features SET IsEnabled = 0 ,
    LastUpdated = getdate()
    WHERE FeatureID = @FeatureID	

GO
/****** Object:  StoredProcedure [dbo].[MarkPageLayoutAsEnabledSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[MarkPageLayoutAsEnabledSp] (
	@PageLayoutID int
)
AS

    UPDATE PageLayouts SET IsEnabled = 1 ,
    LastUpdated = getdate()
    WHERE PageLayoutID = @PageLayoutID	

GO
/****** Object:  StoredProcedure [dbo].[MarkPageLayoutAsNotEnabledSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[MarkPageLayoutAsNotEnabledSp] (
	@PageLayoutID int
)
AS

    UPDATE PageLayouts SET IsEnabled = 0 ,
    LastUpdated = getdate()
    WHERE PageLayoutID = @PageLayoutID	

GO
/****** Object:  StoredProcedure [dbo].[MarkUserAsEnabledSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[MarkUserAsEnabledSp] (
	@UserID int
)
AS

    UPDATE Users SET IsEnabled = 1 ,
    LastUpdated = getdate()
    WHERE UserID = @UserID	

GO
/****** Object:  StoredProcedure [dbo].[MarkUserAsHasLoggedInSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[MarkUserAsHasLoggedInSp] (
	@UserID int
)
AS

    UPDATE Users SET HasLoggedIn = 1 ,
    LastUpdated = getdate()
    WHERE UserID = @UserID	

GO
/****** Object:  StoredProcedure [dbo].[MarkUserAsInvitedSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[MarkUserAsInvitedSp] (
	@UserID int
)
AS

    UPDATE Users SET IsInvited = 1 ,
    LastUpdated = getdate()
    WHERE UserID = @UserID	

GO
/****** Object:  StoredProcedure [dbo].[MarkUserAsLockedOutSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[MarkUserAsLockedOutSp] (
	@UserID int
)
AS

    UPDATE Users SET IsLockedOut = 1 ,
    LastUpdated = getdate()
    WHERE UserID = @UserID	

GO
/****** Object:  StoredProcedure [dbo].[MarkUserAsNotEnabledSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[MarkUserAsNotEnabledSp] (
	@UserID int
)
AS

    UPDATE Users SET IsEnabled = 0 ,
    LastUpdated = getdate()
    WHERE UserID = @UserID	

GO
/****** Object:  StoredProcedure [dbo].[MarkUserAsNotHasLoggedInSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[MarkUserAsNotHasLoggedInSp] (
	@UserID int
)
AS

    UPDATE Users SET HasLoggedIn = 0 ,
    LastUpdated = getdate()
    WHERE UserID = @UserID	

GO
/****** Object:  StoredProcedure [dbo].[MarkUserAsNotInvitedSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[MarkUserAsNotInvitedSp] (
	@UserID int
)
AS

    UPDATE Users SET IsInvited = 0 ,
    LastUpdated = getdate()
    WHERE UserID = @UserID	

GO
/****** Object:  StoredProcedure [dbo].[MarkUserAsNotLockedOutSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[MarkUserAsNotLockedOutSp] (
	@UserID int
)
AS

    UPDATE Users SET IsLockedOut = 0 ,
    LastUpdated = getdate()
    WHERE UserID = @UserID	

GO
/****** Object:  StoredProcedure [dbo].[RemoveApiSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[RemoveApiSp]
	@ApiID [int]
AS

    -- Automatically generated on 1/31/2024 10:23:40 AM.
    
    DELETE FROM Apis WHERE ApiID = @ApiID

GO
/****** Object:  StoredProcedure [dbo].[RemoveApiUsageLimitSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[RemoveApiUsageLimitSp]
	@ApiUsageLimitID [int]
AS

    -- Automatically generated on 1/31/2024 10:23:40 AM.
    
    DELETE FROM ApiUsageLimits WHERE ApiUsageLimitID = @ApiUsageLimitID

GO
/****** Object:  StoredProcedure [dbo].[RemoveApiUsageSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[RemoveApiUsageSp]
	@ApiUsageID [int]
AS

    -- Automatically generated on 1/31/2024 10:23:40 AM.
    
    DELETE FROM ApiUsages WHERE ApiUsageID = @ApiUsageID

GO
/****** Object:  StoredProcedure [dbo].[RemoveApplicationSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[RemoveApplicationSp]
	@ApplicationID [int]
AS

    -- Automatically generated on 6/19/2024 1:57:54 PM.
    
    DELETE FROM Applications WHERE ApplicationID = @ApplicationID

GO
/****** Object:  StoredProcedure [dbo].[RemoveAuthorizationSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RemoveAuthorizationSp]
	@AuthorizationID [int]
AS

    -- Automatically generated on 1/31/2024 10:23:40 AM.
    
    DELETE FROM Authorizations WHERE AuthorizationID = @AuthorizationID
GO
/****** Object:  StoredProcedure [dbo].[RemoveBlockedEmailSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[RemoveBlockedEmailSp]
	@BlockedEmailID [int]
AS

    -- Automatically generated on 7/18/2024 5:57:46 PM.
    
    DELETE FROM BlockedEmails WHERE BlockedEmailID = @BlockedEmailID

GO
/****** Object:  StoredProcedure [dbo].[RemoveContentSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[RemoveContentSp]
	@ContentID [int]
AS

    -- Automatically generated on 8/23/2024 9:58:34 AM.
    
    DELETE FROM Contents WHERE ContentID = @ContentID

GO
/****** Object:  StoredProcedure [dbo].[RemoveContentTypeSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[RemoveContentTypeSp]
	@ContentTypeID [int]
AS

    -- Automatically generated on 8/23/2024 9:58:34 AM.
    
    DELETE FROM ContentTypes WHERE ContentTypeID = @ContentTypeID

GO
/****** Object:  StoredProcedure [dbo].[RemoveEmailHistorySp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[RemoveEmailHistorySp]
	@EmailHistoryID [int]
AS

    -- Automatically generated on 7/18/2024 5:57:46 PM.
    
    DELETE FROM EmailHistories WHERE EmailHistoryID = @EmailHistoryID

GO
/****** Object:  StoredProcedure [dbo].[RemoveEmailTemplateSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[RemoveEmailTemplateSp]
	@EmailTemplateID [int]
AS

    -- Automatically generated on 7/18/2024 5:57:46 PM.
    
    DELETE FROM EmailTemplates WHERE EmailTemplateID = @EmailTemplateID

GO
/****** Object:  StoredProcedure [dbo].[RemoveFeatureSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RemoveFeatureSp]
	@FeatureID [int]
AS

    -- Automatically generated on 1/20/2024 5:38:31 AM.
    
    DELETE FROM Features WHERE FeatureID = @FeatureID
GO
/****** Object:  StoredProcedure [dbo].[RemovePageLayoutSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RemovePageLayoutSp]
	@PageLayoutID [int]
AS

    -- Automatically generated on 1/20/2024 5:38:31 AM.
    
    DELETE FROM PageLayouts WHERE PageLayoutID = @PageLayoutID
GO
/****** Object:  StoredProcedure [dbo].[RemoveRoleSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RemoveRoleSp]
	@RoleID [int]
AS

    -- Automatically generated on 1/31/2024 10:23:40 AM.
    
    DELETE FROM Roles WHERE RoleID = @RoleID
GO
/****** Object:  StoredProcedure [dbo].[RemoveTierSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[RemoveTierSp]
	@TierID [int]
AS

    -- Automatically generated on 1/31/2024 10:23:40 AM.
    
    DELETE FROM Tiers WHERE TierID = @TierID

GO
/****** Object:  StoredProcedure [dbo].[RemoveUsageDimensionSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[RemoveUsageDimensionSp]
	@UsageDimensionID [int]
AS

    -- Automatically generated on 1/31/2024 10:23:40 AM.
    
    DELETE FROM UsageDimensions WHERE UsageDimensionID = @UsageDimensionID

GO
/****** Object:  StoredProcedure [dbo].[RemoveUserRoleSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RemoveUserRoleSp]
	@UserRoleID [int]
AS

    -- Automatically generated on 1/31/2024 10:23:40 AM.
    
    DELETE FROM UserRoles WHERE UserRoleID = @UserRoleID
GO
/****** Object:  StoredProcedure [dbo].[RemoveUserSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RemoveUserSp]
	@UserID [int]
AS

    -- Automatically generated on 1/31/2024 10:23:40 AM.
    
    DELETE FROM Users WHERE UserID = @UserID
GO
/****** Object:  StoredProcedure [dbo].[UpdateApiDataSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[UpdateApiDataSp] (
	@ApiID int,
	@Data nvarchar(max)
)
AS

    UPDATE Apis SET Data = @Data ,
    LastUpdated = getdate()
    WHERE ApiID = @ApiID	


GO
/****** Object:  StoredProcedure [dbo].[UpdateApiSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UpdateApiSp]
	@ApiID [int],
	@ApiKey [nvarchar](255),
	@Data [nvarchar](max)
AS

    -- Automatically generated on 1/31/2024 10:23:40 AM.
    
    UPDATE Apis SET 
            [ApiKey] = @ApiKey, 
            [Data] = @Data, 
            [LastUpdated] = getdate()
    WHERE ApiID = @ApiID

GO
/****** Object:  StoredProcedure [dbo].[UpdateApiUsageDataSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[UpdateApiUsageDataSp] (
	@ApiUsageID int,
	@Data nvarchar(max)
)
AS

    UPDATE ApiUsages SET Data = @Data ,
    LastUpdated = getdate()
    WHERE ApiUsageID = @ApiUsageID	


GO
/****** Object:  StoredProcedure [dbo].[UpdateApiUsageLimitDataSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[UpdateApiUsageLimitDataSp] (
	@ApiUsageLimitID int,
	@Data nvarchar(max)
)
AS

    UPDATE ApiUsageLimits SET Data = @Data ,
    LastUpdated = getdate()
    WHERE ApiUsageLimitID = @ApiUsageLimitID	


GO
/****** Object:  StoredProcedure [dbo].[UpdateApiUsageLimitSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UpdateApiUsageLimitSp]
	@ApiUsageLimitID [int],
	@ApiID [int],
	@TierID [int],
	@UsageDimensionID [int],
	@Limit [decimal](18, 4),
	@Data [nvarchar](max)
AS

    -- Automatically generated on 1/31/2024 10:23:40 AM.
    
    UPDATE ApiUsageLimits SET 
            [ApiID] = @ApiID, 
            [TierID] = @TierID, 
            [UsageDimensionID] = @UsageDimensionID, 
            [Limit] = @Limit, 
            [Data] = @Data, 
            [LastUpdated] = getdate()
    WHERE ApiUsageLimitID = @ApiUsageLimitID

GO
/****** Object:  StoredProcedure [dbo].[UpdateApiUsageSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UpdateApiUsageSp]
	@ApiUsageID [int],
	@UsageDimensionID [int],
	@UserID [int],
	@AuthorizationID [int],
	@ApiID [int],
	@Usage [decimal](18, 4),
	@CostPerUnit [money],
	@Data [nvarchar](max)
AS

    -- Automatically generated on 1/31/2024 10:23:40 AM.
    
    UPDATE ApiUsages SET 
            [UsageDimensionID] = @UsageDimensionID, 
            [UserID] = @UserID, 
            [AuthorizationID] = @AuthorizationID, 
            [ApiID] = @ApiID, 
            [Usage] = @Usage, 
            [CostPerUnit] = @CostPerUnit, 
            [Data] = @Data, 
            [LastUpdated] = getdate()
    WHERE ApiUsageID = @ApiUsageID

GO
/****** Object:  StoredProcedure [dbo].[UpdateApplicationDataSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[UpdateApplicationDataSp] (
	@ApplicationID int,
	@Data nvarchar(max)
)
AS

    UPDATE Applications SET Data = @Data ,
    LastUpdated = getdate()
    WHERE ApplicationID = @ApplicationID	


GO
/****** Object:  StoredProcedure [dbo].[UpdateApplicationSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UpdateApplicationSp]
	@ApplicationID [int],
	@ApplicationName [nvarchar](255),
	@URL [nvarchar](512),
	@ApplicationType [nvarchar](255),
	@Data [nvarchar](max),
	@UserID [int]
AS

    -- Automatically generated on 6/19/2024 1:57:54 PM.
    
    UPDATE Applications SET 
            [ApplicationName] = @ApplicationName, 
            [URL] = @URL, 
            [ApplicationType] = @ApplicationType, 
            [LastUpdated] = getdate(), 
            [Data] = @Data, 
            [UserID] = @UserID
    WHERE ApplicationID = @ApplicationID

GO
/****** Object:  StoredProcedure [dbo].[UpdateAuthorizationDataSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UpdateAuthorizationDataSp] (
	@AuthorizationID int,
	@Data nvarchar(max)
)
AS

    UPDATE Authorizations SET Data = @Data ,
    LastUpdated = getdate()
    WHERE AuthorizationID = @AuthorizationID	

GO
/****** Object:  StoredProcedure [dbo].[UpdateAuthorizationSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateAuthorizationSp]
	@AuthorizationID [int],
	@AuthorizationToken [nvarchar](255),
	@RefreshToken [nvarchar](255),
	@Expiration [datetime],
	@UserID [int],
	@LastRefreshedDate [datetime],
	@LastActivityDate [datetime],
	@IsExpired [bit],
	@IsRevoked [bit],
	@IsEncrypted [bit],
	@Data [nvarchar](max)
AS

    -- Automatically generated on 1/31/2024 10:23:40 AM.
    
    UPDATE Authorizations SET 
            [AuthorizationToken] = @AuthorizationToken, 
            [RefreshToken] = @RefreshToken, 
            [Expiration] = @Expiration, 
            [UserID] = @UserID, 
            [LastRefreshedDate] = @LastRefreshedDate, 
            [LastActivityDate] = @LastActivityDate, 
            [IsExpired] = @IsExpired, 
            [IsRevoked] = @IsRevoked, 
            [IsEncrypted] = @IsEncrypted, 
            [Data] = @Data, 
            [LastUpdated] = getdate()
    WHERE AuthorizationID = @AuthorizationID
GO
/****** Object:  StoredProcedure [dbo].[UpdateBlockedEmailDataSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[UpdateBlockedEmailDataSp] (
	@BlockedEmailID int,
	@Data nvarchar(max)
)
AS

    UPDATE BlockedEmails SET Data = @Data ,
    LastUpdated = getdate()
    WHERE BlockedEmailID = @BlockedEmailID	


GO
/****** Object:  StoredProcedure [dbo].[UpdateBlockedEmailSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UpdateBlockedEmailSp]
	@BlockedEmailID [int],
	@Email [nvarchar](255),
	@Notes [nvarchar](max),
	@Data [nvarchar](max)
AS

    -- Automatically generated on 7/18/2024 5:57:46 PM.
    
    UPDATE BlockedEmails SET 
            [Email] = @Email, 
            [Notes] = @Notes, 
            [Data] = @Data, 
            [LastUpdated] = getdate()
    WHERE BlockedEmailID = @BlockedEmailID

GO
/****** Object:  StoredProcedure [dbo].[UpdateContentDataSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[UpdateContentDataSp] (
	@ContentID int,
	@Data nvarchar(max)
)
AS

    UPDATE Contents SET Data = @Data ,
    LastUpdated = getdate()
    WHERE ContentID = @ContentID	


GO
/****** Object:  StoredProcedure [dbo].[UpdateContentSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UpdateContentSp]
	@ContentID [int],
	@ContentName [nvarchar](255),
	@Content [nvarchar](max),
	@Data [nvarchar](max),
	@ContentTypeID [int]
AS

    -- Automatically generated on 8/23/2024 9:58:34 AM.
    
    UPDATE Contents SET 
            [ContentName] = @ContentName, 
            [Content] = @Content, 
            [LastUpdated] = getdate(), 
            [Data] = @Data, 
            [ContentTypeID] = @ContentTypeID
    WHERE ContentID = @ContentID

GO
/****** Object:  StoredProcedure [dbo].[UpdateContentTypeDataSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[UpdateContentTypeDataSp] (
	@ContentTypeID int,
	@Data nvarchar(max)
)
AS

    UPDATE ContentTypes SET Data = @Data ,
    LastUpdated = getdate()
    WHERE ContentTypeID = @ContentTypeID	


GO
/****** Object:  StoredProcedure [dbo].[UpdateContentTypeSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UpdateContentTypeSp]
	@ContentTypeID [int],
	@ContentTypeName [nvarchar](255),
	@Data [nvarchar](max)
AS

    -- Automatically generated on 8/23/2024 9:58:34 AM.
    
    UPDATE ContentTypes SET 
            [ContentTypeName] = @ContentTypeName, 
            [Data] = @Data, 
            [LastUpdated] = getdate()
    WHERE ContentTypeID = @ContentTypeID

GO
/****** Object:  StoredProcedure [dbo].[UpdateEmailHistoryDataSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[UpdateEmailHistoryDataSp] (
	@EmailHistoryID int,
	@Data nvarchar(max)
)
AS

    UPDATE EmailHistories SET Data = @Data ,
    LastUpdated = getdate()
    WHERE EmailHistoryID = @EmailHistoryID	


GO
/****** Object:  StoredProcedure [dbo].[UpdateEmailHistorySp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UpdateEmailHistorySp]
	@EmailHistoryID [int],
	@To [nvarchar](255),
	@From [nvarchar](255),
	@EmailTemplateID [int],
	@Subject [nvarchar](255),
	@Email [nvarchar](max),
	@IsPending [bit],
	@IsSent [bit],
	@Data [nvarchar](max)
AS

    -- Automatically generated on 7/18/2024 5:57:46 PM.
    
    UPDATE EmailHistories SET 
            [To] = @To, 
            [From] = @From, 
            [EmailTemplateID] = @EmailTemplateID, 
            [Subject] = @Subject, 
            [Email] = @Email, 
            [IsPending] = @IsPending, 
            [IsSent] = @IsSent, 
            [Data] = @Data, 
            [LastUpdated] = getdate()
    WHERE EmailHistoryID = @EmailHistoryID

GO
/****** Object:  StoredProcedure [dbo].[UpdateEmailTemplateDataSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[UpdateEmailTemplateDataSp] (
	@EmailTemplateID int,
	@Data nvarchar(max)
)
AS

    UPDATE EmailTemplates SET Data = @Data ,
    LastUpdated = getdate()
    WHERE EmailTemplateID = @EmailTemplateID	


GO
/****** Object:  StoredProcedure [dbo].[UpdateEmailTemplateSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UpdateEmailTemplateSp]
	@EmailTemplateID [int],
	@Name [nvarchar](255),
	@EmailSubject [nvarchar](255),
	@EmailText [nvarchar](max),
	@EmailParams [nvarchar](255),
	@FromAddress [nvarchar](255),
	@Data [nvarchar](max)
AS

    -- Automatically generated on 7/18/2024 5:57:46 PM.
    
    UPDATE EmailTemplates SET 
            [Name] = @Name, 
            [EmailSubject] = @EmailSubject, 
            [EmailText] = @EmailText, 
            [EmailParams] = @EmailParams, 
            [FromAddress] = @FromAddress, 
            [LastUpdated] = getdate(), 
            [Data] = @Data
    WHERE EmailTemplateID = @EmailTemplateID

GO
/****** Object:  StoredProcedure [dbo].[UpdateFeatureDataSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UpdateFeatureDataSp] (
	@FeatureID int,
	@Data nvarchar(max)
)
AS

    UPDATE Features SET Data = @Data ,
    LastUpdated = getdate()
    WHERE FeatureID = @FeatureID	

GO
/****** Object:  StoredProcedure [dbo].[UpdateFeatureSettingsSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UpdateFeatureSettingsSp] (
	@FeatureID int,
	@Settings nvarchar(max)
)
AS

    UPDATE Features SET Settings = @Settings ,
    LastUpdated = getdate()
    WHERE FeatureID = @FeatureID	

GO
/****** Object:  StoredProcedure [dbo].[UpdateFeatureSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateFeatureSp]
	@FeatureID [int],
	@FeatureName [nvarchar](255),
	@Version [nvarchar](255),
	@IsEnabled [bit],
	@SettingsAssembly [nvarchar](255),
	@SettingsClass [nvarchar](255),
	@Settings [nvarchar](max),
	@Data [nvarchar](max)
AS

    -- Automatically generated on 1/20/2024 5:38:31 AM.
    
    UPDATE Features SET 
            [FeatureName] = @FeatureName, 
            [Version] = @Version, 
            [IsEnabled] = @IsEnabled, 
            [SettingsAssembly] = @SettingsAssembly, 
            [SettingsClass] = @SettingsClass, 
            [Settings] = @Settings, 
            [LastUpdated] = getdate(), 
            [Data] = @Data
    WHERE FeatureID = @FeatureID
GO
/****** Object:  StoredProcedure [dbo].[UpdatePageLayoutSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdatePageLayoutSp]
	@PageLayoutID [int],
	@LayoutID [int],
	@Url [nvarchar](512),
	@Handler [nvarchar](512),
	@IsEnabled [bit],
	@KeywordsMetaTag [nvarchar](255),
	@DescriptionMetaTag [nvarchar](255),
	@PageTitle [nvarchar](255),
	@RoleID [int],
	@Priority [int],
	@SiteID [int]
AS

    -- Automatically generated on 1/20/2024 5:38:31 AM.
    
    UPDATE PageLayouts SET 
            [LayoutID] = @LayoutID, 
            [Url] = @Url, 
            [Handler] = @Handler, 
            [IsEnabled] = @IsEnabled, 
            [LastUpdated] = getdate(), 
            [KeywordsMetaTag] = @KeywordsMetaTag, 
            [DescriptionMetaTag] = @DescriptionMetaTag, 
            [PageTitle] = @PageTitle, 
            [RoleID] = @RoleID, 
            [Priority] = @Priority, 
            [SiteID] = @SiteID
    WHERE PageLayoutID = @PageLayoutID
GO
/****** Object:  StoredProcedure [dbo].[UpdateRoleDataSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UpdateRoleDataSp] (
	@RoleID int,
	@Data nvarchar(max)
)
AS

    UPDATE Roles SET Data = @Data ,
    LastUpdated = getdate()
    WHERE RoleID = @RoleID	

GO
/****** Object:  StoredProcedure [dbo].[UpdateRoleSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateRoleSp]
	@RoleID [int],
	@RoleName [nvarchar](255),
	@Data [nvarchar](max)
AS

    -- Automatically generated on 1/31/2024 10:23:40 AM.
    
    UPDATE Roles SET 
            [RoleName] = @RoleName, 
            [LastUpdated] = getdate(), 
            [Data] = @Data
    WHERE RoleID = @RoleID
GO
/****** Object:  StoredProcedure [dbo].[UpdateTierDataSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[UpdateTierDataSp] (
	@TierID int,
	@Data nvarchar(max)
)
AS

    UPDATE Tiers SET Data = @Data ,
    LastUpdated = getdate()
    WHERE TierID = @TierID	


GO
/****** Object:  StoredProcedure [dbo].[UpdateTierSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UpdateTierSp]
	@TierID [int],
	@TierName [nvarchar](255),
	@Data [nvarchar](max)
AS

    -- Automatically generated on 1/31/2024 10:23:40 AM.
    
    UPDATE Tiers SET 
            [TierName] = @TierName, 
            [Data] = @Data, 
            [LastUpdated] = getdate()
    WHERE TierID = @TierID

GO
/****** Object:  StoredProcedure [dbo].[UpdateUsageDimensionDataSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[UpdateUsageDimensionDataSp] (
	@UsageDimensionID int,
	@Data nvarchar(max)
)
AS

    UPDATE UsageDimensions SET Data = @Data ,
    LastUpdated = getdate()
    WHERE UsageDimensionID = @UsageDimensionID	


GO
/****** Object:  StoredProcedure [dbo].[UpdateUsageDimensionSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UpdateUsageDimensionSp]
	@UsageDimensionID [int],
	@UsageDimension [nvarchar](255),
	@Data [nvarchar](max)
AS

    -- Automatically generated on 1/31/2024 10:23:40 AM.
    
    UPDATE UsageDimensions SET 
            [UsageDimension] = @UsageDimension, 
            [LastUpdated] = getdate(), 
            [Data] = @Data
    WHERE UsageDimensionID = @UsageDimensionID

GO
/****** Object:  StoredProcedure [dbo].[UpdateUserDataSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UpdateUserDataSp] (
	@UserID int,
	@Data nvarchar(max)
)
AS

    UPDATE Users SET Data = @Data ,
    LastUpdated = getdate()
    WHERE UserID = @UserID	

GO
/****** Object:  StoredProcedure [dbo].[UpdateUserRoleDataSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UpdateUserRoleDataSp] (
	@UserRoleID int,
	@Data nvarchar(max)
)
AS

    UPDATE UserRoles SET Data = @Data ,
    LastUpdated = getdate()
    WHERE UserRoleID = @UserRoleID	

GO
/****** Object:  StoredProcedure [dbo].[UpdateUserRoleSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateUserRoleSp]
	@UserRoleID [int],
	@UserID [int],
	@RoleID [int],
	@Data [nvarchar](max)
AS

    -- Automatically generated on 1/31/2024 10:23:40 AM.
    
    UPDATE UserRoles SET 
            [UserID] = @UserID, 
            [RoleID] = @RoleID, 
            [LastUpdated] = getdate(), 
            [Data] = @Data
    WHERE UserRoleID = @UserRoleID
GO
/****** Object:  StoredProcedure [dbo].[UpdateUserSp]    Script Date: 1/21/2025 4:10:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateUserSp]
	@UserID [int],
	@IsEnabled [bit],
	@Data [nvarchar](max),
	@Email [nvarchar](255),
	@Phone [nvarchar](255),
	@Password [nvarchar](max),
	@HasLoggedIn [bit],
	@LastLoginDate [datetime],
	@IsLockedOut [bit],
	@InvitationCode [nvarchar](255),
	@InvitationExpiration [datetime],
	@IsInvited [bit],
	@InvitedDate [datetime]
AS

    -- Automatically generated on 1/31/2024 10:23:40 AM.
    
    UPDATE Users SET 
            [IsEnabled] = @IsEnabled, 
            [LastUpdated] = getdate(), 
            [Data] = @Data, 
            [Email] = @Email, 
            [Phone] = @Phone, 
            [Password] = @Password, 
            [HasLoggedIn] = @HasLoggedIn, 
            [LastLoginDate] = @LastLoginDate, 
            [IsLockedOut] = @IsLockedOut, 
            [InvitationCode] = @InvitationCode, 
            [InvitationExpiration] = @InvitationExpiration, 
            [IsInvited] = @IsInvited, 
            [InvitedDate] = @InvitedDate
    WHERE UserID = @UserID
GO
USE [master]
GO
ALTER DATABASE [buffaly] SET  READ_WRITE 
GO
