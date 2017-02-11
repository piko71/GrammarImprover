USE [Funnel]
GO

/****** Object:  Table [dbo].[Groups]    Script Date: 07/14/2016 4:18:59 PM ******/
DROP TABLE [dbo].[Groups]
GO

/****** Object:  Table [dbo].[Groups]    Script Date: 07/14/2016 4:18:59 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Groups](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_Groups] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


/****** Object:  Table [dbo].[Languages]    Script Date: 07/14/2016 4:19:36 PM ******/
DROP TABLE [dbo].[Languages]
GO

/****** Object:  Table [dbo].[Languages]    Script Date: 07/14/2016 4:19:36 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Languages](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OriginName] [nvarchar](max) NULL,
	[EngName] [nvarchar](max) NULL,
 CONSTRAINT [PK_Languages] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

/****** Object:  Table [dbo].[Roles]    Script Date: 07/14/2016 4:20:12 PM ******/
DROP TABLE [dbo].[Roles]
GO

/****** Object:  Table [dbo].[Roles]    Script Date: 07/14/2016 4:20:12 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Roles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

/****** Object:  Table [dbo].[Statuses]    Script Date: 07/14/2016 4:20:47 PM ******/
DROP TABLE [dbo].[Statuses]
GO

/****** Object:  Table [dbo].[Statuses]    Script Date: 07/14/2016 4:20:47 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Statuses](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Statuses] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

/****** Object:  Table [dbo].[Statuses]    Script Date: 07/14/2016 4:20:47 PM ******/
DROP TABLE [dbo].[Statuses]
GO

/****** Object:  Table [dbo].[Statuses]    Script Date: 07/14/2016 4:20:47 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Statuses](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Statuses] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[Words] DROP CONSTRAINT [FK_Words_Languages]
GO

ALTER TABLE [dbo].[Words] DROP CONSTRAINT [FK_Words_Groups]
GO

/****** Object:  Table [dbo].[Words]    Script Date: 07/14/2016 4:22:25 PM ******/
DROP TABLE [dbo].[Words]
GO

/****** Object:  Table [dbo].[Words]    Script Date: 07/14/2016 4:22:25 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Words](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[LanguageId] [int] NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Transcription] [nvarchar](max) NULL,
	[Video] [varbinary](max) NULL,
	[GroupId] [int] NOT NULL,
 CONSTRAINT [PK_Words] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[Words]  WITH CHECK ADD  CONSTRAINT [FK_Words_Groups] FOREIGN KEY([GroupId])
REFERENCES [dbo].[Groups] ([Id])
GO

ALTER TABLE [dbo].[Words] CHECK CONSTRAINT [FK_Words_Groups]
GO

ALTER TABLE [dbo].[Words]  WITH CHECK ADD  CONSTRAINT [FK_Words_Languages] FOREIGN KEY([LanguageId])
REFERENCES [dbo].[Languages] ([Id])
GO

ALTER TABLE [dbo].[Words] CHECK CONSTRAINT [FK_Words_Languages]
GO

ALTER TABLE [dbo].[Tasks] DROP CONSTRAINT [FK_Tasks_Users]
GO

ALTER TABLE [dbo].[Tasks] DROP CONSTRAINT [FK_Tasks_Statuses]
GO

ALTER TABLE [dbo].[Tasks] DROP CONSTRAINT [FK_Tasks_Languages]
GO

/****** Object:  Table [dbo].[Tasks]    Script Date: 07/14/2016 4:22:57 PM ******/
DROP TABLE [dbo].[Tasks]
GO

/****** Object:  Table [dbo].[Tasks]    Script Date: 07/14/2016 4:22:57 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Tasks](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[LangId] [int] NOT NULL,
	[StatusId] [int] NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[FinishDate] [datetime] NOT NULL,
	[LastUpdatedDate] [datetime] NOT NULL,
	[Words] [xml] NOT NULL,
 CONSTRAINT [PK_Tasks] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

ALTER TABLE [dbo].[Tasks]  WITH CHECK ADD  CONSTRAINT [FK_Tasks_Languages] FOREIGN KEY([LangId])
REFERENCES [dbo].[Languages] ([Id])
GO

ALTER TABLE [dbo].[Tasks] CHECK CONSTRAINT [FK_Tasks_Languages]
GO

ALTER TABLE [dbo].[Tasks]  WITH CHECK ADD  CONSTRAINT [FK_Tasks_Statuses] FOREIGN KEY([StatusId])
REFERENCES [dbo].[Statuses] ([Id])
GO

ALTER TABLE [dbo].[Tasks] CHECK CONSTRAINT [FK_Tasks_Statuses]
GO

ALTER TABLE [dbo].[Tasks]  WITH CHECK ADD  CONSTRAINT [FK_Tasks_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[Tasks] CHECK CONSTRAINT [FK_Tasks_Users]
GO




