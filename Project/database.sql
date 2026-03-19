USE [master]
GO
/****** Object:  Database [DotNetTestDB]    Script Date: 19-03-2026 10:30:26 ******/
CREATE DATABASE [DotNetTestDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DotNetTestDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\DotNetTestDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DotNetTestDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\DotNetTestDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [DotNetTestDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DotNetTestDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DotNetTestDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DotNetTestDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DotNetTestDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DotNetTestDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DotNetTestDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [DotNetTestDB] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [DotNetTestDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DotNetTestDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DotNetTestDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DotNetTestDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DotNetTestDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DotNetTestDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DotNetTestDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DotNetTestDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DotNetTestDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [DotNetTestDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DotNetTestDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DotNetTestDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DotNetTestDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DotNetTestDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DotNetTestDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DotNetTestDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DotNetTestDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DotNetTestDB] SET  MULTI_USER 
GO
ALTER DATABASE [DotNetTestDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DotNetTestDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DotNetTestDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DotNetTestDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DotNetTestDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DotNetTestDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [DotNetTestDB] SET QUERY_STORE = OFF
GO
USE [DotNetTestDB]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 19-03-2026 10:30:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Username] [nvarchar](100) NULL,
	[Password] [nvarchar](100) NULL,
	[Language] [nvarchar](5) NULL,
	[MobileNumber] [nvarchar](15) NULL,
	[IsVerified] [bit] NULL,
	[IsActive] [bit] NULL,
	[CreatedDate] [datetime] NULL,
	[VerificationToken] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [Name], [Username], [Password], [Language], [MobileNumber], [IsVerified], [IsActive], [CreatedDate], [VerificationToken]) VALUES (1, N'Admin', N'admin@gmail.com', N'Admin@123', N'EN', NULL, 1, 1, CAST(N'2026-03-17T14:48:22.200' AS DateTime), NULL)
INSERT [dbo].[Users] ([Id], [Name], [Username], [Password], [Language], [MobileNumber], [IsVerified], [IsActive], [CreatedDate], [VerificationToken]) VALUES (2, N'pratiksha', N'pratiksha@gmail.com', N'74588jgf', N'EN', N'8668221933', 1, 1, CAST(N'2026-03-18T09:58:51.123' AS DateTime), N'365072d6-22a2-45ce-b96e-33bf17267e4f')
INSERT [dbo].[Users] ([Id], [Name], [Username], [Password], [Language], [MobileNumber], [IsVerified], [IsActive], [CreatedDate], [VerificationToken]) VALUES (4, N'Komal', N'komal123', N'123@pass', N'EN', N'9876543210', 0, 1, CAST(N'2026-03-18T12:25:52.597' AS DateTime), NULL)
INSERT [dbo].[Users] ([Id], [Name], [Username], [Password], [Language], [MobileNumber], [IsVerified], [IsActive], [CreatedDate], [VerificationToken]) VALUES (5, N'Smita', N'Smita123', N'123@pass', N'EN', N'9876543210', 0, 0, CAST(N'2026-03-18T12:40:28.690' AS DateTime), NULL)
INSERT [dbo].[Users] ([Id], [Name], [Username], [Password], [Language], [MobileNumber], [IsVerified], [IsActive], [CreatedDate], [VerificationToken]) VALUES (6, N'prajwal', N'prajwal@gmail.com', N'prajwal1234', N'EN', N'8924896324', 0, 1, CAST(N'2026-03-19T09:59:52.647' AS DateTime), N'f5d2b632-e45d-4e97-b561-ab689682efda')
INSERT [dbo].[Users] ([Id], [Name], [Username], [Password], [Language], [MobileNumber], [IsVerified], [IsActive], [CreatedDate], [VerificationToken]) VALUES (7, N'pranal', N'pranal@gmail.com', N'pranal1234', N'EN', N'8965892896', 0, 1, CAST(N'2026-03-19T10:04:07.723' AS DateTime), N'ff4c9075-3132-44dc-8927-5c59ac57dd02')
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Users__536C85E41DDA958D]    Script Date: 19-03-2026 10:30:27 ******/
ALTER TABLE [dbo].[Users] ADD UNIQUE NONCLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT ((0)) FOR [IsVerified]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
/****** Object:  StoredProcedure [dbo].[sp_GetUserByUsername]    Script Date: 19-03-2026 10:30:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- API FETCH USER
CREATE PROCEDURE [dbo].[sp_GetUserByUsername]
    @Username NVARCHAR(100)
AS
BEGIN
    SELECT Name, Username, Language, MobileNumber, IsVerified, IsActive
    FROM Users WHERE Username=@Username
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetUsers]    Script Date: 19-03-2026 10:30:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- GET ALL USERS (ADMIN)
CREATE PROCEDURE [dbo].[sp_GetUsers]
AS
BEGIN
    SELECT 
        ROW_NUMBER() OVER (ORDER BY Id DESC) AS SrNo,
        Id, Name, Username, CreatedDate, IsActive
    FROM Users
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Login]    Script Date: 19-03-2026 10:30:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- LOGIN
CREATE PROCEDURE [dbo].[sp_Login]
    @Username NVARCHAR(100),
    @Password NVARCHAR(100)
AS
BEGIN
    SELECT * FROM Users 
    WHERE Username=@Username AND Password=@Password
END
GO
/****** Object:  StoredProcedure [dbo].[sp_RegisterUser]    Script Date: 19-03-2026 10:30:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------
-- STORED PROCEDURES
---------------------------------------------------

-- REGISTER
CREATE PROCEDURE [dbo].[sp_RegisterUser]
    @Name NVARCHAR(100),
    @Username NVARCHAR(100),
    @Password NVARCHAR(100),
    @Language NVARCHAR(5),
    @Mobile NVARCHAR(15),
    @Token NVARCHAR(200)
AS
BEGIN
    INSERT INTO Users(Name, Username, Password, Language, MobileNumber, VerificationToken)
    VALUES (@Name, @Username, @Password, @Language, @Mobile, @Token)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ToggleUser]    Script Date: 19-03-2026 10:30:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- ENABLE / DISABLE USER
CREATE PROCEDURE [dbo].[sp_ToggleUser]
    @Id INT
AS
BEGIN
    UPDATE Users 
    SET IsActive = CASE WHEN IsActive = 1 THEN 0 ELSE 1 END
    WHERE Id=@Id
END
GO
/****** Object:  StoredProcedure [dbo].[sp_VerifyUser]    Script Date: 19-03-2026 10:30:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- VERIFY USER
CREATE PROCEDURE [dbo].[sp_VerifyUser]
    @Token NVARCHAR(200)
AS
BEGIN
    UPDATE Users SET IsVerified = 1 WHERE VerificationToken = @Token
END
GO
USE [master]
GO
ALTER DATABASE [DotNetTestDB] SET  READ_WRITE 
GO
