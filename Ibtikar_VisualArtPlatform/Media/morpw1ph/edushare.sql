USE [EduShare3.2_temp]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 7/20/2020 3:54:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ADGroup]    Script Date: 7/20/2020 3:54:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ADGroup](
	[ADGroupId] [int] IDENTITY(1,1) NOT NULL,
	[ADGroupName] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_dbo.ADGroup] PRIMARY KEY CLUSTERED 
(
	[ADGroupId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AllUsers]    Script Date: 7/20/2020 3:54:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AllUsers](
	[UPN] [nvarchar](max) NULL,
	[DisplayName] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comment]    Script Date: 7/20/2020 3:54:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comment](
	[Id] [nvarchar](128) NOT NULL,
	[ResourceId] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](300) NOT NULL,
	[UserDisplayName] [nvarchar](300) NULL,
	[Text] [nvarchar](400) NULL,
	[CreationDate] [datetime] NOT NULL,
	[Processed] [bit] NULL,
	[ParentCommentId] [nvarchar](128) NULL,
	[IsReplay] [bit] NOT NULL,
	[TotalLikes] [int] NULL,
	[CommentCreatorEmail] [nvarchar](300) NULL,
 CONSTRAINT [PK_dbo.Comment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Configuration]    Script Date: 7/20/2020 3:54:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Configuration](
	[TenantName] [nvarchar](255) NOT NULL,
	[ClientId] [nvarchar](255) NOT NULL,
	[DataSourceName] [nvarchar](255) NULL,
	[IndexerName] [nvarchar](255) NULL,
	[IndexName] [nvarchar](255) NULL,
	[SearchServiceName] [nvarchar](255) NULL,
	[SearchPrimaryKey] [nvarchar](255) NULL,
	[StorageAccountName] [nvarchar](255) NULL,
	[BlobPrimaryKey] [nvarchar](255) NULL,
	[BlobSecondaryKey] [nvarchar](255) NULL,
	[BlobEndpoint] [nvarchar](255) NULL,
	[EnableApprovalCycle] [bit] NOT NULL,
	[FacebookURL] [nvarchar](255) NULL,
	[TwitterURL] [nvarchar](255) NULL,
	[YouTubeURL] [nvarchar](255) NULL,
	[InstagramURL] [nvarchar](255) NULL,
 CONSTRAINT [PK_dbo.Configuration] PRIMARY KEY CLUSTERED 
(
	[TenantName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CurriculumStandard]    Script Date: 7/20/2020 3:54:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CurriculumStandard](
	[Id] [nvarchar](128) NOT NULL,
	[SubjectId] [nvarchar](128) NOT NULL,
	[ParentId] [nvarchar](128) NULL,
	[Title] [nvarchar](max) NOT NULL,
	[ClientId] [nvarchar](50) NULL,
	[IsActive] [bit] NULL,
	[Sequence] [int] NOT NULL,
	[ExternalId] [nvarchar](max) NULL,
	[TitleSecondLang] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[DescriptionSecondLang] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.CurriculumStandard] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CurriculumStandardResources]    Script Date: 7/20/2020 3:54:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CurriculumStandardResources](
	[CurriculumStandard_Id] [nvarchar](128) NOT NULL,
	[Resource_Id] [nvarchar](128) NOT NULL,
	[Processed] [bit] NULL,
	[OldResource_Id] [nvarchar](128) NULL,
 CONSTRAINT [PK_dbo.CurriculumStandardResources] PRIMARY KEY CLUSTERED 
(
	[Resource_Id] ASC,
	[CurriculumStandard_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmailNotification]    Script Date: 7/20/2020 3:54:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmailNotification](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NotificationType] [nvarchar](255) NULL,
	[stringHTML] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_dbo.EmailNotification] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ExternalLink]    Script Date: 7/20/2020 3:54:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExternalLink](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[URL] [nvarchar](max) NOT NULL,
	[TitleEn] [nvarchar](255) NOT NULL,
	[TitleAr] [nvarchar](255) NOT NULL,
	[TitleLanguage3] [nvarchar](255) NULL,
	[IconName] [nvarchar](255) NULL,
	[PermissionName] [nvarchar](255) NULL,
 CONSTRAINT [PK_dbo.ExternalLink] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Grade]    Script Date: 7/20/2020 3:54:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Grade](
	[Id] [nvarchar](128) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[ClientId] [nvarchar](50) NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[ExternalId] [nvarchar](max) NULL,
	[TitleSecondLang] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.Grade] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Grade_BAK]    Script Date: 7/20/2020 3:54:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Grade_BAK](
	[Id] [nvarchar](128) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[ClientId] [nvarchar](50) NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[ExternalId] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GradeCurriculumStandard]    Script Date: 7/20/2020 3:54:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GradeCurriculumStandard](
	[CSId] [nvarchar](128) NOT NULL,
	[GradeId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.GradeCurriculumStandard] PRIMARY KEY CLUSTERED 
(
	[CSId] ASC,
	[GradeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InappropriateLookup]    Script Date: 7/20/2020 3:54:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InappropriateLookup](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[EnTitle] [nvarchar](max) NOT NULL,
	[ArTitle] [nvarchar](max) NOT NULL,
	[IsResourceLookup] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.InappropriateLookup] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Language]    Script Date: 7/20/2020 3:54:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Language](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[ClientId] [nvarchar](50) NULL,
 CONSTRAINT [PK_dbo.Language] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LearningResourceType]    Script Date: 7/20/2020 3:54:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LearningResourceType](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](255) NULL,
	[ClientId] [nvarchar](50) NULL,
	[NameSecondLang] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.LearningResourceType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lesson]    Script Date: 7/20/2020 3:54:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lesson](
	[Id] [nvarchar](128) NOT NULL,
	[UnitId] [nvarchar](128) NOT NULL,
	[Title] [nvarchar](max) NOT NULL,
	[ClientId] [nvarchar](50) NULL,
	[Sequence] [int] NOT NULL,
	[ExternalId] [nvarchar](max) NULL,
	[TitleSecondLang] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.Lesson] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Permission]    Script Date: 7/20/2020 3:54:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Permission](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[TenantName] [nvarchar](255) NULL,
	[PermissionGroupId] [int] NULL,
 CONSTRAINT [PK_dbo.Permission] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PermissionGrouping]    Script Date: 7/20/2020 3:54:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PermissionGrouping](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_dbo.PermissionGrouping] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Privacy]    Script Date: 7/20/2020 3:54:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Privacy](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StringHtml] [nvarchar](max) NOT NULL,
	[StringHtmlAr] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_dbo.Privacy] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RefreshToken]    Script Date: 7/20/2020 3:54:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RefreshToken](
	[Id] [nvarchar](128) NOT NULL,
	[ClientId] [nvarchar](max) NULL,
	[Subject] [nvarchar](max) NULL,
	[ProtectedTicket] [nvarchar](max) NULL,
	[IssuedUtc] [datetime] NOT NULL,
	[ExpiresUtc] [datetime] NOT NULL,
 CONSTRAINT [PK_dbo.RefreshToken] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RefreshToken_backup]    Script Date: 7/20/2020 3:54:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RefreshToken_backup](
	[Id] [nvarchar](128) NOT NULL,
	[ClientId] [nvarchar](max) NULL,
	[Subject] [nvarchar](max) NULL,
	[ProtectedTicket] [nvarchar](max) NULL,
	[IssuedUtc] [datetime] NOT NULL,
	[ExpiresUtc] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Resource]    Script Date: 7/20/2020 3:54:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Resource](
	[Id] [nvarchar](128) NOT NULL,
	[SubjectID] [nvarchar](128) NULL,
	[UploadedByDisplayName] [nvarchar](300) NULL,
	[UploadedBy] [nvarchar](300) NULL,
	[LastEditedByDisplayName] [nvarchar](300) NULL,
	[LastEditedBy] [nvarchar](300) NULL,
	[Title] [nvarchar](255) NULL,
	[DocExtension] [nvarchar](300) NULL,
	[DocType] [nvarchar](30) NULL,
	[DateModified] [datetime2](7) NULL,
	[UploadedDate] [datetime2](7) NULL,
	[ExternalLink] [nvarchar](max) NULL,
	[Status] [int] NOT NULL,
	[ClientId] [nvarchar](50) NULL,
	[FeaturedDate] [datetime2](7) NULL,
	[AccreditedDate] [datetime2](7) NULL,
	[IsFeatured] [bit] NOT NULL,
	[IsAccredited] [bit] NOT NULL,
	[ApproverComment] [nvarchar](max) NULL,
	[Author] [nvarchar](255) NULL,
	[Source] [nvarchar](255) NULL,
	[PublishingDate] [datetime2](7) NULL,
	[Abstract] [nvarchar](max) NULL,
	[CheckedOutBy] [nvarchar](300) NULL,
	[Thumbnail] [nvarchar](2000) NULL,
	[Language] [nvarchar](100) NULL,
	[LastEditedByType] [int] NOT NULL,
	[FileName] [nvarchar](300) NULL,
	[IsDeleted] [bit] NOT NULL,
	[TotalRating] [float] NULL,
	[AverageRating] [float] NULL,
	[NumberOfRatingUsers] [int] NULL,
	[TotalDownloads] [int] NULL,
	[ReviewsCount] [int] NULL,
	[TotalViews] [int] NULL,
	[ViewURL] [nvarchar](2000) NULL,
	[IsSearchVisiable] [bit] NOT NULL,
	[IsSCORM] [int] NOT NULL,
	[CurriculumStandardIDs]  AS ([dbo].[GetCurriculumStandardIds]([Id])),
	[CurriculumStandardNames]  AS ([dbo].[GetCurriculumStandardNames]([Id])),
	[GradesIDs]  AS ([dbo].[GetGradesIds]([Id])),
	[GradesNames]  AS ([dbo].[GetGradesNames]([Id])),
	[Tags]  AS ([dbo].[GetTagNames]([Id])),
	[SubjectName]  AS ([dbo].[GetSubjectName]([Id])),
	[LearningResourceType] [nvarchar](255) NULL,
	[SmartCollectionsIDs]  AS ([dbo].[GetSmartCollectionsIds]([Id])),
	[OldId] [nvarchar](128) NULL,
	[Processed] [bit] NULL,
	[Owner] [nvarchar](255) NULL,
	[TerritoryId] [nvarchar](128) NULL,
	[TopicId] [nvarchar](128) NULL,
	[Adaption] [int] NOT NULL,
	[LicenseType] [int] NOT NULL,
	[TopicName]  AS ([dbo].[GetTopicName]([Id])),
	[TotalLikes] [int] NULL,
	[TotalFavorites] [int] NULL,
	[DeletionReason] [nvarchar](500) NULL,
	[UploadedByEmail] [nvarchar](300) NULL,
	[InappropriateCount] [int] NULL,
	[AllowedRoleNames]  AS ([dbo].[GetAllowedRolesNames]([Id])),
	[RejectedDate] [datetime] NULL,
	[SentForApprovalDate] [datetime] NULL,
	[LessonIDs]  AS ([dbo].[GetLessonsIds]([Id])),
	[CurriculumStandardExternalIDs]  AS ([dbo].[GetCurriculumStandardExternalIds]([Id])),
	[AllInappropriateCount] [int] NULL,
	[AcademicYear] [nvarchar](max) NULL,
	[AbstractSecondLang] [nvarchar](max) NULL,
	[PagesNumbers] [nvarchar](max) NULL,
	[Duration] [nvarchar](max) NULL,
	[Objective] [nvarchar](max) NULL,
	[ObjectiveSecondLang] [nvarchar](max) NULL,
	[IntellectualProperty] [nvarchar](max) NULL,
	[FileSize] [nvarchar](max) NULL,
	[Approver] [nvarchar](max) NULL,
	[ResourcePublishingDate] [nvarchar](max) NULL,
	[SemesterId] [nvarchar](128) NULL,
	[SemesterName]  AS ([dbo].[GetSemesterName]([Id])),
	[Publisher] [nvarchar](max) NULL,
	[TitleSecondLang] [nvarchar](max) NULL,
	[IsRelatedToCurriculum] [bit] NOT NULL,
	[IsForEnrichment] [bit] NOT NULL,
	[LearningResourceTypeSecondLang] [nvarchar](max) NULL,
	[UnitIds]  AS ([dbo].[GetResourceUnitIds]([Id])),
	[SubjectNameSecondLang]  AS ([dbo].[GetSubjectNameSecondLanguage]([Id])),
	[SemesterNameSecondLang]  AS ([dbo].[GetSemesterNameSecondLanguage]([Id])),
 CONSTRAINT [PK_Resource_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Resource_bkp15Aug2018]    Script Date: 7/20/2020 3:54:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Resource_bkp15Aug2018](
	[Id] [nvarchar](128) NOT NULL,
	[SubjectID] [nvarchar](128) NULL,
	[UploadedByDisplayName] [nvarchar](300) NULL,
	[UploadedBy] [nvarchar](300) NULL,
	[LastEditedByDisplayName] [nvarchar](300) NULL,
	[LastEditedBy] [nvarchar](300) NULL,
	[Title] [nvarchar](255) NULL,
	[DocExtension] [nvarchar](300) NULL,
	[DocType] [nvarchar](30) NULL,
	[DateModified] [datetime2](7) NULL,
	[UploadedDate] [datetime2](7) NULL,
	[ExternalLink] [nvarchar](max) NULL,
	[Status] [int] NOT NULL,
	[ClientId] [nvarchar](50) NULL,
	[FeaturedDate] [datetime2](7) NULL,
	[AccreditedDate] [datetime2](7) NULL,
	[IsFeatured] [bit] NOT NULL,
	[IsAccredited] [bit] NOT NULL,
	[ApproverComment] [nvarchar](max) NULL,
	[Author] [nvarchar](255) NULL,
	[Source] [nvarchar](255) NULL,
	[PublishingDate] [datetime2](7) NULL,
	[Abstract] [nvarchar](max) NULL,
	[CheckedOutBy] [nvarchar](300) NULL,
	[Thumbnail] [nvarchar](2000) NULL,
	[Language] [nvarchar](100) NULL,
	[LastEditedByType] [int] NOT NULL,
	[FileName] [nvarchar](300) NULL,
	[IsDeleted] [bit] NOT NULL,
	[TotalRating] [float] NULL,
	[AverageRating] [float] NULL,
	[NumberOfRatingUsers] [int] NULL,
	[TotalDownloads] [int] NULL,
	[ReviewsCount] [int] NULL,
	[TotalViews] [int] NULL,
	[ViewURL] [nvarchar](2000) NULL,
	[IsSearchVisiable] [bit] NOT NULL,
	[IsSCORM] [int] NOT NULL,
	[CurriculumStandardIDs] [nvarchar](max) NULL,
	[CurriculumStandardNames] [nvarchar](max) NULL,
	[GradesIDs] [nvarchar](max) NULL,
	[GradesNames] [nvarchar](max) NULL,
	[Tags] [nvarchar](max) NULL,
	[SubjectName] [nvarchar](255) NULL,
	[LearningResourceType] [nvarchar](255) NULL,
	[SmartCollectionsIDs] [nvarchar](max) NULL,
	[OldId] [nvarchar](128) NULL,
	[Processed] [bit] NULL,
	[Owner] [nvarchar](255) NULL,
	[TerritoryId] [nvarchar](128) NULL,
	[TopicId] [nvarchar](128) NULL,
	[Adaption] [int] NOT NULL,
	[LicenseType] [int] NOT NULL,
	[TopicName] [nvarchar](255) NULL,
	[TotalLikes] [int] NULL,
	[TotalFavorites] [int] NULL,
	[DeletionReason] [nvarchar](500) NULL,
	[UploadedByEmail] [nvarchar](300) NULL,
	[InappropriateCount] [int] NULL,
	[AllowedRoleNames] [nvarchar](max) NULL,
	[RejectedDate] [datetime] NULL,
	[SentForApprovalDate] [datetime] NULL,
	[LessonIDs] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ResourceGrade]    Script Date: 7/20/2020 3:54:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ResourceGrade](
	[GradeId] [nvarchar](128) NOT NULL,
	[ResourceId] [nvarchar](128) NOT NULL,
	[OldResourceId] [nvarchar](128) NULL,
 CONSTRAINT [PK_dbo.ResourceGrade] PRIMARY KEY CLUSTERED 
(
	[GradeId] ASC,
	[ResourceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ResourceLesson]    Script Date: 7/20/2020 3:54:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ResourceLesson](
	[LessonId] [nvarchar](128) NOT NULL,
	[ResourceId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.ResourceLesson] PRIMARY KEY CLUSTERED 
(
	[LessonId] ASC,
	[ResourceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ResourceRoles]    Script Date: 7/20/2020 3:54:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ResourceRoles](
	[RoleId] [int] NOT NULL,
	[ResourceId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.ResourceRoles] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC,
	[ResourceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ResourceSmartCollection]    Script Date: 7/20/2020 3:54:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ResourceSmartCollection](
	[ResourceId] [nvarchar](128) NOT NULL,
	[SmartCollectionsId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.ResourceSmartCollection] PRIMARY KEY CLUSTERED 
(
	[ResourceId] ASC,
	[SmartCollectionsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ResourceSubtopic]    Script Date: 7/20/2020 3:54:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ResourceSubtopic](
	[SubtopicId] [nvarchar](128) NOT NULL,
	[ResourceId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.ResourceSubtopic] PRIMARY KEY CLUSTERED 
(
	[SubtopicId] ASC,
	[ResourceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ResourceTemplate]    Script Date: 7/20/2020 3:54:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ResourceTemplate](
	[Id] [nvarchar](128) NOT NULL,
	[Abstract] [nvarchar](max) NULL,
	[Adaption] [int] NOT NULL,
	[DocAuthor] [nvarchar](max) NULL,
	[EduIsFeatured] [bit] NOT NULL,
	[EduLanguage] [nvarchar](max) NULL,
	[IsAccredited] [bit] NOT NULL,
	[LearningResourceType] [nvarchar](max) NULL,
	[LicenseType] [int] NOT NULL,
	[Owner] [nvarchar](max) NULL,
	[RoleIds] [nvarchar](max) NULL,
	[RolesNames] [nvarchar](max) NULL,
	[Source] [nvarchar](max) NULL,
	[SubTopics] [nvarchar](max) NULL,
	[Tags] [nvarchar](max) NULL,
	[TagsList] [nvarchar](max) NULL,
	[TerritoryId] [nvarchar](max) NULL,
	[ThumbnailUrl] [nvarchar](max) NULL,
	[TopicId] [nvarchar](max) NULL,
	[selectedCurriculums] [nvarchar](max) NULL,
	[selectedGrades] [nvarchar](max) NULL,
	[selectedSubject] [nvarchar](max) NULL,
	[TopicName] [nvarchar](max) NULL,
	[Lessons] [nvarchar](max) NULL,
	[LearningResourceTypeSecondLang] [nvarchar](max) NULL,
	[SubTopicsSecondLang] [nvarchar](max) NULL,
	[TopicNameSecondLang] [nvarchar](max) NULL,
	[selectedCurriculumsSecondLang] [nvarchar](max) NULL,
	[selectedSubjectSecondLang] [nvarchar](max) NULL,
	[selectedGradesSecondLang] [nvarchar](max) NULL,
	[LessonsSecondLang] [nvarchar](max) NULL,
	[AcademicYear] [nvarchar](max) NULL,
	[AbstractSecondLang] [nvarchar](max) NULL,
	[PagesNumbers] [nvarchar](max) NULL,
	[Duration] [nvarchar](max) NULL,
	[Objective] [nvarchar](max) NULL,
	[ObjectiveSecondLang] [nvarchar](max) NULL,
	[IntellectualProperty] [nvarchar](max) NULL,
	[FileSize] [nvarchar](max) NULL,
	[Approver] [nvarchar](max) NULL,
	[ResourcePublishingDate] [nvarchar](max) NULL,
	[Publisher] [nvarchar](max) NULL,
	[TitleSecondLang] [nvarchar](max) NULL,
	[IsRelatedToCurriculum] [bit] NOT NULL,
	[IsForEnrichment] [bit] NOT NULL,
	[SemesterName] [nvarchar](max) NULL,
	[SemesterNameSecondLang] [nvarchar](max) NULL,
	[RolesNamesAr] [nvarchar](max) NULL,
	[RolesNamesLang3] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.ResourceTemplate] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 7/20/2020 3:54:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NameEn] [nvarchar](255) NOT NULL,
	[ShowIsAllowed] [bit] NOT NULL,
	[NameAr] [nvarchar](255) NOT NULL,
	[NameLanguage3] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_dbo.Role] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoleADGroup]    Script Date: 7/20/2020 3:54:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoleADGroup](
	[RoleId] [int] NOT NULL,
	[ADGroupId] [int] NOT NULL,
 CONSTRAINT [PK_dbo.RoleADGroup] PRIMARY KEY CLUSTERED 
(
	[ADGroupId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RolePermission]    Script Date: 7/20/2020 3:54:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RolePermission](
	[PermissionId] [int] NOT NULL,
	[RoleId] [int] NOT NULL,
 CONSTRAINT [PK_dbo.RolePermission] PRIMARY KEY CLUSTERED 
(
	[PermissionId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Semester]    Script Date: 7/20/2020 3:54:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Semester](
	[Id] [nvarchar](128) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[ClientId] [nvarchar](max) NULL,
	[TitleSecondLang] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.Semester] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SmartCollection]    Script Date: 7/20/2020 3:54:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SmartCollection](
	[Id] [nvarchar](128) NOT NULL,
	[SmartCollectionTitle] [nvarchar](255) NULL,
	[SmartCollectionDescription] [nvarchar](500) NULL,
	[SmartCollectionIcon] [nvarchar](2000) NULL,
	[ClientId] [nvarchar](128) NOT NULL,
	[IsDisplayInHomePage] [bit] NOT NULL,
	[CreationDate] [datetime] NOT NULL,
	[SubjectID] [nvarchar](128) NULL,
	[TopicID] [nvarchar](128) NULL,
	[ParentId] [nvarchar](128) NULL,
 CONSTRAINT [PK_dbo.SmartCollection] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SmartCollectionGrade]    Script Date: 7/20/2020 3:54:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SmartCollectionGrade](
	[GradeId] [nvarchar](128) NOT NULL,
	[SmartCollectionId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.SmartCollectionGrade] PRIMARY KEY CLUSTERED 
(
	[GradeId] ASC,
	[SmartCollectionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SmePermission]    Script Date: 7/20/2020 3:54:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SmePermission](
	[UserId] [nvarchar](300) NOT NULL,
	[SubjectId] [nvarchar](128) NULL,
	[PermissionId] [int] NOT NULL,
	[Id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_dbo.SmePermission] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Source]    Script Date: 7/20/2020 3:54:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Source](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](255) NULL,
	[ClientId] [nvarchar](50) NULL,
 CONSTRAINT [PK_dbo.Source] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subject]    Script Date: 7/20/2020 3:54:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subject](
	[Id] [nvarchar](128) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[ClientId] [nvarchar](50) NULL,
	[ExternalId] [nvarchar](max) NULL,
	[TitleSecondLang] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.Subject] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SubjectGrade]    Script Date: 7/20/2020 3:54:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubjectGrade](
	[GradeId] [nvarchar](128) NOT NULL,
	[SubjectId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.SubjectGrade] PRIMARY KEY CLUSTERED 
(
	[GradeId] ASC,
	[SubjectId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SubTopic]    Script Date: 7/20/2020 3:54:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubTopic](
	[Id] [nvarchar](128) NOT NULL,
	[Title] [nvarchar](max) NULL,
	[ClientId] [nvarchar](50) NULL,
	[TitleSecondLang] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.SubTopic] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tag]    Script Date: 7/20/2020 3:54:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tag](
	[Id] [nvarchar](128) NOT NULL,
	[Title] [nvarchar](50) NULL,
	[Count] [int] NOT NULL,
	[ClientId] [nvarchar](50) NULL,
 CONSTRAINT [PK_dbo.Tag] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TagResource]    Script Date: 7/20/2020 3:54:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TagResource](
	[ResourceId] [nvarchar](128) NOT NULL,
	[TagId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.TagResource] PRIMARY KEY CLUSTERED 
(
	[ResourceId] ASC,
	[TagId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[temp]    Script Date: 7/20/2020 3:54:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[temp](
	[email] [nvarchar](max) NOT NULL,
	[firstname] [nvarchar](max) NOT NULL,
	[lastname] [nvarchar](max) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Terms]    Script Date: 7/20/2020 3:54:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Terms](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StringHtml] [nvarchar](max) NOT NULL,
	[StringHtmlAr] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_dbo.Terms] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Territory]    Script Date: 7/20/2020 3:54:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Territory](
	[Id] [nvarchar](128) NOT NULL,
	[Title] [nvarchar](255) NULL,
	[ClientId] [nvarchar](50) NULL,
 CONSTRAINT [PK_dbo.Territory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Topic]    Script Date: 7/20/2020 3:54:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Topic](
	[Id] [nvarchar](128) NOT NULL,
	[SubjectId] [nvarchar](128) NOT NULL,
	[Title] [nvarchar](max) NOT NULL,
	[ClientId] [nvarchar](50) NULL,
	[TitleSecondLang] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.Topic] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TopicSubtopic]    Script Date: 7/20/2020 3:54:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TopicSubtopic](
	[SubtopicId] [nvarchar](128) NOT NULL,
	[TopicId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.TopicSubtopic] PRIMARY KEY CLUSTERED 
(
	[SubtopicId] ASC,
	[TopicId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Unit]    Script Date: 7/20/2020 3:54:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Unit](
	[Id] [nvarchar](128) NOT NULL,
	[Title] [nvarchar](max) NOT NULL,
	[ClientId] [nvarchar](50) NULL,
	[GradeId] [nvarchar](128) NOT NULL,
	[SubjectId] [nvarchar](128) NOT NULL,
	[Sequence] [int] NOT NULL,
	[ExternalId] [nvarchar](max) NULL,
	[SemesterId] [nvarchar](128) NULL,
	[TitleSecondLang] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.Unit] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserInappropriateResource]    Script Date: 7/20/2020 3:54:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserInappropriateResource](
	[Id] [nvarchar](128) NOT NULL,
	[ResourceId] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](300) NOT NULL,
	[UserDisplayName] [nvarchar](max) NULL,
	[Text] [nvarchar](max) NULL,
	[CreationDate] [datetime] NOT NULL,
	[InappropriateLookupId] [int] NOT NULL,
	[Count] [int] NOT NULL,
	[CommentId] [nvarchar](128) NULL,
	[IsComment] [bit] NULL,
	[IsReply] [bit] NULL,
 CONSTRAINT [PK_dbo.UserInappropriateResource] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserInfo]    Script Date: 7/20/2020 3:54:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserInfo](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UPN] [nvarchar](max) NOT NULL,
	[DisplayName] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_dbo.UserInfo] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserMentors]    Script Date: 7/20/2020 3:54:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserMentors](
	[MentorId] [int] NOT NULL,
	[MenteeId] [int] NOT NULL,
 CONSTRAINT [PK_dbo.UserMentors] PRIMARY KEY CLUSTERED 
(
	[MentorId] ASC,
	[MenteeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserPreferences]    Script Date: 7/20/2020 3:54:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserPreferences](
	[Id] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](300) NULL,
	[GradeId] [nvarchar](128) NULL,
	[SubjectId] [nvarchar](128) NULL,
 CONSTRAINT [PK_dbo.UserPreferences] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserResourceTemplate]    Script Date: 7/20/2020 3:54:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserResourceTemplate](
	[Id] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](300) NOT NULL,
	[Title] [nvarchar](max) NOT NULL,
	[ResourceTemplateId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.UserResourceTemplate] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UsersFavorite]    Script Date: 7/20/2020 3:54:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsersFavorite](
	[ResourceId] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](300) NOT NULL,
 CONSTRAINT [PK_dbo.UsersFavorite] PRIMARY KEY CLUSTERED 
(
	[ResourceId] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UsersLike]    Script Date: 7/20/2020 3:54:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsersLike](
	[ResourceId] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](300) NOT NULL,
 CONSTRAINT [PK_dbo.UsersLike] PRIMARY KEY CLUSTERED 
(
	[ResourceId] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UsersLikeComment]    Script Date: 7/20/2020 3:54:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsersLikeComment](
	[CommentId] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](300) NOT NULL,
 CONSTRAINT [PK_dbo.UsersLikeComment] PRIMARY KEY CLUSTERED 
(
	[CommentId] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UsersRating]    Script Date: 7/20/2020 3:54:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsersRating](
	[ResourceId] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](300) NOT NULL,
	[Rating] [decimal](18, 2) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NULL,
 CONSTRAINT [PK_dbo.UsersRating] PRIMARY KEY CLUSTERED 
(
	[ResourceId] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Comment] ADD  CONSTRAINT [DF__Comment__IsRepla__1FCDBCEB]  DEFAULT ((0)) FOR [IsReplay]
GO
ALTER TABLE [dbo].[Configuration] ADD  CONSTRAINT [DF__Configura__Enabl__22AA2996]  DEFAULT ((1)) FOR [EnableApprovalCycle]
GO
ALTER TABLE [dbo].[CurriculumStandard] ADD  CONSTRAINT [DF__Curriculu__Seque__25869641]  DEFAULT ((0)) FOR [Sequence]
GO
ALTER TABLE [dbo].[Grade] ADD  CONSTRAINT [DF__Grade__ModifiedD__2E1BDC42]  DEFAULT ('1900-01-01T00:00:00.000') FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[Lesson] ADD  CONSTRAINT [DF__Lesson__Sequence__4C6B5938]  DEFAULT ((0)) FOR [Sequence]
GO
ALTER TABLE [dbo].[Resource] ADD  CONSTRAINT [DF__Resource__Adapti__3C69FB99]  DEFAULT ((0)) FOR [Adaption]
GO
ALTER TABLE [dbo].[Resource] ADD  CONSTRAINT [DF__Resource__Licens__3D5E1FD2]  DEFAULT ((0)) FOR [LicenseType]
GO
ALTER TABLE [dbo].[Resource] ADD  DEFAULT ((0)) FOR [IsRelatedToCurriculum]
GO
ALTER TABLE [dbo].[Resource] ADD  DEFAULT ((0)) FOR [IsForEnrichment]
GO
ALTER TABLE [dbo].[ResourceTemplate] ADD  DEFAULT ((0)) FOR [IsRelatedToCurriculum]
GO
ALTER TABLE [dbo].[ResourceTemplate] ADD  DEFAULT ((0)) FOR [IsForEnrichment]
GO
ALTER TABLE [dbo].[Role] ADD  CONSTRAINT [DF__Role__ShowIsAllo__47DBAE45]  DEFAULT ((0)) FOR [ShowIsAllowed]
GO
ALTER TABLE [dbo].[Role] ADD  CONSTRAINT [DF__Role__NameAr__48CFD27E]  DEFAULT ('') FOR [NameAr]
GO
ALTER TABLE [dbo].[Role] ADD  CONSTRAINT [DF__Role__NameLangua__49C3F6B7]  DEFAULT ('') FOR [NameLanguage3]
GO
ALTER TABLE [dbo].[SmePermission] ADD  CONSTRAINT [DF__SmePermis__Permi__151B244E]  DEFAULT ((0)) FOR [PermissionId]
GO
ALTER TABLE [dbo].[Terms] ADD  CONSTRAINT [DF__Terms__StringHtm__5FB337D6]  DEFAULT ('') FOR [StringHtmlAr]
GO
ALTER TABLE [dbo].[Unit] ADD  CONSTRAINT [DF__Unit__SubjectId__4A8310C6]  DEFAULT ('') FOR [SubjectId]
GO
ALTER TABLE [dbo].[Unit] ADD  CONSTRAINT [DF__Unit__Sequence__4D5F7D71]  DEFAULT ((0)) FOR [Sequence]
GO
ALTER TABLE [dbo].[UserInappropriateResource] ADD  DEFAULT ((0)) FOR [InappropriateLookupId]
GO
ALTER TABLE [dbo].[UserInappropriateResource] ADD  DEFAULT ((0)) FOR [Count]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_Resource] FOREIGN KEY([ResourceId])
REFERENCES [dbo].[Resource] ([Id])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_Resource]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Comment_dbo.Comment_ParentCommentId] FOREIGN KEY([ParentCommentId])
REFERENCES [dbo].[Comment] ([Id])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_dbo.Comment_dbo.Comment_ParentCommentId]
GO
ALTER TABLE [dbo].[CurriculumStandard]  WITH CHECK ADD  CONSTRAINT [FK_dbo.CurriculumStandard_dbo.CurriculumStandard_ParentId] FOREIGN KEY([ParentId])
REFERENCES [dbo].[CurriculumStandard] ([Id])
GO
ALTER TABLE [dbo].[CurriculumStandard] CHECK CONSTRAINT [FK_dbo.CurriculumStandard_dbo.CurriculumStandard_ParentId]
GO
ALTER TABLE [dbo].[CurriculumStandard]  WITH CHECK ADD  CONSTRAINT [FK_dbo.CurriculumStandard_dbo.Subject_SubjectId] FOREIGN KEY([SubjectId])
REFERENCES [dbo].[Subject] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CurriculumStandard] CHECK CONSTRAINT [FK_dbo.CurriculumStandard_dbo.Subject_SubjectId]
GO
ALTER TABLE [dbo].[CurriculumStandardResources]  WITH CHECK ADD  CONSTRAINT [FK_CurriculumStandardResources_Resource] FOREIGN KEY([Resource_Id])
REFERENCES [dbo].[Resource] ([Id])
GO
ALTER TABLE [dbo].[CurriculumStandardResources] CHECK CONSTRAINT [FK_CurriculumStandardResources_Resource]
GO
ALTER TABLE [dbo].[CurriculumStandardResources]  WITH CHECK ADD  CONSTRAINT [FK_dbo.CurriculumStandardResources_dbo.CurriculumStandard_CurriculumStandard_Id] FOREIGN KEY([CurriculumStandard_Id])
REFERENCES [dbo].[CurriculumStandard] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CurriculumStandardResources] CHECK CONSTRAINT [FK_dbo.CurriculumStandardResources_dbo.CurriculumStandard_CurriculumStandard_Id]
GO
ALTER TABLE [dbo].[GradeCurriculumStandard]  WITH CHECK ADD  CONSTRAINT [FK_dbo.GradeCurriculumStandard_dbo.CurriculumStandard_CSId] FOREIGN KEY([CSId])
REFERENCES [dbo].[CurriculumStandard] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[GradeCurriculumStandard] CHECK CONSTRAINT [FK_dbo.GradeCurriculumStandard_dbo.CurriculumStandard_CSId]
GO
ALTER TABLE [dbo].[GradeCurriculumStandard]  WITH CHECK ADD  CONSTRAINT [FK_dbo.GradeCurriculumStandard_dbo.Grade_GradeId] FOREIGN KEY([GradeId])
REFERENCES [dbo].[Grade] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[GradeCurriculumStandard] CHECK CONSTRAINT [FK_dbo.GradeCurriculumStandard_dbo.Grade_GradeId]
GO
ALTER TABLE [dbo].[Lesson]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Lesson_dbo.Unit_UnitId] FOREIGN KEY([UnitId])
REFERENCES [dbo].[Unit] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Lesson] CHECK CONSTRAINT [FK_dbo.Lesson_dbo.Unit_UnitId]
GO
ALTER TABLE [dbo].[Permission]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Permission_dbo.PermissionGrouping_PermissionGroupId] FOREIGN KEY([PermissionGroupId])
REFERENCES [dbo].[PermissionGrouping] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Permission] CHECK CONSTRAINT [FK_dbo.Permission_dbo.PermissionGrouping_PermissionGroupId]
GO
ALTER TABLE [dbo].[Resource]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Resource_dbo.Semester_SemesterId] FOREIGN KEY([SemesterId])
REFERENCES [dbo].[Semester] ([Id])
GO
ALTER TABLE [dbo].[Resource] CHECK CONSTRAINT [FK_dbo.Resource_dbo.Semester_SemesterId]
GO
ALTER TABLE [dbo].[Resource]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Resource_dbo.Subject_SubjectID] FOREIGN KEY([SubjectID])
REFERENCES [dbo].[Subject] ([Id])
GO
ALTER TABLE [dbo].[Resource] CHECK CONSTRAINT [FK_dbo.Resource_dbo.Subject_SubjectID]
GO
ALTER TABLE [dbo].[Resource]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Resource_dbo.Territory_TerritoryId] FOREIGN KEY([TerritoryId])
REFERENCES [dbo].[Territory] ([Id])
GO
ALTER TABLE [dbo].[Resource] CHECK CONSTRAINT [FK_dbo.Resource_dbo.Territory_TerritoryId]
GO
ALTER TABLE [dbo].[Resource]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Resource_dbo.Topic_TopicId] FOREIGN KEY([TopicId])
REFERENCES [dbo].[Topic] ([Id])
GO
ALTER TABLE [dbo].[Resource] CHECK CONSTRAINT [FK_dbo.Resource_dbo.Topic_TopicId]
GO
ALTER TABLE [dbo].[ResourceGrade]  WITH CHECK ADD  CONSTRAINT [FK_dbo.ResourceGrade_dbo.Grade_GradeId] FOREIGN KEY([GradeId])
REFERENCES [dbo].[Grade] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ResourceGrade] CHECK CONSTRAINT [FK_dbo.ResourceGrade_dbo.Grade_GradeId]
GO
ALTER TABLE [dbo].[ResourceGrade]  WITH CHECK ADD  CONSTRAINT [FK_ResourceGrade_Resource] FOREIGN KEY([ResourceId])
REFERENCES [dbo].[Resource] ([Id])
GO
ALTER TABLE [dbo].[ResourceGrade] CHECK CONSTRAINT [FK_ResourceGrade_Resource]
GO
ALTER TABLE [dbo].[ResourceLesson]  WITH CHECK ADD  CONSTRAINT [FK_dbo.ResourceLesson_dbo.Lesson_LessonId] FOREIGN KEY([LessonId])
REFERENCES [dbo].[Lesson] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ResourceLesson] CHECK CONSTRAINT [FK_dbo.ResourceLesson_dbo.Lesson_LessonId]
GO
ALTER TABLE [dbo].[ResourceLesson]  WITH CHECK ADD  CONSTRAINT [FK_dbo.ResourceLesson_dbo.Resource_ResourceId] FOREIGN KEY([ResourceId])
REFERENCES [dbo].[Resource] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ResourceLesson] CHECK CONSTRAINT [FK_dbo.ResourceLesson_dbo.Resource_ResourceId]
GO
ALTER TABLE [dbo].[ResourceRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.ResourceRoles_dbo.Resource_ResourceId] FOREIGN KEY([ResourceId])
REFERENCES [dbo].[Resource] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ResourceRoles] CHECK CONSTRAINT [FK_dbo.ResourceRoles_dbo.Resource_ResourceId]
GO
ALTER TABLE [dbo].[ResourceRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.ResourceRoles_dbo.Role_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ResourceRoles] CHECK CONSTRAINT [FK_dbo.ResourceRoles_dbo.Role_RoleId]
GO
ALTER TABLE [dbo].[ResourceSmartCollection]  WITH CHECK ADD  CONSTRAINT [FK_dbo.ResourceSmartCollection_dbo.SmartCollection_SmartCollectionsId] FOREIGN KEY([SmartCollectionsId])
REFERENCES [dbo].[SmartCollection] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ResourceSmartCollection] CHECK CONSTRAINT [FK_dbo.ResourceSmartCollection_dbo.SmartCollection_SmartCollectionsId]
GO
ALTER TABLE [dbo].[ResourceSmartCollection]  WITH CHECK ADD  CONSTRAINT [FK_ResourceSmartCollection_Resource] FOREIGN KEY([ResourceId])
REFERENCES [dbo].[Resource] ([Id])
GO
ALTER TABLE [dbo].[ResourceSmartCollection] CHECK CONSTRAINT [FK_ResourceSmartCollection_Resource]
GO
ALTER TABLE [dbo].[ResourceSubtopic]  WITH CHECK ADD  CONSTRAINT [FK_dbo.ResourceSubtopic_dbo.Resource_ResourceId] FOREIGN KEY([ResourceId])
REFERENCES [dbo].[Resource] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ResourceSubtopic] CHECK CONSTRAINT [FK_dbo.ResourceSubtopic_dbo.Resource_ResourceId]
GO
ALTER TABLE [dbo].[ResourceSubtopic]  WITH CHECK ADD  CONSTRAINT [FK_dbo.ResourceSubtopic_dbo.SubTopic_SubtopicId] FOREIGN KEY([SubtopicId])
REFERENCES [dbo].[SubTopic] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ResourceSubtopic] CHECK CONSTRAINT [FK_dbo.ResourceSubtopic_dbo.SubTopic_SubtopicId]
GO
ALTER TABLE [dbo].[RoleADGroup]  WITH CHECK ADD  CONSTRAINT [FK_dbo.RoleADGroup_dbo.ADGroup_ADGroupId] FOREIGN KEY([ADGroupId])
REFERENCES [dbo].[ADGroup] ([ADGroupId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RoleADGroup] CHECK CONSTRAINT [FK_dbo.RoleADGroup_dbo.ADGroup_ADGroupId]
GO
ALTER TABLE [dbo].[RoleADGroup]  WITH CHECK ADD  CONSTRAINT [FK_dbo.RoleADGroup_dbo.Role_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RoleADGroup] CHECK CONSTRAINT [FK_dbo.RoleADGroup_dbo.Role_RoleId]
GO
ALTER TABLE [dbo].[RolePermission]  WITH CHECK ADD  CONSTRAINT [FK_dbo.RolePermission_dbo.Permission_PermissionId] FOREIGN KEY([PermissionId])
REFERENCES [dbo].[Permission] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RolePermission] CHECK CONSTRAINT [FK_dbo.RolePermission_dbo.Permission_PermissionId]
GO
ALTER TABLE [dbo].[RolePermission]  WITH CHECK ADD  CONSTRAINT [FK_dbo.RolePermission_dbo.Role_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RolePermission] CHECK CONSTRAINT [FK_dbo.RolePermission_dbo.Role_RoleId]
GO
ALTER TABLE [dbo].[SmartCollection]  WITH CHECK ADD  CONSTRAINT [FK_dbo.SmartCollection_dbo.SmartCollection_ParentId] FOREIGN KEY([ParentId])
REFERENCES [dbo].[SmartCollection] ([Id])
GO
ALTER TABLE [dbo].[SmartCollection] CHECK CONSTRAINT [FK_dbo.SmartCollection_dbo.SmartCollection_ParentId]
GO
ALTER TABLE [dbo].[SmartCollection]  WITH CHECK ADD  CONSTRAINT [FK_dbo.SmartCollection_dbo.Subject_SubjectID] FOREIGN KEY([SubjectID])
REFERENCES [dbo].[Subject] ([Id])
GO
ALTER TABLE [dbo].[SmartCollection] CHECK CONSTRAINT [FK_dbo.SmartCollection_dbo.Subject_SubjectID]
GO
ALTER TABLE [dbo].[SmartCollection]  WITH CHECK ADD  CONSTRAINT [FK_dbo.SmartCollection_dbo.Topic_TopicID] FOREIGN KEY([TopicID])
REFERENCES [dbo].[Topic] ([Id])
GO
ALTER TABLE [dbo].[SmartCollection] CHECK CONSTRAINT [FK_dbo.SmartCollection_dbo.Topic_TopicID]
GO
ALTER TABLE [dbo].[SmartCollectionGrade]  WITH CHECK ADD  CONSTRAINT [FK_dbo.SmartCollectionGrade_dbo.Grade_GradeId] FOREIGN KEY([GradeId])
REFERENCES [dbo].[Grade] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SmartCollectionGrade] CHECK CONSTRAINT [FK_dbo.SmartCollectionGrade_dbo.Grade_GradeId]
GO
ALTER TABLE [dbo].[SmartCollectionGrade]  WITH CHECK ADD  CONSTRAINT [FK_dbo.SmartCollectionGrade_dbo.SmartCollection_SmartCollectionId] FOREIGN KEY([SmartCollectionId])
REFERENCES [dbo].[SmartCollection] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SmartCollectionGrade] CHECK CONSTRAINT [FK_dbo.SmartCollectionGrade_dbo.SmartCollection_SmartCollectionId]
GO
ALTER TABLE [dbo].[SmePermission]  WITH CHECK ADD  CONSTRAINT [FK_dbo.SmePermission_dbo.Permission_PermissionId] FOREIGN KEY([PermissionId])
REFERENCES [dbo].[Permission] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SmePermission] CHECK CONSTRAINT [FK_dbo.SmePermission_dbo.Permission_PermissionId]
GO
ALTER TABLE [dbo].[SmePermission]  WITH CHECK ADD  CONSTRAINT [FK_dbo.SmePermission_dbo.Subject_SubjectId] FOREIGN KEY([SubjectId])
REFERENCES [dbo].[Subject] ([Id])
GO
ALTER TABLE [dbo].[SmePermission] CHECK CONSTRAINT [FK_dbo.SmePermission_dbo.Subject_SubjectId]
GO
ALTER TABLE [dbo].[SubjectGrade]  WITH CHECK ADD  CONSTRAINT [FK_dbo.SubjectGrade_dbo.Grade_GradeId] FOREIGN KEY([GradeId])
REFERENCES [dbo].[Grade] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SubjectGrade] CHECK CONSTRAINT [FK_dbo.SubjectGrade_dbo.Grade_GradeId]
GO
ALTER TABLE [dbo].[SubjectGrade]  WITH CHECK ADD  CONSTRAINT [FK_dbo.SubjectGrade_dbo.Subject_SubjectId] FOREIGN KEY([SubjectId])
REFERENCES [dbo].[Subject] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SubjectGrade] CHECK CONSTRAINT [FK_dbo.SubjectGrade_dbo.Subject_SubjectId]
GO
ALTER TABLE [dbo].[TagResource]  WITH CHECK ADD  CONSTRAINT [FK_TagResource_Resource] FOREIGN KEY([ResourceId])
REFERENCES [dbo].[Resource] ([Id])
GO
ALTER TABLE [dbo].[TagResource] CHECK CONSTRAINT [FK_TagResource_Resource]
GO
ALTER TABLE [dbo].[TagResource]  WITH CHECK ADD  CONSTRAINT [FK_TagResource_Tag] FOREIGN KEY([TagId])
REFERENCES [dbo].[Tag] ([Id])
GO
ALTER TABLE [dbo].[TagResource] CHECK CONSTRAINT [FK_TagResource_Tag]
GO
ALTER TABLE [dbo].[Topic]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Topic_dbo.Subject_SubjectId] FOREIGN KEY([SubjectId])
REFERENCES [dbo].[Subject] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Topic] CHECK CONSTRAINT [FK_dbo.Topic_dbo.Subject_SubjectId]
GO
ALTER TABLE [dbo].[TopicSubtopic]  WITH CHECK ADD  CONSTRAINT [FK_dbo.TopicSubtopic_dbo.SubTopic_SubtopicId] FOREIGN KEY([SubtopicId])
REFERENCES [dbo].[SubTopic] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TopicSubtopic] CHECK CONSTRAINT [FK_dbo.TopicSubtopic_dbo.SubTopic_SubtopicId]
GO
ALTER TABLE [dbo].[TopicSubtopic]  WITH CHECK ADD  CONSTRAINT [FK_dbo.TopicSubtopic_dbo.Topic_TopicId] FOREIGN KEY([TopicId])
REFERENCES [dbo].[Topic] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TopicSubtopic] CHECK CONSTRAINT [FK_dbo.TopicSubtopic_dbo.Topic_TopicId]
GO
ALTER TABLE [dbo].[Unit]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Unit_dbo.Grade_GradeId] FOREIGN KEY([GradeId])
REFERENCES [dbo].[Grade] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Unit] CHECK CONSTRAINT [FK_dbo.Unit_dbo.Grade_GradeId]
GO
ALTER TABLE [dbo].[Unit]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Unit_dbo.Semester_SemesterId] FOREIGN KEY([SemesterId])
REFERENCES [dbo].[Semester] ([Id])
GO
ALTER TABLE [dbo].[Unit] CHECK CONSTRAINT [FK_dbo.Unit_dbo.Semester_SemesterId]
GO
ALTER TABLE [dbo].[Unit]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Unit_dbo.Subject_SubjectId] FOREIGN KEY([SubjectId])
REFERENCES [dbo].[Subject] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Unit] CHECK CONSTRAINT [FK_dbo.Unit_dbo.Subject_SubjectId]
GO
ALTER TABLE [dbo].[UserInappropriateResource]  WITH CHECK ADD  CONSTRAINT [FK_dbo.UserInappropriateResource_dbo.Comment_CommentId] FOREIGN KEY([CommentId])
REFERENCES [dbo].[Comment] ([Id])
GO
ALTER TABLE [dbo].[UserInappropriateResource] CHECK CONSTRAINT [FK_dbo.UserInappropriateResource_dbo.Comment_CommentId]
GO
ALTER TABLE [dbo].[UserInappropriateResource]  WITH CHECK ADD  CONSTRAINT [FK_dbo.UserInappropriateResource_dbo.InappropriateLookup_InappropriateLookupId] FOREIGN KEY([InappropriateLookupId])
REFERENCES [dbo].[InappropriateLookup] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserInappropriateResource] CHECK CONSTRAINT [FK_dbo.UserInappropriateResource_dbo.InappropriateLookup_InappropriateLookupId]
GO
ALTER TABLE [dbo].[UserInappropriateResource]  WITH CHECK ADD  CONSTRAINT [FK_dbo.UserInappropriateResource_dbo.Resource_ResourceId] FOREIGN KEY([ResourceId])
REFERENCES [dbo].[Resource] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserInappropriateResource] CHECK CONSTRAINT [FK_dbo.UserInappropriateResource_dbo.Resource_ResourceId]
GO
ALTER TABLE [dbo].[UserMentors]  WITH CHECK ADD  CONSTRAINT [FK_dbo.UserMentors_dbo.UserInfo_MenteeId] FOREIGN KEY([MenteeId])
REFERENCES [dbo].[UserInfo] ([Id])
GO
ALTER TABLE [dbo].[UserMentors] CHECK CONSTRAINT [FK_dbo.UserMentors_dbo.UserInfo_MenteeId]
GO
ALTER TABLE [dbo].[UserMentors]  WITH CHECK ADD  CONSTRAINT [FK_dbo.UserMentors_dbo.UserInfo_MentorId] FOREIGN KEY([MentorId])
REFERENCES [dbo].[UserInfo] ([Id])
GO
ALTER TABLE [dbo].[UserMentors] CHECK CONSTRAINT [FK_dbo.UserMentors_dbo.UserInfo_MentorId]
GO
ALTER TABLE [dbo].[UserPreferences]  WITH CHECK ADD  CONSTRAINT [FK_dbo.UserPreferences_dbo.Grade_GradeId] FOREIGN KEY([GradeId])
REFERENCES [dbo].[Grade] ([Id])
GO
ALTER TABLE [dbo].[UserPreferences] CHECK CONSTRAINT [FK_dbo.UserPreferences_dbo.Grade_GradeId]
GO
ALTER TABLE [dbo].[UserPreferences]  WITH CHECK ADD  CONSTRAINT [FK_dbo.UserPreferences_dbo.Subject_SubjectId] FOREIGN KEY([SubjectId])
REFERENCES [dbo].[Subject] ([Id])
GO
ALTER TABLE [dbo].[UserPreferences] CHECK CONSTRAINT [FK_dbo.UserPreferences_dbo.Subject_SubjectId]
GO
ALTER TABLE [dbo].[UserResourceTemplate]  WITH CHECK ADD  CONSTRAINT [FK_dbo.UserResourceTemplate_dbo.ResourceTemplate_ResourceTemplateId] FOREIGN KEY([ResourceTemplateId])
REFERENCES [dbo].[ResourceTemplate] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserResourceTemplate] CHECK CONSTRAINT [FK_dbo.UserResourceTemplate_dbo.ResourceTemplate_ResourceTemplateId]
GO
ALTER TABLE [dbo].[UsersFavorite]  WITH CHECK ADD  CONSTRAINT [FK_UsersFavorite_Resource] FOREIGN KEY([ResourceId])
REFERENCES [dbo].[Resource] ([Id])
GO
ALTER TABLE [dbo].[UsersFavorite] CHECK CONSTRAINT [FK_UsersFavorite_Resource]
GO
ALTER TABLE [dbo].[UsersLike]  WITH CHECK ADD  CONSTRAINT [FK_dbo.UsersLike_dbo.Resource_ResourceId] FOREIGN KEY([ResourceId])
REFERENCES [dbo].[Resource] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UsersLike] CHECK CONSTRAINT [FK_dbo.UsersLike_dbo.Resource_ResourceId]
GO
ALTER TABLE [dbo].[UsersLikeComment]  WITH CHECK ADD  CONSTRAINT [FK_dbo.UsersLikeComment_dbo.Comment_CommentId] FOREIGN KEY([CommentId])
REFERENCES [dbo].[Comment] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UsersLikeComment] CHECK CONSTRAINT [FK_dbo.UsersLikeComment_dbo.Comment_CommentId]
GO
ALTER TABLE [dbo].[UsersRating]  WITH CHECK ADD  CONSTRAINT [FK_UsersRating_Resource] FOREIGN KEY([ResourceId])
REFERENCES [dbo].[Resource] ([Id])
GO
ALTER TABLE [dbo].[UsersRating] CHECK CONSTRAINT [FK_UsersRating_Resource]
GO
