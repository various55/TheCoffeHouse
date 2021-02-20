USE [master]
GO
/****** Object:  Database [TheCoffeHouse]    Script Date: 2/18/2021 10:43:00 PM ******/
CREATE DATABASE [TheCoffeHouse]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TheCoffeHouse', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\TheCoffeHouse.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'TheCoffeHouse_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\TheCoffeHouse_log.ldf' , SIZE = 816KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [TheCoffeHouse] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TheCoffeHouse].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TheCoffeHouse] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TheCoffeHouse] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TheCoffeHouse] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TheCoffeHouse] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TheCoffeHouse] SET ARITHABORT OFF 
GO
ALTER DATABASE [TheCoffeHouse] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TheCoffeHouse] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TheCoffeHouse] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TheCoffeHouse] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TheCoffeHouse] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TheCoffeHouse] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TheCoffeHouse] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TheCoffeHouse] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TheCoffeHouse] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TheCoffeHouse] SET  ENABLE_BROKER 
GO
ALTER DATABASE [TheCoffeHouse] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TheCoffeHouse] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TheCoffeHouse] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TheCoffeHouse] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TheCoffeHouse] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TheCoffeHouse] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TheCoffeHouse] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TheCoffeHouse] SET RECOVERY FULL 
GO
ALTER DATABASE [TheCoffeHouse] SET  MULTI_USER 
GO
ALTER DATABASE [TheCoffeHouse] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TheCoffeHouse] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TheCoffeHouse] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TheCoffeHouse] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [TheCoffeHouse] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'TheCoffeHouse', N'ON'
GO
USE [TheCoffeHouse]
GO
/****** Object:  Table [dbo].[Actions]    Script Date: 2/18/2021 10:43:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Actions](
	[id] [nchar](10) NULL,
	[name] [nvarchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Categories]    Script Date: 2/18/2021 10:43:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[id] [nchar](10) NOT NULL,
	[name] [nvarchar](50) NULL,
	[isShowOnHome] [bit] NULL,
	[status] [bit] NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Functions]    Script Date: 2/18/2021 10:43:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Functions](
	[id] [nchar](10) NULL,
	[name] [nvarchar](50) NULL,
	[url] [nchar](255) NULL,
	[parentId] [nchar](10) NULL,
	[status] [bit] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Images]    Script Date: 2/18/2021 10:43:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Images](
	[id] [nchar](10) NOT NULL,
	[productId] [nchar](10) NULL,
	[url] [nchar](255) NULL,
	[desciption] [nvarchar](255) NULL,
 CONSTRAINT [PK_Images] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 2/18/2021 10:43:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[orderId] [nchar](10) NULL,
	[productId] [nchar](10) NULL,
	[quantity] [int] NULL,
	[price] [float] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Orders]    Script Date: 2/18/2021 10:43:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[id] [nchar](10) NOT NULL,
	[createdBy] [nchar](10) NULL,
	[userId] [nchar](10) NULL,
	[orderDate] [datetime] NULL,
	[shipName] [nvarchar](50) NULL,
	[shipAddress] [nvarchar](255) NULL,
	[shipPhoneNumber] [nchar](20) NULL,
	[status] [int] NULL,
	[typeId] [nchar](10) NULL,
	[fee] [float] NULL,
	[discount] [float] NULL,
	[total] [float] NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Permisions]    Script Date: 2/18/2021 10:43:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Permisions](
	[roleId] [nchar](10) NULL,
	[functionId] [nchar](10) NULL,
	[actionId] [nchar](10) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Products]    Script Date: 2/18/2021 10:43:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[id] [nchar](10) NOT NULL,
	[name] [nvarchar](50) NULL,
	[description] [nvarchar](255) NULL,
	[price] [float] NULL,
	[details] [nvarchar](255) NULL,
	[isShowOnHome] [bit] NULL,
	[discount] [float] NULL,
	[quantityOrder] [int] NULL,
 CONSTRAINT [PK_Table_1] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProductStatus]    Script Date: 2/18/2021 10:43:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductStatus](
	[productId] [nchar](10) NULL,
	[statusId] [nchar](10) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Status]    Script Date: 2/18/2021 10:43:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Status](
	[id] [nchar](10) NOT NULL,
	[name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Status] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Transactions]    Script Date: 2/18/2021 10:43:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transactions](
	[id] [nchar](10) NOT NULL,
	[userId] [nchar](10) NULL,
	[orderId] [nchar](10) NULL,
	[createdBy] [nchar](10) NULL,
	[createdAt] [datetime] NULL,
	[message] [nvarchar](255) NULL,
	[status] [bit] NULL,
 CONSTRAINT [PK_Transactions] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Types]    Script Date: 2/18/2021 10:43:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Types](
	[id] [nchar](10) NOT NULL,
	[name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Types] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserRoles]    Script Date: 2/18/2021 10:43:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRoles](
	[userId] [nchar](10) NULL,
	[roleId] [nchar](10) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Users]    Script Date: 2/18/2021 10:43:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[id] [nchar](10) NOT NULL,
	[username] [nchar](25) NULL,
	[password] [nchar](256) NULL,
	[phoneNumber] [nchar](20) NULL,
	[email] [nchar](50) NULL,
	[DOB] [date] NULL,
	[fullName] [nvarchar](50) NULL,
	[address] [nvarchar](50) NULL,
	[total] [float] NULL,
	[status] [bit] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Categories] ADD  CONSTRAINT [DF_Categories_isShowOnHome]  DEFAULT ((1)) FOR [isShowOnHome]
GO
ALTER TABLE [dbo].[Categories] ADD  CONSTRAINT [DF_Categories_status]  DEFAULT ((1)) FOR [status]
GO
ALTER TABLE [dbo].[Functions] ADD  CONSTRAINT [DF_Functions_status]  DEFAULT ((1)) FOR [status]
GO
ALTER TABLE [dbo].[Orders] ADD  CONSTRAINT [DF_Table_1_ordersDate]  DEFAULT (getdate()) FOR [orderDate]
GO
ALTER TABLE [dbo].[Orders] ADD  CONSTRAINT [DF_Orders_status]  DEFAULT ((0)) FOR [status]
GO
ALTER TABLE [dbo].[Orders] ADD  CONSTRAINT [DF_Orders_fee]  DEFAULT ((0)) FOR [fee]
GO
ALTER TABLE [dbo].[Orders] ADD  CONSTRAINT [DF_Orders_discount]  DEFAULT ((0)) FOR [discount]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Table_1_isShowOnHome]  DEFAULT ((1)) FOR [isShowOnHome]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Table_1_discount]  DEFAULT ((0)) FOR [discount]
GO
ALTER TABLE [dbo].[Transactions] ADD  CONSTRAINT [DF_Transactions_createdAt]  DEFAULT (getdate()) FOR [createdAt]
GO
ALTER TABLE [dbo].[Transactions] ADD  CONSTRAINT [DF_Transactions_message]  DEFAULT (N'Hàng đã được thanh toán') FOR [message]
GO
ALTER TABLE [dbo].[Transactions] ADD  CONSTRAINT [DF_Transactions_status]  DEFAULT ((1)) FOR [status]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_total]  DEFAULT ((0)) FOR [total]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_status]  DEFAULT ((1)) FOR [status]
GO
USE [master]
GO
ALTER DATABASE [TheCoffeHouse] SET  READ_WRITE 
GO
