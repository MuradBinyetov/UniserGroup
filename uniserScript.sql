USE [master]
GO
/****** Object:  Database [UniserGroup]    Script Date: 10-Aug-22 14:03:32 ******/
CREATE DATABASE [UniserGroup]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'UniserGroup', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\UniserGroup.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'UniserGroup_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\UniserGroup_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [UniserGroup] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [UniserGroup].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [UniserGroup] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [UniserGroup] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [UniserGroup] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [UniserGroup] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [UniserGroup] SET ARITHABORT OFF 
GO
ALTER DATABASE [UniserGroup] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [UniserGroup] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [UniserGroup] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [UniserGroup] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [UniserGroup] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [UniserGroup] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [UniserGroup] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [UniserGroup] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [UniserGroup] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [UniserGroup] SET  ENABLE_BROKER 
GO
ALTER DATABASE [UniserGroup] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [UniserGroup] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [UniserGroup] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [UniserGroup] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [UniserGroup] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [UniserGroup] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [UniserGroup] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [UniserGroup] SET RECOVERY FULL 
GO
ALTER DATABASE [UniserGroup] SET  MULTI_USER 
GO
ALTER DATABASE [UniserGroup] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [UniserGroup] SET DB_CHAINING OFF 
GO
ALTER DATABASE [UniserGroup] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [UniserGroup] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [UniserGroup] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'UniserGroup', N'ON'
GO
ALTER DATABASE [UniserGroup] SET QUERY_STORE = OFF
GO
USE [UniserGroup]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 10-Aug-22 14:03:32 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Addresses]    Script Date: 10-Aug-22 14:03:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Addresses](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NULL,
	[ApplicationUserId] [nvarchar](450) NULL,
 CONSTRAINT [PK_Addresses] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 10-Aug-22 14:03:32 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 10-Aug-22 14:03:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[Discriminator] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 10-Aug-22 14:03:32 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 10-Aug-22 14:03:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](450) NOT NULL,
	[ProviderKey] [nvarchar](450) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 10-Aug-22 14:03:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
	[Discriminator] [nvarchar](max) NOT NULL,
	[RoleId1] [nvarchar](450) NULL,
	[UserId1] [nvarchar](450) NULL,
 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 10-Aug-22 14:03:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
	[Discriminator] [nvarchar](max) NOT NULL,
	[Name] [nvarchar](255) NULL,
	[Surname] [nvarchar](255) NULL,
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
	[HasAccessToLogin] [bit] NULL,
	[IsDeleted] [bit] NULL,
	[LastLoginDate] [datetime2](7) NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 10-Aug-22 14:03:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220809195805_Initial', N'5.0.17')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220810072016_addNewColumn', N'5.0.17')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220810072624_UserRoleAdd', N'5.0.17')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220810092939_addNewColumnApplicationUserModel', N'5.0.17')
GO
SET IDENTITY_INSERT [dbo].[Addresses] ON 

INSERT [dbo].[Addresses] ([Id], [Name], [ApplicationUserId]) VALUES (1, N'address1', N'14c48c5d-4f1f-4c4e-b960-5bdff5f7c79c')
INSERT [dbo].[Addresses] ([Id], [Name], [ApplicationUserId]) VALUES (2, N'address2', N'14c48c5d-4f1f-4c4e-b960-5bdff5f7c79c')
INSERT [dbo].[Addresses] ([Id], [Name], [ApplicationUserId]) VALUES (3, N'address3', N'14c48c5d-4f1f-4c4e-b960-5bdff5f7c79c')
INSERT [dbo].[Addresses] ([Id], [Name], [ApplicationUserId]) VALUES (4, N'eliAddress1', N'5c56a148-7943-485b-9a55-2d09f488a86b')
INSERT [dbo].[Addresses] ([Id], [Name], [ApplicationUserId]) VALUES (5, N'eliAddress2', N'5c56a148-7943-485b-9a55-2d09f488a86b')
INSERT [dbo].[Addresses] ([Id], [Name], [ApplicationUserId]) VALUES (6, N'veliAddress1', N'1b7b3651-ffed-4e0e-bf75-51c910df8819')
INSERT [dbo].[Addresses] ([Id], [Name], [ApplicationUserId]) VALUES (7, N'veliAddress2', N'1b7b3651-ffed-4e0e-bf75-51c910df8819')
INSERT [dbo].[Addresses] ([Id], [Name], [ApplicationUserId]) VALUES (8, N'veliAddress3', N'1b7b3651-ffed-4e0e-bf75-51c910df8819')
INSERT [dbo].[Addresses] ([Id], [Name], [ApplicationUserId]) VALUES (9, N'veliAddress4', N'1b7b3651-ffed-4e0e-bf75-51c910df8819')
SET IDENTITY_INSERT [dbo].[Addresses] OFF
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp], [Discriminator]) VALUES (N'5545974f-2dd9-459e-b9f7-a5076b8ce232', N'User', N'USER', N'08d3e3d1-8fcb-423c-b3c9-c2010ed4a007', N'ApplicationRole')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Discriminator], [RoleId1], [UserId1]) VALUES (N'14c48c5d-4f1f-4c4e-b960-5bdff5f7c79c', N'5545974f-2dd9-459e-b9f7-a5076b8ce232', N'IdentityUserRole<string>', NULL, NULL)
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Discriminator], [RoleId1], [UserId1]) VALUES (N'1b7b3651-ffed-4e0e-bf75-51c910df8819', N'5545974f-2dd9-459e-b9f7-a5076b8ce232', N'IdentityUserRole<string>', NULL, NULL)
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Discriminator], [RoleId1], [UserId1]) VALUES (N'5c56a148-7943-485b-9a55-2d09f488a86b', N'5545974f-2dd9-459e-b9f7-a5076b8ce232', N'IdentityUserRole<string>', NULL, NULL)
GO
INSERT [dbo].[AspNetUsers] ([Id], [Discriminator], [Name], [Surname], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [HasAccessToLogin], [IsDeleted], [LastLoginDate]) VALUES (N'14c48c5d-4f1f-4c4e-b960-5bdff5f7c79c', N'ApplicationUser', N'Murad', N'Binyetov', N'Murad123', N'MURAD123', N'murad_binyetov@mail.ru', N'MURAD_BINYETOV@MAIL.RU', 0, N'AQAAAAEAAC7gAAAAEB8gna8ad9pt+lTkeRPZI9UyAqMusJkOYQk4OyTBWnvdJQrc2b4cnbYXgNHnd7Z9YQ==', N'EHMJ2YA3KY7H22E3YLNCB2UUQTJ6J7Z2', N'8f00021f-05bc-478b-97c1-5bc79fa3aeaa', NULL, 0, 0, NULL, 1, 0, 1, 0, CAST(N'2022-08-10T13:52:20.0231697' AS DateTime2))
INSERT [dbo].[AspNetUsers] ([Id], [Discriminator], [Name], [Surname], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [HasAccessToLogin], [IsDeleted], [LastLoginDate]) VALUES (N'1b7b3651-ffed-4e0e-bf75-51c910df8819', N'ApplicationUser', N'Veli', N'Veliyev', N'Veli123', N'VELI123', N'veli@mail.ru', N'VELI@MAIL.RU', 0, N'AQAAAAEAAC7gAAAAEPhubDJRwyr0X7OyW+08q6BrtyYZ3Xr6e9mgmxnhmhaLgo1Gspvmebqqt0hdPxBJvg==', N'AX3C33EPDGUYXCGWMDSEH57X3IKEBV4X', N'9fc66096-5524-485a-a694-1fd8d450cfb5', NULL, 0, 0, NULL, 1, 0, 1, 0, CAST(N'2022-08-10T13:59:57.7409586' AS DateTime2))
INSERT [dbo].[AspNetUsers] ([Id], [Discriminator], [Name], [Surname], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [HasAccessToLogin], [IsDeleted], [LastLoginDate]) VALUES (N'5c56a148-7943-485b-9a55-2d09f488a86b', N'ApplicationUser', N'Eli', N'Eliyev', N'Eli123', N'ELI123', N'eli@mail.ru', N'ELI@MAIL.RU', 0, N'AQAAAAEAAC7gAAAAEFUZTI62xT/QrdEYpOv4aRhngcJaBgZ4Y3uQ3btdTOeLfWOb4EjIbz2pkAuzOSPeWw==', N'5AEFRJSOFBEQNSO73AJJYMNXPJAUH7AH', N'9e7cb5a3-ad9e-4036-9730-2c53808beaa0', NULL, 0, 0, NULL, 1, 0, 1, 0, CAST(N'2022-08-10T13:30:49.6783520' AS DateTime2))
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Addresses_ApplicationUserId]    Script Date: 10-Aug-22 14:03:33 ******/
CREATE NONCLUSTERED INDEX [IX_Addresses_ApplicationUserId] ON [dbo].[Addresses]
(
	[ApplicationUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetRoleClaims_RoleId]    Script Date: 10-Aug-22 14:03:33 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetRoleClaims_RoleId] ON [dbo].[AspNetRoleClaims]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 10-Aug-22 14:03:33 ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[NormalizedName] ASC
)
WHERE ([NormalizedName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserClaims_UserId]    Script Date: 10-Aug-22 14:03:33 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserClaims_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserLogins_UserId]    Script Date: 10-Aug-22 14:03:33 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserLogins_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserRoles_RoleId]    Script Date: 10-Aug-22 14:03:33 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserRoles_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserRoles_RoleId1]    Script Date: 10-Aug-22 14:03:33 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserRoles_RoleId1] ON [dbo].[AspNetUserRoles]
(
	[RoleId1] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserRoles_UserId1]    Script Date: 10-Aug-22 14:03:33 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserRoles_UserId1] ON [dbo].[AspNetUserRoles]
(
	[UserId1] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [EmailIndex]    Script Date: 10-Aug-22 14:03:33 ******/
CREATE NONCLUSTERED INDEX [EmailIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 10-Aug-22 14:03:33 ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedUserName] ASC
)
WHERE ([NormalizedUserName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AspNetRoles] ADD  DEFAULT (N'') FOR [Discriminator]
GO
ALTER TABLE [dbo].[AspNetUserRoles] ADD  DEFAULT (N'') FOR [Discriminator]
GO
ALTER TABLE [dbo].[Addresses]  WITH CHECK ADD  CONSTRAINT [FK_Addresses_AspNetUsers_ApplicationUserId] FOREIGN KEY([ApplicationUserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Addresses] CHECK CONSTRAINT [FK_Addresses_AspNetUsers_ApplicationUserId]
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
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId1] FOREIGN KEY([RoleId1])
REFERENCES [dbo].[AspNetRoles] ([Id])
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId1]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId1] FOREIGN KEY([UserId1])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId1]
GO
ALTER TABLE [dbo].[AspNetUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserTokens] CHECK CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId]
GO
USE [master]
GO
ALTER DATABASE [UniserGroup] SET  READ_WRITE 
GO
