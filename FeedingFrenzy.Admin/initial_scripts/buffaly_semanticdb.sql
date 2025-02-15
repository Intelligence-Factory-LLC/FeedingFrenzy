USE [master]
GO
ALTER DATABASE [buffaly_semanticdb] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [buffaly_semanticdb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [buffaly_semanticdb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [buffaly_semanticdb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [buffaly_semanticdb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [buffaly_semanticdb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [buffaly_semanticdb] SET ARITHABORT OFF 
GO
ALTER DATABASE [buffaly_semanticdb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [buffaly_semanticdb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [buffaly_semanticdb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [buffaly_semanticdb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [buffaly_semanticdb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [buffaly_semanticdb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [buffaly_semanticdb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [buffaly_semanticdb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [buffaly_semanticdb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [buffaly_semanticdb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [buffaly_semanticdb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [buffaly_semanticdb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [buffaly_semanticdb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [buffaly_semanticdb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [buffaly_semanticdb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [buffaly_semanticdb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [buffaly_semanticdb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [buffaly_semanticdb] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [buffaly_semanticdb] SET  MULTI_USER 
GO
ALTER DATABASE [buffaly_semanticdb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [buffaly_semanticdb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [buffaly_semanticdb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [buffaly_semanticdb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [buffaly_semanticdb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [buffaly_semanticdb] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [buffaly_semanticdb] SET QUERY_STORE = OFF
GO
USE [buffaly_semanticdb]
GO
/****** Object:  Table [dbo].[Artifacts]    Script Date: 1/21/2025 4:08:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Artifacts](
	[ArtifactID] [int] IDENTITY(1,1) NOT NULL,
	[ArtifactTypeID] [int] NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[File] [nvarchar](255) NULL,
	[Summary] [nvarchar](max) NULL,
	[FragmentID] [int] NULL,
	[Data] [nvarchar](max) NULL,
	[DateCreated] [datetime] NOT NULL,
	[LastUpdated] [datetime] NOT NULL,
 CONSTRAINT [PK_Artifacts] PRIMARY KEY CLUSTERED 
(
	[ArtifactID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ArtifactTypes]    Script Date: 1/21/2025 4:08:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ArtifactTypes](
	[ArtifactTypeID] [int] IDENTITY(1,1) NOT NULL,
	[ArtifactType] [nvarchar](255) NOT NULL,
	[Data] [nvarchar](max) NULL,
	[DateCreated] [datetime] NOT NULL,
	[LastUpdated] [datetime] NOT NULL,
 CONSTRAINT [PK_ArtifactTypes] PRIMARY KEY CLUSTERED 
(
	[ArtifactTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DataExtractors]    Script Date: 1/21/2025 4:08:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DataExtractors](
	[DataExtractorID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Format] [nvarchar](255) NOT NULL,
	[Prompt] [nvarchar](max) NOT NULL,
	[Version] [int] NOT NULL,
	[Data] [nvarchar](max) NULL,
	[DateCreated] [datetime] NOT NULL,
	[LastUpdated] [datetime] NOT NULL,
	[TagID] [int] NOT NULL,
 CONSTRAINT [PK_DataExtractors] PRIMARY KEY CLUSTERED 
(
	[DataExtractorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Embeddings]    Script Date: 1/21/2025 4:08:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Embeddings](
	[EmbeddingID] [int] IDENTITY(1,1) NOT NULL,
	[EmbeddingModel] [nvarchar](255) NOT NULL,
	[Data] [nvarchar](max) NULL,
	[DateCreated] [datetime] NOT NULL,
	[LastUpdated] [datetime] NOT NULL,
 CONSTRAINT [PK_Embeddings] PRIMARY KEY CLUSTERED 
(
	[EmbeddingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Fragments]    Script Date: 1/21/2025 4:08:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fragments](
	[FragmentID] [int] IDENTITY(1,1) NOT NULL,
	[Fragment] [nvarchar](max) NOT NULL,
	[ParentFragmentID] [int] NULL,
	[FragmentKey] [nvarchar](255) NOT NULL,
	[Data] [nvarchar](max) NULL,
	[DateCreated] [datetime] NOT NULL,
	[LastUpdated] [datetime] NOT NULL,
 CONSTRAINT [PK_Fragments] PRIMARY KEY CLUSTERED 
(
	[FragmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FragmentTags]    Script Date: 1/21/2025 4:08:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FragmentTags](
	[FragmentTagID] [int] IDENTITY(1,1) NOT NULL,
	[TagID] [int] NOT NULL,
	[FragmentID] [int] NOT NULL,
	[Data] [nvarchar](max) NULL,
	[DateCreated] [datetime] NOT NULL,
	[LastUpdated] [datetime] NOT NULL,
 CONSTRAINT [PK_FragmentTags] PRIMARY KEY CLUSTERED 
(
	[FragmentTagID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tags]    Script Date: 1/21/2025 4:08:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tags](
	[TagID] [int] IDENTITY(1,1) NOT NULL,
	[TagName] [nvarchar](255) NOT NULL,
	[TagDescription] [nvarchar](255) NULL,
	[Data] [nvarchar](max) NULL,
	[DateCreated] [datetime] NOT NULL,
	[LastUpdated] [datetime] NOT NULL,
 CONSTRAINT [PK_Tags] PRIMARY KEY CLUSTERED 
(
	[TagID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vectors]    Script Date: 1/21/2025 4:08:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vectors](
	[VectorID] [int] IDENTITY(1,1) NOT NULL,
	[EmbeddingID] [int] NOT NULL,
	[FragmentID] [int] NOT NULL,
	[Dimension] [int] NOT NULL,
	[Value] [float] NOT NULL,
	[Data] [nvarchar](max) NULL,
	[DateCreated] [datetime] NOT NULL,
	[LastUpdated] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Fragments] ON 

INSERT [dbo].[Fragments] ([FragmentID], [Fragment], [ParentFragmentID], [FragmentKey], [Data], [DateCreated], [LastUpdated]) VALUES (1, N'***Lead Info: ****
*** Lead Info: ***

Hi John Doe
Lead ID: 2756
Tags: Add 
Campaign: 
Sales Representative: 
Company: Hi John
Opportunity Size: 
Mailing Address: 3820 C Ave Ste 111-11, Nashville, Tennessee, 37211, United States
Nashville Tennessee 37211

Contacts

Jane Jones (Primary)
Name: Jane Jones
Phone: 
Email: Jane@joneses.com

More Info
Last Contacted Date: 
Priority: Normal
Status: Not Contacted
Source: Google
Campaign: 
Generated: 9/30/2024 10:05 AM

 *** Recent Notes and Interactions: *** 
 
 ****** Recent Emails ***** 
', NULL, N'Lead Info 2756', N'{"DataExtractors":[{"DataExtractorID":4,"Format":"JSON","Name":"Appointment Scheduling Extractor - Incoming","Prompt":null,"Version":6},{"DataExtractorID":5,"Format":"JSON","Name":"Extract Knowledge Graph - Incoming","Prompt":null,"Version":2}],"ExtractedData":{"AnswerersName":"Julie","Contact":{"Email":"","Name":"Aaron","Phone":""},"DateAndTimeOfAppointment":"","Facts":["Julie is a Voice Agent from Intelligence Factory.","Aaron is over at Intelligence Factory.","Julie is doing well.","Intelligence Factory offers comprehensive IT support services.","Intelligence Factory includes emergency onsite assistance.","Intelligence Factory offers flexible plans tailored to customer needs.","Intelligence Factory provides one-time support.","Intelligence Factory provides ongoing maintenance."],"MainObjection":"Contact information request","MainTopic":"IT support services","Summary":"Aaron, the caller, is seeking IT support for a server issue but is hesitant to provide contact information. Julie, the sales representative, responds politely and offers assistance.","Timestamp":6.386471426255699E+17,"WasAnswererPolite":true,"WasAppointmentScheduled":"No","WasAppointmentScheduledResponse":"I''m sorry to hear about your server troubles. We offer comprehensive IT support services, including emergency onsite assistance.","WasThereAnObjection":true}}', CAST(N'2024-10-04T16:25:44.370' AS DateTime), CAST(N'2024-10-04T16:25:44.370' AS DateTime))
INSERT [dbo].[Fragments] ([FragmentID], [Fragment], [ParentFragmentID], [FragmentKey], [Data], [DateCreated], [LastUpdated]) VALUES (2, N'
# Daily Summary for Matthew Furnari for 1/15/2025 12:00:00 AM
  
## Sales Representative Info
  
Sales Representative ID: 1
Name: Matthew Furnari  
Email: mfurnari@gmail.com  
Phone: 234567894  
Enabled: Yes  
  
## Overall Performance 
  
Appointments Set: 0
Presentations Given: 0
Phone Calls Made: 0 calls made to 0 unique leads. 
	The minimum unique leads called per day for this sales rep is 0 and they were Over this limit.
	The minimum phone calls per day for this sales rep is 0 and they were Over this limit.
Emails Sent: 0


## Actions Taken

	  
  		', NULL, N'Sales Representative Daily Summary 1 for 1/15/2025 12:00:00 AM', NULL, CAST(N'2025-01-16T15:22:33.900' AS DateTime), CAST(N'2025-01-16T15:22:33.900' AS DateTime))
SET IDENTITY_INSERT [dbo].[Fragments] OFF
GO
SET IDENTITY_INSERT [dbo].[FragmentTags] ON 

INSERT [dbo].[FragmentTags] ([FragmentTagID], [TagID], [FragmentID], [Data], [DateCreated], [LastUpdated]) VALUES (7, 3, 1, NULL, CAST(N'2024-10-17T13:32:43.417' AS DateTime), CAST(N'2024-10-17T13:32:43.417' AS DateTime))
INSERT [dbo].[FragmentTags] ([FragmentTagID], [TagID], [FragmentID], [Data], [DateCreated], [LastUpdated]) VALUES (9, 7, 2, NULL, CAST(N'2025-01-16T15:22:34.050' AS DateTime), CAST(N'2025-01-16T15:22:34.050' AS DateTime))
SET IDENTITY_INSERT [dbo].[FragmentTags] OFF
GO
SET IDENTITY_INSERT [dbo].[Tags] ON 

INSERT [dbo].[Tags] ([TagID], [TagName], [TagDescription], [Data], [DateCreated], [LastUpdated]) VALUES (1, N'Lead Phone Call', N'', N'', CAST(N'2024-07-09T18:31:41.487' AS DateTime), CAST(N'2024-07-09T18:31:41.487' AS DateTime))
INSERT [dbo].[Tags] ([TagID], [TagName], [TagDescription], [Data], [DateCreated], [LastUpdated]) VALUES (2, N'Incoming Phone Call', NULL, NULL, CAST(N'2024-07-29T19:42:43.057' AS DateTime), CAST(N'2024-07-29T19:42:43.057' AS DateTime))
INSERT [dbo].[Tags] ([TagID], [TagName], [TagDescription], [Data], [DateCreated], [LastUpdated]) VALUES (3, N'tag3', N'tag3 description', N'', CAST(N'2024-10-16T11:22:56.880' AS DateTime), CAST(N'2024-10-16T11:22:56.880' AS DateTime))
INSERT [dbo].[Tags] ([TagID], [TagName], [TagDescription], [Data], [DateCreated], [LastUpdated]) VALUES (4, N'tag4', N'tag4 description', N'', CAST(N'2024-10-16T11:23:10.990' AS DateTime), CAST(N'2024-10-16T11:23:10.990' AS DateTime))
INSERT [dbo].[Tags] ([TagID], [TagName], [TagDescription], [Data], [DateCreated], [LastUpdated]) VALUES (5, N'', NULL, NULL, CAST(N'2024-10-16T21:40:54.440' AS DateTime), CAST(N'2024-10-16T21:40:54.440' AS DateTime))
INSERT [dbo].[Tags] ([TagID], [TagName], [TagDescription], [Data], [DateCreated], [LastUpdated]) VALUES (6, N'aaa', NULL, NULL, CAST(N'2024-10-16T21:44:35.937' AS DateTime), CAST(N'2024-10-16T21:44:35.937' AS DateTime))
INSERT [dbo].[Tags] ([TagID], [TagName], [TagDescription], [Data], [DateCreated], [LastUpdated]) VALUES (7, N'Sales Representative Day Info', NULL, NULL, CAST(N'2025-01-16T15:22:33.977' AS DateTime), CAST(N'2025-01-16T15:22:33.977' AS DateTime))
SET IDENTITY_INSERT [dbo].[Tags] OFF
GO
ALTER TABLE [dbo].[Artifacts] ADD  CONSTRAINT [DF_Artifacts_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [dbo].[Artifacts] ADD  CONSTRAINT [DF_Artifacts_LastUpdated]  DEFAULT (getdate()) FOR [LastUpdated]
GO
ALTER TABLE [dbo].[ArtifactTypes] ADD  CONSTRAINT [DF_ArtifactTypes_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [dbo].[ArtifactTypes] ADD  CONSTRAINT [DF_ArtifactTypes_LastUpdated]  DEFAULT (getdate()) FOR [LastUpdated]
GO
ALTER TABLE [dbo].[DataExtractors] ADD  CONSTRAINT [DF_DataExtractors_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [dbo].[DataExtractors] ADD  CONSTRAINT [DF_DataExtractors_LastUpdated]  DEFAULT (getdate()) FOR [LastUpdated]
GO
ALTER TABLE [dbo].[Embeddings] ADD  CONSTRAINT [DF_Embeddings_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [dbo].[Embeddings] ADD  CONSTRAINT [DF_Embeddings_LastUpdated]  DEFAULT (getdate()) FOR [LastUpdated]
GO
ALTER TABLE [dbo].[Fragments] ADD  CONSTRAINT [DF_Fragments_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [dbo].[Fragments] ADD  CONSTRAINT [DF_Fragments_LastUpdated]  DEFAULT (getdate()) FOR [LastUpdated]
GO
ALTER TABLE [dbo].[FragmentTags] ADD  CONSTRAINT [DF_FragmentTags_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [dbo].[FragmentTags] ADD  CONSTRAINT [DF_FragmentTags_LastUpdated]  DEFAULT (getdate()) FOR [LastUpdated]
GO
ALTER TABLE [dbo].[Tags] ADD  CONSTRAINT [DF_Tags_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [dbo].[Tags] ADD  CONSTRAINT [DF_Tags_LastUpdated]  DEFAULT (getdate()) FOR [LastUpdated]
GO
ALTER TABLE [dbo].[Vectors] ADD  CONSTRAINT [DF_Vectors_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [dbo].[Vectors] ADD  CONSTRAINT [DF_Vectors_LastUpdated]  DEFAULT (getdate()) FOR [LastUpdated]
GO
ALTER TABLE [dbo].[Artifacts]  WITH CHECK ADD  CONSTRAINT [FK_Artifacts_ArtifactTypeID_ArtifactTypes] FOREIGN KEY([ArtifactTypeID])
REFERENCES [dbo].[ArtifactTypes] ([ArtifactTypeID])
GO
ALTER TABLE [dbo].[Artifacts] CHECK CONSTRAINT [FK_Artifacts_ArtifactTypeID_ArtifactTypes]
GO
ALTER TABLE [dbo].[Artifacts]  WITH CHECK ADD  CONSTRAINT [FK_Artifacts_FragmentID_Fragments] FOREIGN KEY([FragmentID])
REFERENCES [dbo].[Fragments] ([FragmentID])
GO
ALTER TABLE [dbo].[Artifacts] CHECK CONSTRAINT [FK_Artifacts_FragmentID_Fragments]
GO
ALTER TABLE [dbo].[DataExtractors]  WITH CHECK ADD  CONSTRAINT [FK_DataExtractors_TagID_Tags] FOREIGN KEY([TagID])
REFERENCES [dbo].[Tags] ([TagID])
GO
ALTER TABLE [dbo].[DataExtractors] CHECK CONSTRAINT [FK_DataExtractors_TagID_Tags]
GO
ALTER TABLE [dbo].[Fragments]  WITH CHECK ADD  CONSTRAINT [FK_Fragments_ParentFragmentID_Fragments] FOREIGN KEY([ParentFragmentID])
REFERENCES [dbo].[Fragments] ([FragmentID])
GO
ALTER TABLE [dbo].[Fragments] CHECK CONSTRAINT [FK_Fragments_ParentFragmentID_Fragments]
GO
ALTER TABLE [dbo].[FragmentTags]  WITH CHECK ADD  CONSTRAINT [FK_FragmentTags_FragmentID_Fragments] FOREIGN KEY([FragmentID])
REFERENCES [dbo].[Fragments] ([FragmentID])
GO
ALTER TABLE [dbo].[FragmentTags] CHECK CONSTRAINT [FK_FragmentTags_FragmentID_Fragments]
GO
ALTER TABLE [dbo].[FragmentTags]  WITH CHECK ADD  CONSTRAINT [FK_FragmentTags_TagID_Tags] FOREIGN KEY([TagID])
REFERENCES [dbo].[Tags] ([TagID])
GO
ALTER TABLE [dbo].[FragmentTags] CHECK CONSTRAINT [FK_FragmentTags_TagID_Tags]
GO
ALTER TABLE [dbo].[Vectors]  WITH CHECK ADD  CONSTRAINT [FK_Vectors_EmbeddingID_Embeddings] FOREIGN KEY([EmbeddingID])
REFERENCES [dbo].[Embeddings] ([EmbeddingID])
GO
ALTER TABLE [dbo].[Vectors] CHECK CONSTRAINT [FK_Vectors_EmbeddingID_Embeddings]
GO
ALTER TABLE [dbo].[Vectors]  WITH CHECK ADD  CONSTRAINT [FK_Vectors_FragmentID_Fragments] FOREIGN KEY([FragmentID])
REFERENCES [dbo].[Fragments] ([FragmentID])
GO
ALTER TABLE [dbo].[Vectors] CHECK CONSTRAINT [FK_Vectors_FragmentID_Fragments]
GO
/****** Object:  StoredProcedure [dbo].[CopyArtifactSp]    Script Date: 1/21/2025 4:08:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CopyArtifactSp]
	@ArtifactID [int]
AS

    -- Automatically generated on 5/25/2024 6:50:56 AM.
    
    INSERT INTO Artifacts
    (
            [ArtifactTypeID], 
            [Name], 
            [File], 
            [Summary], 
            [FragmentID], 
            [Data], 
            [DateCreated], 
            [LastUpdated]
    )
    SELECT
            [ArtifactTypeID], 
            [Name], 
            [File], 
            [Summary], 
            [FragmentID], 
            [Data], 
            getdate(), 
            getdate()
    FROM [Artifacts]
    WHERE ArtifactID = @ArtifactID
    SELECT scope_identity() as ArtifactID

GO
/****** Object:  StoredProcedure [dbo].[CopyArtifactTypeSp]    Script Date: 1/21/2025 4:08:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CopyArtifactTypeSp]
	@ArtifactTypeID [int]
AS

    -- Automatically generated on 5/25/2024 6:50:56 AM.
    
    INSERT INTO ArtifactTypes
    (
            [ArtifactType], 
            [Data], 
            [DateCreated], 
            [LastUpdated]
    )
    SELECT
            [ArtifactType] + ' - Copy', 
            [Data], 
            getdate(), 
            getdate()
    FROM [ArtifactTypes]
    WHERE ArtifactTypeID = @ArtifactTypeID
    SELECT scope_identity() as ArtifactTypeID

GO
/****** Object:  StoredProcedure [dbo].[CopyDataExtractorSp]    Script Date: 1/21/2025 4:08:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CopyDataExtractorSp]
	@DataExtractorID [int]
AS

    -- Automatically generated on 6/12/2024 1:36:54 PM.
    
    INSERT INTO DataExtractors
    (
            [Name], 
            [Format], 
            [Prompt], 
            [Version], 
            [Data], 
            [DateCreated], 
            [LastUpdated], 
            [TagID]
    )
    SELECT
            [Name] + ' - Copy', 
            [Format], 
            [Prompt], 
            [Version], 
            [Data], 
            getdate(), 
            getdate(), 
            [TagID]
    FROM [DataExtractors]
    WHERE DataExtractorID = @DataExtractorID
    SELECT scope_identity() as DataExtractorID

GO
/****** Object:  StoredProcedure [dbo].[CopyEmbeddingSp]    Script Date: 1/21/2025 4:08:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CopyEmbeddingSp]
	@EmbeddingID [int]
AS

    -- Automatically generated on 1/20/2024 5:01:21 AM.
    
    INSERT INTO Embeddings
    (
            [EmbeddingModel], 
            [Data], 
            [DateCreated], 
            [LastUpdated]
    )
    SELECT
            [EmbeddingModel] + ' - Copy', 
            [Data], 
            getdate(), 
            getdate()
    FROM [Embeddings]
    WHERE EmbeddingID = @EmbeddingID
    SELECT scope_identity() as EmbeddingID

GO
/****** Object:  StoredProcedure [dbo].[CopyFragmentSp]    Script Date: 1/21/2025 4:08:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CopyFragmentSp]
	@FragmentID [int]
AS

    -- Automatically generated on 1/20/2024 5:01:21 AM.
    
    INSERT INTO Fragments
    (
            [Fragment], 
            [ParentFragmentID], 
            [FragmentKey], 
            [Data], 
            [DateCreated], 
            [LastUpdated]
    )
    SELECT
            [Fragment], 
            [ParentFragmentID], 
            [FragmentKey] + ' - Copy', 
            [Data], 
            getdate(), 
            getdate()
    FROM [Fragments]
    WHERE FragmentID = @FragmentID
    SELECT scope_identity() as FragmentID

GO
/****** Object:  StoredProcedure [dbo].[CopyFragmentTagSp]    Script Date: 1/21/2025 4:08:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CopyFragmentTagSp]
	@FragmentTagID [int]
AS

    -- Automatically generated on 5/23/2024 4:33:21 PM.
    
    INSERT INTO FragmentTags
    (
            [TagID], 
            [FragmentID], 
            [Data], 
            [DateCreated], 
            [LastUpdated]
    )
    SELECT
            [TagID], 
            [FragmentID], 
            [Data], 
            getdate(), 
            getdate()
    FROM [FragmentTags]
    WHERE FragmentTagID = @FragmentTagID
    SELECT scope_identity() as FragmentTagID

GO
/****** Object:  StoredProcedure [dbo].[CopyTagSp]    Script Date: 1/21/2025 4:08:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CopyTagSp]
	@TagID [int]
AS

    -- Automatically generated on 5/23/2024 4:33:21 PM.
    
    INSERT INTO Tags
    (
            [TagName], 
            [TagDescription], 
            [Data], 
            [DateCreated], 
            [LastUpdated]
    )
    SELECT
            [TagName] + ' - Copy', 
            [TagDescription], 
            [Data], 
            getdate(), 
            getdate()
    FROM [Tags]
    WHERE TagID = @TagID
    SELECT scope_identity() as TagID

GO
/****** Object:  StoredProcedure [dbo].[CopyVectorSp]    Script Date: 1/21/2025 4:08:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CopyVectorSp]
	@VectorID [int]
AS

    -- Automatically generated on 1/20/2024 5:01:21 AM.
    
    INSERT INTO Vectors
    (
            [EmbeddingID], 
            [FragmentID], 
            [Dimension], 
            [Value], 
            [Data], 
            [DateCreated], 
            [LastUpdated]
    )
    SELECT
            [EmbeddingID], 
            [FragmentID], 
            [Dimension], 
            [Value], 
            [Data], 
            getdate(), 
            getdate()
    FROM [Vectors]
    WHERE VectorID = @VectorID
    SELECT scope_identity() as VectorID

GO
/****** Object:  StoredProcedure [dbo].[Fragments_GetByTagID_Sp]    Script Date: 1/21/2025 4:08:43 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[Fragments_GetByTagID_Sp]
	@TagID [int]
AS

	select f.* from Fragments f with (nolock) 
	JOIN FragmentTags ft ON f.FragmentID = ft.FragmentID 
	where ft.TagID= @TagID

GO
/****** Object:  StoredProcedure [dbo].[Fragments_GetByTagID_Sp_CountSp]    Script Date: 1/21/2025 4:08:43 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[Fragments_GetByTagID_Sp_CountSp]
	@TagID [int],
	@Search [nvarchar](255)
AS


	SET NOCOUNT ON

	
	SELECT		COUNT(*) as Total
	FROM		(
				select f.* from Fragments f with (nolock) 
	JOIN FragmentTags ft ON f.FragmentID = ft.FragmentID 
	where ft.TagID= @TagID
				) sub
	where		
					[FragmentID] like '%' + @Search + '%' or
					[FragmentKey] like '%' + @Search + '%' 
		

GO
/****** Object:  StoredProcedure [dbo].[Fragments_GetByTagID_Sp_PagingSp]    Script Date: 1/21/2025 4:08:43 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[Fragments_GetByTagID_Sp_PagingSp]
	@TagID [int],
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
					
			
						case when @SortColumn = 'FragmentID' and @SortAscending = 1 then 
							[FragmentID]
						end ASC,
						case when @SortColumn = 'FragmentID' and @SortAscending = 0 then 
							[FragmentID]
						end DESC,
			
						case when @SortColumn = 'ParentFragmentID' and @SortAscending = 1 then 
							[ParentFragmentID]
						end ASC,
						case when @SortColumn = 'ParentFragmentID' and @SortAscending = 0 then 
							[ParentFragmentID]
						end DESC,
			
						case when @SortColumn = 'FragmentKey' and @SortAscending = 1 then 
							[FragmentKey]
						end ASC,
						case when @SortColumn = 'FragmentKey' and @SortAscending = 0 then 
							[FragmentKey]
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
					select f.* from Fragments f with (nolock) 
	JOIN FragmentTags ft ON f.FragmentID = ft.FragmentID 
	where ft.TagID= @TagID
					) sub
		where		
					[FragmentID] like '%' + @Search + '%' or
					[FragmentKey] like '%' + @Search + '%' 
	)
			
	SELECT	*
	FROM	SearchTable
	WHERE	RowNumber BETWEEN @FirstRow AND @LastRow
	ORDER BY RowNumber ASC
	OPTION (recompile);
	
	
		

GO
/****** Object:  StoredProcedure [dbo].[Fragments_GetMostSimilar1_Sp]    Script Date: 1/21/2025 4:08:43 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO



CREATE procedure [dbo].[Fragments_GetMostSimilar1_Sp]
	@Embeddings nvarchar(max), 
	@Threshold float

as
begin 


/*
    Extract the title vectors from the JSON and store them in a table
*/

drop table if exists #t;

select 
    cast([key] as int) as Dimension,
    cast([value] as float) as Value
into    
    #t
from 
    openjson(@Embeddings)




/* 
    Calculate cosine distance between the input text and all the articles
*/
drop table if exists #results;
select top(100)
    v2.FragmentID, 
    sum(v1.Value * v2.Value) / 
        (
            sqrt(sum(v1.Value * v1.Value)) 
            * 
            sqrt(sum(v2.Value * v2.Value))
        ) as cosine_distance
into
    #results
from 
    #t v1
inner join 
    dbo.Vectors v2 on v1.Dimension = v2.Dimension
group by
    v2.FragmentID
order by
    cosine_distance desc;

select 
	f.*, 
    r.cosine_distance as Similarity
from 
    #results r
inner join 
	Fragments f on f.FragmentID = r.FragmentID 
where 
	cosine_distance >= @Threshold
order by
    cosine_distance desc;


end 


GO
/****** Object:  StoredProcedure [dbo].[Fragments_GetMostSimilar1ByTagID_Sp]    Script Date: 1/21/2025 4:08:43 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO




create procedure [dbo].[Fragments_GetMostSimilar1ByTagID_Sp]
	@Embeddings nvarchar(max), 
	@TagID int,
	@Threshold float

as
begin 


/*
    Extract the title vectors from the JSON and store them in a table
*/

drop table if exists #t;

select 
    cast([key] as int) as Dimension,
    cast([value] as float) as Value
into    
    #t
from 
    openjson(@Embeddings)




/* 
    Calculate cosine distance between the input text and all the articles
*/
drop table if exists #results;
select 
    v2.FragmentID, 
    sum(v1.Value * v2.Value) / 
        (
            sqrt(sum(v1.Value * v1.Value)) 
            * 
            sqrt(sum(v2.Value * v2.Value))
        ) as cosine_distance
into
    #results
from 
    #t v1
inner join 
    dbo.Vectors v2 on v1.Dimension = v2.Dimension
group by
    v2.FragmentID
order by
    cosine_distance desc;

select 
	f.*, 
    r.cosine_distance as Similarity
from 
    #results r
inner join 
	Fragments f on f.FragmentID = r.FragmentID 
join FragmentTags ft on f.FragmentID = ft.FragmentID
where 
	cosine_distance >= @Threshold
	and ft.TagID = @TagID
order by
    cosine_distance desc;


end 


GO
/****** Object:  StoredProcedure [dbo].[Fragments_GetSp_CountSp]    Script Date: 1/21/2025 4:08:43 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO


create PROCEDURE [dbo].[Fragments_GetSp_CountSp]
	@Search [nvarchar](255)
AS


	SET NOCOUNT ON

	
	SELECT		COUNT(*) as Total
	FROM		(
				-- Automatically generated on 1/20/2024 5:01:21 AM.
    
    SELECT *
    FROM Fragments WITH (NOLOCK) 
				) sub
	where		
					[FragmentID] like '%' + @Search + '%' or
					[FragmentKey] like '%' + @Search + '%' or 
					[Fragment] like '%' + @Search + '%'
		

GO
/****** Object:  StoredProcedure [dbo].[Fragments_GetSp_PagingSp]    Script Date: 1/21/2025 4:08:43 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO


create PROCEDURE [dbo].[Fragments_GetSp_PagingSp]
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
					
			
						case when @SortColumn = 'FragmentID' and @SortAscending = 1 then 
							[FragmentID]
						end ASC,
						case when @SortColumn = 'FragmentID' and @SortAscending = 0 then 
							[FragmentID]
						end DESC,
			
						case when @SortColumn = 'ParentFragmentID' and @SortAscending = 1 then 
							[ParentFragmentID]
						end ASC,
						case when @SortColumn = 'ParentFragmentID' and @SortAscending = 0 then 
							[ParentFragmentID]
						end DESC,
			
						case when @SortColumn = 'FragmentKey' and @SortAscending = 1 then 
							[FragmentKey]
						end ASC,
						case when @SortColumn = 'FragmentKey' and @SortAscending = 0 then 
							[FragmentKey]
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
					-- Automatically generated on 1/20/2024 5:01:21 AM.
    
    SELECT *
    FROM Fragments WITH (NOLOCK) 
					) sub
		where		
					[FragmentID] like '%' + @Search + '%' or
					[FragmentKey] like '%' + @Search + '%' or 
					[Fragment] like '%' + @Search + '%' 
	)
			
	SELECT	*
	FROM	SearchTable
	WHERE	RowNumber BETWEEN @FirstRow AND @LastRow
	ORDER BY RowNumber ASC
	OPTION (recompile);
	
	
		

GO
/****** Object:  StoredProcedure [dbo].[GetArtifactsByArtifactTypeIDSp]    Script Date: 1/21/2025 4:08:43 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetArtifactsByArtifactTypeIDSp]
	@ArtifactTypeID [int]
AS

    -- Automatically generated on 5/25/2024 6:50:56 AM.
    
    SELECT *
    FROM Artifacts WITH (NOLOCK) 
    WHERE [ArtifactTypeID] = @ArtifactTypeID

GO
/****** Object:  StoredProcedure [dbo].[GetArtifactsByArtifactTypeIDSp_CountSp]    Script Date: 1/21/2025 4:08:43 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetArtifactsByArtifactTypeIDSp_CountSp]
	@ArtifactTypeID [int],
	@Search [nvarchar](255)
AS


	SET NOCOUNT ON

	
	SELECT		COUNT(*) as Total
	FROM		(
				-- Automatically generated on 5/25/2024 6:50:56 AM.
    
    SELECT *
    FROM Artifacts WITH (NOLOCK) 
    WHERE [ArtifactTypeID] = @ArtifactTypeID
				) sub
	where		
					[ArtifactID] like '%' + @Search + '%' or
					[Name] like '%' + @Search + '%' or
					[File] like '%' + @Search + '%' 
		

GO
/****** Object:  StoredProcedure [dbo].[GetArtifactsByArtifactTypeIDSp_PagingSp]    Script Date: 1/21/2025 4:08:43 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetArtifactsByArtifactTypeIDSp_PagingSp]
	@ArtifactTypeID [int],
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
					
			
						case when @SortColumn = 'ArtifactID' and @SortAscending = 1 then 
							[ArtifactID]
						end ASC,
						case when @SortColumn = 'ArtifactID' and @SortAscending = 0 then 
							[ArtifactID]
						end DESC,
			
						case when @SortColumn = 'ArtifactTypeID' and @SortAscending = 1 then 
							[ArtifactTypeID]
						end ASC,
						case when @SortColumn = 'ArtifactTypeID' and @SortAscending = 0 then 
							[ArtifactTypeID]
						end DESC,
			
						case when @SortColumn = 'Name' and @SortAscending = 1 then 
							[Name]
						end ASC,
						case when @SortColumn = 'Name' and @SortAscending = 0 then 
							[Name]
						end DESC,
			
						case when @SortColumn = 'File' and @SortAscending = 1 then 
							[File]
						end ASC,
						case when @SortColumn = 'File' and @SortAscending = 0 then 
							[File]
						end DESC,
			
						case when @SortColumn = 'FragmentID' and @SortAscending = 1 then 
							[FragmentID]
						end ASC,
						case when @SortColumn = 'FragmentID' and @SortAscending = 0 then 
							[FragmentID]
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
					-- Automatically generated on 5/25/2024 6:50:56 AM.
    
    SELECT *
    FROM Artifacts WITH (NOLOCK) 
    WHERE [ArtifactTypeID] = @ArtifactTypeID
					) sub
		where		
					[ArtifactID] like '%' + @Search + '%' or
					[Name] like '%' + @Search + '%' or
					[File] like '%' + @Search + '%' 
	)
			
	SELECT	*
	FROM	SearchTable
	WHERE	RowNumber BETWEEN @FirstRow AND @LastRow
	ORDER BY RowNumber ASC
	OPTION (recompile);
	
	
		

GO
/****** Object:  StoredProcedure [dbo].[GetArtifactsByFragmentIDSp]    Script Date: 1/21/2025 4:08:43 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetArtifactsByFragmentIDSp]
	@FragmentID [int]
AS

    -- Automatically generated on 5/25/2024 6:50:56 AM.
    
    SELECT *
    FROM Artifacts WITH (NOLOCK) 
    WHERE [FragmentID] = @FragmentID

GO
/****** Object:  StoredProcedure [dbo].[GetArtifactsByFragmentIDSp_CountSp]    Script Date: 1/21/2025 4:08:43 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetArtifactsByFragmentIDSp_CountSp]
	@FragmentID [int],
	@Search [nvarchar](255)
AS


	SET NOCOUNT ON

	
	SELECT		COUNT(*) as Total
	FROM		(
				-- Automatically generated on 5/25/2024 6:50:56 AM.
    
    SELECT *
    FROM Artifacts WITH (NOLOCK) 
    WHERE [FragmentID] = @FragmentID
				) sub
	where		
					[ArtifactID] like '%' + @Search + '%' or
					[Name] like '%' + @Search + '%' or
					[File] like '%' + @Search + '%' 
		

GO
/****** Object:  StoredProcedure [dbo].[GetArtifactsByFragmentIDSp_PagingSp]    Script Date: 1/21/2025 4:08:43 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetArtifactsByFragmentIDSp_PagingSp]
	@FragmentID [int],
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
					
			
						case when @SortColumn = 'ArtifactID' and @SortAscending = 1 then 
							[ArtifactID]
						end ASC,
						case when @SortColumn = 'ArtifactID' and @SortAscending = 0 then 
							[ArtifactID]
						end DESC,
			
						case when @SortColumn = 'ArtifactTypeID' and @SortAscending = 1 then 
							[ArtifactTypeID]
						end ASC,
						case when @SortColumn = 'ArtifactTypeID' and @SortAscending = 0 then 
							[ArtifactTypeID]
						end DESC,
			
						case when @SortColumn = 'Name' and @SortAscending = 1 then 
							[Name]
						end ASC,
						case when @SortColumn = 'Name' and @SortAscending = 0 then 
							[Name]
						end DESC,
			
						case when @SortColumn = 'File' and @SortAscending = 1 then 
							[File]
						end ASC,
						case when @SortColumn = 'File' and @SortAscending = 0 then 
							[File]
						end DESC,
			
						case when @SortColumn = 'FragmentID' and @SortAscending = 1 then 
							[FragmentID]
						end ASC,
						case when @SortColumn = 'FragmentID' and @SortAscending = 0 then 
							[FragmentID]
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
					-- Automatically generated on 5/25/2024 6:50:56 AM.
    
    SELECT *
    FROM Artifacts WITH (NOLOCK) 
    WHERE [FragmentID] = @FragmentID
					) sub
		where		
					[ArtifactID] like '%' + @Search + '%' or
					[Name] like '%' + @Search + '%' or
					[File] like '%' + @Search + '%' 
	)
			
	SELECT	*
	FROM	SearchTable
	WHERE	RowNumber BETWEEN @FirstRow AND @LastRow
	ORDER BY RowNumber ASC
	OPTION (recompile);
	
	
		

GO
/****** Object:  StoredProcedure [dbo].[GetArtifactsByNameSp]    Script Date: 1/21/2025 4:08:43 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetArtifactsByNameSp]
	@Name [nvarchar](255)
AS

    -- Automatically generated on 5/25/2024 6:50:56 AM.
    
    SELECT *
    FROM Artifacts WITH (NOLOCK) 
    WHERE [Name] = @Name

GO
/****** Object:  StoredProcedure [dbo].[GetArtifactSp]    Script Date: 1/21/2025 4:08:43 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetArtifactSp]
	@ArtifactID [int]
AS

    -- Automatically generated on 5/25/2024 6:50:56 AM.
    
    SELECT *
    FROM Artifacts WITH (NOLOCK) 
     WHERE ArtifactID = @ArtifactID

GO
/****** Object:  StoredProcedure [dbo].[GetArtifactsSp]    Script Date: 1/21/2025 4:08:43 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetArtifactsSp]
AS

    -- Automatically generated on 5/25/2024 6:50:56 AM.
    
    SELECT *
    FROM Artifacts WITH (NOLOCK) 

GO
/****** Object:  StoredProcedure [dbo].[GetArtifactsSp_CountSp]    Script Date: 1/21/2025 4:08:43 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetArtifactsSp_CountSp]
	@Search [nvarchar](255)
AS


	SET NOCOUNT ON

	
	SELECT		COUNT(*) as Total
	FROM		(
				-- Automatically generated on 5/25/2024 6:50:56 AM.
    
    SELECT *
    FROM Artifacts WITH (NOLOCK) 
				) sub
	where		
					[ArtifactID] like '%' + @Search + '%' or
					[Name] like '%' + @Search + '%' or
					[File] like '%' + @Search + '%' 
		

GO
/****** Object:  StoredProcedure [dbo].[GetArtifactsSp_PagingSp]    Script Date: 1/21/2025 4:08:43 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetArtifactsSp_PagingSp]
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
					
			
						case when @SortColumn = 'ArtifactID' and @SortAscending = 1 then 
							[ArtifactID]
						end ASC,
						case when @SortColumn = 'ArtifactID' and @SortAscending = 0 then 
							[ArtifactID]
						end DESC,
			
						case when @SortColumn = 'ArtifactTypeID' and @SortAscending = 1 then 
							[ArtifactTypeID]
						end ASC,
						case when @SortColumn = 'ArtifactTypeID' and @SortAscending = 0 then 
							[ArtifactTypeID]
						end DESC,
			
						case when @SortColumn = 'Name' and @SortAscending = 1 then 
							[Name]
						end ASC,
						case when @SortColumn = 'Name' and @SortAscending = 0 then 
							[Name]
						end DESC,
			
						case when @SortColumn = 'File' and @SortAscending = 1 then 
							[File]
						end ASC,
						case when @SortColumn = 'File' and @SortAscending = 0 then 
							[File]
						end DESC,
			
						case when @SortColumn = 'FragmentID' and @SortAscending = 1 then 
							[FragmentID]
						end ASC,
						case when @SortColumn = 'FragmentID' and @SortAscending = 0 then 
							[FragmentID]
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
					-- Automatically generated on 5/25/2024 6:50:56 AM.
    
    SELECT *
    FROM Artifacts WITH (NOLOCK) 
					) sub
		where		
					[ArtifactID] like '%' + @Search + '%' or
					[Name] like '%' + @Search + '%' or
					[File] like '%' + @Search + '%' 
	)
			
	SELECT	*
	FROM	SearchTable
	WHERE	RowNumber BETWEEN @FirstRow AND @LastRow
	ORDER BY RowNumber ASC
	OPTION (recompile);
	
	
		

GO
/****** Object:  StoredProcedure [dbo].[GetArtifactTypeByArtifactTypeSp]    Script Date: 1/21/2025 4:08:43 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetArtifactTypeByArtifactTypeSp]
	@ArtifactType [nvarchar](255)
AS

    -- Automatically generated on 5/25/2024 6:50:56 AM.
    
    SELECT *
    FROM ArtifactTypes WITH (NOLOCK) 
    WHERE [ArtifactType] = @ArtifactType

GO
/****** Object:  StoredProcedure [dbo].[GetArtifactTypeSp]    Script Date: 1/21/2025 4:08:43 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetArtifactTypeSp]
	@ArtifactTypeID [int]
AS

    -- Automatically generated on 5/25/2024 6:50:56 AM.
    
    SELECT *
    FROM ArtifactTypes WITH (NOLOCK) 
     WHERE ArtifactTypeID = @ArtifactTypeID

GO
/****** Object:  StoredProcedure [dbo].[GetArtifactTypesSp]    Script Date: 1/21/2025 4:08:43 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetArtifactTypesSp]
AS

    -- Automatically generated on 5/25/2024 6:50:56 AM.
    
    SELECT *
    FROM ArtifactTypes WITH (NOLOCK) 

GO
/****** Object:  StoredProcedure [dbo].[GetArtifactTypesSp_CountSp]    Script Date: 1/21/2025 4:08:43 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetArtifactTypesSp_CountSp]
	@Search [nvarchar](255)
AS


	SET NOCOUNT ON

	
	SELECT		COUNT(*) as Total
	FROM		(
				-- Automatically generated on 5/25/2024 6:50:56 AM.
    
    SELECT *
    FROM ArtifactTypes WITH (NOLOCK) 
				) sub
	where		
					[ArtifactTypeID] like '%' + @Search + '%' or
					[ArtifactType] like '%' + @Search + '%' 
		

GO
/****** Object:  StoredProcedure [dbo].[GetArtifactTypesSp_PagingSp]    Script Date: 1/21/2025 4:08:43 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetArtifactTypesSp_PagingSp]
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
					
			
						case when @SortColumn = 'ArtifactTypeID' and @SortAscending = 1 then 
							[ArtifactTypeID]
						end ASC,
						case when @SortColumn = 'ArtifactTypeID' and @SortAscending = 0 then 
							[ArtifactTypeID]
						end DESC,
			
						case when @SortColumn = 'ArtifactType' and @SortAscending = 1 then 
							[ArtifactType]
						end ASC,
						case when @SortColumn = 'ArtifactType' and @SortAscending = 0 then 
							[ArtifactType]
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
					-- Automatically generated on 5/25/2024 6:50:56 AM.
    
    SELECT *
    FROM ArtifactTypes WITH (NOLOCK) 
					) sub
		where		
					[ArtifactTypeID] like '%' + @Search + '%' or
					[ArtifactType] like '%' + @Search + '%' 
	)
			
	SELECT	*
	FROM	SearchTable
	WHERE	RowNumber BETWEEN @FirstRow AND @LastRow
	ORDER BY RowNumber ASC
	OPTION (recompile);
	
	
		

GO
/****** Object:  StoredProcedure [dbo].[GetDataExtractorByNameSp]    Script Date: 1/21/2025 4:08:43 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[GetDataExtractorByNameSp]
	@Name [nvarchar](255)
AS

    -- Automatically generated on 6/12/2024 1:36:54 PM.
    
    SELECT *
    FROM DataExtractors WITH (NOLOCK) 
    WHERE [Name] = @Name
GO
/****** Object:  StoredProcedure [dbo].[GetDataExtractorsByTagIDSp]    Script Date: 1/21/2025 4:08:43 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[GetDataExtractorsByTagIDSp]
	@TagID [int]
AS

    -- Automatically generated on 6/12/2024 2:03:45 PM.
    
    SELECT *
    FROM DataExtractors WITH (NOLOCK) 
    WHERE [TagID] = @TagID

GO
/****** Object:  StoredProcedure [dbo].[GetDataExtractorSp]    Script Date: 1/21/2025 4:08:43 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[GetDataExtractorSp]
	@DataExtractorID [int]
AS

    -- Automatically generated on 6/12/2024 1:36:54 PM.
    
    SELECT *
    FROM DataExtractors WITH (NOLOCK) 
     WHERE DataExtractorID = @DataExtractorID

GO
/****** Object:  StoredProcedure [dbo].[GetDataExtractorsSp]    Script Date: 1/21/2025 4:08:43 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[GetDataExtractorsSp]
AS

    -- Automatically generated on 6/12/2024 1:36:54 PM.
    
    SELECT *
    FROM DataExtractors WITH (NOLOCK) 
GO
/****** Object:  StoredProcedure [dbo].[GetDataExtractorsSp_CountSp]    Script Date: 1/21/2025 4:08:43 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[GetDataExtractorsSp_CountSp]
	@Search [nvarchar](255)
AS


	SET NOCOUNT ON

	
	SELECT		COUNT(*) as Total
	FROM		(
				-- Automatically generated on 6/12/2024 1:36:54 PM.
    
    SELECT *
    FROM DataExtractors WITH (NOLOCK) 
				) sub
	where		
					[DataExtractorID] like '%' + @Search + '%' or
					[Name] like '%' + @Search + '%' or
					[Format] like '%' + @Search + '%' 
		
GO
/****** Object:  StoredProcedure [dbo].[GetDataExtractorsSp_PagingSp]    Script Date: 1/21/2025 4:08:43 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[GetDataExtractorsSp_PagingSp]
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
					
			
						case when @SortColumn = 'DataExtractorID' and @SortAscending = 1 then 
							[DataExtractorID]
						end ASC,
						case when @SortColumn = 'DataExtractorID' and @SortAscending = 0 then 
							[DataExtractorID]
						end DESC,
			
						case when @SortColumn = 'Name' and @SortAscending = 1 then 
							[Name]
						end ASC,
						case when @SortColumn = 'Name' and @SortAscending = 0 then 
							[Name]
						end DESC,
			
						case when @SortColumn = 'Format' and @SortAscending = 1 then 
							[Format]
						end ASC,
						case when @SortColumn = 'Format' and @SortAscending = 0 then 
							[Format]
						end DESC,
			
						case when @SortColumn = 'Version' and @SortAscending = 1 then 
							[Version]
						end ASC,
						case when @SortColumn = 'Version' and @SortAscending = 0 then 
							[Version]
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
			
						case when @SortColumn = 'TagID' and @SortAscending = 1 then 
							[TagID]
						end ASC,
						case when @SortColumn = 'TagID' and @SortAscending = 0 then 
							[TagID]
						end DESC									
					) AS RowNumber,
					*
		FROM		(
					-- Automatically generated on 6/12/2024 1:36:54 PM.
    
    SELECT *
    FROM DataExtractors WITH (NOLOCK) 
					) sub
		where		
					[DataExtractorID] like '%' + @Search + '%' or
					[Name] like '%' + @Search + '%' or
					[Format] like '%' + @Search + '%' 
	)
			
	SELECT	*
	FROM	SearchTable
	WHERE	RowNumber BETWEEN @FirstRow AND @LastRow
	ORDER BY RowNumber ASC
	OPTION (recompile);
	
	
		
GO
/****** Object:  StoredProcedure [dbo].[GetEmbeddingByEmbeddingModelSp]    Script Date: 1/21/2025 4:08:43 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetEmbeddingByEmbeddingModelSp]
	@EmbeddingModel [nvarchar](255)
AS

    -- Automatically generated on 1/20/2024 5:01:21 AM.
    
    SELECT *
    FROM Embeddings WITH (NOLOCK) 
    WHERE [EmbeddingModel] = @EmbeddingModel

GO
/****** Object:  StoredProcedure [dbo].[GetEmbeddingSp]    Script Date: 1/21/2025 4:08:43 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetEmbeddingSp]
	@EmbeddingID [int]
AS

    -- Automatically generated on 1/20/2024 5:01:21 AM.
    
    SELECT *
    FROM Embeddings WITH (NOLOCK) 
     WHERE EmbeddingID = @EmbeddingID

GO
/****** Object:  StoredProcedure [dbo].[GetEmbeddingsSp]    Script Date: 1/21/2025 4:08:43 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetEmbeddingsSp]
AS

    -- Automatically generated on 1/20/2024 5:01:21 AM.
    
    SELECT *
    FROM Embeddings WITH (NOLOCK) 

GO
/****** Object:  StoredProcedure [dbo].[GetEmbeddingsSp_CountSp]    Script Date: 1/21/2025 4:08:43 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetEmbeddingsSp_CountSp]
	@Search [nvarchar](255)
AS


	SET NOCOUNT ON

	
	SELECT		COUNT(*) as Total
	FROM		(
				-- Automatically generated on 1/20/2024 5:01:21 AM.
    
    SELECT *
    FROM Embeddings WITH (NOLOCK) 
				) sub
	where		
					[EmbeddingID] like '%' + @Search + '%' or
					[EmbeddingModel] like '%' + @Search + '%' 
		

GO
/****** Object:  StoredProcedure [dbo].[GetEmbeddingsSp_PagingSp]    Script Date: 1/21/2025 4:08:43 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetEmbeddingsSp_PagingSp]
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
					
			
						case when @SortColumn = 'EmbeddingID' and @SortAscending = 1 then 
							[EmbeddingID]
						end ASC,
						case when @SortColumn = 'EmbeddingID' and @SortAscending = 0 then 
							[EmbeddingID]
						end DESC,
			
						case when @SortColumn = 'EmbeddingModel' and @SortAscending = 1 then 
							[EmbeddingModel]
						end ASC,
						case when @SortColumn = 'EmbeddingModel' and @SortAscending = 0 then 
							[EmbeddingModel]
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
					-- Automatically generated on 1/20/2024 5:01:21 AM.
    
    SELECT *
    FROM Embeddings WITH (NOLOCK) 
					) sub
		where		
					[EmbeddingID] like '%' + @Search + '%' or
					[EmbeddingModel] like '%' + @Search + '%' 
	)
			
	SELECT	*
	FROM	SearchTable
	WHERE	RowNumber BETWEEN @FirstRow AND @LastRow
	ORDER BY RowNumber ASC
	OPTION (recompile);
	
	
		

GO
/****** Object:  StoredProcedure [dbo].[GetFragmentByFragmentKeySp]    Script Date: 1/21/2025 4:08:43 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetFragmentByFragmentKeySp]
	@FragmentKey [nvarchar](255)
AS

    -- Automatically generated on 1/20/2024 5:01:21 AM.
    
    SELECT *
    FROM Fragments WITH (NOLOCK) 
    WHERE [FragmentKey] = @FragmentKey

GO
/****** Object:  StoredProcedure [dbo].[GetFragmentsByFragmentTagTagIDSp]    Script Date: 1/21/2025 4:08:43 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetFragmentsByFragmentTagTagIDSp]
	@TagID [int]
AS

    -- Automatically generated on 5/23/2024 4:33:21 PM.
    
    SELECT t2.*
    FROM FragmentTags t1 WITH (NOLOCK) 
    JOIN Fragments t2 WITH (NOLOCK) 
    ON t1.FragmentID = t2.FragmentID
    WHERE t1.[TagID] = @TagID

GO
/****** Object:  StoredProcedure [dbo].[GetFragmentsByParentFragmentIDSp]    Script Date: 1/21/2025 4:08:43 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetFragmentsByParentFragmentIDSp]
	@ParentFragmentID [int]
AS

    -- Automatically generated on 1/20/2024 5:01:21 AM.
    
    SELECT *
    FROM Fragments WITH (NOLOCK) 
    WHERE [ParentFragmentID] = @ParentFragmentID

GO
/****** Object:  StoredProcedure [dbo].[GetFragmentsByParentFragmentIDSp_CountSp]    Script Date: 1/21/2025 4:08:43 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetFragmentsByParentFragmentIDSp_CountSp]
	@ParentFragmentID [int],
	@Search [nvarchar](255)
AS


	SET NOCOUNT ON

	
	SELECT		COUNT(*) as Total
	FROM		(
				-- Automatically generated on 1/20/2024 5:01:21 AM.
    
    SELECT *
    FROM Fragments WITH (NOLOCK) 
    WHERE [ParentFragmentID] = @ParentFragmentID
				) sub
	where		
					[FragmentID] like '%' + @Search + '%' or
					[FragmentKey] like '%' + @Search + '%' 
		

GO
/****** Object:  StoredProcedure [dbo].[GetFragmentsByParentFragmentIDSp_PagingSp]    Script Date: 1/21/2025 4:08:43 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetFragmentsByParentFragmentIDSp_PagingSp]
	@ParentFragmentID [int],
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
					
			
						case when @SortColumn = 'FragmentID' and @SortAscending = 1 then 
							[FragmentID]
						end ASC,
						case when @SortColumn = 'FragmentID' and @SortAscending = 0 then 
							[FragmentID]
						end DESC,
			
						case when @SortColumn = 'ParentFragmentID' and @SortAscending = 1 then 
							[ParentFragmentID]
						end ASC,
						case when @SortColumn = 'ParentFragmentID' and @SortAscending = 0 then 
							[ParentFragmentID]
						end DESC,
			
						case when @SortColumn = 'FragmentKey' and @SortAscending = 1 then 
							[FragmentKey]
						end ASC,
						case when @SortColumn = 'FragmentKey' and @SortAscending = 0 then 
							[FragmentKey]
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
					-- Automatically generated on 1/20/2024 5:01:21 AM.
    
    SELECT *
    FROM Fragments WITH (NOLOCK) 
    WHERE [ParentFragmentID] = @ParentFragmentID
					) sub
		where		
					[FragmentID] like '%' + @Search + '%' or
					[FragmentKey] like '%' + @Search + '%' 
	)
			
	SELECT	*
	FROM	SearchTable
	WHERE	RowNumber BETWEEN @FirstRow AND @LastRow
	ORDER BY RowNumber ASC
	OPTION (recompile);
	
	
		

GO
/****** Object:  StoredProcedure [dbo].[GetFragmentSp]    Script Date: 1/21/2025 4:08:43 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetFragmentSp]
	@FragmentID [int]
AS

    -- Automatically generated on 1/20/2024 5:01:21 AM.
    
    SELECT *
    FROM Fragments WITH (NOLOCK) 
     WHERE FragmentID = @FragmentID

GO
/****** Object:  StoredProcedure [dbo].[GetFragmentsSp]    Script Date: 1/21/2025 4:08:43 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetFragmentsSp]
AS

    -- Automatically generated on 1/20/2024 5:01:21 AM.
    
    SELECT *
    FROM Fragments WITH (NOLOCK) 

GO
/****** Object:  StoredProcedure [dbo].[GetFragmentsSp_CountSp]    Script Date: 1/21/2025 4:08:43 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetFragmentsSp_CountSp]
	@Search [nvarchar](255)
AS


	SET NOCOUNT ON

	
	SELECT		COUNT(*) as Total
	FROM		(
				-- Automatically generated on 1/20/2024 5:01:21 AM.
    
    SELECT *
    FROM Fragments WITH (NOLOCK) 
				) sub
	where		
					[FragmentID] like '%' + @Search + '%' or
					[FragmentKey] like '%' + @Search + '%' 
		

GO
/****** Object:  StoredProcedure [dbo].[GetFragmentsSp_PagingSp]    Script Date: 1/21/2025 4:08:43 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetFragmentsSp_PagingSp]
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
					
			
						case when @SortColumn = 'FragmentID' and @SortAscending = 1 then 
							[FragmentID]
						end ASC,
						case when @SortColumn = 'FragmentID' and @SortAscending = 0 then 
							[FragmentID]
						end DESC,
			
						case when @SortColumn = 'ParentFragmentID' and @SortAscending = 1 then 
							[ParentFragmentID]
						end ASC,
						case when @SortColumn = 'ParentFragmentID' and @SortAscending = 0 then 
							[ParentFragmentID]
						end DESC,
			
						case when @SortColumn = 'FragmentKey' and @SortAscending = 1 then 
							[FragmentKey]
						end ASC,
						case when @SortColumn = 'FragmentKey' and @SortAscending = 0 then 
							[FragmentKey]
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
					-- Automatically generated on 1/20/2024 5:01:21 AM.
    
    SELECT *
    FROM Fragments WITH (NOLOCK) 
					) sub
		where		
					[FragmentID] like '%' + @Search + '%' or
					[FragmentKey] like '%' + @Search + '%' 
	)
			
	SELECT	*
	FROM	SearchTable
	WHERE	RowNumber BETWEEN @FirstRow AND @LastRow
	ORDER BY RowNumber ASC
	OPTION (recompile);
	
	
		

GO
/****** Object:  StoredProcedure [dbo].[GetFragmentTagsByFragmentIDSp]    Script Date: 1/21/2025 4:08:43 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetFragmentTagsByFragmentIDSp]
	@FragmentID [int]
AS

    -- Automatically generated on 5/23/2024 4:33:21 PM.
    
    SELECT *
    FROM FragmentTags WITH (NOLOCK) 
    WHERE [FragmentID] = @FragmentID

GO
/****** Object:  StoredProcedure [dbo].[GetFragmentTagsByFragmentIDSp_CountSp]    Script Date: 1/21/2025 4:08:43 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetFragmentTagsByFragmentIDSp_CountSp]
	@FragmentID [int],
	@Search [nvarchar](255)
AS


	SET NOCOUNT ON

	
	SELECT		COUNT(*) as Total
	FROM		(
				-- Automatically generated on 5/23/2024 4:33:21 PM.
    
    SELECT *
    FROM FragmentTags WITH (NOLOCK) 
    WHERE [FragmentID] = @FragmentID
				) sub
	where		
					[FragmentTagID] like '%' + @Search + '%' 
		

GO
/****** Object:  StoredProcedure [dbo].[GetFragmentTagsByFragmentIDSp_PagingSp]    Script Date: 1/21/2025 4:08:43 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetFragmentTagsByFragmentIDSp_PagingSp]
	@FragmentID [int],
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
					
			
						case when @SortColumn = 'FragmentTagID' and @SortAscending = 1 then 
							[FragmentTagID]
						end ASC,
						case when @SortColumn = 'FragmentTagID' and @SortAscending = 0 then 
							[FragmentTagID]
						end DESC,
			
						case when @SortColumn = 'TagID' and @SortAscending = 1 then 
							[TagID]
						end ASC,
						case when @SortColumn = 'TagID' and @SortAscending = 0 then 
							[TagID]
						end DESC,
			
						case when @SortColumn = 'FragmentID' and @SortAscending = 1 then 
							[FragmentID]
						end ASC,
						case when @SortColumn = 'FragmentID' and @SortAscending = 0 then 
							[FragmentID]
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
					-- Automatically generated on 5/23/2024 4:33:21 PM.
    
    SELECT *
    FROM FragmentTags WITH (NOLOCK) 
    WHERE [FragmentID] = @FragmentID
					) sub
		where		
					[FragmentTagID] like '%' + @Search + '%' 
	)
			
	SELECT	*
	FROM	SearchTable
	WHERE	RowNumber BETWEEN @FirstRow AND @LastRow
	ORDER BY RowNumber ASC
	OPTION (recompile);
	
	
		

GO
/****** Object:  StoredProcedure [dbo].[GetFragmentTagsByFragmentIDTagIDSp]    Script Date: 1/21/2025 4:08:43 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetFragmentTagsByFragmentIDTagIDSp]
	@FragmentID [int],
	@TagID [int]
AS

    -- Automatically generated on 5/23/2024 4:33:21 PM.
    
    SELECT *
    FROM FragmentTags WITH (NOLOCK) 
    WHERE [FragmentID] = @FragmentID AND [TagID] = @TagID

GO
/****** Object:  StoredProcedure [dbo].[GetFragmentTagsByTagIDSp]    Script Date: 1/21/2025 4:08:43 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetFragmentTagsByTagIDSp]
	@TagID [int]
AS

    -- Automatically generated on 5/23/2024 4:33:21 PM.
    
    SELECT *
    FROM FragmentTags WITH (NOLOCK) 
    WHERE [TagID] = @TagID

GO
/****** Object:  StoredProcedure [dbo].[GetFragmentTagsByTagIDSp_CountSp]    Script Date: 1/21/2025 4:08:43 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetFragmentTagsByTagIDSp_CountSp]
	@TagID [int],
	@Search [nvarchar](255)
AS


	SET NOCOUNT ON

	
	SELECT		COUNT(*) as Total
	FROM		(
				-- Automatically generated on 5/23/2024 4:33:21 PM.
    
    SELECT *
    FROM FragmentTags WITH (NOLOCK) 
    WHERE [TagID] = @TagID
				) sub
	where		
					[FragmentTagID] like '%' + @Search + '%' 
		

GO
/****** Object:  StoredProcedure [dbo].[GetFragmentTagsByTagIDSp_PagingSp]    Script Date: 1/21/2025 4:08:43 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetFragmentTagsByTagIDSp_PagingSp]
	@TagID [int],
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
					
			
						case when @SortColumn = 'FragmentTagID' and @SortAscending = 1 then 
							[FragmentTagID]
						end ASC,
						case when @SortColumn = 'FragmentTagID' and @SortAscending = 0 then 
							[FragmentTagID]
						end DESC,
			
						case when @SortColumn = 'TagID' and @SortAscending = 1 then 
							[TagID]
						end ASC,
						case when @SortColumn = 'TagID' and @SortAscending = 0 then 
							[TagID]
						end DESC,
			
						case when @SortColumn = 'FragmentID' and @SortAscending = 1 then 
							[FragmentID]
						end ASC,
						case when @SortColumn = 'FragmentID' and @SortAscending = 0 then 
							[FragmentID]
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
					-- Automatically generated on 5/23/2024 4:33:21 PM.
    
    SELECT *
    FROM FragmentTags WITH (NOLOCK) 
    WHERE [TagID] = @TagID
					) sub
		where		
					[FragmentTagID] like '%' + @Search + '%' 
	)
			
	SELECT	*
	FROM	SearchTable
	WHERE	RowNumber BETWEEN @FirstRow AND @LastRow
	ORDER BY RowNumber ASC
	OPTION (recompile);
	
	
		

GO
/****** Object:  StoredProcedure [dbo].[GetFragmentTagSp]    Script Date: 1/21/2025 4:08:43 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetFragmentTagSp]
	@FragmentTagID [int]
AS

    -- Automatically generated on 5/23/2024 4:33:21 PM.
    
    SELECT *
    FROM FragmentTags WITH (NOLOCK) 
     WHERE FragmentTagID = @FragmentTagID

GO
/****** Object:  StoredProcedure [dbo].[GetFragmentTagsSp]    Script Date: 1/21/2025 4:08:43 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetFragmentTagsSp]
AS

    -- Automatically generated on 5/23/2024 4:33:21 PM.
    
    SELECT *
    FROM FragmentTags WITH (NOLOCK) 

GO
/****** Object:  StoredProcedure [dbo].[GetTagByTagNameSp]    Script Date: 1/21/2025 4:08:43 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetTagByTagNameSp]
	@TagName [nvarchar](255)
AS

    -- Automatically generated on 5/23/2024 4:33:21 PM.
    
    SELECT *
    FROM Tags WITH (NOLOCK) 
    WHERE [TagName] = @TagName

GO
/****** Object:  StoredProcedure [dbo].[GetTagsByFragmentTagFragmentIDSp]    Script Date: 1/21/2025 4:08:43 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetTagsByFragmentTagFragmentIDSp]
	@FragmentID [int]
AS

    -- Automatically generated on 5/23/2024 4:33:21 PM.
    
    SELECT t2.*
    FROM FragmentTags t1 WITH (NOLOCK) 
    JOIN Tags t2 WITH (NOLOCK) 
    ON t1.TagID = t2.TagID
    WHERE t1.[FragmentID] = @FragmentID

GO
/****** Object:  StoredProcedure [dbo].[GetTagSp]    Script Date: 1/21/2025 4:08:43 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetTagSp]
	@TagID [int]
AS

    -- Automatically generated on 5/23/2024 4:33:21 PM.
    
    SELECT *
    FROM Tags WITH (NOLOCK) 
     WHERE TagID = @TagID

GO
/****** Object:  StoredProcedure [dbo].[GetTagsSp]    Script Date: 1/21/2025 4:08:43 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetTagsSp]
AS

    -- Automatically generated on 5/23/2024 4:33:21 PM.
    
    SELECT *
    FROM Tags WITH (NOLOCK) 

GO
/****** Object:  StoredProcedure [dbo].[GetTagsSp_CountSp]    Script Date: 1/21/2025 4:08:43 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetTagsSp_CountSp]
	@Search [nvarchar](255)
AS


	SET NOCOUNT ON

	
	SELECT		COUNT(*) as Total
	FROM		(
				-- Automatically generated on 5/23/2024 4:33:21 PM.
    
    SELECT *
    FROM Tags WITH (NOLOCK) 
				) sub
	where		
					[TagID] like '%' + @Search + '%' or
					[TagName] like '%' + @Search + '%' or
					[TagDescription] like '%' + @Search + '%' 
		

GO
/****** Object:  StoredProcedure [dbo].[GetTagsSp_PagingSp]    Script Date: 1/21/2025 4:08:43 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetTagsSp_PagingSp]
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
					
			
						case when @SortColumn = 'TagID' and @SortAscending = 1 then 
							[TagID]
						end ASC,
						case when @SortColumn = 'TagID' and @SortAscending = 0 then 
							[TagID]
						end DESC,
			
						case when @SortColumn = 'TagName' and @SortAscending = 1 then 
							[TagName]
						end ASC,
						case when @SortColumn = 'TagName' and @SortAscending = 0 then 
							[TagName]
						end DESC,
			
						case when @SortColumn = 'TagDescription' and @SortAscending = 1 then 
							[TagDescription]
						end ASC,
						case when @SortColumn = 'TagDescription' and @SortAscending = 0 then 
							[TagDescription]
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
					-- Automatically generated on 5/23/2024 4:33:21 PM.
    
    SELECT *
    FROM Tags WITH (NOLOCK) 
					) sub
		where		
					[TagID] like '%' + @Search + '%' or
					[TagName] like '%' + @Search + '%' or
					[TagDescription] like '%' + @Search + '%' 
	)
			
	SELECT	*
	FROM	SearchTable
	WHERE	RowNumber BETWEEN @FirstRow AND @LastRow
	ORDER BY RowNumber ASC
	OPTION (recompile);
	
	
		

GO
/****** Object:  StoredProcedure [dbo].[GetVectorsByEmbeddingIDSp]    Script Date: 1/21/2025 4:08:43 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetVectorsByEmbeddingIDSp]
	@EmbeddingID [int]
AS

    -- Automatically generated on 1/20/2024 5:01:21 AM.
    
    SELECT *
    FROM Vectors WITH (NOLOCK) 
    WHERE [EmbeddingID] = @EmbeddingID

GO
/****** Object:  StoredProcedure [dbo].[GetVectorsByEmbeddingIDSp_CountSp]    Script Date: 1/21/2025 4:08:43 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetVectorsByEmbeddingIDSp_CountSp]
	@EmbeddingID [int],
	@Search [nvarchar](255)
AS


	SET NOCOUNT ON

	
	SELECT		COUNT(*) as Total
	FROM		(
				-- Automatically generated on 1/20/2024 5:01:21 AM.
    
    SELECT *
    FROM Vectors WITH (NOLOCK) 
    WHERE [EmbeddingID] = @EmbeddingID
				) sub
	where		
					[VectorID] like '%' + @Search + '%' 
		

GO
/****** Object:  StoredProcedure [dbo].[GetVectorsByEmbeddingIDSp_PagingSp]    Script Date: 1/21/2025 4:08:43 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetVectorsByEmbeddingIDSp_PagingSp]
	@EmbeddingID [int],
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
					
			
						case when @SortColumn = 'VectorID' and @SortAscending = 1 then 
							[VectorID]
						end ASC,
						case when @SortColumn = 'VectorID' and @SortAscending = 0 then 
							[VectorID]
						end DESC,
			
						case when @SortColumn = 'EmbeddingID' and @SortAscending = 1 then 
							[EmbeddingID]
						end ASC,
						case when @SortColumn = 'EmbeddingID' and @SortAscending = 0 then 
							[EmbeddingID]
						end DESC,
			
						case when @SortColumn = 'FragmentID' and @SortAscending = 1 then 
							[FragmentID]
						end ASC,
						case when @SortColumn = 'FragmentID' and @SortAscending = 0 then 
							[FragmentID]
						end DESC,
			
						case when @SortColumn = 'Dimension' and @SortAscending = 1 then 
							[Dimension]
						end ASC,
						case when @SortColumn = 'Dimension' and @SortAscending = 0 then 
							[Dimension]
						end DESC,
			
						case when @SortColumn = 'Value' and @SortAscending = 1 then 
							[Value]
						end ASC,
						case when @SortColumn = 'Value' and @SortAscending = 0 then 
							[Value]
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
					-- Automatically generated on 1/20/2024 5:01:21 AM.
    
    SELECT *
    FROM Vectors WITH (NOLOCK) 
    WHERE [EmbeddingID] = @EmbeddingID
					) sub
		where		
					[VectorID] like '%' + @Search + '%' 
	)
			
	SELECT	*
	FROM	SearchTable
	WHERE	RowNumber BETWEEN @FirstRow AND @LastRow
	ORDER BY RowNumber ASC
	OPTION (recompile);
	
	
		

GO
/****** Object:  StoredProcedure [dbo].[GetVectorsByFragmentIDSp]    Script Date: 1/21/2025 4:08:43 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetVectorsByFragmentIDSp]
	@FragmentID [int]
AS

    -- Automatically generated on 1/20/2024 5:01:21 AM.
    
    SELECT *
    FROM Vectors WITH (NOLOCK) 
    WHERE [FragmentID] = @FragmentID

GO
/****** Object:  StoredProcedure [dbo].[GetVectorsByFragmentIDSp_CountSp]    Script Date: 1/21/2025 4:08:43 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetVectorsByFragmentIDSp_CountSp]
	@FragmentID [int],
	@Search [nvarchar](255)
AS


	SET NOCOUNT ON

	
	SELECT		COUNT(*) as Total
	FROM		(
				-- Automatically generated on 1/20/2024 5:01:21 AM.
    
    SELECT *
    FROM Vectors WITH (NOLOCK) 
    WHERE [FragmentID] = @FragmentID
				) sub
	where		
					[VectorID] like '%' + @Search + '%' 
		

GO
/****** Object:  StoredProcedure [dbo].[GetVectorsByFragmentIDSp_PagingSp]    Script Date: 1/21/2025 4:08:43 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetVectorsByFragmentIDSp_PagingSp]
	@FragmentID [int],
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
					
			
						case when @SortColumn = 'VectorID' and @SortAscending = 1 then 
							[VectorID]
						end ASC,
						case when @SortColumn = 'VectorID' and @SortAscending = 0 then 
							[VectorID]
						end DESC,
			
						case when @SortColumn = 'EmbeddingID' and @SortAscending = 1 then 
							[EmbeddingID]
						end ASC,
						case when @SortColumn = 'EmbeddingID' and @SortAscending = 0 then 
							[EmbeddingID]
						end DESC,
			
						case when @SortColumn = 'FragmentID' and @SortAscending = 1 then 
							[FragmentID]
						end ASC,
						case when @SortColumn = 'FragmentID' and @SortAscending = 0 then 
							[FragmentID]
						end DESC,
			
						case when @SortColumn = 'Dimension' and @SortAscending = 1 then 
							[Dimension]
						end ASC,
						case when @SortColumn = 'Dimension' and @SortAscending = 0 then 
							[Dimension]
						end DESC,
			
						case when @SortColumn = 'Value' and @SortAscending = 1 then 
							[Value]
						end ASC,
						case when @SortColumn = 'Value' and @SortAscending = 0 then 
							[Value]
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
					-- Automatically generated on 1/20/2024 5:01:21 AM.
    
    SELECT *
    FROM Vectors WITH (NOLOCK) 
    WHERE [FragmentID] = @FragmentID
					) sub
		where		
					[VectorID] like '%' + @Search + '%' 
	)
			
	SELECT	*
	FROM	SearchTable
	WHERE	RowNumber BETWEEN @FirstRow AND @LastRow
	ORDER BY RowNumber ASC
	OPTION (recompile);
	
	
		

GO
/****** Object:  StoredProcedure [dbo].[GetVectorSp]    Script Date: 1/21/2025 4:08:43 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetVectorSp]
	@VectorID [int]
AS

    -- Automatically generated on 1/20/2024 5:01:21 AM.
    
    SELECT *
    FROM Vectors WITH (NOLOCK) 
     WHERE VectorID = @VectorID

GO
/****** Object:  StoredProcedure [dbo].[GetVectorsSp]    Script Date: 1/21/2025 4:08:43 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetVectorsSp]
AS

    -- Automatically generated on 1/20/2024 5:01:21 AM.
    
    SELECT *
    FROM Vectors WITH (NOLOCK) 

GO
/****** Object:  StoredProcedure [dbo].[InsertArtifactSp]    Script Date: 1/21/2025 4:08:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertArtifactSp]
	@ArtifactTypeID [int],
	@Name [nvarchar](255),
	@File [nvarchar](255),
	@Summary [nvarchar](max),
	@FragmentID [int],
	@Data [nvarchar](max)
AS

    -- Automatically generated on 5/25/2024 6:50:56 AM.
    
    INSERT INTO Artifacts
    (
            [ArtifactTypeID], 
            [Name], 
            [File], 
            [Summary], 
            [FragmentID], 
            [Data], 
            [DateCreated], 
            [LastUpdated]
    )
    VALUES
    (
            @ArtifactTypeID, 
            @Name, 
            @File, 
            @Summary, 
            @FragmentID, 
            @Data, 
            getdate(), 
            getdate()
    )
    SELECT scope_identity() as ArtifactID

GO
/****** Object:  StoredProcedure [dbo].[InsertArtifactTypeSp]    Script Date: 1/21/2025 4:08:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertArtifactTypeSp]
	@ArtifactType [nvarchar](255),
	@Data [nvarchar](max)
AS

    -- Automatically generated on 5/25/2024 6:50:56 AM.
    
    INSERT INTO ArtifactTypes
    (
            [ArtifactType], 
            [Data], 
            [DateCreated], 
            [LastUpdated]
    )
    VALUES
    (
            @ArtifactType, 
            @Data, 
            getdate(), 
            getdate()
    )
    SELECT scope_identity() as ArtifactTypeID

GO
/****** Object:  StoredProcedure [dbo].[InsertDataExtractorSp]    Script Date: 1/21/2025 4:08:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[InsertDataExtractorSp]
	@Name [nvarchar](255),
	@Format [nvarchar](255),
	@Prompt [nvarchar](max),
	@Version [int],
	@Data [nvarchar](max),
	@TagID [int]
AS

    -- Automatically generated on 6/12/2024 1:36:54 PM.
    
    INSERT INTO DataExtractors
    (
            [Name], 
            [Format], 
            [Prompt], 
            [Version], 
            [Data], 
            [DateCreated], 
            [LastUpdated], 
            [TagID]
    )
    VALUES
    (
            @Name, 
            @Format, 
            @Prompt, 
            @Version, 
            @Data, 
            getdate(), 
            getdate(), 
            @TagID
    )
    SELECT scope_identity() as DataExtractorID

GO
/****** Object:  StoredProcedure [dbo].[InsertEmbeddingSp]    Script Date: 1/21/2025 4:08:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertEmbeddingSp]
	@EmbeddingModel [nvarchar](255),
	@Data [nvarchar](max)
AS

    -- Automatically generated on 1/20/2024 5:01:21 AM.
    
    INSERT INTO Embeddings
    (
            [EmbeddingModel], 
            [Data], 
            [DateCreated], 
            [LastUpdated]
    )
    VALUES
    (
            @EmbeddingModel, 
            @Data, 
            getdate(), 
            getdate()
    )
    SELECT scope_identity() as EmbeddingID

GO
/****** Object:  StoredProcedure [dbo].[InsertFragmentSp]    Script Date: 1/21/2025 4:08:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertFragmentSp]
	@Fragment [nvarchar](max),
	@ParentFragmentID [int],
	@FragmentKey [nvarchar](255),
	@Data [nvarchar](max)
AS

    -- Automatically generated on 1/20/2024 5:01:21 AM.
    
    INSERT INTO Fragments
    (
            [Fragment], 
            [ParentFragmentID], 
            [FragmentKey], 
            [Data], 
            [DateCreated], 
            [LastUpdated]
    )
    VALUES
    (
            @Fragment, 
            @ParentFragmentID, 
            @FragmentKey, 
            @Data, 
            getdate(), 
            getdate()
    )
    SELECT scope_identity() as FragmentID

GO
/****** Object:  StoredProcedure [dbo].[InsertFragmentTagSp]    Script Date: 1/21/2025 4:08:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertFragmentTagSp]
	@TagID [int],
	@FragmentID [int],
	@Data [nvarchar](max)
AS

    -- Automatically generated on 5/23/2024 4:33:21 PM.
    
    INSERT INTO FragmentTags
    (
            [TagID], 
            [FragmentID], 
            [Data], 
            [DateCreated], 
            [LastUpdated]
    )
    VALUES
    (
            @TagID, 
            @FragmentID, 
            @Data, 
            getdate(), 
            getdate()
    )
    SELECT scope_identity() as FragmentTagID

GO
/****** Object:  StoredProcedure [dbo].[InsertTagSp]    Script Date: 1/21/2025 4:08:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertTagSp]
	@TagName [nvarchar](255),
	@TagDescription [nvarchar](255),
	@Data [nvarchar](max)
AS

    -- Automatically generated on 5/23/2024 4:33:21 PM.
    
    INSERT INTO Tags
    (
            [TagName], 
            [TagDescription], 
            [Data], 
            [DateCreated], 
            [LastUpdated]
    )
    VALUES
    (
            @TagName, 
            @TagDescription, 
            @Data, 
            getdate(), 
            getdate()
    )
    SELECT scope_identity() as TagID

GO
/****** Object:  StoredProcedure [dbo].[InsertVectorSp]    Script Date: 1/21/2025 4:08:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertVectorSp]
	@EmbeddingID [int],
	@FragmentID [int],
	@Dimension [int],
	@Value [float](53),
	@Data [nvarchar](max)
AS

    -- Automatically generated on 1/20/2024 5:01:21 AM.
    
    INSERT INTO Vectors
    (
            [EmbeddingID], 
            [FragmentID], 
            [Dimension], 
            [Value], 
            [Data], 
            [DateCreated], 
            [LastUpdated]
    )
    VALUES
    (
            @EmbeddingID, 
            @FragmentID, 
            @Dimension, 
            @Value, 
            @Data, 
            getdate(), 
            getdate()
    )
    SELECT scope_identity() as VectorID

GO
/****** Object:  StoredProcedure [dbo].[RemoveArtifactSp]    Script Date: 1/21/2025 4:08:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RemoveArtifactSp]
	@ArtifactID [int]
AS

    -- Automatically generated on 5/25/2024 6:50:56 AM.
    
    DELETE FROM Artifacts WHERE ArtifactID = @ArtifactID

GO
/****** Object:  StoredProcedure [dbo].[RemoveArtifactTypeSp]    Script Date: 1/21/2025 4:08:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RemoveArtifactTypeSp]
	@ArtifactTypeID [int]
AS

    -- Automatically generated on 5/25/2024 6:50:56 AM.
    
    DELETE FROM ArtifactTypes WHERE ArtifactTypeID = @ArtifactTypeID

GO
/****** Object:  StoredProcedure [dbo].[RemoveDataExtractorSp]    Script Date: 1/21/2025 4:08:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[RemoveDataExtractorSp]
	@DataExtractorID [int]
AS

    -- Automatically generated on 6/12/2024 1:36:54 PM.
    
    DELETE FROM DataExtractors WHERE DataExtractorID = @DataExtractorID

GO
/****** Object:  StoredProcedure [dbo].[RemoveEmbeddingSp]    Script Date: 1/21/2025 4:08:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RemoveEmbeddingSp]
	@EmbeddingID [int]
AS

    -- Automatically generated on 1/20/2024 5:01:21 AM.
    
    DELETE FROM Embeddings WHERE EmbeddingID = @EmbeddingID

GO
/****** Object:  StoredProcedure [dbo].[RemoveFragmentSp]    Script Date: 1/21/2025 4:08:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RemoveFragmentSp]
	@FragmentID [int]
AS

    -- Automatically generated on 1/20/2024 5:01:21 AM.
    
    DELETE FROM Fragments WHERE FragmentID = @FragmentID

GO
/****** Object:  StoredProcedure [dbo].[RemoveFragmentTagSp]    Script Date: 1/21/2025 4:08:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RemoveFragmentTagSp]
	@FragmentTagID [int]
AS

    -- Automatically generated on 5/23/2024 4:33:21 PM.
    
    DELETE FROM FragmentTags WHERE FragmentTagID = @FragmentTagID

GO
/****** Object:  StoredProcedure [dbo].[RemoveTagSp]    Script Date: 1/21/2025 4:08:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RemoveTagSp]
	@TagID [int]
AS

    -- Automatically generated on 5/23/2024 4:33:21 PM.
    
    DELETE FROM Tags WHERE TagID = @TagID

GO
/****** Object:  StoredProcedure [dbo].[RemoveVectorSp]    Script Date: 1/21/2025 4:08:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RemoveVectorSp]
	@VectorID [int]
AS

    -- Automatically generated on 1/20/2024 5:01:21 AM.
    
    DELETE FROM Vectors WHERE VectorID = @VectorID

GO
/****** Object:  StoredProcedure [dbo].[UpdateArtifactDataSp]    Script Date: 1/21/2025 4:08:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UpdateArtifactDataSp] (
	@ArtifactID int,
	@Data nvarchar(max)
)
AS

    UPDATE Artifacts SET Data = @Data ,
    LastUpdated = getdate()
    WHERE ArtifactID = @ArtifactID	


GO
/****** Object:  StoredProcedure [dbo].[UpdateArtifactSp]    Script Date: 1/21/2025 4:08:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateArtifactSp]
	@ArtifactID [int],
	@ArtifactTypeID [int],
	@Name [nvarchar](255),
	@File [nvarchar](255),
	@Summary [nvarchar](max),
	@FragmentID [int],
	@Data [nvarchar](max)
AS

    -- Automatically generated on 5/25/2024 6:50:56 AM.
    
    UPDATE Artifacts SET 
            [ArtifactTypeID] = @ArtifactTypeID, 
            [Name] = @Name, 
            [File] = @File, 
            [Summary] = @Summary, 
            [FragmentID] = @FragmentID, 
            [Data] = @Data, 
            [LastUpdated] = getdate()
    WHERE ArtifactID = @ArtifactID

GO
/****** Object:  StoredProcedure [dbo].[UpdateArtifactTypeDataSp]    Script Date: 1/21/2025 4:08:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UpdateArtifactTypeDataSp] (
	@ArtifactTypeID int,
	@Data nvarchar(max)
)
AS

    UPDATE ArtifactTypes SET Data = @Data ,
    LastUpdated = getdate()
    WHERE ArtifactTypeID = @ArtifactTypeID	


GO
/****** Object:  StoredProcedure [dbo].[UpdateArtifactTypeSp]    Script Date: 1/21/2025 4:08:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateArtifactTypeSp]
	@ArtifactTypeID [int],
	@ArtifactType [nvarchar](255),
	@Data [nvarchar](max)
AS

    -- Automatically generated on 5/25/2024 6:50:56 AM.
    
    UPDATE ArtifactTypes SET 
            [ArtifactType] = @ArtifactType, 
            [Data] = @Data, 
            [LastUpdated] = getdate()
    WHERE ArtifactTypeID = @ArtifactTypeID

GO
/****** Object:  StoredProcedure [dbo].[UpdateDataExtractorDataSp]    Script Date: 1/21/2025 4:08:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[UpdateDataExtractorDataSp] (
	@DataExtractorID int,
	@Data nvarchar(max)
)
AS

    UPDATE DataExtractors SET Data = @Data ,
    LastUpdated = getdate()
    WHERE DataExtractorID = @DataExtractorID	


GO
/****** Object:  StoredProcedure [dbo].[UpdateDataExtractorSp]    Script Date: 1/21/2025 4:08:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UpdateDataExtractorSp]
	@DataExtractorID [int],
	@Name [nvarchar](255),
	@Format [nvarchar](255),
	@Prompt [nvarchar](max),
	@Version [int],
	@Data [nvarchar](max),
	@TagID [int]
AS

    -- Automatically generated on 6/12/2024 1:36:54 PM.
    
    UPDATE DataExtractors SET 
            [Name] = @Name, 
            [Format] = @Format, 
            [Prompt] = @Prompt, 
            [Version] = @Version, 
            [Data] = @Data, 
            [LastUpdated] = getdate(), 
            [TagID] = @TagID
    WHERE DataExtractorID = @DataExtractorID

GO
/****** Object:  StoredProcedure [dbo].[UpdateEmbeddingDataSp]    Script Date: 1/21/2025 4:08:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UpdateEmbeddingDataSp] (
	@EmbeddingID int,
	@Data nvarchar(max)
)
AS

    UPDATE Embeddings SET Data = @Data ,
    LastUpdated = getdate()
    WHERE EmbeddingID = @EmbeddingID	


GO
/****** Object:  StoredProcedure [dbo].[UpdateEmbeddingSp]    Script Date: 1/21/2025 4:08:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateEmbeddingSp]
	@EmbeddingID [int],
	@EmbeddingModel [nvarchar](255),
	@Data [nvarchar](max)
AS

    -- Automatically generated on 1/20/2024 5:01:21 AM.
    
    UPDATE Embeddings SET 
            [EmbeddingModel] = @EmbeddingModel, 
            [Data] = @Data, 
            [LastUpdated] = getdate()
    WHERE EmbeddingID = @EmbeddingID

GO
/****** Object:  StoredProcedure [dbo].[UpdateFragmentDataSp]    Script Date: 1/21/2025 4:08:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UpdateFragmentDataSp] (
	@FragmentID int,
	@Data nvarchar(max)
)
AS

    UPDATE Fragments SET Data = @Data ,
    LastUpdated = getdate()
    WHERE FragmentID = @FragmentID	


GO
/****** Object:  StoredProcedure [dbo].[UpdateFragmentSp]    Script Date: 1/21/2025 4:08:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateFragmentSp]
	@FragmentID [int],
	@Fragment [nvarchar](max),
	@ParentFragmentID [int],
	@FragmentKey [nvarchar](255),
	@Data [nvarchar](max)
AS

    -- Automatically generated on 1/20/2024 5:01:21 AM.
    
    UPDATE Fragments SET 
            [Fragment] = @Fragment, 
            [ParentFragmentID] = @ParentFragmentID, 
            [FragmentKey] = @FragmentKey, 
            [Data] = @Data, 
            [LastUpdated] = getdate()
    WHERE FragmentID = @FragmentID

GO
/****** Object:  StoredProcedure [dbo].[UpdateFragmentTagDataSp]    Script Date: 1/21/2025 4:08:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UpdateFragmentTagDataSp] (
	@FragmentTagID int,
	@Data nvarchar(max)
)
AS

    UPDATE FragmentTags SET Data = @Data ,
    LastUpdated = getdate()
    WHERE FragmentTagID = @FragmentTagID	


GO
/****** Object:  StoredProcedure [dbo].[UpdateFragmentTagSp]    Script Date: 1/21/2025 4:08:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateFragmentTagSp]
	@FragmentTagID [int],
	@TagID [int],
	@FragmentID [int],
	@Data [nvarchar](max)
AS

    -- Automatically generated on 5/23/2024 4:33:21 PM.
    
    UPDATE FragmentTags SET 
            [TagID] = @TagID, 
            [FragmentID] = @FragmentID, 
            [Data] = @Data, 
            [LastUpdated] = getdate()
    WHERE FragmentTagID = @FragmentTagID

GO
/****** Object:  StoredProcedure [dbo].[UpdateTagDataSp]    Script Date: 1/21/2025 4:08:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UpdateTagDataSp] (
	@TagID int,
	@Data nvarchar(max)
)
AS

    UPDATE Tags SET Data = @Data ,
    LastUpdated = getdate()
    WHERE TagID = @TagID	


GO
/****** Object:  StoredProcedure [dbo].[UpdateTagSp]    Script Date: 1/21/2025 4:08:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateTagSp]
	@TagID [int],
	@TagName [nvarchar](255),
	@TagDescription [nvarchar](255),
	@Data [nvarchar](max)
AS

    -- Automatically generated on 5/23/2024 4:33:21 PM.
    
    UPDATE Tags SET 
            [TagName] = @TagName, 
            [TagDescription] = @TagDescription, 
            [Data] = @Data, 
            [LastUpdated] = getdate()
    WHERE TagID = @TagID

GO
/****** Object:  StoredProcedure [dbo].[UpdateVectorDataSp]    Script Date: 1/21/2025 4:08:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UpdateVectorDataSp] (
	@VectorID int,
	@Data nvarchar(max)
)
AS

    UPDATE Vectors SET Data = @Data ,
    LastUpdated = getdate()
    WHERE VectorID = @VectorID	


GO
/****** Object:  StoredProcedure [dbo].[UpdateVectorSp]    Script Date: 1/21/2025 4:08:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateVectorSp]
	@VectorID [int],
	@EmbeddingID [int],
	@FragmentID [int],
	@Dimension [int],
	@Value [float](53),
	@Data [nvarchar](max)
AS

    -- Automatically generated on 1/20/2024 5:01:21 AM.
    
    UPDATE Vectors SET 
            [EmbeddingID] = @EmbeddingID, 
            [FragmentID] = @FragmentID, 
            [Dimension] = @Dimension, 
            [Value] = @Value, 
            [Data] = @Data, 
            [LastUpdated] = getdate()
    WHERE VectorID = @VectorID

GO
/****** Object:  StoredProcedure [dbo].[Vector_InsertAll_Sp]    Script Date: 1/21/2025 4:08:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Vector_InsertAll_Sp]
    @EmbeddingID INT,
    @FragmentID INT,
    @Vector NVARCHAR(MAX)
AS

BEGIN
    SET NOCOUNT ON;

    -- Insert into Vectors table by parsing the JSON array
    INSERT INTO Vectors (
        [EmbeddingID], 
        [FragmentID], 
        [Dimension], 
        [Value], 
        [Data], 
        [DateCreated], 
        [LastUpdated]
    )
    SELECT 
        @EmbeddingID, 
        @FragmentID, 
        [key] AS Dimension, 
        [value] AS Value, 
        NULL, -- Assuming Data column is nullable or needs a default value
        GETDATE(), 
        GETDATE()
    FROM OPENJSON(@Vector);

    -- Return the last inserted VectorID
    SELECT SCOPE_IDENTITY() AS VectorID;
END

GO
USE [master]
GO
ALTER DATABASE [buffaly_semanticdb] SET  READ_WRITE 
GO
