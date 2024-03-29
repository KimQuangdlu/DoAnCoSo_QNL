USE [DoAn]
GO
/****** Object:  Table [dbo].[DanhMuc]    Script Date: 4/29/2020 11:11:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DanhMuc](
	[DanhMucID] [int] IDENTITY(1,1) NOT NULL,
	[TenDanhMuc] [nvarchar](50) NOT NULL,
	[DonViID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[DanhMucID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DonVi]    Script Date: 4/29/2020 11:11:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DonVi](
	[DonViID] [int] IDENTITY(1,1) NOT NULL,
	[TenDonVi] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[DonViID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HocVu]    Script Date: 4/29/2020 11:11:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HocVu](
	[HocVuID] [int] IDENTITY(1,1) NOT NULL,
	[NgayTao] [date] NOT NULL,
	[YeuCauThem] [ntext] NULL,
	[TinhTrang] [nvarchar](50) NOT NULL,
	[ParentID] [int] NOT NULL,
	[ChuyenVienID] [int] NOT NULL,
	[NgayHen] [date] NOT NULL,
	[DanhMucID] [int] NULL,
	[UserID] [int] NULL,
	[DonViID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[HocVuID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Lop]    Script Date: 4/29/2020 11:11:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lop](
	[LopID] [int] IDENTITY(1,1) NOT NULL,
	[TenLop] [nvarchar](50) NOT NULL,
	[DonViID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[LopID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Roles]    Script Date: 4/29/2020 11:11:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[RolesID] [int] IDENTITY(1,1) NOT NULL,
	[Ten] [nvarchar](50) NOT NULL,
	[Quyen] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RolesID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserInRoles]    Script Date: 4/29/2020 11:11:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserInRoles](
	[UserID] [int] NULL,
	[RolesID] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Users]    Script Date: 4/29/2020 11:11:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[Email] [varchar](30) NOT NULL,
	[DonViID] [int] NULL,
	[LopID] [int] NULL,
	[UserName] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[DanhMuc] ON 

INSERT [dbo].[DanhMuc] ([DanhMucID], [TenDanhMuc], [DonViID]) VALUES (1, N'Cấp bảng điểm', 1)
INSERT [dbo].[DanhMuc] ([DanhMucID], [TenDanhMuc], [DonViID]) VALUES (2, N'Cấp giấy xác nhận hoàn tất khóa học', 1)
INSERT [dbo].[DanhMuc] ([DanhMucID], [TenDanhMuc], [DonViID]) VALUES (3, N'Cấp bằng tốt nghiệp', 1)
INSERT [dbo].[DanhMuc] ([DanhMucID], [TenDanhMuc], [DonViID]) VALUES (6, N'abx', 1)
INSERT [dbo].[DanhMuc] ([DanhMucID], [TenDanhMuc], [DonViID]) VALUES (8, N'Nam', 2)
INSERT [dbo].[DanhMuc] ([DanhMucID], [TenDanhMuc], [DonViID]) VALUES (9, N'Edit', 2)
INSERT [dbo].[DanhMuc] ([DanhMucID], [TenDanhMuc], [DonViID]) VALUES (10, N'acb', 2)
SET IDENTITY_INSERT [dbo].[DanhMuc] OFF
SET IDENTITY_INSERT [dbo].[DonVi] ON 

INSERT [dbo].[DonVi] ([DonViID], [TenDonVi]) VALUES (1, N'Phòng hỗ trợ sinh viên')
INSERT [dbo].[DonVi] ([DonViID], [TenDonVi]) VALUES (2, N'Phòng Đào tạo')
SET IDENTITY_INSERT [dbo].[DonVi] OFF
SET IDENTITY_INSERT [dbo].[Lop] ON 

INSERT [dbo].[Lop] ([LopID], [TenLop], [DonViID]) VALUES (1, N'abc', NULL)
INSERT [dbo].[Lop] ([LopID], [TenLop], [DonViID]) VALUES (2, N'xyz', NULL)
SET IDENTITY_INSERT [dbo].[Lop] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserID], [Email], [DonViID], [LopID], [UserName]) VALUES (1, N'namabc@gmail.com', 2, 2, N'qwe')
INSERT [dbo].[Users] ([UserID], [Email], [DonViID], [LopID], [UserName]) VALUES (4, N'admin2@gmail.com', 2, 1, N'admin2')
INSERT [dbo].[Users] ([UserID], [Email], [DonViID], [LopID], [UserName]) VALUES (9, N'123@gmail.com', 1, 1, N'12')
SET IDENTITY_INSERT [dbo].[Users] OFF
ALTER TABLE [dbo].[DanhMuc]  WITH CHECK ADD FOREIGN KEY([DonViID])
REFERENCES [dbo].[DonVi] ([DonViID])
GO
ALTER TABLE [dbo].[HocVu]  WITH CHECK ADD FOREIGN KEY([DanhMucID])
REFERENCES [dbo].[DanhMuc] ([DanhMucID])
GO
ALTER TABLE [dbo].[HocVu]  WITH CHECK ADD FOREIGN KEY([DonViID])
REFERENCES [dbo].[DonVi] ([DonViID])
GO
ALTER TABLE [dbo].[HocVu]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Lop]  WITH CHECK ADD FOREIGN KEY([DonViID])
REFERENCES [dbo].[DonVi] ([DonViID])
GO
ALTER TABLE [dbo].[UserInRoles]  WITH CHECK ADD FOREIGN KEY([RolesID])
REFERENCES [dbo].[Roles] ([RolesID])
GO
ALTER TABLE [dbo].[UserInRoles]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD FOREIGN KEY([DonViID])
REFERENCES [dbo].[DonVi] ([DonViID])
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD FOREIGN KEY([LopID])
REFERENCES [dbo].[Lop] ([LopID])
GO
