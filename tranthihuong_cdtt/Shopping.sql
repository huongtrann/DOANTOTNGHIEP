USE [master]
GO
/****** Object:  Database [Shopping]    Script Date: 4/9/2023 12:07:51 PM ******/
CREATE DATABASE [Shopping]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Shopping', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Shopping.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Shopping_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Shopping_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Shopping] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Shopping].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Shopping] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Shopping] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Shopping] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Shopping] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Shopping] SET ARITHABORT OFF 
GO
ALTER DATABASE [Shopping] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Shopping] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Shopping] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Shopping] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Shopping] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Shopping] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Shopping] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Shopping] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Shopping] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Shopping] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Shopping] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Shopping] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Shopping] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Shopping] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Shopping] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Shopping] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Shopping] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Shopping] SET RECOVERY FULL 
GO
ALTER DATABASE [Shopping] SET  MULTI_USER 
GO
ALTER DATABASE [Shopping] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Shopping] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Shopping] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Shopping] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Shopping] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Shopping] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Shopping] SET QUERY_STORE = OFF
GO
USE [Shopping]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 4/9/2023 12:07:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 4/9/2023 12:07:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NULL,
	[ProductName] [nvarchar](50) NULL,
	[ProductPrice] [int] NULL,
	[Quantity] [int] NULL,
	[OrderID] [int] NULL,
	[ProductImage] [nvarchar](500) NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 4/9/2023 12:07:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[Status] [nvarchar](50) NULL,
	[DateOrder] [datetime] NULL,
	[DateShip] [datetime] NULL,
	[IsPaid] [bit] NULL,
	[FullName] [nvarchar](200) NULL,
	[Address] [nvarchar](500) NULL,
	[Note] [nvarchar](200) NULL,
	[Phone] [nvarchar](12) NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 4/9/2023 12:07:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[Price] [int] NULL,
	[CreatedBy] [int] NULL,
	[ViewCount] [int] NULL,
	[Image1] [nvarchar](500) NULL,
	[Image2] [nvarchar](500) NULL,
	[Image3] [nvarchar](500) NULL,
	[Quantity] [int] NULL,
	[PurchasedCount] [int] NULL,
	[Description] [nvarchar](max) NULL,
	[IsActive] [bit] NULL,
	[CategoryID] [int] NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 4/9/2023 12:07:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[Email] [nvarchar](50) NULL,
	[Captcha] [nvarchar](50) NULL,
	[IsConfirm] [bit] NULL,
	[Address] [nvarchar](500) NULL,
	[Phone] [nchar](12) NULL,
	[UserTypeID] [int] NULL,
	[Password] [nvarchar](50) NULL,
	[Avatar] [nvarchar](50) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserType]    Script Date: 4/9/2023 12:07:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_UserType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([ID], [Name], [IsActive]) VALUES (1, N'Đồ chơi xếp hình', 1)
INSERT [dbo].[Categories] ([ID], [Name], [IsActive]) VALUES (2, N'Đồ chơi búp bê', 1)
INSERT [dbo].[Categories] ([ID], [Name], [IsActive]) VALUES (3, N'Đồ chơi thông minh', 1)
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderDetails] ON 

INSERT [dbo].[OrderDetails] ([ID], [ProductID], [ProductName], [ProductPrice], [Quantity], [OrderID], [ProductImage]) VALUES (1, 1, N'Búp bê thời trang mini 3 trong 1 - Parisian Kitty', 1249000, 1, 1, N'590392euc.jpg')
INSERT [dbo].[OrderDetails] ([ID], [ProductID], [ProductName], [ProductPrice], [Quantity], [OrderID], [ProductImage]) VALUES (2, 1, N'Búp bê thời trang mini 3 trong 1 - Parisian Kitty', 1249000, 1, 2, N'590392euc.jpg')
INSERT [dbo].[OrderDetails] ([ID], [ProductID], [ProductName], [ProductPrice], [Quantity], [OrderID], [ProductImage]) VALUES (3, 1, N'Búp bê thời trang mini 3 trong 1 - Parisian Kitty', 1249000, 1, 3, N'590392euc.jpg')
INSERT [dbo].[OrderDetails] ([ID], [ProductID], [ProductName], [ProductPrice], [Quantity], [OrderID], [ProductImage]) VALUES (4, 1, N'Búp bê thời trang mini 3 trong 1 - Parisian Kitty', 1249000, 1, 4, N'590392euc.jpg')
INSERT [dbo].[OrderDetails] ([ID], [ProductID], [ProductName], [ProductPrice], [Quantity], [OrderID], [ProductImage]) VALUES (5, 1, N'Búp bê thời trang mini 3 trong 1 - Parisian Kitty', 1249000, 1, 5, N'590392euc.jpg')
INSERT [dbo].[OrderDetails] ([ID], [ProductID], [ProductName], [ProductPrice], [Quantity], [OrderID], [ProductImage]) VALUES (6, 1, N'Búp bê thời trang mini 3 trong 1 - Parisian Kitty', 1249000, 3, 6, N'590392euc.jpg')
INSERT [dbo].[OrderDetails] ([ID], [ProductID], [ProductName], [ProductPrice], [Quantity], [OrderID], [ProductImage]) VALUES (7, 1, N'Búp bê thời trang mini 3 trong 1 - Parisian Kitty', 1249000, 1, 7, N'590392euc.jpg')
INSERT [dbo].[OrderDetails] ([ID], [ProductID], [ProductName], [ProductPrice], [Quantity], [OrderID], [ProductImage]) VALUES (8, 2, N'Nhà ngói đỏ ấm áp', 1099000, 2, 8, N'wz6624z_3_.jpg')
SET IDENTITY_INSERT [dbo].[OrderDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([ID], [UserID], [Status], [DateOrder], [DateShip], [IsPaid], [FullName], [Address], [Note], [Phone]) VALUES (1, 2, N'Complete', CAST(N'2023-04-05T22:41:52.723' AS DateTime), CAST(N'2023-04-06T17:44:53.573' AS DateTime), 0, N'hương trần', N'213 trần đại nghĩa, hai bà trưng, hà nội', N'giao hàng giờ hành chính', N'0853968952  ')
INSERT [dbo].[Orders] ([ID], [UserID], [Status], [DateOrder], [DateShip], [IsPaid], [FullName], [Address], [Note], [Phone]) VALUES (2, 2, N'Processed', CAST(N'2023-04-05T22:45:41.587' AS DateTime), CAST(N'2023-04-09T17:45:14.010' AS DateTime), 0, N'hương trần', N'pr.jpg', NULL, N'0853968952  ')
INSERT [dbo].[Orders] ([ID], [UserID], [Status], [DateOrder], [DateShip], [IsPaid], [FullName], [Address], [Note], [Phone]) VALUES (3, 2, N'Complete', CAST(N'2023-04-06T17:42:16.450' AS DateTime), CAST(N'2023-04-06T17:44:57.020' AS DateTime), 1, N'hương trần', N'213 trần đại nghĩa, hai bà trưng, hà nội', N'giao hàng giờ hành chính', N'0853968952  ')
INSERT [dbo].[Orders] ([ID], [UserID], [Status], [DateOrder], [DateShip], [IsPaid], [FullName], [Address], [Note], [Phone]) VALUES (4, 2, N'Complete', CAST(N'2023-04-07T17:51:48.797' AS DateTime), CAST(N'2023-04-07T23:05:30.150' AS DateTime), 1, N'hương trần', N'213 trần đại nghĩa, hai bà trưng, hà nội', N'giao hàng giờ hành chính', N'0853968952  ')
INSERT [dbo].[Orders] ([ID], [UserID], [Status], [DateOrder], [DateShip], [IsPaid], [FullName], [Address], [Note], [Phone]) VALUES (5, 2, N'Processing', CAST(N'2023-04-07T17:52:27.230' AS DateTime), CAST(N'2023-04-10T17:52:27.230' AS DateTime), 0, N'hương trần', N'pr.jpg', NULL, N'0853968952  ')
INSERT [dbo].[Orders] ([ID], [UserID], [Status], [DateOrder], [DateShip], [IsPaid], [FullName], [Address], [Note], [Phone]) VALUES (6, 2, N'Processing', CAST(N'2023-04-08T09:44:29.600' AS DateTime), CAST(N'2023-04-11T09:44:29.600' AS DateTime), 0, N'hương trần', N'pr.jpg', NULL, N'0853968952  ')
INSERT [dbo].[Orders] ([ID], [UserID], [Status], [DateOrder], [DateShip], [IsPaid], [FullName], [Address], [Note], [Phone]) VALUES (7, 2, N'Complete', CAST(N'2023-04-08T09:46:13.997' AS DateTime), CAST(N'2023-04-08T09:49:11.260' AS DateTime), 1, N'hương trần', N'pr.jpg', NULL, N'0853968952  ')
INSERT [dbo].[Orders] ([ID], [UserID], [Status], [DateOrder], [DateShip], [IsPaid], [FullName], [Address], [Note], [Phone]) VALUES (8, 2, N'Complete', CAST(N'2023-04-08T22:46:43.860' AS DateTime), CAST(N'2023-04-08T22:48:31.043' AS DateTime), 1, N'Trần Thị Hương', N'213 trần đại nghĩa hai bà trưng hà nội', N'giao hàng giờ hành chính', N'0853968952  ')
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([ID], [Name], [Price], [CreatedBy], [ViewCount], [Image1], [Image2], [Image3], [Quantity], [PurchasedCount], [Description], [IsActive], [CategoryID]) VALUES (1, N'Búp bê thời trang mini 3 trong 1 - Parisian Kitty', 1249000, 1, 0, N'590392euc.jpg', N'590392euc_copy_7.jpg', N'590392euc_copy_3.jpg', 96, 4, N'Đồ Chơi Na Na Na Búp Bê Thời Trang Mini 3 Trong 1 - Parisian Kitty 
Balo thời trang 3 trong 1 của - Parisian Kitty  sành điệu, hứa hẹn sẽ là món quà đặc biệt dành tặng cho bé yêu. Chiếc balo với họa tiết hình chú mèo xinh xắn cùng bộ lông màu hồng mềm mượt có thể đựng vật dụng bé thích và mang đi khắp nơi.

Khi mở chiếc balo ra sẽ để lộ phòng ngủ gồm giường gấp, tủ kéo đựng quần áo, chăn, gối và bộ quần áo. Tất cả đều được trang trí với họa tiết chú mèo con rất đáng yêu. Đi kèm là cô nàng búp bê Parisian Kitty với outfit cực kỳ sành điệu cùng mái tóc dài cá tính.

Bé có thể tương tác với cô nàng cùng set đồ chơi và sáng tạo những câu chuyện cho riêng mình. Sau khi chơi xong bé có thể gấp gọn mọi thứ lại và kéo balo là xong.', 1, 2)
INSERT [dbo].[Products] ([ID], [Name], [Price], [CreatedBy], [ViewCount], [Image1], [Image2], [Image3], [Quantity], [PurchasedCount], [Description], [IsActive], [CategoryID]) VALUES (2, N'Nhà ngói đỏ ấm áp', 1099000, 1, 0, N'wz6624z_3_.jpg', N'wz6624z_2_.jpg', N'wz6624z_1_.jpg', 98, 2, N'Đồ Chơi LIL WOODZEEZ Nhà Ngói Đỏ Ấm Áp
Đồ chơi mô hình Lil Woodzeez – là sản phẩm hoàn hảo trong việc phát huy trí tưởng tượng của các bé. Sở hữu một ngôi nhà xinh xắn cùng với các nội thất nhỏ với hình dáng gần gũi với cuộc sống, đồ chơi mô phỏng cửa hàng này sẽ mang đến cho bé những giây phút vui chơi và học tập thú vị nhất. bao gồm: 1 Ngôi nhà đồng quê, 1 Gấu con, 1 Trang phục, 1 Ghế, 1 Xe tải đồ chơi, 1 Thư, 1 Giường, 1 Gối, Các nhân vật được Bán riêng.', 1, 1)
INSERT [dbo].[Products] ([ID], [Name], [Price], [CreatedBy], [ViewCount], [Image1], [Image2], [Image3], [Quantity], [PurchasedCount], [Description], [IsActive], [CategoryID]) VALUES (3, N'Xe vượt địa hình thế hệ mới ', 689000, 1, 0, N'vt1918-or_1_.jpg', N'vt1918-or_3_.jpg', N'vt1918-or_2_.jpg', 100, 0, N'Đồ Chơi VECTO Xe Vượt Địa Hình Thế Hệ Mới 
Là phiên bản nâng cấp của các mẫu xe vượt địa hình điều khiển từ xa trước đây. Xe vượt địa hình thế hệ mới được cải tiến cả từ bên ngoài lẫn bên trong, tạo nên một phiên bản hoàn hảo mà bé trai nào cũng muốn sở hữu cho mình một chiếc.

- Vẻ ngoài độc đáo với các đường nét được cắt dọc thân xe một cách mạnh mẽ, kết hợp cùng phong cách phối màu theo trường phái hiện đại tạo nên một vẻ ngoại quan độc nhất, mà khó có dòng xe nào trên thị trường sở hữu được.

- Chưa dừng lại ở đó, với hệ thống công nghệ tân tiến bên trong giúp xe di chuyển vô cùng mượt mà khi bé điều khiển. Chắc chắn giúp bé dễ dàng chinh phục mọi địa hình trên đường đua', 1, 3)
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([ID], [Name], [Email], [Captcha], [IsConfirm], [Address], [Phone], [UserTypeID], [Password], [Avatar]) VALUES (1, N'Amin', N'admin@gmail.com', N'123456', 1, N'213 trần đại nghĩa', N'1234567890  ', 1, N'123456', N'pr.jpg')
INSERT [dbo].[Users] ([ID], [Name], [Email], [Captcha], [IsConfirm], [Address], [Phone], [UserTypeID], [Password], [Avatar]) VALUES (2, N'Trần Thị Hương', N'tuonglaisang800@gmail.com', N'673261', 1, N'213 trần đại nghĩa hai bà trưng hà nội', N'0853968952  ', 2, N'1234567', NULL)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET IDENTITY_INSERT [dbo].[UserType] ON 

INSERT [dbo].[UserType] ([ID], [Name]) VALUES (1, N'Admin')
INSERT [dbo].[UserType] ([ID], [Name]) VALUES (2, N'Client')
SET IDENTITY_INSERT [dbo].[UserType] OFF
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK__OrderDeta__Order__25869641] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([ID])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK__OrderDeta__Order__25869641]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK__OrderDeta__Produ__24927208] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ID])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK__OrderDeta__Produ__24927208]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK__Products__Catego__239E4DCF] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Categories] ([ID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK__Products__Catego__239E4DCF]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK__Products__Create__276EDEB3] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK__Products__Create__276EDEB3]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD FOREIGN KEY([UserTypeID])
REFERENCES [dbo].[UserType] ([ID])
GO
USE [master]
GO
ALTER DATABASE [Shopping] SET  READ_WRITE 
GO
