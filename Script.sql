USE [master]
GO
/****** Object:  Database [CaChepFinal3]    Script Date: 19/12/2019 12:45:57 PM ******/
CREATE DATABASE [CaChepFinal3]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CaChepFinal3', FILENAME = N'C:\Users\thanh\CaChepFinal3.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CaChepFinal3_log', FILENAME = N'C:\Users\thanh\CaChepFinal3_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [CaChepFinal3] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CaChepFinal3].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CaChepFinal3] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CaChepFinal3] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CaChepFinal3] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CaChepFinal3] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CaChepFinal3] SET ARITHABORT OFF 
GO
ALTER DATABASE [CaChepFinal3] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [CaChepFinal3] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CaChepFinal3] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CaChepFinal3] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CaChepFinal3] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CaChepFinal3] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CaChepFinal3] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CaChepFinal3] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CaChepFinal3] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CaChepFinal3] SET  ENABLE_BROKER 
GO
ALTER DATABASE [CaChepFinal3] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CaChepFinal3] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CaChepFinal3] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CaChepFinal3] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CaChepFinal3] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CaChepFinal3] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [CaChepFinal3] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CaChepFinal3] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [CaChepFinal3] SET  MULTI_USER 
GO
ALTER DATABASE [CaChepFinal3] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CaChepFinal3] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CaChepFinal3] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CaChepFinal3] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CaChepFinal3] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [CaChepFinal3] SET QUERY_STORE = OFF
GO
USE [CaChepFinal3]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [CaChepFinal3]
GO
/****** Object:  UserDefinedFunction [dbo].[fnTongTienDichVuByDatPhongId]    Script Date: 19/12/2019 12:45:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create FUNCTION [dbo].[fnTongTienDichVuByDatPhongId]( @IdDatPhong int =0)
 RETURNS money 
 BEGIN
    RETURN (select sum(TongTien)
    from
        (SELECT TongTien = (a.SoLuong*b.Price)
        from ChiTietDichVuDatPhongs a, DichVus b
        WHERE a.DatPhongId=1
            and a.DichVuId=b.Id)c
)
END;
GO
/****** Object:  UserDefinedFunction [dbo].[fnTongTienPhongByDatPhongId]    Script Date: 19/12/2019 12:45:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create FUNCTION [dbo].[fnTongTienPhongByDatPhongId]( @IdDatPhong int =0)
 RETURNS money 
 BEGIN
    RETURN ( select sum(b.Price)
    from ChiTietDatPhongs a, Phongs  b
    where DatPhongId =@IdDatPhong
        and a.PhongId=b.Id )
END;
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 19/12/2019 12:45:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 19/12/2019 12:45:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 19/12/2019 12:45:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 19/12/2019 12:45:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 19/12/2019 12:45:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 19/12/2019 12:45:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 19/12/2019 12:45:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Discriminator] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 19/12/2019 12:45:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](128) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChiTietDatPhongs]    Script Date: 19/12/2019 12:45:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietDatPhongs](
	[DatPhongId] [int] NOT NULL,
	[PhongId] [int] NOT NULL,
	[ThoiGian] [datetime2](7) NOT NULL,
	[TrangThaiId] [int] NOT NULL,
 CONSTRAINT [PK_ChiTietDatPhongs] PRIMARY KEY CLUSTERED 
(
	[DatPhongId] ASC,
	[PhongId] ASC,
	[ThoiGian] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChiTietDichVuDatPhongs]    Script Date: 19/12/2019 12:45:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietDichVuDatPhongs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DatPhongId] [int] NOT NULL,
	[DichVuId] [int] NOT NULL,
	[SoLuong] [int] NOT NULL,
 CONSTRAINT [PK_ChiTietDichVuDatPhongs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChuongTrinhs]    Script Date: 19/12/2019 12:45:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChuongTrinhs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TenChuongTrinh] [nvarchar](max) NOT NULL,
	[TiLeThayDoiGia] [int] NOT NULL,
	[IsTang] [bit] NOT NULL,
 CONSTRAINT [PK_ChuongTrinhs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DatPhongs]    Script Date: 19/12/2019 12:45:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DatPhongs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TenNguoiDat] [nvarchar](max) NULL,
	[Address] [nvarchar](max) NULL,
	[Cmnd] [nvarchar](max) NULL,
	[Sdt] [nvarchar](max) NULL,
	[TienDatCoc] [money] NOT NULL,
	[ThoiGianNhanPhongDuKien] [datetime2](7) NOT NULL,
	[ThoiGianTraPhongDuKien] [datetime2](7) NOT NULL,
	[TongTien] [money] NOT NULL,
	[AccoutId] [int] NULL,
	[AccountId] [nvarchar](450) NULL,
 CONSTRAINT [PK_DatPhongs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DichVus]    Script Date: 19/12/2019 12:45:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DichVus](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[ShortDescription] [nvarchar](max) NULL,
	[Price] [money] NOT NULL,
	[ImageUrl] [nvarchar](max) NULL,
	[InStock] [int] NULL,
	[LoaiDvid] [int] NOT NULL,
 CONSTRAINT [PK_DichVus] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HinhPhongs]    Script Date: 19/12/2019 12:45:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HinhPhongs](
	[HinhId] [int] IDENTITY(1,1) NOT NULL,
	[PhongId] [int] NOT NULL,
	[HinhUrl] [nvarchar](max) NULL,
 CONSTRAINT [PK_HinhPhongs] PRIMARY KEY CLUSTERED 
(
	[HinhId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoaiDichVus]    Script Date: 19/12/2019 12:45:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiDichVus](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_LoaiDichVus] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoaiPhongs]    Script Date: 19/12/2019 12:45:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiPhongs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[HinhUrl] [nvarchar](max) NULL,
	[ShortDescription] [nvarchar](max) NULL,
 CONSTRAINT [PK_LoaiPhongs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Phongs]    Script Date: 19/12/2019 12:45:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Phongs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[ShortDescription] [nvarchar](max) NULL,
	[Price] [money] NOT NULL,
	[LoaiPhongId] [int] NULL,
	[ChuongTrinhId] [int] NULL,
	[HinhUrl] [nvarchar](max) NULL,
 CONSTRAINT [PK_Phongs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TrangThais]    Script Date: 19/12/2019 12:45:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TrangThais](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_TrangThais] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'00000000000000_CreateIdentitySchema', N'3.0.0')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20191204232407_ver1', N'3.0.0')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20191206045526_addHinhUrl', N'3.0.0')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20191206081328_addLP', N'3.0.0')
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'254fac14-1a71-408a-84a2-8cad64c18e51', N'Super Admin', N'SUPER ADMIN', N'958f12db-25b5-4bd9-88f2-36e9fae20baa')
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'ee9030e0-cb42-4cb6-ba36-952ffbd3ba7e', N'Admins', N'ADMINS', N'7d6f8a12-b6e7-438d-b94a-11ffd0785895')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'1886fdb2-95ee-4215-b027-1a0c62de9e93', N'254fac14-1a71-408a-84a2-8cad64c18e51')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'6ea5b82b-29a7-4be1-80c5-a890acdf3444', N'254fac14-1a71-408a-84a2-8cad64c18e51')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'e6fed860-82c2-4dde-9d30-bebd2224c125', N'254fac14-1a71-408a-84a2-8cad64c18e51')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'3931e7ed-3d51-43c4-bdf1-169e33088e54', N'ee9030e0-cb42-4cb6-ba36-952ffbd3ba7e')
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Name], [Discriminator]) VALUES (N'1886fdb2-95ee-4215-b027-1a0c62de9e93', N'aaa@gmail.com', N'AAA@GMAIL.COM', N'aaa@gmail.com', N'AAA@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEN2MZV5JxUmjryiBQOziBTEs8KBC5cy4LZikCFR4aIpOGOXdRxY42ofmIUhbH8PBXg==', N'2ZFHMZDVS3U45ITDWKDR2PD5NV2P3DCK', N'9bca1efe-0e19-4984-910f-292ce05a1c13', N'789', 0, 0, NULL, 1, 0, N'admin', N'AccountSys')
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Name], [Discriminator]) VALUES (N'3931e7ed-3d51-43c4-bdf1-169e33088e54', N'bbb@gmail.com', N'BBB@GMAIL.COM', N'bbb@gmail.com', N'BBB@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEP4AI9Q7Qg8iriC6TVlWqr4Rotk904bc7t+bSI8De11/LeedNWdz8lk1pMMIIcSyrg==', N'J4R4AJJMPJ5WOEPKTIZRH5O6VKWTULJK', N'17396416-9941-43ef-bc64-abccda2ab5af', N'234234', 0, 0, NULL, 1, 0, N'bbb', N'AccountSys')
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Name], [Discriminator]) VALUES (N'6ea5b82b-29a7-4be1-80c5-a890acdf3444', N'admin@gmail.com', N'ADMIN@GMAIL.COM', N'admin@gmail.com', N'ADMIN@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEBTVv96Rf1LVyAp3PYul1v9O++5tpa/1Z0+2PLrfFPDm/h7lTKcXN3sZymBua4n3hg==', N'SFTKDXMFU36UOZWQ5LPBWUMLIDO7X622', N'9ff7cea5-7f7b-4531-8bad-e92d1d6e18df', N'234234', 0, 0, CAST(N'3019-12-13T15:08:40.0575404+07:00' AS DateTimeOffset), 1, 0, N'admin@gmail.com', N'AccountSys')
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Name], [Discriminator]) VALUES (N'e6fed860-82c2-4dde-9d30-bebd2224c125', N'phuocnglt@gmail.com', N'PHUOCNGLT@GMAIL.COM', N'phuocnglt@gmail.com', N'PHUOCNGLT@GMAIL.COM', 1, N'AQAAAAEAACcQAAAAEJ84YeWIUGnRavyHTQb3Zcx5ygsK23VnUhMjD5jS75Y/36+rpnk85Mb6dbD6kbkHeA==', N'CNUTQL635HPJNXWJN7PDDU7PKCFPWFMM', N'ba50a1b6-8248-4576-8525-0d0c0ee43b31', NULL, 0, 0, NULL, 1, 0, N'Nguyen Duy Phuoc', N'AccountSys')
SET IDENTITY_INSERT [dbo].[ChiTietDichVuDatPhongs] ON 

INSERT [dbo].[ChiTietDichVuDatPhongs] ([Id], [DatPhongId], [DichVuId], [SoLuong]) VALUES (1, 1, 1, 2)
INSERT [dbo].[ChiTietDichVuDatPhongs] ([Id], [DatPhongId], [DichVuId], [SoLuong]) VALUES (2, 1, 2, 2)
SET IDENTITY_INSERT [dbo].[ChiTietDichVuDatPhongs] OFF
SET IDENTITY_INSERT [dbo].[DatPhongs] ON 

INSERT [dbo].[DatPhongs] ([Id], [TenNguoiDat], [Address], [Cmnd], [Sdt], [TienDatCoc], [ThoiGianNhanPhongDuKien], [ThoiGianTraPhongDuKien], [TongTien], [AccoutId], [AccountId]) VALUES (1, N'Nguyen Phuoc', N'149', N'281212911', N'0937536545', 50000.0000, CAST(N'2019-11-22T00:00:00.0000000' AS DateTime2), CAST(N'2019-11-24T00:00:00.0000000' AS DateTime2), 7000000.0000, NULL, NULL)
INSERT [dbo].[DatPhongs] ([Id], [TenNguoiDat], [Address], [Cmnd], [Sdt], [TienDatCoc], [ThoiGianNhanPhongDuKien], [ThoiGianTraPhongDuKien], [TongTien], [AccoutId], [AccountId]) VALUES (2, N'Nguyen Truc', N'149', N'281212910', N'01264079973', 50000.0000, CAST(N'2019-12-03T00:00:00.0000000' AS DateTime2), CAST(N'2019-12-06T00:00:00.0000000' AS DateTime2), 4000000.0000, NULL, NULL)
INSERT [dbo].[DatPhongs] ([Id], [TenNguoiDat], [Address], [Cmnd], [Sdt], [TienDatCoc], [ThoiGianNhanPhongDuKien], [ThoiGianTraPhongDuKien], [TongTien], [AccoutId], [AccountId]) VALUES (3, N'Phan Tuyen', N'22', N'281212915', N'01626364802', 50000.0000, CAST(N'2019-12-23T00:00:00.0000000' AS DateTime2), CAST(N'2019-12-25T00:00:00.0000000' AS DateTime2), 5000000.0000, NULL, NULL)
SET IDENTITY_INSERT [dbo].[DatPhongs] OFF
SET IDENTITY_INSERT [dbo].[DichVus] ON 

INSERT [dbo].[DichVus] ([Id], [Name], [ShortDescription], [Price], [ImageUrl], [InStock], [LoaiDvid]) VALUES (1, N'NuocTangLuc', NULL, 15000.0000, NULL, 100, 1)
INSERT [dbo].[DichVus] ([Id], [Name], [ShortDescription], [Price], [ImageUrl], [InStock], [LoaiDvid]) VALUES (2, N'NuocSuoi', NULL, 15000.0000, NULL, 100, 1)
SET IDENTITY_INSERT [dbo].[DichVus] OFF
SET IDENTITY_INSERT [dbo].[LoaiDichVus] ON 

INSERT [dbo].[LoaiDichVus] ([Id], [Name], [Description]) VALUES (1, N'Thuc An', N'notthing')
INSERT [dbo].[LoaiDichVus] ([Id], [Name], [Description]) VALUES (2, N'Nuoc Uong', N'notthing')
SET IDENTITY_INSERT [dbo].[LoaiDichVus] OFF
SET IDENTITY_INSERT [dbo].[LoaiPhongs] ON 

INSERT [dbo].[LoaiPhongs] ([Id], [Name], [HinhUrl], [ShortDescription]) VALUES (1, N'DELUXE ROOM', NULL, NULL)
INSERT [dbo].[LoaiPhongs] ([Id], [Name], [HinhUrl], [ShortDescription]) VALUES (2, N'SUPERIOR ROOM', NULL, NULL)
INSERT [dbo].[LoaiPhongs] ([Id], [Name], [HinhUrl], [ShortDescription]) VALUES (3, N'SUITES ROOM', NULL, NULL)
INSERT [dbo].[LoaiPhongs] ([Id], [Name], [HinhUrl], [ShortDescription]) VALUES (4, N'BUNGALOW LUXURY', NULL, NULL)
SET IDENTITY_INSERT [dbo].[LoaiPhongs] OFF
SET IDENTITY_INSERT [dbo].[Phongs] ON 

INSERT [dbo].[Phongs] ([Id], [Name], [ShortDescription], [Price], [LoaiPhongId], [ChuongTrinhId], [HinhUrl]) VALUES (1, N'101', N'- Area: 45m2', 150000.0000, 1, NULL, N'\images\RoomImages\1.jpg')
INSERT [dbo].[Phongs] ([Id], [Name], [ShortDescription], [Price], [LoaiPhongId], [ChuongTrinhId], [HinhUrl]) VALUES (2, N'102', N'- Area: 20m2- 1 double bed or 2 single beds- Bathroom with glass wall and shower- International direct dial telephone- Cable TV- Air conditioner- Tea and coffee table- Wifi and free internet- Room service', 150000.0000, 2, NULL, N'\images\RoomImages\2.jpg')
INSERT [dbo].[Phongs] ([Id], [Name], [ShortDescription], [Price], [LoaiPhongId], [ChuongTrinhId], [HinhUrl]) VALUES (3, N'103', N'- Area of 70m2- Living room with leather lounge- Kingsize bed with blanket, sheet, feather pillow 100% cotton- Sony 40 inch LCD TV- Wifi and free internet- Desk- Two-way air conditioning with large capacity- Tea table with free tea and coffee- Minibar and soft drinks- Room service- International direct dial telephone- Bathtub with shower and hot and cold water system- Free parking at the resort', 150000.0000, 1, NULL, N'\images\RoomImages\3.jpg')
INSERT [dbo].[Phongs] ([Id], [Name], [ShortDescription], [Price], [LoaiPhongId], [ChuongTrinhId], [HinhUrl]) VALUES (4, N'104', N'- Area of 100m2- Living room with leather upholstery- Luxurious chandeliers- Double kingsize bed with feather, sheet, 100% cotton feather pillows- Sony 40 inch LCD TV- Free Wifi high speed- Two-way air conditioning with large capacity.- Tea table with free tea and coffee- Desk- Minibar and soft drinks.- Steam bath with hot and cold water system- International direct dial telephone- Free parking at the resort.- 3 service staff', 170000.0000, 1, NULL, N'\images\RoomImages\4.jpg')
SET IDENTITY_INSERT [dbo].[Phongs] OFF
SET IDENTITY_INSERT [dbo].[TrangThais] ON 

INSERT [dbo].[TrangThais] ([Id], [Name]) VALUES (1, N'Chưa Nhận')
INSERT [dbo].[TrangThais] ([Id], [Name]) VALUES (2, N'Đã Nhận')
INSERT [dbo].[TrangThais] ([Id], [Name]) VALUES (3, N'Đã Thanh Toán')
SET IDENTITY_INSERT [dbo].[TrangThais] OFF
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetRoleClaims_RoleId]    Script Date: 19/12/2019 12:45:57 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetRoleClaims_RoleId] ON [dbo].[AspNetRoleClaims]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 19/12/2019 12:45:57 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[NormalizedName] ASC
)
WHERE ([NormalizedName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserClaims_UserId]    Script Date: 19/12/2019 12:45:57 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserClaims_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserLogins_UserId]    Script Date: 19/12/2019 12:45:57 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserLogins_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserRoles_RoleId]    Script Date: 19/12/2019 12:45:57 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserRoles_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [EmailIndex]    Script Date: 19/12/2019 12:45:57 PM ******/
CREATE NONCLUSTERED INDEX [EmailIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 19/12/2019 12:45:57 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedUserName] ASC
)
WHERE ([NormalizedUserName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ChiTietDatPhongs_PhongId]    Script Date: 19/12/2019 12:45:57 PM ******/
CREATE NONCLUSTERED INDEX [IX_ChiTietDatPhongs_PhongId] ON [dbo].[ChiTietDatPhongs]
(
	[PhongId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ChiTietDatPhongs_TrangThaiId]    Script Date: 19/12/2019 12:45:57 PM ******/
CREATE NONCLUSTERED INDEX [IX_ChiTietDatPhongs_TrangThaiId] ON [dbo].[ChiTietDatPhongs]
(
	[TrangThaiId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ChiTietDichVuDatPhongs_DatPhongId]    Script Date: 19/12/2019 12:45:57 PM ******/
CREATE NONCLUSTERED INDEX [IX_ChiTietDichVuDatPhongs_DatPhongId] ON [dbo].[ChiTietDichVuDatPhongs]
(
	[DatPhongId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ChiTietDichVuDatPhongs_DichVuId]    Script Date: 19/12/2019 12:45:57 PM ******/
CREATE NONCLUSTERED INDEX [IX_ChiTietDichVuDatPhongs_DichVuId] ON [dbo].[ChiTietDichVuDatPhongs]
(
	[DichVuId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_DatPhongs_AccountId]    Script Date: 19/12/2019 12:45:57 PM ******/
CREATE NONCLUSTERED INDEX [IX_DatPhongs_AccountId] ON [dbo].[DatPhongs]
(
	[AccountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_DichVus_LoaiDvid]    Script Date: 19/12/2019 12:45:57 PM ******/
CREATE NONCLUSTERED INDEX [IX_DichVus_LoaiDvid] ON [dbo].[DichVus]
(
	[LoaiDvid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_HinhPhongs_PhongId]    Script Date: 19/12/2019 12:45:57 PM ******/
CREATE NONCLUSTERED INDEX [IX_HinhPhongs_PhongId] ON [dbo].[HinhPhongs]
(
	[PhongId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Phongs_ChuongTrinhId]    Script Date: 19/12/2019 12:45:57 PM ******/
CREATE NONCLUSTERED INDEX [IX_Phongs_ChuongTrinhId] ON [dbo].[Phongs]
(
	[ChuongTrinhId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Phongs_LoaiPhongId]    Script Date: 19/12/2019 12:45:57 PM ******/
CREATE NONCLUSTERED INDEX [IX_Phongs_LoaiPhongId] ON [dbo].[Phongs]
(
	[LoaiPhongId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AspNetUsers] ADD  DEFAULT (N'') FOR [Discriminator]
GO
ALTER TABLE [dbo].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetRoleClaims] CHECK CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserTokens] CHECK CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[ChiTietDatPhongs]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietDatPhongs_DatPhongs_DatPhongId] FOREIGN KEY([DatPhongId])
REFERENCES [dbo].[DatPhongs] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ChiTietDatPhongs] CHECK CONSTRAINT [FK_ChiTietDatPhongs_DatPhongs_DatPhongId]
GO
ALTER TABLE [dbo].[ChiTietDatPhongs]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietDatPhongs_Phongs_PhongId] FOREIGN KEY([PhongId])
REFERENCES [dbo].[Phongs] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ChiTietDatPhongs] CHECK CONSTRAINT [FK_ChiTietDatPhongs_Phongs_PhongId]
GO
ALTER TABLE [dbo].[ChiTietDatPhongs]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietDatPhongs_TrangThais_TrangThaiId] FOREIGN KEY([TrangThaiId])
REFERENCES [dbo].[TrangThais] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ChiTietDatPhongs] CHECK CONSTRAINT [FK_ChiTietDatPhongs_TrangThais_TrangThaiId]
GO
ALTER TABLE [dbo].[ChiTietDichVuDatPhongs]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietDichVuDatPhongs_DatPhongs_DatPhongId] FOREIGN KEY([DatPhongId])
REFERENCES [dbo].[DatPhongs] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ChiTietDichVuDatPhongs] CHECK CONSTRAINT [FK_ChiTietDichVuDatPhongs_DatPhongs_DatPhongId]
GO
ALTER TABLE [dbo].[ChiTietDichVuDatPhongs]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietDichVuDatPhongs_DichVus_DichVuId] FOREIGN KEY([DichVuId])
REFERENCES [dbo].[DichVus] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ChiTietDichVuDatPhongs] CHECK CONSTRAINT [FK_ChiTietDichVuDatPhongs_DichVus_DichVuId]
GO
ALTER TABLE [dbo].[DatPhongs]  WITH CHECK ADD  CONSTRAINT [FK_DatPhongs_AspNetUsers_AccountId] FOREIGN KEY([AccountId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[DatPhongs] CHECK CONSTRAINT [FK_DatPhongs_AspNetUsers_AccountId]
GO
ALTER TABLE [dbo].[DichVus]  WITH CHECK ADD  CONSTRAINT [FK_DichVus_LoaiDichVus_LoaiDvid] FOREIGN KEY([LoaiDvid])
REFERENCES [dbo].[LoaiDichVus] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DichVus] CHECK CONSTRAINT [FK_DichVus_LoaiDichVus_LoaiDvid]
GO
ALTER TABLE [dbo].[HinhPhongs]  WITH CHECK ADD  CONSTRAINT [FK_HinhPhong_Phongs] FOREIGN KEY([PhongId])
REFERENCES [dbo].[Phongs] ([Id])
GO
ALTER TABLE [dbo].[HinhPhongs] CHECK CONSTRAINT [FK_HinhPhong_Phongs]
GO
ALTER TABLE [dbo].[Phongs]  WITH CHECK ADD  CONSTRAINT [FK_Phongs_ChuongTrinh] FOREIGN KEY([ChuongTrinhId])
REFERENCES [dbo].[ChuongTrinhs] ([Id])
GO
ALTER TABLE [dbo].[Phongs] CHECK CONSTRAINT [FK_Phongs_ChuongTrinh]
GO
ALTER TABLE [dbo].[Phongs]  WITH CHECK ADD  CONSTRAINT [FK_Phongs_LoaiPhongs] FOREIGN KEY([LoaiPhongId])
REFERENCES [dbo].[LoaiPhongs] ([Id])
GO
ALTER TABLE [dbo].[Phongs] CHECK CONSTRAINT [FK_Phongs_LoaiPhongs]
GO
/****** Object:  StoredProcedure [dbo].[GetChiTietDatPhong_ByIdDatPhong]    Script Date: 19/12/2019 12:45:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetChiTietDatPhong_ByIdDatPhong]
    @Id int  = 0
AS

SELECT *
FROM ChiTietDatPhongs
WHERE DatPhongId =@Id 
GO
/****** Object:  StoredProcedure [dbo].[GetChiTietDatPhongBy_IdDatPhong_IdPhong_ThoiGian]    Script Date: 19/12/2019 12:45:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetChiTietDatPhongBy_IdDatPhong_IdPhong_ThoiGian]
    @DatPhongId  int = 0,
    @PhongId  int  = 0

AS

SELECT *
from ChiTietDatPhongs
where ChiTietDatPhongs.DatPhongId= @DatPhongId
    and PhongId = @PhongId
    and ThoiGian >=  (SELECT CAST(getdate() AS date))
GO
/****** Object:  StoredProcedure [dbo].[GetOneDatPhongById]    Script Date: 19/12/2019 12:45:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Create the stored procedure in the specified schema
CREATE PROCEDURE [dbo].[GetOneDatPhongById]
    @Id  int  = 0
AS
SELECT *
FROM DatPhongs
WHERE Id=@Id
GO
/****** Object:  StoredProcedure [dbo].[GetOneDichVuById]    Script Date: 19/12/2019 12:45:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetOneDichVuById]
    @Id int =0
AS
SELECT *
from DichVus
where Id=@Id
GO
/****** Object:  StoredProcedure [dbo].[GetOnePhongById]    Script Date: 19/12/2019 12:45:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetOnePhongById]
    @Id int =0
AS
SELECT *
from Phongs
where Id=@Id
GO
/****** Object:  StoredProcedure [dbo].[GetOneTrangThaiById]    Script Date: 19/12/2019 12:45:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetOneTrangThaiById]
    @Id  int = 0
AS
-- body of the stored procedure
SELECT *
FROM TrangThais
where Id=@Id
GO
/****** Object:  StoredProcedure [dbo].[GetSortedDatPhongsBySomthing]    Script Date: 19/12/2019 12:45:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[GetSortedDatPhongsBySomthing]
    @colname AS sysname,
    @TypeSort AS CHAR(1) = 'I'
AS
IF @colname NOT IN(N'TongTien', N'ThoiGianNhanPhongDuKien',N'ThoiGianTraPhongDuKien',N'TenNguoiDat')
 THROW 50001,'Column name not supported. Possibly a SQL injection attempt.', 1;

DECLARE @sql AS NVARCHAR(1000);
SET @sql = N'SELECT * FROM dbo.DatPhongs ORDER BY '
 + QUOTENAME(@colname) +
 CASE @TypeSort WHEN 'D' THEN N' DESC' ELSE '' END + ';';

EXEC sys.sp_executesql @stmt = @sql;
GO
/****** Object:  StoredProcedure [dbo].[spCapNhatTongTienOnePhieuDatPhong]    Script Date: 19/12/2019 12:45:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spCapNhatTongTienOnePhieuDatPhong]
    @Id int =0
as
BEGIN
    IF(@Id is not null)
        UPDATE DatPhongs
        SET TongTien = dbo.fnTongTienPhongByDatPhongId(@Id) + dbo.fnTongTienDichVuByDatPhongId(1)
        WHERE Id=@Id;
    ELSE
   THROW 50001, 'không tồn tại id', 1;
END;
GO
/****** Object:  StoredProcedure [dbo].[TimPhongDangDcDat]    Script Date: 19/12/2019 12:45:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[TimPhongDangDcDat]
    @ThoiGianNhan DATETIME = NULL,
    @ThoiGianTra DATETIME = NULL
AS
    -- body of the stored procedure
    SELECT distinct  PhongId FROM
    ChiTietDatPhongs
    WHERE @ThoiGianNhan <=ThoiGian and ThoiGian <=@ThoiGianTra   
    
    
GO
/****** Object:  StoredProcedure [dbo].[TimPhongLienTuc]    Script Date: 19/12/2019 12:45:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[TimPhongLienTuc]
    @ThoiGianNhan DATETIME = NULL,
    @ThoiGianTra DATETIME = NULL
AS
    -- body of the stored procedure
  SELECT * from Phongs WHERE Id not IN
  (SELECT distinct  PhongId FROM
    ChiTietDatPhongs
    WHERE @ThoiGianNhan <=ThoiGian and ThoiGian <=@ThoiGianTra)   
    
    
GO
USE [master]
GO
ALTER DATABASE [CaChepFinal3] SET  READ_WRITE 
GO
