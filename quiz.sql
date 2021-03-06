USE [master]
GO
/****** Object:  Database [Quiz]    Script Date: 4/20/2020 3:25:10 PM ******/
CREATE DATABASE [Quiz]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Quiz', FILENAME = N'D:\MSSSQL\MSSQL15.MSSQLSERVER\MSSQL\DATA\Quiz.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Quiz_log', FILENAME = N'D:\MSSSQL\MSSQL15.MSSQLSERVER\MSSQL\DATA\Quiz_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Quiz] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Quiz].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Quiz] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Quiz] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Quiz] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Quiz] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Quiz] SET ARITHABORT OFF 
GO
ALTER DATABASE [Quiz] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Quiz] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Quiz] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Quiz] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Quiz] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Quiz] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Quiz] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Quiz] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Quiz] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Quiz] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Quiz] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Quiz] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Quiz] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Quiz] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Quiz] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Quiz] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Quiz] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Quiz] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Quiz] SET  MULTI_USER 
GO
ALTER DATABASE [Quiz] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Quiz] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Quiz] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Quiz] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Quiz] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Quiz', N'ON'
GO
ALTER DATABASE [Quiz] SET QUERY_STORE = OFF
GO
USE [Quiz]
GO
/****** Object:  Table [dbo].[Question]    Script Date: 4/20/2020 3:25:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Question](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[content] [nvarchar](50) NULL,
	[opt1] [nvarchar](500) NULL,
	[opt2] [nvarchar](500) NULL,
	[opt3] [nvarchar](500) NULL,
	[opt4] [nvarchar](500) NULL,
	[answer] [nvarchar](500) NULL,
	[created] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QuizHistory]    Script Date: 4/20/2020 3:25:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuizHistory](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[studentId] [int] NULL,
	[numOfQuiz] [int] NULL,
	[correctAnswer] [int] NULL,
	[date] [datetime] NULL,
	[status] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 4/20/2020 3:25:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](50) NULL,
	[password] [varchar](50) NULL,
	[email] [varchar](50) NULL,
	[type] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Question] ON 

INSERT [dbo].[Question] ([id], [content], [opt1], [opt2], [opt3], [opt4], [answer], [created]) VALUES (14, N'Content là?', N'Nội dung', N'Chạy', N'Đáp án đàu tiên', N'Dáp án thứ 2', N'12', CAST(N'2020-03-29T14:45:42.240' AS DateTime))
INSERT [dbo].[Question] ([id], [content], [opt1], [opt2], [opt3], [opt4], [answer], [created]) VALUES (1010, N'1 + 10 = ?', N'11', N'1', N'2', N'3', N'1', CAST(N'2020-04-07T22:48:10.770' AS DateTime))
INSERT [dbo].[Question] ([id], [content], [opt1], [opt2], [opt3], [opt4], [answer], [created]) VALUES (1011, N'Hà Nội thuộc nước nào?', N'Lào', N'Campuchia', N'Việt Nam', N'Thái Lan', N'3', CAST(N'2020-04-07T22:59:08.663' AS DateTime))
INSERT [dbo].[Question] ([id], [content], [opt1], [opt2], [opt3], [opt4], [answer], [created]) VALUES (1012, N'JVM là viêt tắt của...?', N'Japan Video More', N'Java Virtual Machine', N'Just Voldemore Vector', N'Japan Va Malay', N'2', CAST(N'2020-04-07T22:59:22.357' AS DateTime))
INSERT [dbo].[Question] ([id], [content], [opt1], [opt2], [opt3], [opt4], [answer], [created]) VALUES (1013, N'Sắt kí hiệu hóa hoạc là?', N'Sa', N'Cu', N'Zn', N'Fe', N'4', CAST(N'2020-04-07T22:59:29.620' AS DateTime))
INSERT [dbo].[Question] ([id], [content], [opt1], [opt2], [opt3], [opt4], [answer], [created]) VALUES (1014, N'Quoc gia dong dan nhat', N'TQ', N'Han', N'Viet', N'Nga', N'1', CAST(N'2020-04-17T00:41:17.113' AS DateTime))
SET IDENTITY_INSERT [dbo].[Question] OFF
SET IDENTITY_INSERT [dbo].[QuizHistory] ON 

INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer], [date], [status]) VALUES (1, 5, 3, 2, NULL, NULL)
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer], [date], [status]) VALUES (2, 5, 6, 2, NULL, NULL)
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer], [date], [status]) VALUES (3, 6, 1, 0, NULL, NULL)
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer], [date], [status]) VALUES (4, 6, 5, 1, NULL, NULL)
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer], [date], [status]) VALUES (5, 6, 5, 0, NULL, NULL)
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer], [date], [status]) VALUES (6, 6, 3, 3, NULL, NULL)
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer], [date], [status]) VALUES (1003, 7, 3, 1, CAST(N'2020-04-07T10:12:33.000' AS DateTime), NULL)
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer], [date], [status]) VALUES (1004, 7, 3, 0, CAST(N'2020-04-07T10:12:55.000' AS DateTime), NULL)
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer], [date], [status]) VALUES (1005, 7, 3, 0, CAST(N'2020-04-07T10:14:50.000' AS DateTime), NULL)
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer], [date], [status]) VALUES (1006, 7, 2, 0, CAST(N'2020-04-07T10:24:28.000' AS DateTime), NULL)
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer], [date], [status]) VALUES (1007, 7, 2, 0, CAST(N'2020-04-07T10:26:10.000' AS DateTime), NULL)
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer], [date], [status]) VALUES (1008, 7, 2, 0, CAST(N'2020-04-07T10:27:35.000' AS DateTime), NULL)
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer], [date], [status]) VALUES (1009, 7, 2, 0, CAST(N'2020-04-07T10:29:00.000' AS DateTime), NULL)
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer], [date], [status]) VALUES (1010, 7, 2, 0, CAST(N'2020-04-07T10:30:59.000' AS DateTime), NULL)
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer], [date], [status]) VALUES (1011, 7, 2, 0, CAST(N'2020-04-07T10:31:08.000' AS DateTime), NULL)
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer], [date], [status]) VALUES (1012, 7, 2, 0, CAST(N'2020-04-07T10:33:09.000' AS DateTime), NULL)
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer], [date], [status]) VALUES (1013, 7, 2, 0, CAST(N'2020-04-07T10:34:27.000' AS DateTime), NULL)
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer], [date], [status]) VALUES (1014, 7, 1, 1, CAST(N'2020-04-07T10:34:50.000' AS DateTime), NULL)
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer], [date], [status]) VALUES (1015, 7, 1, 1, CAST(N'2020-04-07T10:35:14.000' AS DateTime), NULL)
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer], [date], [status]) VALUES (1016, 7, 1, 0, CAST(N'2020-04-07T10:36:32.000' AS DateTime), NULL)
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer], [date], [status]) VALUES (1017, 7, 1, 0, CAST(N'2020-04-07T10:36:53.000' AS DateTime), NULL)
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer], [date], [status]) VALUES (1018, 7, 3, 2, CAST(N'2020-04-07T10:37:50.000' AS DateTime), NULL)
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer], [date], [status]) VALUES (1019, 7, 3, 2, CAST(N'2020-04-07T10:39:03.000' AS DateTime), NULL)
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer], [date], [status]) VALUES (1020, 7, 3, 2, CAST(N'2020-04-07T10:39:17.000' AS DateTime), NULL)
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer], [date], [status]) VALUES (1021, 7, 2, 5, CAST(N'2020-04-07T10:45:11.000' AS DateTime), N'Reject because overtime')
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer], [date], [status]) VALUES (1022, 7, 2, 5, CAST(N'2020-04-07T10:46:31.000' AS DateTime), N'Reject because overtime')
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer], [date], [status]) VALUES (1023, 6, 5, 0, CAST(N'2020-04-12T05:43:24.000' AS DateTime), N'Failed')
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer], [date], [status]) VALUES (1024, 6, 3, 0, CAST(N'2020-04-12T05:45:27.000' AS DateTime), N'Reject because overtime')
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer], [date], [status]) VALUES (1025, 6, 3, 0, CAST(N'2020-04-12T05:47:01.000' AS DateTime), N'Reject because overtime')
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer], [date], [status]) VALUES (1026, 6, 3, 0, CAST(N'2020-04-12T05:48:55.000' AS DateTime), N'Failed')
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer], [date], [status]) VALUES (1027, 6, 3, 0, CAST(N'2020-04-12T05:49:15.000' AS DateTime), N'Failed')
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer], [date], [status]) VALUES (1028, 6, 2, 0, CAST(N'2020-04-12T05:50:35.000' AS DateTime), N'Failed')
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer], [date], [status]) VALUES (1029, 7, 2, 5, CAST(N'2020-04-12T05:51:16.000' AS DateTime), N'Passed')
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer], [date], [status]) VALUES (1030, 6, 1, 0, CAST(N'2020-04-12T05:54:10.000' AS DateTime), N'Failed')
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer], [date], [status]) VALUES (1031, 6, 1, 0, CAST(N'2020-04-12T06:18:05.000' AS DateTime), N'Failed')
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer], [date], [status]) VALUES (1032, 6, 1, 0, CAST(N'2020-04-12T06:18:31.000' AS DateTime), N'Failed')
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer], [date], [status]) VALUES (1033, 6, 1, 0, CAST(N'2020-04-12T06:18:38.000' AS DateTime), N'Failed')
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer], [date], [status]) VALUES (1034, 7, 1, 0, CAST(N'2020-04-12T06:19:30.000' AS DateTime), N'Failed')
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer], [date], [status]) VALUES (1035, 7, 1, 0, CAST(N'2020-04-12T06:20:03.000' AS DateTime), N'Failed')
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer], [date], [status]) VALUES (1036, 7, 1, 0, CAST(N'2020-04-12T06:20:20.000' AS DateTime), N'Failed')
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer], [date], [status]) VALUES (1037, 6, 1, 0, CAST(N'2020-04-12T06:20:49.000' AS DateTime), N'Failed')
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer], [date], [status]) VALUES (1038, 6, 1, 0, CAST(N'2020-04-12T06:21:51.000' AS DateTime), N'Failed')
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer], [date], [status]) VALUES (1039, 6, 1, 0, CAST(N'2020-04-12T06:27:23.000' AS DateTime), N'Failed')
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer], [date], [status]) VALUES (1040, 6, 1, 0, CAST(N'2020-04-12T06:37:23.000' AS DateTime), N'Failed')
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer], [date], [status]) VALUES (1041, 7, 1, 0, CAST(N'2020-04-12T09:04:31.000' AS DateTime), N'Failed')
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer], [date], [status]) VALUES (1042, 7, 1, 0, CAST(N'2020-04-12T09:05:08.000' AS DateTime), N'Failed')
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer], [date], [status]) VALUES (1043, 7, 1, 0, CAST(N'2020-04-12T09:05:43.000' AS DateTime), N'Failed')
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer], [date], [status]) VALUES (1044, 7, 1, 0, CAST(N'2020-04-12T09:10:21.000' AS DateTime), N'Failed')
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer], [date], [status]) VALUES (1045, 7, 1, 0, CAST(N'2020-04-12T09:11:41.000' AS DateTime), N'Reject because overtime')
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer], [date], [status]) VALUES (1046, 7, 1, 0, CAST(N'2020-04-12T09:11:54.000' AS DateTime), N'Reject because overtime')
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer], [date], [status]) VALUES (1047, 7, 1, 0, CAST(N'2020-04-12T09:15:35.000' AS DateTime), N'Reject because overtime')
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer], [date], [status]) VALUES (1048, 7, 1, 0, CAST(N'2020-04-12T09:15:46.000' AS DateTime), N'Reject because overtime')
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer], [date], [status]) VALUES (1049, 7, 1, 0, CAST(N'2020-04-12T09:15:52.000' AS DateTime), N'Reject because overtime')
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer], [date], [status]) VALUES (1050, 7, 1, 0, CAST(N'2020-04-12T09:16:00.000' AS DateTime), N'Failed')
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer], [date], [status]) VALUES (1051, 7, 3, 3, CAST(N'2020-04-12T09:29:35.000' AS DateTime), N'Reject because overtime')
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer], [date], [status]) VALUES (1052, 7, 2, 5, CAST(N'2020-04-12T09:31:15.000' AS DateTime), N'Passed')
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer], [date], [status]) VALUES (1053, 7, 1, 0, CAST(N'2020-04-12T09:31:44.000' AS DateTime), N'Reject because overtime')
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer], [date], [status]) VALUES (1054, 7, 1, 0, CAST(N'2020-04-12T09:31:55.000' AS DateTime), N'Reject because overtime')
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer], [date], [status]) VALUES (1055, 7, 1, 0, CAST(N'2020-04-15T09:11:57.000' AS DateTime), N'Failed')
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer], [date], [status]) VALUES (1056, 7, 1, 0, CAST(N'2020-04-15T09:17:02.000' AS DateTime), N'Failed')
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer], [date], [status]) VALUES (1057, 6, 1, 0, CAST(N'2020-04-15T09:18:15.000' AS DateTime), N'Failed')
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer], [date], [status]) VALUES (1058, 6, 1, 0, CAST(N'2020-04-15T09:19:04.000' AS DateTime), N'Failed')
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer], [date], [status]) VALUES (1059, 6, 1, 0, CAST(N'2020-04-15T09:19:31.000' AS DateTime), N'Failed')
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer], [date], [status]) VALUES (1060, 6, 1, 0, CAST(N'2020-04-15T09:19:52.000' AS DateTime), N'Failed')
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer], [date], [status]) VALUES (1061, 6, 1, 0, CAST(N'2020-04-15T09:20:25.000' AS DateTime), N'Failed')
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer], [date], [status]) VALUES (1062, 6, 1, 0, CAST(N'2020-04-15T09:20:35.000' AS DateTime), N'Failed')
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer], [date], [status]) VALUES (1063, 6, 1, 0, CAST(N'2020-04-15T09:20:43.000' AS DateTime), N'Failed')
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer], [date], [status]) VALUES (1064, 6, 1, 0, CAST(N'2020-04-15T09:20:58.000' AS DateTime), N'Failed')
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer], [date], [status]) VALUES (1065, 6, 1, 0, CAST(N'2020-04-15T09:21:20.000' AS DateTime), N'Failed')
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer], [date], [status]) VALUES (1066, 7, 1, 0, CAST(N'2020-04-15T09:21:56.000' AS DateTime), N'Failed')
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer], [date], [status]) VALUES (1067, 7, 1, 0, CAST(N'2020-04-15T09:22:12.000' AS DateTime), N'Failed')
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer], [date], [status]) VALUES (1068, 7, 1, 0, CAST(N'2020-04-15T09:22:26.000' AS DateTime), N'Failed')
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer], [date], [status]) VALUES (1069, 7, 1, 0, CAST(N'2020-04-15T09:23:00.000' AS DateTime), N'Failed')
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer], [date], [status]) VALUES (1070, 7, 1, 0, CAST(N'2020-04-15T09:23:40.000' AS DateTime), N'Failed')
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer], [date], [status]) VALUES (1071, 7, 2, 0, CAST(N'2020-04-15T09:29:28.000' AS DateTime), N'Failed')
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer], [date], [status]) VALUES (1072, 7, 1, 0, CAST(N'2020-04-15T09:29:43.000' AS DateTime), N'Failed')
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer], [date], [status]) VALUES (1073, 7, 1, 0, CAST(N'2020-04-15T09:33:14.000' AS DateTime), N'Failed')
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer], [date], [status]) VALUES (1074, 7, 1, 0, CAST(N'2020-04-15T09:38:34.000' AS DateTime), N'Failed')
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer], [date], [status]) VALUES (1075, 7, 1, 0, CAST(N'2020-04-15T09:38:41.000' AS DateTime), N'Failed')
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer], [date], [status]) VALUES (1076, 7, 1, 0, CAST(N'2020-04-15T09:38:52.000' AS DateTime), N'Failed')
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer], [date], [status]) VALUES (1077, 7, 1, 0, CAST(N'2020-04-15T09:39:09.000' AS DateTime), N'Failed')
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer], [date], [status]) VALUES (1078, 7, 1, 0, CAST(N'2020-04-15T09:56:25.000' AS DateTime), N'Failed')
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer], [date], [status]) VALUES (1079, 7, 1, 10, CAST(N'2020-04-15T09:57:03.000' AS DateTime), N'Reject because overtime')
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer], [date], [status]) VALUES (1080, 7, 1, 10, CAST(N'2020-04-15T09:57:22.000' AS DateTime), N'Reject because overtime')
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer], [date], [status]) VALUES (1081, 7, 1, 10, CAST(N'2020-04-15T09:57:36.000' AS DateTime), N'Reject because overtime')
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer], [date], [status]) VALUES (1082, 7, 1, 0, CAST(N'2020-04-15T09:58:40.000' AS DateTime), N'Failed')
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer], [date], [status]) VALUES (1083, 7, 1, 0, CAST(N'2020-04-15T09:59:19.000' AS DateTime), N'Failed')
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer], [date], [status]) VALUES (1084, 7, 1, 0, CAST(N'2020-04-15T09:59:27.000' AS DateTime), N'Failed')
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer], [date], [status]) VALUES (1085, 7, 1, 0, CAST(N'2020-04-15T09:59:36.000' AS DateTime), N'Failed')
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer], [date], [status]) VALUES (1086, 7, 1, 0, CAST(N'2020-04-15T09:59:44.000' AS DateTime), N'Failed')
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer], [date], [status]) VALUES (1087, 7, 1, 0, CAST(N'2020-04-15T10:00:03.000' AS DateTime), N'Failed')
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer], [date], [status]) VALUES (1088, 7, 1, 0, CAST(N'2020-04-15T10:00:54.000' AS DateTime), N'Failed')
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer], [date], [status]) VALUES (1089, 7, 1, 0, CAST(N'2020-04-15T10:01:25.000' AS DateTime), N'Failed')
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer], [date], [status]) VALUES (1090, 7, 1, 0, CAST(N'2020-04-15T10:01:32.000' AS DateTime), N'Failed')
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer], [date], [status]) VALUES (1091, 7, 1, 0, CAST(N'2020-04-15T10:03:51.000' AS DateTime), N'Failed')
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer], [date], [status]) VALUES (1092, 7, 1, 0, CAST(N'2020-04-15T10:04:06.000' AS DateTime), N'Failed')
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer], [date], [status]) VALUES (1093, 7, 1, 0, CAST(N'2020-04-15T10:06:22.000' AS DateTime), N'Failed')
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer], [date], [status]) VALUES (1094, 7, 1, 0, CAST(N'2020-04-15T10:10:06.000' AS DateTime), N'Failed')
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer], [date], [status]) VALUES (1095, 7, 1, 0, CAST(N'2020-04-15T10:10:25.000' AS DateTime), N'Failed')
GO
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer], [date], [status]) VALUES (1096, 7, 1, 0, CAST(N'2020-04-15T10:10:44.000' AS DateTime), N'Failed')
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer], [date], [status]) VALUES (1097, 7, 1, 0, CAST(N'2020-04-15T10:10:54.000' AS DateTime), N'Failed')
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer], [date], [status]) VALUES (1098, 7, 1, 0, CAST(N'2020-04-15T10:11:11.000' AS DateTime), N'Failed')
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer], [date], [status]) VALUES (1099, 7, 1, 0, CAST(N'2020-04-15T10:11:23.000' AS DateTime), N'Failed')
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer], [date], [status]) VALUES (1100, 7, 1, 0, CAST(N'2020-04-15T10:11:58.000' AS DateTime), N'Reject because overtime')
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer], [date], [status]) VALUES (1101, 7, 1, 10, CAST(N'2020-04-15T10:12:12.000' AS DateTime), N'Reject because overtime')
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer], [date], [status]) VALUES (1102, 7, 1, 10, CAST(N'2020-04-15T10:12:48.000' AS DateTime), N'Reject because overtime')
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer], [date], [status]) VALUES (1103, 7, 1, 10, CAST(N'2020-04-15T10:17:05.000' AS DateTime), N'Reject because overtime')
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer], [date], [status]) VALUES (1104, 7, 1, 0, CAST(N'2020-04-15T10:19:21.000' AS DateTime), N'Failed')
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer], [date], [status]) VALUES (1105, 7, 1, 0, CAST(N'2020-04-15T11:19:05.000' AS DateTime), N'Failed')
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer], [date], [status]) VALUES (1106, 7, 1, 0, CAST(N'2020-04-15T11:19:18.000' AS DateTime), N'Failed')
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer], [date], [status]) VALUES (1107, 7, 1, 0, CAST(N'2020-04-15T11:19:44.000' AS DateTime), N'Failed')
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer], [date], [status]) VALUES (1108, 7, 2, 5, CAST(N'2020-04-15T11:26:26.000' AS DateTime), N'Passed')
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer], [date], [status]) VALUES (1109, 7, 2, 5, CAST(N'2020-04-15T11:27:21.000' AS DateTime), N'Passed')
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer], [date], [status]) VALUES (1110, 7, 1, 10, CAST(N'2020-04-15T11:27:32.000' AS DateTime), N'Passed')
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer], [date], [status]) VALUES (1111, 7, 1, 10, CAST(N'2020-04-15T11:27:50.000' AS DateTime), N'Passed')
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer], [date], [status]) VALUES (1112, 7, 1, 10, CAST(N'2020-04-15T11:28:05.000' AS DateTime), N'Passed')
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer], [date], [status]) VALUES (1113, 7, 1, 10, CAST(N'2020-04-15T11:28:18.000' AS DateTime), N'Passed')
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer], [date], [status]) VALUES (1114, 7, 1, 10, CAST(N'2020-04-15T11:28:48.000' AS DateTime), N'Passed')
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer], [date], [status]) VALUES (1115, 7, 1, 0, CAST(N'2020-04-15T11:28:56.000' AS DateTime), N'Failed')
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer], [date], [status]) VALUES (1116, 7, 1, 0, CAST(N'2020-04-15T11:29:08.000' AS DateTime), N'Failed')
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer], [date], [status]) VALUES (1117, 7, 1, 0, CAST(N'2020-04-15T11:30:19.000' AS DateTime), N'Failed')
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer], [date], [status]) VALUES (1118, 7, 1, 10, CAST(N'2020-04-15T11:30:27.000' AS DateTime), N'Passed')
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer], [date], [status]) VALUES (1119, 7, 1, 0, CAST(N'2020-04-15T11:31:51.000' AS DateTime), N'Failed')
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer], [date], [status]) VALUES (1120, 7, 1, 0, CAST(N'2020-04-15T11:32:13.000' AS DateTime), N'Failed')
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer], [date], [status]) VALUES (1121, 7, 1, 10, CAST(N'2020-04-15T11:32:24.000' AS DateTime), N'Passed')
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer], [date], [status]) VALUES (1122, 7, 1, 0, CAST(N'2020-04-15T11:33:25.000' AS DateTime), N'Failed')
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer], [date], [status]) VALUES (1123, 7, 1, 0, CAST(N'2020-04-15T11:34:09.000' AS DateTime), N'Failed')
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer], [date], [status]) VALUES (1124, 7, 1, 10, CAST(N'2020-04-15T11:34:28.000' AS DateTime), N'Passed')
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer], [date], [status]) VALUES (1125, 7, 1, 10, CAST(N'2020-04-15T11:34:59.000' AS DateTime), N'Passed')
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer], [date], [status]) VALUES (1126, 7, 1, 10, CAST(N'2020-04-15T11:35:08.000' AS DateTime), N'Passed')
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer], [date], [status]) VALUES (1127, 7, 1, 10, CAST(N'2020-04-15T11:36:05.000' AS DateTime), N'Passed')
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer], [date], [status]) VALUES (1128, 7, 1, 10, CAST(N'2020-04-15T11:36:20.000' AS DateTime), N'Reject because overtime')
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer], [date], [status]) VALUES (1129, 7, 1, 10, CAST(N'2020-04-15T11:36:31.000' AS DateTime), N'Reject because overtime')
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer], [date], [status]) VALUES (1130, 7, 1, 0, CAST(N'2020-04-16T04:05:52.000' AS DateTime), N'Failed')
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer], [date], [status]) VALUES (1131, 7, 1, 0, CAST(N'2020-04-16T04:06:07.000' AS DateTime), N'Failed')
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer], [date], [status]) VALUES (1132, 7, 1, 0, CAST(N'2020-04-16T04:08:20.000' AS DateTime), N'Failed')
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer], [date], [status]) VALUES (1133, 7, 2, 0, CAST(N'2020-04-17T12:18:54.000' AS DateTime), N'Failed')
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer], [date], [status]) VALUES (1134, 7, 1, 10, CAST(N'2020-04-17T12:19:21.000' AS DateTime), N'Passed')
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer], [date], [status]) VALUES (1135, 7, 2, 5, CAST(N'2020-04-17T12:19:34.000' AS DateTime), N'Passed')
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer], [date], [status]) VALUES (1136, 7, 2, 5, CAST(N'2020-04-17T12:21:11.000' AS DateTime), N'Passed')
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer], [date], [status]) VALUES (1137, 6, 3, 6, CAST(N'2020-04-17T12:54:56.000' AS DateTime), N'Passed')
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer], [date], [status]) VALUES (1138, 6, 2, 0, CAST(N'2020-04-17T01:00:20.000' AS DateTime), N'Failed')
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer], [date], [status]) VALUES (2021, 7, 2, 0, CAST(N'2020-04-18T12:03:54.000' AS DateTime), N'Failed')
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer], [date], [status]) VALUES (2022, 6, 2, 5, CAST(N'2020-04-18T12:44:24.000' AS DateTime), N'Passed')
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer], [date], [status]) VALUES (2023, 6, 2, 5, CAST(N'2020-04-18T03:20:32.000' AS DateTime), N'Passed')
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer], [date], [status]) VALUES (2024, 6, 1, 0, CAST(N'2020-04-18T03:25:41.000' AS DateTime), N'Failed')
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer], [date], [status]) VALUES (2025, 6, 1, 0, CAST(N'2020-04-18T03:25:49.000' AS DateTime), N'Failed')
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer], [date], [status]) VALUES (2026, 6, 2, 5, CAST(N'2020-04-18T03:26:24.000' AS DateTime), N'Passed')
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer], [date], [status]) VALUES (2027, 6, 2, 0, CAST(N'2020-04-18T03:26:56.000' AS DateTime), N'Failed')
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer], [date], [status]) VALUES (2028, 6, 2, 0, CAST(N'2020-04-18T03:28:45.000' AS DateTime), N'Failed')
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer], [date], [status]) VALUES (2029, 6, 1, 0, CAST(N'2020-04-18T03:28:51.000' AS DateTime), N'Failed')
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer], [date], [status]) VALUES (2030, 6, 1, 0, CAST(N'2020-04-18T03:30:07.000' AS DateTime), N'Failed')
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer], [date], [status]) VALUES (2031, 6, 1, 0, CAST(N'2020-04-18T03:30:18.000' AS DateTime), N'Failed')
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer], [date], [status]) VALUES (2032, 6, 1, 0, CAST(N'2020-04-18T03:30:54.000' AS DateTime), N'Failed')
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer], [date], [status]) VALUES (2033, 6, 1, 0, CAST(N'2020-04-18T03:31:10.000' AS DateTime), N'Failed')
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer], [date], [status]) VALUES (2034, 6, 2, 5, CAST(N'2020-04-18T03:31:26.000' AS DateTime), N'Passed')
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer], [date], [status]) VALUES (2035, 6, 4, 2, CAST(N'2020-04-18T07:46:53.000' AS DateTime), N'Failed')
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer], [date], [status]) VALUES (2036, 6, 2, 0, CAST(N'2020-04-18T07:48:32.000' AS DateTime), N'Reject because overtime')
SET IDENTITY_INSERT [dbo].[QuizHistory] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([id], [username], [password], [email], [type]) VALUES (1, N'Minh', N'123456', N'mra00000@gmail.com', 1)
INSERT [dbo].[Users] ([id], [username], [password], [email], [type]) VALUES (2, N'MrVD', N'123456', N'ahihi@gmail.com', 1)
INSERT [dbo].[Users] ([id], [username], [password], [email], [type]) VALUES (3, N'MrAhihi', N'123456', N'ah@gmail.com', 1)
INSERT [dbo].[Users] ([id], [username], [password], [email], [type]) VALUES (4, N'MrGalan', N'123456', N'galan@ahihi.com', 0)
INSERT [dbo].[Users] ([id], [username], [password], [email], [type]) VALUES (5, N'MrSFAG', N'12345678', N'mfagman@ahihi.com', 1)
INSERT [dbo].[Users] ([id], [username], [password], [email], [type]) VALUES (6, N'don123', N'12345678', N'don123@gmail.com', 1)
INSERT [dbo].[Users] ([id], [username], [password], [email], [type]) VALUES (7, N'don1234', N'12345678', N'don@123.com', 0)
INSERT [dbo].[Users] ([id], [username], [password], [email], [type]) VALUES (8, N'don123456', N'123456789', N'abc@123.com', 0)
SET IDENTITY_INSERT [dbo].[Users] OFF
ALTER TABLE [dbo].[Question] ADD  DEFAULT (getdate()) FOR [created]
GO
ALTER TABLE [dbo].[QuizHistory]  WITH CHECK ADD  CONSTRAINT [fk_studentId_1] FOREIGN KEY([studentId])
REFERENCES [dbo].[Users] ([id])
GO
ALTER TABLE [dbo].[QuizHistory] CHECK CONSTRAINT [fk_studentId_1]
GO
USE [master]
GO
ALTER DATABASE [Quiz] SET  READ_WRITE 
GO
