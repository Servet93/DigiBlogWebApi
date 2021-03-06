USE [DigiturkBlogSystem]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 10.08.2020 21:56:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[ParentId] [int] NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([Id], [Name], [ParentId]) VALUES (8, N'Antalya Ve Çevresi', NULL)
INSERT [dbo].[Categories] ([Id], [Name], [ParentId]) VALUES (9, N'Ege Bölgesi', NULL)
INSERT [dbo].[Categories] ([Id], [Name], [ParentId]) VALUES (10, N'Istanbul Çevresi', NULL)
INSERT [dbo].[Categories] ([Id], [Name], [ParentId]) VALUES (11, N'Ankara Çevresi', NULL)
INSERT [dbo].[Categories] ([Id], [Name], [ParentId]) VALUES (12, N'Karadeniz ve Dogu Bölgeleri', NULL)
INSERT [dbo].[Categories] ([Id], [Name], [ParentId]) VALUES (13, N'Lara', 8)
INSERT [dbo].[Categories] ([Id], [Name], [ParentId]) VALUES (14, N'Kundu', 8)
INSERT [dbo].[Categories] ([Id], [Name], [ParentId]) VALUES (15, N'Antalya', 8)
INSERT [dbo].[Categories] ([Id], [Name], [ParentId]) VALUES (16, N'Alanya', 8)
INSERT [dbo].[Categories] ([Id], [Name], [ParentId]) VALUES (17, N'Olimpos', 8)
INSERT [dbo].[Categories] ([Id], [Name], [ParentId]) VALUES (18, N'Fethiye', 8)
INSERT [dbo].[Categories] ([Id], [Name], [ParentId]) VALUES (19, N'Kemer', 8)
INSERT [dbo].[Categories] ([Id], [Name], [ParentId]) VALUES (20, N'Marmaris', 9)
INSERT [dbo].[Categories] ([Id], [Name], [ParentId]) VALUES (21, N'Kazdagi', 9)
INSERT [dbo].[Categories] ([Id], [Name], [ParentId]) VALUES (22, N'Kusadasi', 9)
INSERT [dbo].[Categories] ([Id], [Name], [ParentId]) VALUES (23, N'Çesme', 9)
INSERT [dbo].[Categories] ([Id], [Name], [ParentId]) VALUES (24, N'Erdek', 9)
INSERT [dbo].[Categories] ([Id], [Name], [ParentId]) VALUES (25, N'Ortakent', 9)
INSERT [dbo].[Categories] ([Id], [Name], [ParentId]) VALUES (26, N'Foça', 9)
INSERT [dbo].[Categories] ([Id], [Name], [ParentId]) VALUES (27, N'Abant', 10)
INSERT [dbo].[Categories] ([Id], [Name], [ParentId]) VALUES (28, N'Bolu', 10)
INSERT [dbo].[Categories] ([Id], [Name], [ParentId]) VALUES (29, N'Izmit', 10)
INSERT [dbo].[Categories] ([Id], [Name], [ParentId]) VALUES (30, N'Kerpe', 10)
INSERT [dbo].[Categories] ([Id], [Name], [ParentId]) VALUES (31, N'Mudanya', 10)
INSERT [dbo].[Categories] ([Id], [Name], [ParentId]) VALUES (32, N'Safranbolu', 10)
INSERT [dbo].[Categories] ([Id], [Name], [ParentId]) VALUES (33, N'Sapanca', 10)
INSERT [dbo].[Categories] ([Id], [Name], [ParentId]) VALUES (34, N'Sile', 10)
INSERT [dbo].[Categories] ([Id], [Name], [ParentId]) VALUES (35, N'Uludag', 10)
INSERT [dbo].[Categories] ([Id], [Name], [ParentId]) VALUES (36, N'Gerede', 11)
INSERT [dbo].[Categories] ([Id], [Name], [ParentId]) VALUES (37, N'Ilgaz', 11)
INSERT [dbo].[Categories] ([Id], [Name], [ParentId]) VALUES (38, N'Kapadokya', 11)
INSERT [dbo].[Categories] ([Id], [Name], [ParentId]) VALUES (39, N'Uçhisar', 11)
INSERT [dbo].[Categories] ([Id], [Name], [ParentId]) VALUES (40, N'Ürgüp', 11)
INSERT [dbo].[Categories] ([Id], [Name], [ParentId]) VALUES (41, N'Kizilcahamam', 11)
INSERT [dbo].[Categories] ([Id], [Name], [ParentId]) VALUES (42, N'Rize', 12)
INSERT [dbo].[Categories] ([Id], [Name], [ParentId]) VALUES (43, N'Erzurum', 12)
INSERT [dbo].[Categories] ([Id], [Name], [ParentId]) VALUES (44, N'Kars', 12)
INSERT [dbo].[Categories] ([Id], [Name], [ParentId]) VALUES (45, N'Mardin', 12)
SET IDENTITY_INSERT [dbo].[Categories] OFF
ALTER TABLE [dbo].[Categories]  WITH CHECK ADD  CONSTRAINT [FK_Categories_Categories_ParentId] FOREIGN KEY([ParentId])
REFERENCES [dbo].[Categories] ([Id])
GO
ALTER TABLE [dbo].[Categories] CHECK CONSTRAINT [FK_Categories_Categories_ParentId]
GO
