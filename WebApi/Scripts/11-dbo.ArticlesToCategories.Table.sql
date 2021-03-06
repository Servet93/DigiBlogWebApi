USE [DigiturkBlogSystem]
GO
/****** Object:  Table [dbo].[ArticlesToCategories]    Script Date: 10.08.2020 22:24:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ArticlesToCategories](
	[ArticleId] [int] NOT NULL,
	[CategoryId] [int] NOT NULL,
 CONSTRAINT [PK_ArticlesToCategories] PRIMARY KEY CLUSTERED 
(
	[ArticleId] ASC,
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[ArticlesToCategories] ([ArticleId], [CategoryId]) VALUES (8, 8)
INSERT [dbo].[ArticlesToCategories] ([ArticleId], [CategoryId]) VALUES (9, 8)
INSERT [dbo].[ArticlesToCategories] ([ArticleId], [CategoryId]) VALUES (10, 8)
INSERT [dbo].[ArticlesToCategories] ([ArticleId], [CategoryId]) VALUES (13, 8)
INSERT [dbo].[ArticlesToCategories] ([ArticleId], [CategoryId]) VALUES (14, 8)
INSERT [dbo].[ArticlesToCategories] ([ArticleId], [CategoryId]) VALUES (18, 8)
INSERT [dbo].[ArticlesToCategories] ([ArticleId], [CategoryId]) VALUES (19, 8)
INSERT [dbo].[ArticlesToCategories] ([ArticleId], [CategoryId]) VALUES (21, 9)
INSERT [dbo].[ArticlesToCategories] ([ArticleId], [CategoryId]) VALUES (22, 9)
INSERT [dbo].[ArticlesToCategories] ([ArticleId], [CategoryId]) VALUES (24, 9)
INSERT [dbo].[ArticlesToCategories] ([ArticleId], [CategoryId]) VALUES (27, 9)
INSERT [dbo].[ArticlesToCategories] ([ArticleId], [CategoryId]) VALUES (29, 9)
INSERT [dbo].[ArticlesToCategories] ([ArticleId], [CategoryId]) VALUES (30, 9)
INSERT [dbo].[ArticlesToCategories] ([ArticleId], [CategoryId]) VALUES (31, 10)
INSERT [dbo].[ArticlesToCategories] ([ArticleId], [CategoryId]) VALUES (32, 10)
INSERT [dbo].[ArticlesToCategories] ([ArticleId], [CategoryId]) VALUES (34, 10)
INSERT [dbo].[ArticlesToCategories] ([ArticleId], [CategoryId]) VALUES (35, 10)
INSERT [dbo].[ArticlesToCategories] ([ArticleId], [CategoryId]) VALUES (36, 10)
INSERT [dbo].[ArticlesToCategories] ([ArticleId], [CategoryId]) VALUES (40, 10)
INSERT [dbo].[ArticlesToCategories] ([ArticleId], [CategoryId]) VALUES (41, 11)
INSERT [dbo].[ArticlesToCategories] ([ArticleId], [CategoryId]) VALUES (43, 11)
INSERT [dbo].[ArticlesToCategories] ([ArticleId], [CategoryId]) VALUES (45, 11)
INSERT [dbo].[ArticlesToCategories] ([ArticleId], [CategoryId]) VALUES (48, 11)
INSERT [dbo].[ArticlesToCategories] ([ArticleId], [CategoryId]) VALUES (49, 11)
INSERT [dbo].[ArticlesToCategories] ([ArticleId], [CategoryId]) VALUES (52, 12)
INSERT [dbo].[ArticlesToCategories] ([ArticleId], [CategoryId]) VALUES (53, 12)
INSERT [dbo].[ArticlesToCategories] ([ArticleId], [CategoryId]) VALUES (54, 12)
INSERT [dbo].[ArticlesToCategories] ([ArticleId], [CategoryId]) VALUES (55, 12)
INSERT [dbo].[ArticlesToCategories] ([ArticleId], [CategoryId]) VALUES (57, 12)
INSERT [dbo].[ArticlesToCategories] ([ArticleId], [CategoryId]) VALUES (58, 12)
INSERT [dbo].[ArticlesToCategories] ([ArticleId], [CategoryId]) VALUES (60, 12)
INSERT [dbo].[ArticlesToCategories] ([ArticleId], [CategoryId]) VALUES (68, 12)
INSERT [dbo].[ArticlesToCategories] ([ArticleId], [CategoryId]) VALUES (8, 13)
INSERT [dbo].[ArticlesToCategories] ([ArticleId], [CategoryId]) VALUES (9, 14)
INSERT [dbo].[ArticlesToCategories] ([ArticleId], [CategoryId]) VALUES (10, 15)
INSERT [dbo].[ArticlesToCategories] ([ArticleId], [CategoryId]) VALUES (13, 16)
INSERT [dbo].[ArticlesToCategories] ([ArticleId], [CategoryId]) VALUES (18, 16)
INSERT [dbo].[ArticlesToCategories] ([ArticleId], [CategoryId]) VALUES (19, 17)
INSERT [dbo].[ArticlesToCategories] ([ArticleId], [CategoryId]) VALUES (13, 18)
INSERT [dbo].[ArticlesToCategories] ([ArticleId], [CategoryId]) VALUES (14, 19)
INSERT [dbo].[ArticlesToCategories] ([ArticleId], [CategoryId]) VALUES (21, 20)
INSERT [dbo].[ArticlesToCategories] ([ArticleId], [CategoryId]) VALUES (68, 20)
INSERT [dbo].[ArticlesToCategories] ([ArticleId], [CategoryId]) VALUES (22, 21)
INSERT [dbo].[ArticlesToCategories] ([ArticleId], [CategoryId]) VALUES (29, 21)
INSERT [dbo].[ArticlesToCategories] ([ArticleId], [CategoryId]) VALUES (30, 22)
INSERT [dbo].[ArticlesToCategories] ([ArticleId], [CategoryId]) VALUES (24, 23)
INSERT [dbo].[ArticlesToCategories] ([ArticleId], [CategoryId]) VALUES (62, 25)
INSERT [dbo].[ArticlesToCategories] ([ArticleId], [CategoryId]) VALUES (63, 25)
INSERT [dbo].[ArticlesToCategories] ([ArticleId], [CategoryId]) VALUES (64, 25)
INSERT [dbo].[ArticlesToCategories] ([ArticleId], [CategoryId]) VALUES (65, 25)
INSERT [dbo].[ArticlesToCategories] ([ArticleId], [CategoryId]) VALUES (66, 25)
INSERT [dbo].[ArticlesToCategories] ([ArticleId], [CategoryId]) VALUES (67, 25)
INSERT [dbo].[ArticlesToCategories] ([ArticleId], [CategoryId]) VALUES (27, 26)
INSERT [dbo].[ArticlesToCategories] ([ArticleId], [CategoryId]) VALUES (62, 26)
INSERT [dbo].[ArticlesToCategories] ([ArticleId], [CategoryId]) VALUES (63, 26)
INSERT [dbo].[ArticlesToCategories] ([ArticleId], [CategoryId]) VALUES (64, 26)
INSERT [dbo].[ArticlesToCategories] ([ArticleId], [CategoryId]) VALUES (65, 26)
INSERT [dbo].[ArticlesToCategories] ([ArticleId], [CategoryId]) VALUES (66, 26)
INSERT [dbo].[ArticlesToCategories] ([ArticleId], [CategoryId]) VALUES (67, 26)
INSERT [dbo].[ArticlesToCategories] ([ArticleId], [CategoryId]) VALUES (31, 27)
INSERT [dbo].[ArticlesToCategories] ([ArticleId], [CategoryId]) VALUES (32, 28)
INSERT [dbo].[ArticlesToCategories] ([ArticleId], [CategoryId]) VALUES (34, 30)
INSERT [dbo].[ArticlesToCategories] ([ArticleId], [CategoryId]) VALUES (40, 30)
INSERT [dbo].[ArticlesToCategories] ([ArticleId], [CategoryId]) VALUES (35, 31)
INSERT [dbo].[ArticlesToCategories] ([ArticleId], [CategoryId]) VALUES (36, 32)
INSERT [dbo].[ArticlesToCategories] ([ArticleId], [CategoryId]) VALUES (41, 36)
INSERT [dbo].[ArticlesToCategories] ([ArticleId], [CategoryId]) VALUES (48, 37)
INSERT [dbo].[ArticlesToCategories] ([ArticleId], [CategoryId]) VALUES (43, 38)
INSERT [dbo].[ArticlesToCategories] ([ArticleId], [CategoryId]) VALUES (49, 38)
INSERT [dbo].[ArticlesToCategories] ([ArticleId], [CategoryId]) VALUES (45, 40)
INSERT [dbo].[ArticlesToCategories] ([ArticleId], [CategoryId]) VALUES (55, 42)
INSERT [dbo].[ArticlesToCategories] ([ArticleId], [CategoryId]) VALUES (52, 43)
INSERT [dbo].[ArticlesToCategories] ([ArticleId], [CategoryId]) VALUES (60, 43)
INSERT [dbo].[ArticlesToCategories] ([ArticleId], [CategoryId]) VALUES (53, 44)
INSERT [dbo].[ArticlesToCategories] ([ArticleId], [CategoryId]) VALUES (57, 44)
INSERT [dbo].[ArticlesToCategories] ([ArticleId], [CategoryId]) VALUES (54, 45)
INSERT [dbo].[ArticlesToCategories] ([ArticleId], [CategoryId]) VALUES (58, 45)
ALTER TABLE [dbo].[ArticlesToCategories]  WITH CHECK ADD  CONSTRAINT [FK_ArticlesToCategories_Articles_ArticleId] FOREIGN KEY([ArticleId])
REFERENCES [dbo].[Articles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ArticlesToCategories] CHECK CONSTRAINT [FK_ArticlesToCategories_Articles_ArticleId]
GO
ALTER TABLE [dbo].[ArticlesToCategories]  WITH CHECK ADD  CONSTRAINT [FK_ArticlesToCategories_Categories_CategoryId] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ArticlesToCategories] CHECK CONSTRAINT [FK_ArticlesToCategories_Categories_CategoryId]
GO
