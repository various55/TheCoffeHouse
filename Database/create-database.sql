USE [master]
GO
/****** Object:  Database [TheCoffeHouse]    Script Date: 3/1/2021 10:03:30 AM ******/
CREATE DATABASE [TheCoffeHouse]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TheCoffeHouse', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\TheCoffeHouse.mdf' , SIZE = 4288KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'TheCoffeHouse_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\TheCoffeHouse_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
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
/****** Object:  Table [dbo].[Actions]    Script Date: 3/1/2021 10:03:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Actions](
	[id] [nchar](10) NOT NULL,
	[name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Actions] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Categories]    Script Date: 3/1/2021 10:03:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[id] [nchar](10) NOT NULL,
	[name] [nvarchar](50) NULL,
	[isShowOnHome] [bit] NULL CONSTRAINT [DF_Categories_isShowOnHome]  DEFAULT ((1)),
	[status] [bit] NULL CONSTRAINT [DF_Categories_status]  DEFAULT ((1)),
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Functions]    Script Date: 3/1/2021 10:03:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Functions](
	[id] [nchar](10) NOT NULL,
	[name] [nvarchar](50) NULL,
	[url] [nchar](255) NULL,
	[parentId] [nchar](10) NULL,
	[status] [bit] NULL,
 CONSTRAINT [PK_Functions] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 3/1/2021 10:03:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[orderId] [nchar](10) NOT NULL,
	[productId] [nchar](10) NOT NULL,
	[quantity] [int] NULL,
	[price] [float] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Orders]    Script Date: 3/1/2021 10:03:30 AM ******/
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
	[typeId] [nchar](10) NOT NULL,
	[fee] [float] NULL,
	[discount] [float] NULL,
	[total] [float] NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Permissions]    Script Date: 3/1/2021 10:03:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Permissions](
	[roleId] [nchar](10) NOT NULL,
	[functionId] [nchar](10) NOT NULL,
	[actionId] [nchar](10) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Products]    Script Date: 3/1/2021 10:03:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[id] [nchar](10) NOT NULL,
	[name] [nvarchar](50) NULL,
	[description] [nvarchar](255) NULL,
	[price] [float] NULL,
	[details] [ntext] NULL,
	[isShowOnHome] [bit] NULL CONSTRAINT [DF_Table_1_isShowOnHome]  DEFAULT ((1)),
	[discount] [float] NULL CONSTRAINT [DF_Table_1_discount]  DEFAULT ((0)),
	[quantityOrder] [int] NULL,
	[image] [nchar](255) NULL,
	[categoriesId] [nchar](10) NOT NULL,
 CONSTRAINT [PK_Table_1] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProductStatus]    Script Date: 3/1/2021 10:03:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductStatus](
	[productId] [nchar](10) NOT NULL,
	[statusId] [nchar](10) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Roles]    Script Date: 3/1/2021 10:03:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[id] [nchar](10) NOT NULL,
	[name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ShopConfig]    Script Date: 3/1/2021 10:03:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ShopConfig](
	[id] [char](10) NOT NULL,
	[shopName] [nvarchar](50) NULL,
	[imageLogo] [char](255) NULL,
	[mobile] [char](20) NULL,
	[address] [nvarchar](255) NULL,
	[gmail] [char](50) NULL,
	[facebook] [char](255) NULL CONSTRAINT [DF_ShopConfig_facebook]  DEFAULT (N'https://www.facebook.com'),
	[instagram] [char](255) NULL CONSTRAINT [DF_ShopConfig_instagram]  DEFAULT (N'https://www.instagram.com'),
	[twitter] [char](255) NULL CONSTRAINT [DF_ShopConfig_twitter]  DEFAULT (N'https://twitter.com/?lang=vi'),
	[youtube] [char](255) NULL CONSTRAINT [DF_ShopConfig_youtube]  DEFAULT (N'https://www.youtube.com'),
 CONSTRAINT [PK_ShopConfig] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Status]    Script Date: 3/1/2021 10:03:30 AM ******/
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
/****** Object:  Table [dbo].[Transactions]    Script Date: 3/1/2021 10:03:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transactions](
	[id] [nchar](10) NOT NULL,
	[userId] [nchar](10) NULL,
	[orderId] [nchar](10) NOT NULL,
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
/****** Object:  Table [dbo].[Types]    Script Date: 3/1/2021 10:03:30 AM ******/
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
/****** Object:  Table [dbo].[UserRoles]    Script Date: 3/1/2021 10:03:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRoles](
	[userId] [nchar](10) NOT NULL,
	[roleId] [nchar](10) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Users]    Script Date: 3/1/2021 10:03:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[id] [nchar](10) NOT NULL,
	[username] [nchar](25) NULL,
	[password] [nchar](256) NULL,
	[role] [nchar](10) NULL,
	[phoneNumber] [nchar](20) NULL,
	[email] [nchar](50) NULL,
	[DOB] [date] NULL,
	[fullName] [nvarchar](50) NULL,
	[address] [nvarchar](50) NULL,
	[total] [float] NULL CONSTRAINT [DF_Users_total]  DEFAULT ((0)),
	[status] [bit] NULL CONSTRAINT [DF_Users_status]  DEFAULT ((1)),
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

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
ALTER TABLE [dbo].[Transactions] ADD  CONSTRAINT [DF_Transactions_createdAt]  DEFAULT (getdate()) FOR [createdAt]
GO
ALTER TABLE [dbo].[Transactions] ADD  CONSTRAINT [DF_Transactions_message]  DEFAULT (N'Hàng đã được thanh toán') FOR [message]
GO
ALTER TABLE [dbo].[Transactions] ADD  CONSTRAINT [DF_Transactions_status]  DEFAULT ((1)) FOR [status]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Orders] FOREIGN KEY([orderId])
REFERENCES [dbo].[Orders] ([id])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Orders]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Products] FOREIGN KEY([productId])
REFERENCES [dbo].[Products] ([id])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Products]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Types1] FOREIGN KEY([typeId])
REFERENCES [dbo].[Types] ([id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Types1]
GO
ALTER TABLE [dbo].[Permissions]  WITH CHECK ADD  CONSTRAINT [FK_Permissions_Actions] FOREIGN KEY([actionId])
REFERENCES [dbo].[Actions] ([id])
GO
ALTER TABLE [dbo].[Permissions] CHECK CONSTRAINT [FK_Permissions_Actions]
GO
ALTER TABLE [dbo].[Permissions]  WITH CHECK ADD  CONSTRAINT [FK_Permissions_Functions] FOREIGN KEY([functionId])
REFERENCES [dbo].[Functions] ([id])
GO
ALTER TABLE [dbo].[Permissions] CHECK CONSTRAINT [FK_Permissions_Functions]
GO
ALTER TABLE [dbo].[Permissions]  WITH CHECK ADD  CONSTRAINT [FK_Permissions_Roles] FOREIGN KEY([roleId])
REFERENCES [dbo].[Roles] ([id])
GO
ALTER TABLE [dbo].[Permissions] CHECK CONSTRAINT [FK_Permissions_Roles]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Categories] FOREIGN KEY([categoriesId])
REFERENCES [dbo].[Categories] ([id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Categories]
GO
ALTER TABLE [dbo].[ProductStatus]  WITH CHECK ADD  CONSTRAINT [FK_ProductStatus_Products] FOREIGN KEY([productId])
REFERENCES [dbo].[Products] ([id])
GO
ALTER TABLE [dbo].[ProductStatus] CHECK CONSTRAINT [FK_ProductStatus_Products]
GO
ALTER TABLE [dbo].[ProductStatus]  WITH CHECK ADD  CONSTRAINT [FK_ProductStatus_Status] FOREIGN KEY([statusId])
REFERENCES [dbo].[Status] ([id])
GO
ALTER TABLE [dbo].[ProductStatus] CHECK CONSTRAINT [FK_ProductStatus_Status]
GO
ALTER TABLE [dbo].[Transactions]  WITH CHECK ADD  CONSTRAINT [FK_Transactions_Orders] FOREIGN KEY([orderId])
REFERENCES [dbo].[Orders] ([id])
GO
ALTER TABLE [dbo].[Transactions] CHECK CONSTRAINT [FK_Transactions_Orders]
GO
ALTER TABLE [dbo].[UserRoles]  WITH CHECK ADD  CONSTRAINT [FK_UserRoles_Roles] FOREIGN KEY([userId])
REFERENCES [dbo].[Roles] ([id])
GO
ALTER TABLE [dbo].[UserRoles] CHECK CONSTRAINT [FK_UserRoles_Roles]
GO
ALTER TABLE [dbo].[UserRoles]  WITH CHECK ADD  CONSTRAINT [FK_UserRoles_Users] FOREIGN KEY([userId])
REFERENCES [dbo].[Users] ([id])
GO
ALTER TABLE [dbo].[UserRoles] CHECK CONSTRAINT [FK_UserRoles_Users]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Roles] FOREIGN KEY([role])
REFERENCES [dbo].[Roles] ([id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Roles]
GO
/****** Object:  StoredProcedure [dbo].[usp_DeleteAction]    Script Date: 3/1/2021 10:03:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--region [dbo].[usp_DeleteAction]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   truon using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [dbo].[usp_DeleteAction]
-- Date Generated: Friday, February 19, 2021
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_DeleteAction]
	@id nchar(10)
AS

SET NOCOUNT ON

DELETE FROM [dbo].[Actions]
WHERE
	[id] = @id

--endregion



GO
/****** Object:  StoredProcedure [dbo].[usp_DeleteActionsDynamic]    Script Date: 3/1/2021 10:03:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--region [dbo].[usp_DeleteActionsDynamic]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   truon using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [dbo].[usp_DeleteActionsDynamic]
-- Date Generated: Friday, February 19, 2021
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_DeleteActionsDynamic]
	@WhereCondition nvarchar(500)
AS

SET NOCOUNT ON

DECLARE @SQL nvarchar(3250)

SET @SQL = '
DELETE FROM
	[dbo].[Actions]
WHERE
	' + @WhereCondition

EXEC sp_executesql @SQL

--endregion



GO
/****** Object:  StoredProcedure [dbo].[usp_DeleteCategoriesDynamic]    Script Date: 3/1/2021 10:03:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--region [dbo].[usp_DeleteCategoriesDynamic]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   truon using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [dbo].[usp_DeleteCategoriesDynamic]
-- Date Generated: Friday, February 19, 2021
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_DeleteCategoriesDynamic]
	@WhereCondition nvarchar(500)
AS

SET NOCOUNT ON

DECLARE @SQL nvarchar(3250)

SET @SQL = '
DELETE FROM
	[dbo].[Categories]
WHERE
	' + @WhereCondition

EXEC sp_executesql @SQL

--endregion



GO
/****** Object:  StoredProcedure [dbo].[usp_DeleteCategory]    Script Date: 3/1/2021 10:03:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--region [dbo].[usp_DeleteCategory]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   truon using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [dbo].[usp_DeleteCategory]
-- Date Generated: Friday, February 19, 2021
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_DeleteCategory]
	@id nchar(10)
AS

SET NOCOUNT ON

DELETE FROM [dbo].[Categories]
WHERE
	[id] = @id

--endregion



GO
/****** Object:  StoredProcedure [dbo].[usp_DeleteFunction]    Script Date: 3/1/2021 10:03:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--region [dbo].[usp_DeleteFunction]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   truon using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [dbo].[usp_DeleteFunction]
-- Date Generated: Friday, February 19, 2021
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_DeleteFunction]
	@id nchar(10)
AS

SET NOCOUNT ON

DELETE FROM [dbo].[Functions]
WHERE
	[id] = @id

--endregion



GO
/****** Object:  StoredProcedure [dbo].[usp_DeleteFunctionsDynamic]    Script Date: 3/1/2021 10:03:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--region [dbo].[usp_DeleteFunctionsDynamic]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   truon using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [dbo].[usp_DeleteFunctionsDynamic]
-- Date Generated: Friday, February 19, 2021
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_DeleteFunctionsDynamic]
	@WhereCondition nvarchar(500)
AS

SET NOCOUNT ON

DECLARE @SQL nvarchar(3250)

SET @SQL = '
DELETE FROM
	[dbo].[Functions]
WHERE
	' + @WhereCondition

EXEC sp_executesql @SQL

--endregion



GO
/****** Object:  StoredProcedure [dbo].[usp_DeleteOrder]    Script Date: 3/1/2021 10:03:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--region [dbo].[usp_DeleteOrder]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   truon using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [dbo].[usp_DeleteOrder]
-- Date Generated: Friday, February 19, 2021
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_DeleteOrder]
	@id nchar(10)
AS

SET NOCOUNT ON

DELETE FROM [dbo].[Orders]
WHERE
	[id] = @id

--endregion



GO
/****** Object:  StoredProcedure [dbo].[usp_DeleteOrdersBytypeId]    Script Date: 3/1/2021 10:03:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--region [dbo].[usp_DeleteOrdersBytypeId]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   truon using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [dbo].[usp_DeleteOrdersBytypeId]
-- Date Generated: Friday, February 19, 2021
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_DeleteOrdersBytypeId]
	@typeId nchar(10)
AS

SET NOCOUNT ON

DELETE FROM [dbo].[Orders]
WHERE
	[typeId] = @typeId



GO
/****** Object:  StoredProcedure [dbo].[usp_DeleteOrdersByuserId]    Script Date: 3/1/2021 10:03:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--region [dbo].[usp_DeleteOrdersByuserId]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   truon using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [dbo].[usp_DeleteOrdersByuserId]
-- Date Generated: Friday, February 19, 2021
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_DeleteOrdersByuserId]
	@userId nchar(10)
AS

SET NOCOUNT ON

DELETE FROM [dbo].[Orders]
WHERE
	[userId] = @userId



GO
/****** Object:  StoredProcedure [dbo].[usp_DeleteOrdersDynamic]    Script Date: 3/1/2021 10:03:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--region [dbo].[usp_DeleteOrdersDynamic]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   truon using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [dbo].[usp_DeleteOrdersDynamic]
-- Date Generated: Friday, February 19, 2021
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_DeleteOrdersDynamic]
	@WhereCondition nvarchar(500)
AS

SET NOCOUNT ON

DECLARE @SQL nvarchar(3250)

SET @SQL = '
DELETE FROM
	[dbo].[Orders]
WHERE
	' + @WhereCondition

EXEC sp_executesql @SQL

--endregion



GO
/****** Object:  StoredProcedure [dbo].[usp_DeleteProduct]    Script Date: 3/1/2021 10:03:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--region [dbo].[usp_DeleteProduct]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   truon using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [dbo].[usp_DeleteProduct]
-- Date Generated: Friday, February 19, 2021
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_DeleteProduct]
	@id nchar(10)
AS

SET NOCOUNT ON

DELETE FROM [dbo].[Products]
WHERE
	[id] = @id

--endregion



GO
/****** Object:  StoredProcedure [dbo].[usp_DeleteProductsBycategoriesId]    Script Date: 3/1/2021 10:03:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--region [dbo].[usp_DeleteProductsBycategoriesId]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   truon using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [dbo].[usp_DeleteProductsBycategoriesId]
-- Date Generated: Friday, February 19, 2021
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_DeleteProductsBycategoriesId]
	@categoriesId nchar(10)
AS

SET NOCOUNT ON

DELETE FROM [dbo].[Products]
WHERE
	[categoriesId] = @categoriesId



GO
/****** Object:  StoredProcedure [dbo].[usp_DeleteProductsDynamic]    Script Date: 3/1/2021 10:03:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--region [dbo].[usp_DeleteProductsDynamic]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   truon using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [dbo].[usp_DeleteProductsDynamic]
-- Date Generated: Friday, February 19, 2021
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_DeleteProductsDynamic]
	@WhereCondition nvarchar(500)
AS

SET NOCOUNT ON

DECLARE @SQL nvarchar(3250)

SET @SQL = '
DELETE FROM
	[dbo].[Products]
WHERE
	' + @WhereCondition

EXEC sp_executesql @SQL

--endregion



GO
/****** Object:  StoredProcedure [dbo].[usp_DeleteRole]    Script Date: 3/1/2021 10:03:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--region [dbo].[usp_DeleteRole]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   truon using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [dbo].[usp_DeleteRole]
-- Date Generated: Friday, February 19, 2021
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_DeleteRole]
	@id nchar(10)
AS

SET NOCOUNT ON

DELETE FROM [dbo].[Roles]
WHERE
	[id] = @id

--endregion



GO
/****** Object:  StoredProcedure [dbo].[usp_DeleteRolesDynamic]    Script Date: 3/1/2021 10:03:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--region [dbo].[usp_DeleteRolesDynamic]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   truon using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [dbo].[usp_DeleteRolesDynamic]
-- Date Generated: Friday, February 19, 2021
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_DeleteRolesDynamic]
	@WhereCondition nvarchar(500)
AS

SET NOCOUNT ON

DECLARE @SQL nvarchar(3250)

SET @SQL = '
DELETE FROM
	[dbo].[Roles]
WHERE
	' + @WhereCondition

EXEC sp_executesql @SQL

--endregion



GO
/****** Object:  StoredProcedure [dbo].[usp_DeleteStatus]    Script Date: 3/1/2021 10:03:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--region [dbo].[usp_DeleteStatus]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   truon using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [dbo].[usp_DeleteStatus]
-- Date Generated: Friday, February 19, 2021
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_DeleteStatus]
	@id nchar(10)
AS

SET NOCOUNT ON

DELETE FROM [dbo].[Status]
WHERE
	[id] = @id

--endregion



GO
/****** Object:  StoredProcedure [dbo].[usp_DeleteStatusDynamic]    Script Date: 3/1/2021 10:03:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--region [dbo].[usp_DeleteStatusDynamic]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   truon using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [dbo].[usp_DeleteStatusDynamic]
-- Date Generated: Friday, February 19, 2021
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_DeleteStatusDynamic]
	@WhereCondition nvarchar(500)
AS

SET NOCOUNT ON

DECLARE @SQL nvarchar(3250)

SET @SQL = '
DELETE FROM
	[dbo].[Status]
WHERE
	' + @WhereCondition

EXEC sp_executesql @SQL

--endregion



GO
/****** Object:  StoredProcedure [dbo].[usp_DeleteTransaction]    Script Date: 3/1/2021 10:03:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--region [dbo].[usp_DeleteTransaction]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   truon using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [dbo].[usp_DeleteTransaction]
-- Date Generated: Friday, February 19, 2021
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_DeleteTransaction]
	@id nchar(10)
AS

SET NOCOUNT ON

DELETE FROM [dbo].[Transactions]
WHERE
	[id] = @id

--endregion



GO
/****** Object:  StoredProcedure [dbo].[usp_DeleteTransactionsByorderId]    Script Date: 3/1/2021 10:03:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--region [dbo].[usp_DeleteTransactionsByorderId]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   truon using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [dbo].[usp_DeleteTransactionsByorderId]
-- Date Generated: Friday, February 19, 2021
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_DeleteTransactionsByorderId]
	@orderId nchar(10)
AS

SET NOCOUNT ON

DELETE FROM [dbo].[Transactions]
WHERE
	[orderId] = @orderId



GO
/****** Object:  StoredProcedure [dbo].[usp_DeleteTransactionsByuserId]    Script Date: 3/1/2021 10:03:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--region [dbo].[usp_DeleteTransactionsByuserId]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   truon using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [dbo].[usp_DeleteTransactionsByuserId]
-- Date Generated: Friday, February 19, 2021
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_DeleteTransactionsByuserId]
	@userId nchar(10)
AS

SET NOCOUNT ON

DELETE FROM [dbo].[Transactions]
WHERE
	[userId] = @userId



GO
/****** Object:  StoredProcedure [dbo].[usp_DeleteTransactionsDynamic]    Script Date: 3/1/2021 10:03:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--region [dbo].[usp_DeleteTransactionsDynamic]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   truon using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [dbo].[usp_DeleteTransactionsDynamic]
-- Date Generated: Friday, February 19, 2021
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_DeleteTransactionsDynamic]
	@WhereCondition nvarchar(500)
AS

SET NOCOUNT ON

DECLARE @SQL nvarchar(3250)

SET @SQL = '
DELETE FROM
	[dbo].[Transactions]
WHERE
	' + @WhereCondition

EXEC sp_executesql @SQL

--endregion



GO
/****** Object:  StoredProcedure [dbo].[usp_DeleteType]    Script Date: 3/1/2021 10:03:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--region [dbo].[usp_DeleteType]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   truon using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [dbo].[usp_DeleteType]
-- Date Generated: Friday, February 19, 2021
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_DeleteType]
	@id nchar(10)
AS

SET NOCOUNT ON

DELETE FROM [dbo].[Types]
WHERE
	[id] = @id

--endregion



GO
/****** Object:  StoredProcedure [dbo].[usp_DeleteTypesDynamic]    Script Date: 3/1/2021 10:03:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--region [dbo].[usp_DeleteTypesDynamic]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   truon using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [dbo].[usp_DeleteTypesDynamic]
-- Date Generated: Friday, February 19, 2021
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_DeleteTypesDynamic]
	@WhereCondition nvarchar(500)
AS

SET NOCOUNT ON

DECLARE @SQL nvarchar(3250)

SET @SQL = '
DELETE FROM
	[dbo].[Types]
WHERE
	' + @WhereCondition

EXEC sp_executesql @SQL

--endregion



GO
/****** Object:  StoredProcedure [dbo].[usp_DeleteUser]    Script Date: 3/1/2021 10:03:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--region [dbo].[usp_DeleteUser]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   truon using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [dbo].[usp_DeleteUser]
-- Date Generated: Friday, February 19, 2021
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_DeleteUser]
	@id nchar(10)
AS

SET NOCOUNT ON

DELETE FROM [dbo].[Users]
WHERE
	[id] = @id

--endregion



GO
/****** Object:  StoredProcedure [dbo].[usp_DeleteUsersDynamic]    Script Date: 3/1/2021 10:03:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--region [dbo].[usp_DeleteUsersDynamic]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   truon using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [dbo].[usp_DeleteUsersDynamic]
-- Date Generated: Friday, February 19, 2021
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_DeleteUsersDynamic]
	@WhereCondition nvarchar(500)
AS

SET NOCOUNT ON

DECLARE @SQL nvarchar(3250)

SET @SQL = '
DELETE FROM
	[dbo].[Users]
WHERE
	' + @WhereCondition

EXEC sp_executesql @SQL

--endregion



GO
/****** Object:  StoredProcedure [dbo].[usp_InsertAction]    Script Date: 3/1/2021 10:03:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--region [dbo].[usp_InsertAction]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   truon using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [dbo].[usp_InsertAction]
-- Date Generated: Friday, February 19, 2021
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_InsertAction]
	@id nchar(10),
	@name nvarchar(50)
AS

SET NOCOUNT ON

INSERT INTO [dbo].[Actions] (
	[id],
	[name]
) VALUES (
	@id,
	@name
)

--endregion



GO
/****** Object:  StoredProcedure [dbo].[usp_InsertCategory]    Script Date: 3/1/2021 10:03:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--region [dbo].[usp_InsertCategory]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   truon using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [dbo].[usp_InsertCategory]
-- Date Generated: Friday, February 19, 2021
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_InsertCategory]
	@id nchar(10),
	@name nvarchar(50),
	@isShowOnHome bit,
	@status bit
AS

SET NOCOUNT ON

INSERT INTO [dbo].[Categories] (
	[id],
	[name],
	[isShowOnHome],
	[status]
) VALUES (
	@id,
	@name,
	@isShowOnHome,
	@status
)

--endregion



GO
/****** Object:  StoredProcedure [dbo].[usp_InsertFunction]    Script Date: 3/1/2021 10:03:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--region [dbo].[usp_InsertFunction]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   truon using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [dbo].[usp_InsertFunction]
-- Date Generated: Friday, February 19, 2021
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_InsertFunction]
	@id nchar(10),
	@name nvarchar(50),
	@url nchar(255),
	@parentId nchar(10),
	@status bit
AS

SET NOCOUNT ON

INSERT INTO [dbo].[Functions] (
	[id],
	[name],
	[url],
	[parentId],
	[status]
) VALUES (
	@id,
	@name,
	@url,
	@parentId,
	@status
)

--endregion



GO
/****** Object:  StoredProcedure [dbo].[usp_InsertOrder]    Script Date: 3/1/2021 10:03:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--region [dbo].[usp_InsertOrder]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   truon using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [dbo].[usp_InsertOrder]
-- Date Generated: Friday, February 19, 2021
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_InsertOrder]
	@id nchar(10),
	@createdBy nchar(10),
	@userId nchar(10),
	@orderDate datetime,
	@shipName nvarchar(50),
	@shipAddress nvarchar(255),
	@shipPhoneNumber nchar(20),
	@status int,
	@typeId nchar(10),
	@fee float,
	@discount float,
	@total float
AS

SET NOCOUNT ON

INSERT INTO [dbo].[Orders] (
	[id],
	[createdBy],
	[userId],
	[orderDate],
	[shipName],
	[shipAddress],
	[shipPhoneNumber],
	[status],
	[typeId],
	[fee],
	[discount],
	[total]
) VALUES (
	@id,
	@createdBy,
	@userId,
	@orderDate,
	@shipName,
	@shipAddress,
	@shipPhoneNumber,
	@status,
	@typeId,
	@fee,
	@discount,
	@total
)

--endregion



GO
/****** Object:  StoredProcedure [dbo].[usp_InsertProduct]    Script Date: 3/1/2021 10:03:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--region [dbo].[usp_InsertProduct]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   truon using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [dbo].[usp_InsertProduct]
-- Date Generated: Friday, February 19, 2021
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_InsertProduct]
	@id nchar(10),
	@name nvarchar(50),
	@description nvarchar(255),
	@price float,
	@details nvarchar(255),
	@isShowOnHome bit,
	@discount float,
	@quantityOrder int,
	@image nchar(255),
	@categoriesId nchar(10)
AS

SET NOCOUNT ON

INSERT INTO [dbo].[Products] (
	[id],
	[name],
	[description],
	[price],
	[details],
	[isShowOnHome],
	[discount],
	[quantityOrder],
	[image],
	[categoriesId]
) VALUES (
	@id,
	@name,
	@description,
	@price,
	@details,
	@isShowOnHome,
	@discount,
	@quantityOrder,
	@image,
	@categoriesId
)

--endregion



GO
/****** Object:  StoredProcedure [dbo].[usp_InsertRole]    Script Date: 3/1/2021 10:03:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--region [dbo].[usp_InsertRole]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   truon using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [dbo].[usp_InsertRole]
-- Date Generated: Friday, February 19, 2021
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_InsertRole]
	@id nchar(10),
	@name nvarchar(50)
AS

SET NOCOUNT ON

INSERT INTO [dbo].[Roles] (
	[id],
	[name]
) VALUES (
	@id,
	@name
)

--endregion



GO
/****** Object:  StoredProcedure [dbo].[usp_InsertStatus]    Script Date: 3/1/2021 10:03:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--region [dbo].[usp_InsertStatus]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   truon using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [dbo].[usp_InsertStatus]
-- Date Generated: Friday, February 19, 2021
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_InsertStatus]
	@id nchar(10),
	@name nvarchar(50)
AS

SET NOCOUNT ON

INSERT INTO [dbo].[Status] (
	[id],
	[name]
) VALUES (
	@id,
	@name
)

--endregion



GO
/****** Object:  StoredProcedure [dbo].[usp_InsertTransaction]    Script Date: 3/1/2021 10:03:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--region [dbo].[usp_InsertTransaction]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   truon using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [dbo].[usp_InsertTransaction]
-- Date Generated: Friday, February 19, 2021
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_InsertTransaction]
	@id nchar(10),
	@userId nchar(10),
	@orderId nchar(10),
	@createdBy nchar(10),
	@createdAt datetime,
	@message nvarchar(255),
	@status bit
AS

SET NOCOUNT ON

INSERT INTO [dbo].[Transactions] (
	[id],
	[userId],
	[orderId],
	[createdBy],
	[createdAt],
	[message],
	[status]
) VALUES (
	@id,
	@userId,
	@orderId,
	@createdBy,
	@createdAt,
	@message,
	@status
)

--endregion



GO
/****** Object:  StoredProcedure [dbo].[usp_InsertType]    Script Date: 3/1/2021 10:03:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--region [dbo].[usp_InsertType]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   truon using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [dbo].[usp_InsertType]
-- Date Generated: Friday, February 19, 2021
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_InsertType]
	@id nchar(10),
	@name nvarchar(50)
AS

SET NOCOUNT ON

INSERT INTO [dbo].[Types] (
	[id],
	[name]
) VALUES (
	@id,
	@name
)

--endregion



GO
/****** Object:  StoredProcedure [dbo].[usp_InsertUpdateAction]    Script Date: 3/1/2021 10:03:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--region [dbo].[usp_InsertUpdateAction]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   truon using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [dbo].[usp_InsertUpdateAction]
-- Date Generated: Friday, February 19, 2021
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_InsertUpdateAction]
	@id nchar(10),
	@name nvarchar(50)
AS

SET NOCOUNT ON

IF EXISTS(SELECT [id] FROM [dbo].[Actions] WHERE [id] = @id)
BEGIN
	UPDATE [dbo].[Actions] SET
		[name] = @name
	WHERE
		[id] = @id
END
ELSE
BEGIN
	INSERT INTO [dbo].[Actions] (
		[id],
		[name]
	) VALUES (
		@id,
		@name
	)
END

--endregion



GO
/****** Object:  StoredProcedure [dbo].[usp_InsertUpdateCategory]    Script Date: 3/1/2021 10:03:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--region [dbo].[usp_InsertUpdateCategory]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   truon using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [dbo].[usp_InsertUpdateCategory]
-- Date Generated: Friday, February 19, 2021
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_InsertUpdateCategory]
	@id nchar(10),
	@name nvarchar(50),
	@isShowOnHome bit,
	@status bit
AS

SET NOCOUNT ON

IF EXISTS(SELECT [id] FROM [dbo].[Categories] WHERE [id] = @id)
BEGIN
	UPDATE [dbo].[Categories] SET
		[name] = @name,
		[isShowOnHome] = @isShowOnHome,
		[status] = @status
	WHERE
		[id] = @id
END
ELSE
BEGIN
	INSERT INTO [dbo].[Categories] (
		[id],
		[name],
		[isShowOnHome],
		[status]
	) VALUES (
		@id,
		@name,
		@isShowOnHome,
		@status
	)
END

--endregion



GO
/****** Object:  StoredProcedure [dbo].[usp_InsertUpdateFunction]    Script Date: 3/1/2021 10:03:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--region [dbo].[usp_InsertUpdateFunction]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   truon using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [dbo].[usp_InsertUpdateFunction]
-- Date Generated: Friday, February 19, 2021
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_InsertUpdateFunction]
	@id nchar(10),
	@name nvarchar(50),
	@url nchar(255),
	@parentId nchar(10),
	@status bit
AS

SET NOCOUNT ON

IF EXISTS(SELECT [id] FROM [dbo].[Functions] WHERE [id] = @id)
BEGIN
	UPDATE [dbo].[Functions] SET
		[name] = @name,
		[url] = @url,
		[parentId] = @parentId,
		[status] = @status
	WHERE
		[id] = @id
END
ELSE
BEGIN
	INSERT INTO [dbo].[Functions] (
		[id],
		[name],
		[url],
		[parentId],
		[status]
	) VALUES (
		@id,
		@name,
		@url,
		@parentId,
		@status
	)
END

--endregion



GO
/****** Object:  StoredProcedure [dbo].[usp_InsertUpdateOrder]    Script Date: 3/1/2021 10:03:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--region [dbo].[usp_InsertUpdateOrder]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   truon using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [dbo].[usp_InsertUpdateOrder]
-- Date Generated: Friday, February 19, 2021
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_InsertUpdateOrder]
	@id nchar(10),
	@createdBy nchar(10),
	@userId nchar(10),
	@orderDate datetime,
	@shipName nvarchar(50),
	@shipAddress nvarchar(255),
	@shipPhoneNumber nchar(20),
	@status int,
	@typeId nchar(10),
	@fee float,
	@discount float,
	@total float
AS

SET NOCOUNT ON

IF EXISTS(SELECT [id] FROM [dbo].[Orders] WHERE [id] = @id)
BEGIN
	UPDATE [dbo].[Orders] SET
		[createdBy] = @createdBy,
		[userId] = @userId,
		[orderDate] = @orderDate,
		[shipName] = @shipName,
		[shipAddress] = @shipAddress,
		[shipPhoneNumber] = @shipPhoneNumber,
		[status] = @status,
		[typeId] = @typeId,
		[fee] = @fee,
		[discount] = @discount,
		[total] = @total
	WHERE
		[id] = @id
END
ELSE
BEGIN
	INSERT INTO [dbo].[Orders] (
		[id],
		[createdBy],
		[userId],
		[orderDate],
		[shipName],
		[shipAddress],
		[shipPhoneNumber],
		[status],
		[typeId],
		[fee],
		[discount],
		[total]
	) VALUES (
		@id,
		@createdBy,
		@userId,
		@orderDate,
		@shipName,
		@shipAddress,
		@shipPhoneNumber,
		@status,
		@typeId,
		@fee,
		@discount,
		@total
	)
END

--endregion



GO
/****** Object:  StoredProcedure [dbo].[usp_InsertUpdateProduct]    Script Date: 3/1/2021 10:03:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--region [dbo].[usp_InsertUpdateProduct]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   truon using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [dbo].[usp_InsertUpdateProduct]
-- Date Generated: Friday, February 19, 2021
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_InsertUpdateProduct]
	@id nchar(10),
	@name nvarchar(50),
	@description nvarchar(255),
	@price float,
	@details nvarchar(255),
	@isShowOnHome bit,
	@discount float,
	@quantityOrder int,
	@image nchar(255),
	@categoriesId nchar(10)
AS

SET NOCOUNT ON

IF EXISTS(SELECT [id] FROM [dbo].[Products] WHERE [id] = @id)
BEGIN
	UPDATE [dbo].[Products] SET
		[name] = @name,
		[description] = @description,
		[price] = @price,
		[details] = @details,
		[isShowOnHome] = @isShowOnHome,
		[discount] = @discount,
		[quantityOrder] = @quantityOrder,
		[image] = @image,
		[categoriesId] = @categoriesId
	WHERE
		[id] = @id
END
ELSE
BEGIN
	INSERT INTO [dbo].[Products] (
		[id],
		[name],
		[description],
		[price],
		[details],
		[isShowOnHome],
		[discount],
		[quantityOrder],
		[image],
		[categoriesId]
	) VALUES (
		@id,
		@name,
		@description,
		@price,
		@details,
		@isShowOnHome,
		@discount,
		@quantityOrder,
		@image,
		@categoriesId
	)
END

--endregion



GO
/****** Object:  StoredProcedure [dbo].[usp_InsertUpdateRole]    Script Date: 3/1/2021 10:03:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--region [dbo].[usp_InsertUpdateRole]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   truon using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [dbo].[usp_InsertUpdateRole]
-- Date Generated: Friday, February 19, 2021
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_InsertUpdateRole]
	@id nchar(10),
	@name nvarchar(50)
AS

SET NOCOUNT ON

IF EXISTS(SELECT [id] FROM [dbo].[Roles] WHERE [id] = @id)
BEGIN
	UPDATE [dbo].[Roles] SET
		[name] = @name
	WHERE
		[id] = @id
END
ELSE
BEGIN
	INSERT INTO [dbo].[Roles] (
		[id],
		[name]
	) VALUES (
		@id,
		@name
	)
END

--endregion



GO
/****** Object:  StoredProcedure [dbo].[usp_InsertUpdateStatus]    Script Date: 3/1/2021 10:03:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--region [dbo].[usp_InsertUpdateStatus]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   truon using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [dbo].[usp_InsertUpdateStatus]
-- Date Generated: Friday, February 19, 2021
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_InsertUpdateStatus]
	@id nchar(10),
	@name nvarchar(50)
AS

SET NOCOUNT ON

IF EXISTS(SELECT [id] FROM [dbo].[Status] WHERE [id] = @id)
BEGIN
	UPDATE [dbo].[Status] SET
		[name] = @name
	WHERE
		[id] = @id
END
ELSE
BEGIN
	INSERT INTO [dbo].[Status] (
		[id],
		[name]
	) VALUES (
		@id,
		@name
	)
END

--endregion



GO
/****** Object:  StoredProcedure [dbo].[usp_InsertUpdateTransaction]    Script Date: 3/1/2021 10:03:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--region [dbo].[usp_InsertUpdateTransaction]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   truon using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [dbo].[usp_InsertUpdateTransaction]
-- Date Generated: Friday, February 19, 2021
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_InsertUpdateTransaction]
	@id nchar(10),
	@userId nchar(10),
	@orderId nchar(10),
	@createdBy nchar(10),
	@createdAt datetime,
	@message nvarchar(255),
	@status bit
AS

SET NOCOUNT ON

IF EXISTS(SELECT [id] FROM [dbo].[Transactions] WHERE [id] = @id)
BEGIN
	UPDATE [dbo].[Transactions] SET
		[userId] = @userId,
		[orderId] = @orderId,
		[createdBy] = @createdBy,
		[createdAt] = @createdAt,
		[message] = @message,
		[status] = @status
	WHERE
		[id] = @id
END
ELSE
BEGIN
	INSERT INTO [dbo].[Transactions] (
		[id],
		[userId],
		[orderId],
		[createdBy],
		[createdAt],
		[message],
		[status]
	) VALUES (
		@id,
		@userId,
		@orderId,
		@createdBy,
		@createdAt,
		@message,
		@status
	)
END

--endregion



GO
/****** Object:  StoredProcedure [dbo].[usp_InsertUpdateType]    Script Date: 3/1/2021 10:03:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--region [dbo].[usp_InsertUpdateType]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   truon using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [dbo].[usp_InsertUpdateType]
-- Date Generated: Friday, February 19, 2021
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_InsertUpdateType]
	@id nchar(10),
	@name nvarchar(50)
AS

SET NOCOUNT ON

IF EXISTS(SELECT [id] FROM [dbo].[Types] WHERE [id] = @id)
BEGIN
	UPDATE [dbo].[Types] SET
		[name] = @name
	WHERE
		[id] = @id
END
ELSE
BEGIN
	INSERT INTO [dbo].[Types] (
		[id],
		[name]
	) VALUES (
		@id,
		@name
	)
END

--endregion



GO
/****** Object:  StoredProcedure [dbo].[usp_InsertUpdateUser]    Script Date: 3/1/2021 10:03:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--region [dbo].[usp_InsertUpdateUser]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   truon using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [dbo].[usp_InsertUpdateUser]
-- Date Generated: Friday, February 19, 2021
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_InsertUpdateUser]
	@id nchar(10),
	@username nchar(25),
	@password nchar(256),
	@phoneNumber nchar(20),
	@email nchar(50),
	@DOB date,
	@fullName nvarchar(50),
	@address nvarchar(50),
	@total float,
	@status bit
AS

SET NOCOUNT ON

IF EXISTS(SELECT [id] FROM [dbo].[Users] WHERE [id] = @id)
BEGIN
	UPDATE [dbo].[Users] SET
		[username] = @username,
		[password] = @password,
		[phoneNumber] = @phoneNumber,
		[email] = @email,
		[DOB] = @DOB,
		[fullName] = @fullName,
		[address] = @address,
		[total] = @total,
		[status] = @status
	WHERE
		[id] = @id
END
ELSE
BEGIN
	INSERT INTO [dbo].[Users] (
		[id],
		[username],
		[password],
		[phoneNumber],
		[email],
		[DOB],
		[fullName],
		[address],
		[total],
		[status]
	) VALUES (
		@id,
		@username,
		@password,
		@phoneNumber,
		@email,
		@DOB,
		@fullName,
		@address,
		@total,
		@status
	)
END

--endregion



GO
/****** Object:  StoredProcedure [dbo].[usp_InsertUser]    Script Date: 3/1/2021 10:03:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--region [dbo].[usp_InsertUser]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   truon using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [dbo].[usp_InsertUser]
-- Date Generated: Friday, February 19, 2021
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_InsertUser]
	@id nchar(10),
	@username nchar(25),
	@password nchar(256),
	@phoneNumber nchar(20),
	@email nchar(50),
	@DOB date,
	@fullName nvarchar(50),
	@address nvarchar(50),
	@total float,
	@status bit
AS

SET NOCOUNT ON

INSERT INTO [dbo].[Users] (
	[id],
	[username],
	[password],
	[phoneNumber],
	[email],
	[DOB],
	[fullName],
	[address],
	[total],
	[status]
) VALUES (
	@id,
	@username,
	@password,
	@phoneNumber,
	@email,
	@DOB,
	@fullName,
	@address,
	@total,
	@status
)

--endregion



GO
/****** Object:  StoredProcedure [dbo].[usp_login]    Script Date: 3/1/2021 10:03:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_login](@username NCHAR(50),@password NCHAR(50))
AS
BEGIN
	DECLARE @count INT
	DECLARE @res BIT
    SELECT @count = COUNT(*) FROM dbo.Users
	WHERE username = @username
	AND password = @password
	IF @count > 0 SET @res = 1
	ELSE SET @res = 0
	SELECT @res
END

GO
/****** Object:  StoredProcedure [dbo].[usp_SelectAction]    Script Date: 3/1/2021 10:03:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--region [dbo].[usp_SelectAction]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   truon using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [dbo].[usp_SelectAction]
-- Date Generated: Friday, February 19, 2021
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_SelectAction]
	@id nchar(10)
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

SELECT
	[id],
	[name]
FROM
	[dbo].[Actions]
WHERE
	[id] = @id

--endregion



GO
/****** Object:  StoredProcedure [dbo].[usp_SelectActionsAll]    Script Date: 3/1/2021 10:03:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--region [dbo].[usp_SelectActionsAll]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   truon using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [dbo].[usp_SelectActionsAll]
-- Date Generated: Friday, February 19, 2021
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_SelectActionsAll]
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

SELECT
	[id],
	[name]
FROM
	[dbo].[Actions]

--endregion



GO
/****** Object:  StoredProcedure [dbo].[usp_SelectActionsDynamic]    Script Date: 3/1/2021 10:03:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--region [dbo].[usp_SelectActionsDynamic]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   truon using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [dbo].[usp_SelectActionsDynamic]
-- Date Generated: Friday, February 19, 2021
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_SelectActionsDynamic]
	@WhereCondition nvarchar(500),
	@OrderByExpression nvarchar(250) = NULL
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

DECLARE @SQL nvarchar(3250)

SET @SQL = '
SELECT
	[id],
	[name]
FROM
	[dbo].[Actions]
WHERE
	' + @WhereCondition

IF @OrderByExpression IS NOT NULL AND LEN(@OrderByExpression) > 0
BEGIN
	SET @SQL = @SQL + '
ORDER BY
	' + @OrderByExpression
END

EXEC sp_executesql @SQL

--endregion



GO
/****** Object:  StoredProcedure [dbo].[usp_SelectActionsPaged]    Script Date: 3/1/2021 10:03:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--region [dbo].[usp_SelectActionsPaged]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   truon using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [dbo].[usp_SelectActionsPaged]
-- Date Generated: Friday, February 19, 2021
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_SelectActionsPaged]
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

SELECT
	[id],
	[name]
FROM
	[dbo].[Actions]

--endregion



GO
/****** Object:  StoredProcedure [dbo].[usp_SelectCategoriesAll]    Script Date: 3/1/2021 10:03:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--region [dbo].[usp_SelectCategoriesAll]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   truon using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [dbo].[usp_SelectCategoriesAll]
-- Date Generated: Friday, February 19, 2021
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_SelectCategoriesAll]
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

SELECT
	[id],
	[name],
	[isShowOnHome],
	[status]
FROM
	[dbo].[Categories]

--endregion



GO
/****** Object:  StoredProcedure [dbo].[usp_SelectCategoriesDynamic]    Script Date: 3/1/2021 10:03:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--region [dbo].[usp_SelectCategoriesDynamic]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   truon using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [dbo].[usp_SelectCategoriesDynamic]
-- Date Generated: Friday, February 19, 2021
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_SelectCategoriesDynamic]
	@WhereCondition nvarchar(500),
	@OrderByExpression nvarchar(250) = NULL
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

DECLARE @SQL nvarchar(3250)

SET @SQL = '
SELECT
	[id],
	[name],
	[isShowOnHome],
	[status]
FROM
	[dbo].[Categories]
WHERE
	' + @WhereCondition

IF @OrderByExpression IS NOT NULL AND LEN(@OrderByExpression) > 0
BEGIN
	SET @SQL = @SQL + '
ORDER BY
	' + @OrderByExpression
END

EXEC sp_executesql @SQL

--endregion



GO
/****** Object:  StoredProcedure [dbo].[usp_SelectCategoriesPaged]    Script Date: 3/1/2021 10:03:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--region [dbo].[usp_SelectCategoriesPaged]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   truon using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [dbo].[usp_SelectCategoriesPaged]
-- Date Generated: Friday, February 19, 2021
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_SelectCategoriesPaged]
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

SELECT
	[id],
	[name],
	[isShowOnHome],
	[status]
FROM
	[dbo].[Categories]

--endregion



GO
/****** Object:  StoredProcedure [dbo].[usp_SelectCategory]    Script Date: 3/1/2021 10:03:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--region [dbo].[usp_SelectCategory]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   truon using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [dbo].[usp_SelectCategory]
-- Date Generated: Friday, February 19, 2021
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_SelectCategory]
	@id nchar(10)
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

SELECT
	[id],
	[name],
	[isShowOnHome],
	[status]
FROM
	[dbo].[Categories]
WHERE
	[id] = @id

--endregion



GO
/****** Object:  StoredProcedure [dbo].[usp_SelectFunction]    Script Date: 3/1/2021 10:03:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--region [dbo].[usp_SelectFunction]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   truon using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [dbo].[usp_SelectFunction]
-- Date Generated: Friday, February 19, 2021
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_SelectFunction]
	@id nchar(10)
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

SELECT
	[id],
	[name],
	[url],
	[parentId],
	[status]
FROM
	[dbo].[Functions]
WHERE
	[id] = @id

--endregion



GO
/****** Object:  StoredProcedure [dbo].[usp_SelectFunctionsAll]    Script Date: 3/1/2021 10:03:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--region [dbo].[usp_SelectFunctionsAll]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   truon using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [dbo].[usp_SelectFunctionsAll]
-- Date Generated: Friday, February 19, 2021
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_SelectFunctionsAll]
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

SELECT
	[id],
	[name],
	[url],
	[parentId],
	[status]
FROM
	[dbo].[Functions]

--endregion



GO
/****** Object:  StoredProcedure [dbo].[usp_SelectFunctionsDynamic]    Script Date: 3/1/2021 10:03:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--region [dbo].[usp_SelectFunctionsDynamic]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   truon using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [dbo].[usp_SelectFunctionsDynamic]
-- Date Generated: Friday, February 19, 2021
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_SelectFunctionsDynamic]
	@WhereCondition nvarchar(500),
	@OrderByExpression nvarchar(250) = NULL
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

DECLARE @SQL nvarchar(3250)

SET @SQL = '
SELECT
	[id],
	[name],
	[url],
	[parentId],
	[status]
FROM
	[dbo].[Functions]
WHERE
	' + @WhereCondition

IF @OrderByExpression IS NOT NULL AND LEN(@OrderByExpression) > 0
BEGIN
	SET @SQL = @SQL + '
ORDER BY
	' + @OrderByExpression
END

EXEC sp_executesql @SQL

--endregion



GO
/****** Object:  StoredProcedure [dbo].[usp_SelectFunctionsPaged]    Script Date: 3/1/2021 10:03:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--region [dbo].[usp_SelectFunctionsPaged]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   truon using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [dbo].[usp_SelectFunctionsPaged]
-- Date Generated: Friday, February 19, 2021
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_SelectFunctionsPaged]
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

SELECT
	[id],
	[name],
	[url],
	[parentId],
	[status]
FROM
	[dbo].[Functions]

--endregion



GO
/****** Object:  StoredProcedure [dbo].[usp_SelectOrder]    Script Date: 3/1/2021 10:03:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--region [dbo].[usp_SelectOrder]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   truon using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [dbo].[usp_SelectOrder]
-- Date Generated: Friday, February 19, 2021
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_SelectOrder]
	@id nchar(10)
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

SELECT
	[id],
	[createdBy],
	[userId],
	[orderDate],
	[shipName],
	[shipAddress],
	[shipPhoneNumber],
	[status],
	[typeId],
	[fee],
	[discount],
	[total]
FROM
	[dbo].[Orders]
WHERE
	[id] = @id

--endregion



GO
/****** Object:  StoredProcedure [dbo].[usp_SelectOrdersAll]    Script Date: 3/1/2021 10:03:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--region [dbo].[usp_SelectOrdersAll]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   truon using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [dbo].[usp_SelectOrdersAll]
-- Date Generated: Friday, February 19, 2021
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_SelectOrdersAll]
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

SELECT
	[id],
	[createdBy],
	[userId],
	[orderDate],
	[shipName],
	[shipAddress],
	[shipPhoneNumber],
	[status],
	[typeId],
	[fee],
	[discount],
	[total]
FROM
	[dbo].[Orders]

--endregion



GO
/****** Object:  StoredProcedure [dbo].[usp_SelectOrdersBytypeId]    Script Date: 3/1/2021 10:03:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--region [dbo].[usp_SelectOrdersBytypeId]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   truon using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [dbo].[usp_SelectOrdersBytypeId]
-- Date Generated: Friday, February 19, 2021
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_SelectOrdersBytypeId]
	@typeId nchar(10)
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

SELECT
	[id],
	[createdBy],
	[userId],
	[orderDate],
	[shipName],
	[shipAddress],
	[shipPhoneNumber],
	[status],
	[typeId],
	[fee],
	[discount],
	[total]
FROM
	[dbo].[Orders]
WHERE
	[typeId] = @typeId

--endregion



GO
/****** Object:  StoredProcedure [dbo].[usp_SelectOrdersByuserId]    Script Date: 3/1/2021 10:03:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--region [dbo].[usp_SelectOrdersByuserId]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   truon using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [dbo].[usp_SelectOrdersByuserId]
-- Date Generated: Friday, February 19, 2021
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_SelectOrdersByuserId]
	@userId nchar(10)
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

SELECT
	[id],
	[createdBy],
	[userId],
	[orderDate],
	[shipName],
	[shipAddress],
	[shipPhoneNumber],
	[status],
	[typeId],
	[fee],
	[discount],
	[total]
FROM
	[dbo].[Orders]
WHERE
	[userId] = @userId

--endregion



GO
/****** Object:  StoredProcedure [dbo].[usp_SelectOrdersDynamic]    Script Date: 3/1/2021 10:03:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--region [dbo].[usp_SelectOrdersDynamic]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   truon using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [dbo].[usp_SelectOrdersDynamic]
-- Date Generated: Friday, February 19, 2021
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_SelectOrdersDynamic]
	@WhereCondition nvarchar(500),
	@OrderByExpression nvarchar(250) = NULL
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

DECLARE @SQL nvarchar(3250)

SET @SQL = '
SELECT
	[id],
	[createdBy],
	[userId],
	[orderDate],
	[shipName],
	[shipAddress],
	[shipPhoneNumber],
	[status],
	[typeId],
	[fee],
	[discount],
	[total]
FROM
	[dbo].[Orders]
WHERE
	' + @WhereCondition

IF @OrderByExpression IS NOT NULL AND LEN(@OrderByExpression) > 0
BEGIN
	SET @SQL = @SQL + '
ORDER BY
	' + @OrderByExpression
END

EXEC sp_executesql @SQL

--endregion



GO
/****** Object:  StoredProcedure [dbo].[usp_SelectOrdersPaged]    Script Date: 3/1/2021 10:03:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--region [dbo].[usp_SelectOrdersPaged]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   truon using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [dbo].[usp_SelectOrdersPaged]
-- Date Generated: Friday, February 19, 2021
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_SelectOrdersPaged]
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

SELECT
	[id],
	[createdBy],
	[userId],
	[orderDate],
	[shipName],
	[shipAddress],
	[shipPhoneNumber],
	[status],
	[typeId],
	[fee],
	[discount],
	[total]
FROM
	[dbo].[Orders]

--endregion



GO
/****** Object:  StoredProcedure [dbo].[usp_SelectProduct]    Script Date: 3/1/2021 10:03:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--region [dbo].[usp_SelectProduct]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   truon using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [dbo].[usp_SelectProduct]
-- Date Generated: Friday, February 19, 2021
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_SelectProduct]
	@id nchar(10)
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

SELECT
	[id],
	[name],
	[description],
	[price],
	[details],
	[isShowOnHome],
	[discount],
	[quantityOrder],
	[image],
	[categoriesId]
FROM
	[dbo].[Products]
WHERE
	[id] = @id

--endregion



GO
/****** Object:  StoredProcedure [dbo].[usp_SelectProductsAll]    Script Date: 3/1/2021 10:03:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--region [dbo].[usp_SelectProductsAll]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   truon using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [dbo].[usp_SelectProductsAll]
-- Date Generated: Friday, February 19, 2021
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_SelectProductsAll]
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

SELECT
	[id],
	[name],
	[description],
	[price],
	[details],
	[isShowOnHome],
	[discount],
	[quantityOrder],
	[image],
	[categoriesId]
FROM
	[dbo].[Products]

--endregion



GO
/****** Object:  StoredProcedure [dbo].[usp_SelectProductsBycategoriesId]    Script Date: 3/1/2021 10:03:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--region [dbo].[usp_SelectProductsBycategoriesId]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   truon using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [dbo].[usp_SelectProductsBycategoriesId]
-- Date Generated: Friday, February 19, 2021
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_SelectProductsBycategoriesId]
	@categoriesId nchar(10)
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

SELECT
	[id],
	[name],
	[description],
	[price],
	[details],
	[isShowOnHome],
	[discount],
	[quantityOrder],
	[image],
	[categoriesId]
FROM
	[dbo].[Products]
WHERE
	[categoriesId] = @categoriesId

--endregion



GO
/****** Object:  StoredProcedure [dbo].[usp_SelectProductsDynamic]    Script Date: 3/1/2021 10:03:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--region [dbo].[usp_SelectProductsDynamic]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   truon using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [dbo].[usp_SelectProductsDynamic]
-- Date Generated: Friday, February 19, 2021
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_SelectProductsDynamic]
	@WhereCondition nvarchar(500),
	@OrderByExpression nvarchar(250) = NULL
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

DECLARE @SQL nvarchar(3250)

SET @SQL = '
SELECT
	[id],
	[name],
	[description],
	[price],
	[details],
	[isShowOnHome],
	[discount],
	[quantityOrder],
	[image],
	[categoriesId]
FROM
	[dbo].[Products]
WHERE
	' + @WhereCondition

IF @OrderByExpression IS NOT NULL AND LEN(@OrderByExpression) > 0
BEGIN
	SET @SQL = @SQL + '
ORDER BY
	' + @OrderByExpression
END

EXEC sp_executesql @SQL

--endregion



GO
/****** Object:  StoredProcedure [dbo].[usp_SelectProductsPaged]    Script Date: 3/1/2021 10:03:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--region [dbo].[usp_SelectProductsPaged]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   truon using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [dbo].[usp_SelectProductsPaged]
-- Date Generated: Friday, February 19, 2021
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_SelectProductsPaged]
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

SELECT
	[id],
	[name],
	[description],
	[price],
	[details],
	[isShowOnHome],
	[discount],
	[quantityOrder],
	[image],
	[categoriesId]
FROM
	[dbo].[Products]

--endregion



GO
/****** Object:  StoredProcedure [dbo].[usp_SelectRole]    Script Date: 3/1/2021 10:03:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--region [dbo].[usp_SelectRole]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   truon using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [dbo].[usp_SelectRole]
-- Date Generated: Friday, February 19, 2021
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_SelectRole]
	@id nchar(10)
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

SELECT
	[id],
	[name]
FROM
	[dbo].[Roles]
WHERE
	[id] = @id

--endregion



GO
/****** Object:  StoredProcedure [dbo].[usp_SelectRolesAll]    Script Date: 3/1/2021 10:03:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--region [dbo].[usp_SelectRolesAll]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   truon using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [dbo].[usp_SelectRolesAll]
-- Date Generated: Friday, February 19, 2021
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_SelectRolesAll]
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

SELECT
	[id],
	[name]
FROM
	[dbo].[Roles]

--endregion



GO
/****** Object:  StoredProcedure [dbo].[usp_SelectRolesDynamic]    Script Date: 3/1/2021 10:03:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--region [dbo].[usp_SelectRolesDynamic]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   truon using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [dbo].[usp_SelectRolesDynamic]
-- Date Generated: Friday, February 19, 2021
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_SelectRolesDynamic]
	@WhereCondition nvarchar(500),
	@OrderByExpression nvarchar(250) = NULL
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

DECLARE @SQL nvarchar(3250)

SET @SQL = '
SELECT
	[id],
	[name]
FROM
	[dbo].[Roles]
WHERE
	' + @WhereCondition

IF @OrderByExpression IS NOT NULL AND LEN(@OrderByExpression) > 0
BEGIN
	SET @SQL = @SQL + '
ORDER BY
	' + @OrderByExpression
END

EXEC sp_executesql @SQL

--endregion



GO
/****** Object:  StoredProcedure [dbo].[usp_SelectRolesPaged]    Script Date: 3/1/2021 10:03:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--region [dbo].[usp_SelectRolesPaged]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   truon using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [dbo].[usp_SelectRolesPaged]
-- Date Generated: Friday, February 19, 2021
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_SelectRolesPaged]
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

SELECT
	[id],
	[name]
FROM
	[dbo].[Roles]

--endregion



GO
/****** Object:  StoredProcedure [dbo].[usp_SelectStatus]    Script Date: 3/1/2021 10:03:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--region [dbo].[usp_SelectStatus]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   truon using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [dbo].[usp_SelectStatus]
-- Date Generated: Friday, February 19, 2021
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_SelectStatus]
	@id nchar(10)
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

SELECT
	[id],
	[name]
FROM
	[dbo].[Status]
WHERE
	[id] = @id

--endregion



GO
/****** Object:  StoredProcedure [dbo].[usp_SelectStatusAll]    Script Date: 3/1/2021 10:03:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--region [dbo].[usp_SelectStatusAll]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   truon using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [dbo].[usp_SelectStatusAll]
-- Date Generated: Friday, February 19, 2021
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_SelectStatusAll]
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

SELECT
	[id],
	[name]
FROM
	[dbo].[Status]

--endregion



GO
/****** Object:  StoredProcedure [dbo].[usp_SelectStatusDynamic]    Script Date: 3/1/2021 10:03:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--region [dbo].[usp_SelectStatusDynamic]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   truon using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [dbo].[usp_SelectStatusDynamic]
-- Date Generated: Friday, February 19, 2021
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_SelectStatusDynamic]
	@WhereCondition nvarchar(500),
	@OrderByExpression nvarchar(250) = NULL
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

DECLARE @SQL nvarchar(3250)

SET @SQL = '
SELECT
	[id],
	[name]
FROM
	[dbo].[Status]
WHERE
	' + @WhereCondition

IF @OrderByExpression IS NOT NULL AND LEN(@OrderByExpression) > 0
BEGIN
	SET @SQL = @SQL + '
ORDER BY
	' + @OrderByExpression
END

EXEC sp_executesql @SQL

--endregion



GO
/****** Object:  StoredProcedure [dbo].[usp_SelectStatusPaged]    Script Date: 3/1/2021 10:03:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--region [dbo].[usp_SelectStatusPaged]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   truon using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [dbo].[usp_SelectStatusPaged]
-- Date Generated: Friday, February 19, 2021
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_SelectStatusPaged]
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

SELECT
	[id],
	[name]
FROM
	[dbo].[Status]

--endregion



GO
/****** Object:  StoredProcedure [dbo].[usp_SelectTransaction]    Script Date: 3/1/2021 10:03:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--region [dbo].[usp_SelectTransaction]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   truon using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [dbo].[usp_SelectTransaction]
-- Date Generated: Friday, February 19, 2021
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_SelectTransaction]
	@id nchar(10)
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

SELECT
	[id],
	[userId],
	[orderId],
	[createdBy],
	[createdAt],
	[message],
	[status]
FROM
	[dbo].[Transactions]
WHERE
	[id] = @id

--endregion



GO
/****** Object:  StoredProcedure [dbo].[usp_SelectTransactionsAll]    Script Date: 3/1/2021 10:03:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--region [dbo].[usp_SelectTransactionsAll]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   truon using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [dbo].[usp_SelectTransactionsAll]
-- Date Generated: Friday, February 19, 2021
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_SelectTransactionsAll]
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

SELECT
	[id],
	[userId],
	[orderId],
	[createdBy],
	[createdAt],
	[message],
	[status]
FROM
	[dbo].[Transactions]

--endregion



GO
/****** Object:  StoredProcedure [dbo].[usp_SelectTransactionsByorderId]    Script Date: 3/1/2021 10:03:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--region [dbo].[usp_SelectTransactionsByorderId]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   truon using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [dbo].[usp_SelectTransactionsByorderId]
-- Date Generated: Friday, February 19, 2021
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_SelectTransactionsByorderId]
	@orderId nchar(10)
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

SELECT
	[id],
	[userId],
	[orderId],
	[createdBy],
	[createdAt],
	[message],
	[status]
FROM
	[dbo].[Transactions]
WHERE
	[orderId] = @orderId

--endregion



GO
/****** Object:  StoredProcedure [dbo].[usp_SelectTransactionsByuserId]    Script Date: 3/1/2021 10:03:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--region [dbo].[usp_SelectTransactionsByuserId]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   truon using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [dbo].[usp_SelectTransactionsByuserId]
-- Date Generated: Friday, February 19, 2021
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_SelectTransactionsByuserId]
	@userId nchar(10)
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

SELECT
	[id],
	[userId],
	[orderId],
	[createdBy],
	[createdAt],
	[message],
	[status]
FROM
	[dbo].[Transactions]
WHERE
	[userId] = @userId

--endregion



GO
/****** Object:  StoredProcedure [dbo].[usp_SelectTransactionsDynamic]    Script Date: 3/1/2021 10:03:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--region [dbo].[usp_SelectTransactionsDynamic]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   truon using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [dbo].[usp_SelectTransactionsDynamic]
-- Date Generated: Friday, February 19, 2021
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_SelectTransactionsDynamic]
	@WhereCondition nvarchar(500),
	@OrderByExpression nvarchar(250) = NULL
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

DECLARE @SQL nvarchar(3250)

SET @SQL = '
SELECT
	[id],
	[userId],
	[orderId],
	[createdBy],
	[createdAt],
	[message],
	[status]
FROM
	[dbo].[Transactions]
WHERE
	' + @WhereCondition

IF @OrderByExpression IS NOT NULL AND LEN(@OrderByExpression) > 0
BEGIN
	SET @SQL = @SQL + '
ORDER BY
	' + @OrderByExpression
END

EXEC sp_executesql @SQL

--endregion



GO
/****** Object:  StoredProcedure [dbo].[usp_SelectTransactionsPaged]    Script Date: 3/1/2021 10:03:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--region [dbo].[usp_SelectTransactionsPaged]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   truon using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [dbo].[usp_SelectTransactionsPaged]
-- Date Generated: Friday, February 19, 2021
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_SelectTransactionsPaged]
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

SELECT
	[id],
	[userId],
	[orderId],
	[createdBy],
	[createdAt],
	[message],
	[status]
FROM
	[dbo].[Transactions]

--endregion



GO
/****** Object:  StoredProcedure [dbo].[usp_SelectType]    Script Date: 3/1/2021 10:03:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--region [dbo].[usp_SelectType]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   truon using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [dbo].[usp_SelectType]
-- Date Generated: Friday, February 19, 2021
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_SelectType]
	@id nchar(10)
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

SELECT
	[id],
	[name]
FROM
	[dbo].[Types]
WHERE
	[id] = @id

--endregion



GO
/****** Object:  StoredProcedure [dbo].[usp_SelectTypesAll]    Script Date: 3/1/2021 10:03:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--region [dbo].[usp_SelectTypesAll]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   truon using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [dbo].[usp_SelectTypesAll]
-- Date Generated: Friday, February 19, 2021
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_SelectTypesAll]
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

SELECT
	[id],
	[name]
FROM
	[dbo].[Types]

--endregion



GO
/****** Object:  StoredProcedure [dbo].[usp_SelectTypesDynamic]    Script Date: 3/1/2021 10:03:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--region [dbo].[usp_SelectTypesDynamic]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   truon using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [dbo].[usp_SelectTypesDynamic]
-- Date Generated: Friday, February 19, 2021
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_SelectTypesDynamic]
	@WhereCondition nvarchar(500),
	@OrderByExpression nvarchar(250) = NULL
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

DECLARE @SQL nvarchar(3250)

SET @SQL = '
SELECT
	[id],
	[name]
FROM
	[dbo].[Types]
WHERE
	' + @WhereCondition

IF @OrderByExpression IS NOT NULL AND LEN(@OrderByExpression) > 0
BEGIN
	SET @SQL = @SQL + '
ORDER BY
	' + @OrderByExpression
END

EXEC sp_executesql @SQL

--endregion



GO
/****** Object:  StoredProcedure [dbo].[usp_SelectTypesPaged]    Script Date: 3/1/2021 10:03:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--region [dbo].[usp_SelectTypesPaged]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   truon using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [dbo].[usp_SelectTypesPaged]
-- Date Generated: Friday, February 19, 2021
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_SelectTypesPaged]
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

SELECT
	[id],
	[name]
FROM
	[dbo].[Types]

--endregion



GO
/****** Object:  StoredProcedure [dbo].[usp_SelectUser]    Script Date: 3/1/2021 10:03:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--region [dbo].[usp_SelectUser]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   truon using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [dbo].[usp_SelectUser]
-- Date Generated: Friday, February 19, 2021
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_SelectUser]
	@id nchar(10)
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

SELECT
	[id],
	[username],
	[password],
	[phoneNumber],
	[email],
	[DOB],
	[fullName],
	[address],
	[total],
	[status]
FROM
	[dbo].[Users]
WHERE
	[id] = @id

--endregion



GO
/****** Object:  StoredProcedure [dbo].[usp_SelectUsersAll]    Script Date: 3/1/2021 10:03:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--region [dbo].[usp_SelectUsersAll]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   truon using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [dbo].[usp_SelectUsersAll]
-- Date Generated: Friday, February 19, 2021
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_SelectUsersAll]
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

SELECT
	[id],
	[username],
	[password],
	[phoneNumber],
	[email],
	[DOB],
	[fullName],
	[address],
	[total],
	[status]
FROM
	[dbo].[Users]

--endregion



GO
/****** Object:  StoredProcedure [dbo].[usp_SelectUsersDynamic]    Script Date: 3/1/2021 10:03:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--region [dbo].[usp_SelectUsersDynamic]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   truon using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [dbo].[usp_SelectUsersDynamic]
-- Date Generated: Friday, February 19, 2021
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_SelectUsersDynamic]
	@WhereCondition nvarchar(500),
	@OrderByExpression nvarchar(250) = NULL
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

DECLARE @SQL nvarchar(3250)

SET @SQL = '
SELECT
	[id],
	[username],
	[password],
	[phoneNumber],
	[email],
	[DOB],
	[fullName],
	[address],
	[total],
	[status]
FROM
	[dbo].[Users]
WHERE
	' + @WhereCondition

IF @OrderByExpression IS NOT NULL AND LEN(@OrderByExpression) > 0
BEGIN
	SET @SQL = @SQL + '
ORDER BY
	' + @OrderByExpression
END

EXEC sp_executesql @SQL

--endregion



GO
/****** Object:  StoredProcedure [dbo].[usp_SelectUsersPaged]    Script Date: 3/1/2021 10:03:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--region [dbo].[usp_SelectUsersPaged]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   truon using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [dbo].[usp_SelectUsersPaged]
-- Date Generated: Friday, February 19, 2021
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_SelectUsersPaged]
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

SELECT
	[id],
	[username],
	[password],
	[phoneNumber],
	[email],
	[DOB],
	[fullName],
	[address],
	[total],
	[status]
FROM
	[dbo].[Users]

--endregion



GO
/****** Object:  StoredProcedure [dbo].[usp_UpdateAction]    Script Date: 3/1/2021 10:03:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--region [dbo].[usp_UpdateAction]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   truon using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [dbo].[usp_UpdateAction]
-- Date Generated: Friday, February 19, 2021
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_UpdateAction]
	@id nchar(10),
	@name nvarchar(50)
AS

SET NOCOUNT ON

UPDATE [dbo].[Actions] SET
	[name] = @name
WHERE
	[id] = @id

--endregion



GO
/****** Object:  StoredProcedure [dbo].[usp_UpdateCategory]    Script Date: 3/1/2021 10:03:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--region [dbo].[usp_UpdateCategory]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   truon using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [dbo].[usp_UpdateCategory]
-- Date Generated: Friday, February 19, 2021
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_UpdateCategory]
	@id nchar(10),
	@name nvarchar(50),
	@isShowOnHome bit,
	@status bit
AS

SET NOCOUNT ON

UPDATE [dbo].[Categories] SET
	[name] = @name,
	[isShowOnHome] = @isShowOnHome,
	[status] = @status
WHERE
	[id] = @id

--endregion



GO
/****** Object:  StoredProcedure [dbo].[usp_UpdateFunction]    Script Date: 3/1/2021 10:03:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--region [dbo].[usp_UpdateFunction]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   truon using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [dbo].[usp_UpdateFunction]
-- Date Generated: Friday, February 19, 2021
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_UpdateFunction]
	@id nchar(10),
	@name nvarchar(50),
	@url nchar(255),
	@parentId nchar(10),
	@status bit
AS

SET NOCOUNT ON

UPDATE [dbo].[Functions] SET
	[name] = @name,
	[url] = @url,
	[parentId] = @parentId,
	[status] = @status
WHERE
	[id] = @id

--endregion



GO
/****** Object:  StoredProcedure [dbo].[usp_UpdateOrder]    Script Date: 3/1/2021 10:03:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--region [dbo].[usp_UpdateOrder]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   truon using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [dbo].[usp_UpdateOrder]
-- Date Generated: Friday, February 19, 2021
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_UpdateOrder]
	@id nchar(10),
	@createdBy nchar(10),
	@userId nchar(10),
	@orderDate datetime,
	@shipName nvarchar(50),
	@shipAddress nvarchar(255),
	@shipPhoneNumber nchar(20),
	@status int,
	@typeId nchar(10),
	@fee float,
	@discount float,
	@total float
AS

SET NOCOUNT ON

UPDATE [dbo].[Orders] SET
	[createdBy] = @createdBy,
	[userId] = @userId,
	[orderDate] = @orderDate,
	[shipName] = @shipName,
	[shipAddress] = @shipAddress,
	[shipPhoneNumber] = @shipPhoneNumber,
	[status] = @status,
	[typeId] = @typeId,
	[fee] = @fee,
	[discount] = @discount,
	[total] = @total
WHERE
	[id] = @id

--endregion



GO
/****** Object:  StoredProcedure [dbo].[usp_UpdateProduct]    Script Date: 3/1/2021 10:03:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--region [dbo].[usp_UpdateProduct]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   truon using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [dbo].[usp_UpdateProduct]
-- Date Generated: Friday, February 19, 2021
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_UpdateProduct]
	@id nchar(10),
	@name nvarchar(50),
	@description nvarchar(255),
	@price float,
	@details nvarchar(255),
	@isShowOnHome bit,
	@discount float,
	@quantityOrder int,
	@image nchar(255),
	@categoriesId nchar(10)
AS

SET NOCOUNT ON

UPDATE [dbo].[Products] SET
	[name] = @name,
	[description] = @description,
	[price] = @price,
	[details] = @details,
	[isShowOnHome] = @isShowOnHome,
	[discount] = @discount,
	[quantityOrder] = @quantityOrder,
	[image] = @image,
	[categoriesId] = @categoriesId
WHERE
	[id] = @id

--endregion



GO
/****** Object:  StoredProcedure [dbo].[usp_UpdateRole]    Script Date: 3/1/2021 10:03:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--region [dbo].[usp_UpdateRole]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   truon using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [dbo].[usp_UpdateRole]
-- Date Generated: Friday, February 19, 2021
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_UpdateRole]
	@id nchar(10),
	@name nvarchar(50)
AS

SET NOCOUNT ON

UPDATE [dbo].[Roles] SET
	[name] = @name
WHERE
	[id] = @id

--endregion



GO
/****** Object:  StoredProcedure [dbo].[usp_UpdateStatus]    Script Date: 3/1/2021 10:03:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--region [dbo].[usp_UpdateStatus]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   truon using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [dbo].[usp_UpdateStatus]
-- Date Generated: Friday, February 19, 2021
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_UpdateStatus]
	@id nchar(10),
	@name nvarchar(50)
AS

SET NOCOUNT ON

UPDATE [dbo].[Status] SET
	[name] = @name
WHERE
	[id] = @id

--endregion



GO
/****** Object:  StoredProcedure [dbo].[usp_UpdateTransaction]    Script Date: 3/1/2021 10:03:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--region [dbo].[usp_UpdateTransaction]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   truon using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [dbo].[usp_UpdateTransaction]
-- Date Generated: Friday, February 19, 2021
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_UpdateTransaction]
	@id nchar(10),
	@userId nchar(10),
	@orderId nchar(10),
	@createdBy nchar(10),
	@createdAt datetime,
	@message nvarchar(255),
	@status bit
AS

SET NOCOUNT ON

UPDATE [dbo].[Transactions] SET
	[userId] = @userId,
	[orderId] = @orderId,
	[createdBy] = @createdBy,
	[createdAt] = @createdAt,
	[message] = @message,
	[status] = @status
WHERE
	[id] = @id

--endregion



GO
/****** Object:  StoredProcedure [dbo].[usp_UpdateType]    Script Date: 3/1/2021 10:03:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--region [dbo].[usp_UpdateType]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   truon using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [dbo].[usp_UpdateType]
-- Date Generated: Friday, February 19, 2021
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_UpdateType]
	@id nchar(10),
	@name nvarchar(50)
AS

SET NOCOUNT ON

UPDATE [dbo].[Types] SET
	[name] = @name
WHERE
	[id] = @id

--endregion



GO
/****** Object:  StoredProcedure [dbo].[usp_UpdateUser]    Script Date: 3/1/2021 10:03:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--region [dbo].[usp_UpdateUser]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   truon using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [dbo].[usp_UpdateUser]
-- Date Generated: Friday, February 19, 2021
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_UpdateUser]
	@id nchar(10),
	@username nchar(25),
	@password nchar(256),
	@phoneNumber nchar(20),
	@email nchar(50),
	@DOB date,
	@fullName nvarchar(50),
	@address nvarchar(50),
	@total float,
	@status bit
AS

SET NOCOUNT ON

UPDATE [dbo].[Users] SET
	[username] = @username,
	[password] = @password,
	[phoneNumber] = @phoneNumber,
	[email] = @email,
	[DOB] = @DOB,
	[fullName] = @fullName,
	[address] = @address,
	[total] = @total,
	[status] = @status
WHERE
	[id] = @id

--endregion



GO
/****** Object:  StoredProcedure [dbo].[uspActions_Delete]    Script Date: 3/1/2021 10:03:30 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO

/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Deletes a record in the Actions table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE [dbo].[uspActions_Delete]
(

	@Id nchar (10)  
)
AS


				DELETE FROM [dbo].[Actions] WITH (ROWLOCK) 
				WHERE
					[id] = @Id
					
			



GO
/****** Object:  StoredProcedure [dbo].[uspActions_Find]    Script Date: 3/1/2021 10:03:30 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO

/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Finds records in the Actions table passing nullable parameters
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE [dbo].[uspActions_Find]
(

	@SearchUsingOR bit   = null ,

	@Id nchar (10)  = null ,

	@Name nvarchar (50)  = null 
)
AS


				
  IF ISNULL(@SearchUsingOR, 0) <> 1
  BEGIN
    SELECT
	  [id]
	, [name]
    FROM
	[dbo].[Actions]
    WHERE 
	 ([id] = @Id OR @Id IS NULL)
	AND ([name] = @Name OR @Name IS NULL)
						
  END
  ELSE
  BEGIN
    SELECT
	  [id]
	, [name]
    FROM
	[dbo].[Actions]
    WHERE 
	 ([id] = @Id AND @Id is not null)
	OR ([name] = @Name AND @Name is not null)
	SELECT @@ROWCOUNT			
  END
				



GO
/****** Object:  StoredProcedure [dbo].[uspActions_Get_List]    Script Date: 3/1/2021 10:03:30 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO

/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Gets all records from the Actions table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE [dbo].[uspActions_Get_List]

AS


				
				SELECT
					[id],
					[name]
				FROM
					[dbo].[Actions]
					
				SELECT @@ROWCOUNT
			



GO
/****** Object:  StoredProcedure [dbo].[uspActions_GetById]    Script Date: 3/1/2021 10:03:30 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO

/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the Actions table through an index
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE [dbo].[uspActions_GetById]
(

	@Id nchar (10)  
)
AS


				SELECT
					[id],
					[name]
				FROM
					[dbo].[Actions]
				WHERE
					[id] = @Id
				SELECT @@ROWCOUNT
					
			



GO
/****** Object:  StoredProcedure [dbo].[uspActions_GetPaged]    Script Date: 3/1/2021 10:03:30 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO

/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Gets records from the Actions table passing page index and page count parameters
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE [dbo].[uspActions_GetPaged]
(

	@WhereClause varchar (8000)  ,

	@OrderBy varchar (2000)  ,

	@PageIndex int   ,

	@PageSize int   
)
AS


				
				BEGIN
				DECLARE @PageLowerBound int
				DECLARE @PageUpperBound int
				
				-- Set the page bounds
				SET @PageLowerBound = @PageSize * @PageIndex
				SET @PageUpperBound = @PageLowerBound + @PageSize

				IF (@OrderBy IS NULL OR LEN(@OrderBy) < 1)
				BEGIN
					-- default order by to first column
					SET @OrderBy = '[id]'
				END

				-- SQL Server 2005 Paging
				DECLARE @SQL AS nvarchar(MAX)
				SET @SQL = 'WITH PageIndex AS ('
				SET @SQL = @SQL + ' SELECT'
				IF @PageSize > 0
				BEGIN
					SET @SQL = @SQL + ' TOP ' + CONVERT(nvarchar, @PageUpperBound)
				END
				SET @SQL = @SQL + ' ROW_NUMBER() OVER (ORDER BY ' + @OrderBy + ') as RowIndex'
				SET @SQL = @SQL + ', [id]'
				SET @SQL = @SQL + ', [name]'
				SET @SQL = @SQL + ' FROM [dbo].[Actions]'
				IF LEN(@WhereClause) > 0
				BEGIN
					SET @SQL = @SQL + ' WHERE ' + @WhereClause
				END
				SET @SQL = @SQL + ' ) SELECT'
				SET @SQL = @SQL + ' [id],'
				SET @SQL = @SQL + ' [name]'
				SET @SQL = @SQL + ' FROM PageIndex'
				SET @SQL = @SQL + ' WHERE RowIndex > ' + CONVERT(nvarchar, @PageLowerBound)
				IF @PageSize > 0
				BEGIN
					SET @SQL = @SQL + ' AND RowIndex <= ' + CONVERT(nvarchar, @PageUpperBound)
				END
				SET @SQL = @SQL + ' ORDER BY ' + @OrderBy
				EXEC sp_executesql @SQL
				
				-- get row count
				SET @SQL = 'SELECT COUNT(1) AS TotalRowCount'
				SET @SQL = @SQL + ' FROM [dbo].[Actions]'
				IF LEN(@WhereClause) > 0
				BEGIN
					SET @SQL = @SQL + ' WHERE ' + @WhereClause
				END
				EXEC sp_executesql @SQL
			
				END
			



GO
/****** Object:  StoredProcedure [dbo].[uspActions_Insert]    Script Date: 3/1/2021 10:03:30 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO

/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Inserts a record into the Actions table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE [dbo].[uspActions_Insert]
(

	@Id nchar (10)  ,

	@Name nvarchar (50)  
)
AS


				
				INSERT INTO [dbo].[Actions]
					(
					[id]
					,[name]
					)
				VALUES
					(
					@Id
					,@Name
					)
									
							
			



GO
/****** Object:  StoredProcedure [dbo].[uspActions_Update]    Script Date: 3/1/2021 10:03:30 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO

/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Updates a record in the Actions table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE [dbo].[uspActions_Update]
(

	@Id nchar (10)  ,

	@OriginalId nchar (10)  ,

	@Name nvarchar (50)  
)
AS


				
				
				-- Modify the updatable columns
				UPDATE
					[dbo].[Actions]
				SET
					[id] = @Id
					,[name] = @Name
				WHERE
[id] = @OriginalId 
				
			



GO
/****** Object:  StoredProcedure [dbo].[uspCategories_Delete]    Script Date: 3/1/2021 10:03:30 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO

/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Deletes a record in the Categories table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE [dbo].[uspCategories_Delete]
(

	@Id nchar (10)  
)
AS


				DELETE FROM [dbo].[Categories] WITH (ROWLOCK) 
				WHERE
					[id] = @Id
					
			



GO
/****** Object:  StoredProcedure [dbo].[uspCategories_Find]    Script Date: 3/1/2021 10:03:30 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO

/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Finds records in the Categories table passing nullable parameters
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE [dbo].[uspCategories_Find]
(

	@SearchUsingOR bit   = null ,

	@Id nchar (10)  = null ,

	@Name nvarchar (50)  = null ,

	@IsShowOnHome bit   = null ,

	@Status bit   = null 
)
AS


				
  IF ISNULL(@SearchUsingOR, 0) <> 1
  BEGIN
    SELECT
	  [id]
	, [name]
	, [isShowOnHome]
	, [status]
    FROM
	[dbo].[Categories]
    WHERE 
	 ([id] = @Id OR @Id IS NULL)
	AND ([name] = @Name OR @Name IS NULL)
	AND ([isShowOnHome] = @IsShowOnHome OR @IsShowOnHome IS NULL)
	AND ([status] = @Status OR @Status IS NULL)
						
  END
  ELSE
  BEGIN
    SELECT
	  [id]
	, [name]
	, [isShowOnHome]
	, [status]
    FROM
	[dbo].[Categories]
    WHERE 
	 ([id] = @Id AND @Id is not null)
	OR ([name] = @Name AND @Name is not null)
	OR ([isShowOnHome] = @IsShowOnHome AND @IsShowOnHome is not null)
	OR ([status] = @Status AND @Status is not null)
	SELECT @@ROWCOUNT			
  END
				



GO
/****** Object:  StoredProcedure [dbo].[uspCategories_Get_List]    Script Date: 3/1/2021 10:03:30 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO

/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Gets all records from the Categories table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE [dbo].[uspCategories_Get_List]

AS


				
				SELECT
					[id],
					[name],
					[isShowOnHome],
					[status]
				FROM
					[dbo].[Categories]
					
				SELECT @@ROWCOUNT
			



GO
/****** Object:  StoredProcedure [dbo].[uspCategories_GetById]    Script Date: 3/1/2021 10:03:30 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO

/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the Categories table through an index
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE [dbo].[uspCategories_GetById]
(

	@Id nchar (10)  
)
AS


				SELECT
					[id],
					[name],
					[isShowOnHome],
					[status]
				FROM
					[dbo].[Categories]
				WHERE
					[id] = @Id
				SELECT @@ROWCOUNT
					
			



GO
/****** Object:  StoredProcedure [dbo].[uspCategories_GetPaged]    Script Date: 3/1/2021 10:03:30 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO

/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Gets records from the Categories table passing page index and page count parameters
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE [dbo].[uspCategories_GetPaged]
(

	@WhereClause varchar (8000)  ,

	@OrderBy varchar (2000)  ,

	@PageIndex int   ,

	@PageSize int   
)
AS


				
				BEGIN
				DECLARE @PageLowerBound int
				DECLARE @PageUpperBound int
				
				-- Set the page bounds
				SET @PageLowerBound = @PageSize * @PageIndex
				SET @PageUpperBound = @PageLowerBound + @PageSize

				IF (@OrderBy IS NULL OR LEN(@OrderBy) < 1)
				BEGIN
					-- default order by to first column
					SET @OrderBy = '[id]'
				END

				-- SQL Server 2005 Paging
				DECLARE @SQL AS nvarchar(MAX)
				SET @SQL = 'WITH PageIndex AS ('
				SET @SQL = @SQL + ' SELECT'
				IF @PageSize > 0
				BEGIN
					SET @SQL = @SQL + ' TOP ' + CONVERT(nvarchar, @PageUpperBound)
				END
				SET @SQL = @SQL + ' ROW_NUMBER() OVER (ORDER BY ' + @OrderBy + ') as RowIndex'
				SET @SQL = @SQL + ', [id]'
				SET @SQL = @SQL + ', [name]'
				SET @SQL = @SQL + ', [isShowOnHome]'
				SET @SQL = @SQL + ', [status]'
				SET @SQL = @SQL + ' FROM [dbo].[Categories]'
				IF LEN(@WhereClause) > 0
				BEGIN
					SET @SQL = @SQL + ' WHERE ' + @WhereClause
				END
				SET @SQL = @SQL + ' ) SELECT'
				SET @SQL = @SQL + ' [id],'
				SET @SQL = @SQL + ' [name],'
				SET @SQL = @SQL + ' [isShowOnHome],'
				SET @SQL = @SQL + ' [status]'
				SET @SQL = @SQL + ' FROM PageIndex'
				SET @SQL = @SQL + ' WHERE RowIndex > ' + CONVERT(nvarchar, @PageLowerBound)
				IF @PageSize > 0
				BEGIN
					SET @SQL = @SQL + ' AND RowIndex <= ' + CONVERT(nvarchar, @PageUpperBound)
				END
				SET @SQL = @SQL + ' ORDER BY ' + @OrderBy
				EXEC sp_executesql @SQL
				
				-- get row count
				SET @SQL = 'SELECT COUNT(1) AS TotalRowCount'
				SET @SQL = @SQL + ' FROM [dbo].[Categories]'
				IF LEN(@WhereClause) > 0
				BEGIN
					SET @SQL = @SQL + ' WHERE ' + @WhereClause
				END
				EXEC sp_executesql @SQL
			
				END
			



GO
/****** Object:  StoredProcedure [dbo].[uspCategories_Insert]    Script Date: 3/1/2021 10:03:30 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO

/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Inserts a record into the Categories table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE [dbo].[uspCategories_Insert]
(

	@Id nchar (10)  ,

	@Name nvarchar (50)  ,

	@IsShowOnHome bit   ,

	@Status bit   
)
AS


				
				INSERT INTO [dbo].[Categories]
					(
					[id]
					,[name]
					,[isShowOnHome]
					,[status]
					)
				VALUES
					(
					@Id
					,@Name
					,@IsShowOnHome
					,@Status
					)
									
							
			



GO
/****** Object:  StoredProcedure [dbo].[uspCategories_Update]    Script Date: 3/1/2021 10:03:30 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO

/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Updates a record in the Categories table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE [dbo].[uspCategories_Update]
(

	@Id nchar (10)  ,

	@OriginalId nchar (10)  ,

	@Name nvarchar (50)  ,

	@IsShowOnHome bit   ,

	@Status bit   
)
AS


				
				
				-- Modify the updatable columns
				UPDATE
					[dbo].[Categories]
				SET
					[id] = @Id
					,[name] = @Name
					,[isShowOnHome] = @IsShowOnHome
					,[status] = @Status
				WHERE
[id] = @OriginalId 
				
			



GO
/****** Object:  StoredProcedure [dbo].[uspFunctions_Delete]    Script Date: 3/1/2021 10:03:30 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO

/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Deletes a record in the Functions table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE [dbo].[uspFunctions_Delete]
(

	@Id nchar (10)  
)
AS


				DELETE FROM [dbo].[Functions] WITH (ROWLOCK) 
				WHERE
					[id] = @Id
					
			



GO
/****** Object:  StoredProcedure [dbo].[uspFunctions_Find]    Script Date: 3/1/2021 10:03:30 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO

/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Finds records in the Functions table passing nullable parameters
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE [dbo].[uspFunctions_Find]
(

	@SearchUsingOR bit   = null ,

	@Id nchar (10)  = null ,

	@Name nvarchar (50)  = null ,

	@Url nchar (255)  = null ,

	@ParentId nchar (10)  = null ,

	@Status bit   = null 
)
AS


				
  IF ISNULL(@SearchUsingOR, 0) <> 1
  BEGIN
    SELECT
	  [id]
	, [name]
	, [url]
	, [parentId]
	, [status]
    FROM
	[dbo].[Functions]
    WHERE 
	 ([id] = @Id OR @Id IS NULL)
	AND ([name] = @Name OR @Name IS NULL)
	AND ([url] = @Url OR @Url IS NULL)
	AND ([parentId] = @ParentId OR @ParentId IS NULL)
	AND ([status] = @Status OR @Status IS NULL)
						
  END
  ELSE
  BEGIN
    SELECT
	  [id]
	, [name]
	, [url]
	, [parentId]
	, [status]
    FROM
	[dbo].[Functions]
    WHERE 
	 ([id] = @Id AND @Id is not null)
	OR ([name] = @Name AND @Name is not null)
	OR ([url] = @Url AND @Url is not null)
	OR ([parentId] = @ParentId AND @ParentId is not null)
	OR ([status] = @Status AND @Status is not null)
	SELECT @@ROWCOUNT			
  END
				



GO
/****** Object:  StoredProcedure [dbo].[uspFunctions_Get_List]    Script Date: 3/1/2021 10:03:30 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO

/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Gets all records from the Functions table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE [dbo].[uspFunctions_Get_List]

AS


				
				SELECT
					[id],
					[name],
					[url],
					[parentId],
					[status]
				FROM
					[dbo].[Functions]
					
				SELECT @@ROWCOUNT
			



GO
/****** Object:  StoredProcedure [dbo].[uspFunctions_GetById]    Script Date: 3/1/2021 10:03:30 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO

/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the Functions table through an index
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE [dbo].[uspFunctions_GetById]
(

	@Id nchar (10)  
)
AS


				SELECT
					[id],
					[name],
					[url],
					[parentId],
					[status]
				FROM
					[dbo].[Functions]
				WHERE
					[id] = @Id
				SELECT @@ROWCOUNT
					
			



GO
/****** Object:  StoredProcedure [dbo].[uspFunctions_GetPaged]    Script Date: 3/1/2021 10:03:30 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO

/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Gets records from the Functions table passing page index and page count parameters
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE [dbo].[uspFunctions_GetPaged]
(

	@WhereClause varchar (8000)  ,

	@OrderBy varchar (2000)  ,

	@PageIndex int   ,

	@PageSize int   
)
AS


				
				BEGIN
				DECLARE @PageLowerBound int
				DECLARE @PageUpperBound int
				
				-- Set the page bounds
				SET @PageLowerBound = @PageSize * @PageIndex
				SET @PageUpperBound = @PageLowerBound + @PageSize

				IF (@OrderBy IS NULL OR LEN(@OrderBy) < 1)
				BEGIN
					-- default order by to first column
					SET @OrderBy = '[id]'
				END

				-- SQL Server 2005 Paging
				DECLARE @SQL AS nvarchar(MAX)
				SET @SQL = 'WITH PageIndex AS ('
				SET @SQL = @SQL + ' SELECT'
				IF @PageSize > 0
				BEGIN
					SET @SQL = @SQL + ' TOP ' + CONVERT(nvarchar, @PageUpperBound)
				END
				SET @SQL = @SQL + ' ROW_NUMBER() OVER (ORDER BY ' + @OrderBy + ') as RowIndex'
				SET @SQL = @SQL + ', [id]'
				SET @SQL = @SQL + ', [name]'
				SET @SQL = @SQL + ', [url]'
				SET @SQL = @SQL + ', [parentId]'
				SET @SQL = @SQL + ', [status]'
				SET @SQL = @SQL + ' FROM [dbo].[Functions]'
				IF LEN(@WhereClause) > 0
				BEGIN
					SET @SQL = @SQL + ' WHERE ' + @WhereClause
				END
				SET @SQL = @SQL + ' ) SELECT'
				SET @SQL = @SQL + ' [id],'
				SET @SQL = @SQL + ' [name],'
				SET @SQL = @SQL + ' [url],'
				SET @SQL = @SQL + ' [parentId],'
				SET @SQL = @SQL + ' [status]'
				SET @SQL = @SQL + ' FROM PageIndex'
				SET @SQL = @SQL + ' WHERE RowIndex > ' + CONVERT(nvarchar, @PageLowerBound)
				IF @PageSize > 0
				BEGIN
					SET @SQL = @SQL + ' AND RowIndex <= ' + CONVERT(nvarchar, @PageUpperBound)
				END
				SET @SQL = @SQL + ' ORDER BY ' + @OrderBy
				EXEC sp_executesql @SQL
				
				-- get row count
				SET @SQL = 'SELECT COUNT(1) AS TotalRowCount'
				SET @SQL = @SQL + ' FROM [dbo].[Functions]'
				IF LEN(@WhereClause) > 0
				BEGIN
					SET @SQL = @SQL + ' WHERE ' + @WhereClause
				END
				EXEC sp_executesql @SQL
			
				END
			



GO
/****** Object:  StoredProcedure [dbo].[uspFunctions_Insert]    Script Date: 3/1/2021 10:03:30 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO

/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Inserts a record into the Functions table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE [dbo].[uspFunctions_Insert]
(

	@Id nchar (10)  ,

	@Name nvarchar (50)  ,

	@Url nchar (255)  ,

	@ParentId nchar (10)  ,

	@Status bit   
)
AS


				
				INSERT INTO [dbo].[Functions]
					(
					[id]
					,[name]
					,[url]
					,[parentId]
					,[status]
					)
				VALUES
					(
					@Id
					,@Name
					,@Url
					,@ParentId
					,@Status
					)
									
							
			



GO
/****** Object:  StoredProcedure [dbo].[uspFunctions_Update]    Script Date: 3/1/2021 10:03:30 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO

/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Updates a record in the Functions table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE [dbo].[uspFunctions_Update]
(

	@Id nchar (10)  ,

	@OriginalId nchar (10)  ,

	@Name nvarchar (50)  ,

	@Url nchar (255)  ,

	@ParentId nchar (10)  ,

	@Status bit   
)
AS


				
				
				-- Modify the updatable columns
				UPDATE
					[dbo].[Functions]
				SET
					[id] = @Id
					,[name] = @Name
					,[url] = @Url
					,[parentId] = @ParentId
					,[status] = @Status
				WHERE
[id] = @OriginalId 
				
			



GO
/****** Object:  StoredProcedure [dbo].[uspOrders_Delete]    Script Date: 3/1/2021 10:03:30 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO

/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Deletes a record in the Orders table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE [dbo].[uspOrders_Delete]
(

	@Id nchar (10)  
)
AS


				DELETE FROM [dbo].[Orders] WITH (ROWLOCK) 
				WHERE
					[id] = @Id
					
			



GO
/****** Object:  StoredProcedure [dbo].[uspOrders_Find]    Script Date: 3/1/2021 10:03:30 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO

/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Finds records in the Orders table passing nullable parameters
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE [dbo].[uspOrders_Find]
(

	@SearchUsingOR bit   = null ,

	@Id nchar (10)  = null ,

	@CreatedBy nchar (10)  = null ,

	@UserId nchar (10)  = null ,

	@OrderDate datetime   = null ,

	@ShipName nvarchar (50)  = null ,

	@ShipAddress nvarchar (255)  = null ,

	@ShipPhoneNumber nchar (20)  = null ,

	@Status int   = null ,

	@TypeId nchar (10)  = null ,

	@Fee float   = null ,

	@Discount float   = null ,

	@Total float   = null 
)
AS


				
  IF ISNULL(@SearchUsingOR, 0) <> 1
  BEGIN
    SELECT
	  [id]
	, [createdBy]
	, [userId]
	, [orderDate]
	, [shipName]
	, [shipAddress]
	, [shipPhoneNumber]
	, [status]
	, [typeId]
	, [fee]
	, [discount]
	, [total]
    FROM
	[dbo].[Orders]
    WHERE 
	 ([id] = @Id OR @Id IS NULL)
	AND ([createdBy] = @CreatedBy OR @CreatedBy IS NULL)
	AND ([userId] = @UserId OR @UserId IS NULL)
	AND ([orderDate] = @OrderDate OR @OrderDate IS NULL)
	AND ([shipName] = @ShipName OR @ShipName IS NULL)
	AND ([shipAddress] = @ShipAddress OR @ShipAddress IS NULL)
	AND ([shipPhoneNumber] = @ShipPhoneNumber OR @ShipPhoneNumber IS NULL)
	AND ([status] = @Status OR @Status IS NULL)
	AND ([typeId] = @TypeId OR @TypeId IS NULL)
	AND ([fee] = @Fee OR @Fee IS NULL)
	AND ([discount] = @Discount OR @Discount IS NULL)
	AND ([total] = @Total OR @Total IS NULL)
						
  END
  ELSE
  BEGIN
    SELECT
	  [id]
	, [createdBy]
	, [userId]
	, [orderDate]
	, [shipName]
	, [shipAddress]
	, [shipPhoneNumber]
	, [status]
	, [typeId]
	, [fee]
	, [discount]
	, [total]
    FROM
	[dbo].[Orders]
    WHERE 
	 ([id] = @Id AND @Id is not null)
	OR ([createdBy] = @CreatedBy AND @CreatedBy is not null)
	OR ([userId] = @UserId AND @UserId is not null)
	OR ([orderDate] = @OrderDate AND @OrderDate is not null)
	OR ([shipName] = @ShipName AND @ShipName is not null)
	OR ([shipAddress] = @ShipAddress AND @ShipAddress is not null)
	OR ([shipPhoneNumber] = @ShipPhoneNumber AND @ShipPhoneNumber is not null)
	OR ([status] = @Status AND @Status is not null)
	OR ([typeId] = @TypeId AND @TypeId is not null)
	OR ([fee] = @Fee AND @Fee is not null)
	OR ([discount] = @Discount AND @Discount is not null)
	OR ([total] = @Total AND @Total is not null)
	SELECT @@ROWCOUNT			
  END
				



GO
/****** Object:  StoredProcedure [dbo].[uspOrders_Get_List]    Script Date: 3/1/2021 10:03:30 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO

/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Gets all records from the Orders table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE [dbo].[uspOrders_Get_List]

AS


				
				SELECT
					[id],
					[createdBy],
					[userId],
					[orderDate],
					[shipName],
					[shipAddress],
					[shipPhoneNumber],
					[status],
					[typeId],
					[fee],
					[discount],
					[total]
				FROM
					[dbo].[Orders]
					
				SELECT @@ROWCOUNT
			



GO
/****** Object:  StoredProcedure [dbo].[uspOrders_GetById]    Script Date: 3/1/2021 10:03:30 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO

/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the Orders table through an index
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE [dbo].[uspOrders_GetById]
(

	@Id nchar (10)  
)
AS


				SELECT
					[id],
					[createdBy],
					[userId],
					[orderDate],
					[shipName],
					[shipAddress],
					[shipPhoneNumber],
					[status],
					[typeId],
					[fee],
					[discount],
					[total]
				FROM
					[dbo].[Orders]
				WHERE
					[id] = @Id
				SELECT @@ROWCOUNT
					
			



GO
/****** Object:  StoredProcedure [dbo].[uspOrders_GetByTypeId]    Script Date: 3/1/2021 10:03:30 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO

/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the Orders table through a foreign key
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE [dbo].[uspOrders_GetByTypeId]
(

	@TypeId nchar (10)  
)
AS


				SET ANSI_NULLS OFF
				
				SELECT
					[id],
					[createdBy],
					[userId],
					[orderDate],
					[shipName],
					[shipAddress],
					[shipPhoneNumber],
					[status],
					[typeId],
					[fee],
					[discount],
					[total]
				FROM
					[dbo].[Orders]
				WHERE
					[typeId] = @TypeId
				
				SELECT @@ROWCOUNT
				SET ANSI_NULLS ON
			



GO
/****** Object:  StoredProcedure [dbo].[uspOrders_GetByUserId]    Script Date: 3/1/2021 10:03:30 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO

/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the Orders table through a foreign key
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE [dbo].[uspOrders_GetByUserId]
(

	@UserId nchar (10)  
)
AS


				SET ANSI_NULLS OFF
				
				SELECT
					[id],
					[createdBy],
					[userId],
					[orderDate],
					[shipName],
					[shipAddress],
					[shipPhoneNumber],
					[status],
					[typeId],
					[fee],
					[discount],
					[total]
				FROM
					[dbo].[Orders]
				WHERE
					[userId] = @UserId
				
				SELECT @@ROWCOUNT
				SET ANSI_NULLS ON
			



GO
/****** Object:  StoredProcedure [dbo].[uspOrders_GetPaged]    Script Date: 3/1/2021 10:03:30 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO

/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Gets records from the Orders table passing page index and page count parameters
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE [dbo].[uspOrders_GetPaged]
(

	@WhereClause varchar (8000)  ,

	@OrderBy varchar (2000)  ,

	@PageIndex int   ,

	@PageSize int   
)
AS


				
				BEGIN
				DECLARE @PageLowerBound int
				DECLARE @PageUpperBound int
				
				-- Set the page bounds
				SET @PageLowerBound = @PageSize * @PageIndex
				SET @PageUpperBound = @PageLowerBound + @PageSize

				IF (@OrderBy IS NULL OR LEN(@OrderBy) < 1)
				BEGIN
					-- default order by to first column
					SET @OrderBy = '[id]'
				END

				-- SQL Server 2005 Paging
				DECLARE @SQL AS nvarchar(MAX)
				SET @SQL = 'WITH PageIndex AS ('
				SET @SQL = @SQL + ' SELECT'
				IF @PageSize > 0
				BEGIN
					SET @SQL = @SQL + ' TOP ' + CONVERT(nvarchar, @PageUpperBound)
				END
				SET @SQL = @SQL + ' ROW_NUMBER() OVER (ORDER BY ' + @OrderBy + ') as RowIndex'
				SET @SQL = @SQL + ', [id]'
				SET @SQL = @SQL + ', [createdBy]'
				SET @SQL = @SQL + ', [userId]'
				SET @SQL = @SQL + ', [orderDate]'
				SET @SQL = @SQL + ', [shipName]'
				SET @SQL = @SQL + ', [shipAddress]'
				SET @SQL = @SQL + ', [shipPhoneNumber]'
				SET @SQL = @SQL + ', [status]'
				SET @SQL = @SQL + ', [typeId]'
				SET @SQL = @SQL + ', [fee]'
				SET @SQL = @SQL + ', [discount]'
				SET @SQL = @SQL + ', [total]'
				SET @SQL = @SQL + ' FROM [dbo].[Orders]'
				IF LEN(@WhereClause) > 0
				BEGIN
					SET @SQL = @SQL + ' WHERE ' + @WhereClause
				END
				SET @SQL = @SQL + ' ) SELECT'
				SET @SQL = @SQL + ' [id],'
				SET @SQL = @SQL + ' [createdBy],'
				SET @SQL = @SQL + ' [userId],'
				SET @SQL = @SQL + ' [orderDate],'
				SET @SQL = @SQL + ' [shipName],'
				SET @SQL = @SQL + ' [shipAddress],'
				SET @SQL = @SQL + ' [shipPhoneNumber],'
				SET @SQL = @SQL + ' [status],'
				SET @SQL = @SQL + ' [typeId],'
				SET @SQL = @SQL + ' [fee],'
				SET @SQL = @SQL + ' [discount],'
				SET @SQL = @SQL + ' [total]'
				SET @SQL = @SQL + ' FROM PageIndex'
				SET @SQL = @SQL + ' WHERE RowIndex > ' + CONVERT(nvarchar, @PageLowerBound)
				IF @PageSize > 0
				BEGIN
					SET @SQL = @SQL + ' AND RowIndex <= ' + CONVERT(nvarchar, @PageUpperBound)
				END
				SET @SQL = @SQL + ' ORDER BY ' + @OrderBy
				EXEC sp_executesql @SQL
				
				-- get row count
				SET @SQL = 'SELECT COUNT(1) AS TotalRowCount'
				SET @SQL = @SQL + ' FROM [dbo].[Orders]'
				IF LEN(@WhereClause) > 0
				BEGIN
					SET @SQL = @SQL + ' WHERE ' + @WhereClause
				END
				EXEC sp_executesql @SQL
			
				END
			



GO
/****** Object:  StoredProcedure [dbo].[uspOrders_Insert]    Script Date: 3/1/2021 10:03:30 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO

/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Inserts a record into the Orders table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE [dbo].[uspOrders_Insert]
(

	@Id nchar (10)  ,

	@CreatedBy nchar (10)  ,

	@UserId nchar (10)  ,

	@OrderDate datetime   ,

	@ShipName nvarchar (50)  ,

	@ShipAddress nvarchar (255)  ,

	@ShipPhoneNumber nchar (20)  ,

	@Status int   ,

	@TypeId nchar (10)  ,

	@Fee float   ,

	@Discount float   ,

	@Total float   
)
AS


				
				INSERT INTO [dbo].[Orders]
					(
					[id]
					,[createdBy]
					,[userId]
					,[orderDate]
					,[shipName]
					,[shipAddress]
					,[shipPhoneNumber]
					,[status]
					,[typeId]
					,[fee]
					,[discount]
					,[total]
					)
				VALUES
					(
					@Id
					,@CreatedBy
					,@UserId
					,@OrderDate
					,@ShipName
					,@ShipAddress
					,@ShipPhoneNumber
					,@Status
					,@TypeId
					,@Fee
					,@Discount
					,@Total
					)
									
							
			



GO
/****** Object:  StoredProcedure [dbo].[uspOrders_Update]    Script Date: 3/1/2021 10:03:30 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO

/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Updates a record in the Orders table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE [dbo].[uspOrders_Update]
(

	@Id nchar (10)  ,

	@OriginalId nchar (10)  ,

	@CreatedBy nchar (10)  ,

	@UserId nchar (10)  ,

	@OrderDate datetime   ,

	@ShipName nvarchar (50)  ,

	@ShipAddress nvarchar (255)  ,

	@ShipPhoneNumber nchar (20)  ,

	@Status int   ,

	@TypeId nchar (10)  ,

	@Fee float   ,

	@Discount float   ,

	@Total float   
)
AS


				
				
				-- Modify the updatable columns
				UPDATE
					[dbo].[Orders]
				SET
					[id] = @Id
					,[createdBy] = @CreatedBy
					,[userId] = @UserId
					,[orderDate] = @OrderDate
					,[shipName] = @ShipName
					,[shipAddress] = @ShipAddress
					,[shipPhoneNumber] = @ShipPhoneNumber
					,[status] = @Status
					,[typeId] = @TypeId
					,[fee] = @Fee
					,[discount] = @Discount
					,[total] = @Total
				WHERE
[id] = @OriginalId 
				
			



GO
/****** Object:  StoredProcedure [dbo].[uspProducts_Delete]    Script Date: 3/1/2021 10:03:30 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO

/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Deletes a record in the Products table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE [dbo].[uspProducts_Delete]
(

	@Id nchar (10)  
)
AS


				DELETE FROM [dbo].[Products] WITH (ROWLOCK) 
				WHERE
					[id] = @Id
					
			



GO
/****** Object:  StoredProcedure [dbo].[uspProducts_Find]    Script Date: 3/1/2021 10:03:30 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO

/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Finds records in the Products table passing nullable parameters
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE [dbo].[uspProducts_Find]
(

	@SearchUsingOR bit   = null ,

	@Id nchar (10)  = null ,

	@Name nvarchar (50)  = null ,

	@Description nvarchar (255)  = null ,

	@Price float   = null ,

	@Details nvarchar (255)  = null ,

	@IsShowOnHome bit   = null ,

	@Discount float   = null ,

	@QuantityOrder int   = null ,

	@Image nchar (255)  = null ,

	@CategoriesId nchar (10)  = null 
)
AS


				
  IF ISNULL(@SearchUsingOR, 0) <> 1
  BEGIN
    SELECT
	  [id]
	, [name]
	, [description]
	, [price]
	, [details]
	, [isShowOnHome]
	, [discount]
	, [quantityOrder]
	, [image]
	, [categoriesId]
    FROM
	[dbo].[Products]
    WHERE 
	 ([id] = @Id OR @Id IS NULL)
	AND ([name] = @Name OR @Name IS NULL)
	AND ([description] = @Description OR @Description IS NULL)
	AND ([price] = @Price OR @Price IS NULL)
	AND ([details] = @Details OR @Details IS NULL)
	AND ([isShowOnHome] = @IsShowOnHome OR @IsShowOnHome IS NULL)
	AND ([discount] = @Discount OR @Discount IS NULL)
	AND ([quantityOrder] = @QuantityOrder OR @QuantityOrder IS NULL)
	AND ([image] = @Image OR @Image IS NULL)
	AND ([categoriesId] = @CategoriesId OR @CategoriesId IS NULL)
						
  END
  ELSE
  BEGIN
    SELECT
	  [id]
	, [name]
	, [description]
	, [price]
	, [details]
	, [isShowOnHome]
	, [discount]
	, [quantityOrder]
	, [image]
	, [categoriesId]
    FROM
	[dbo].[Products]
    WHERE 
	 ([id] = @Id AND @Id is not null)
	OR ([name] = @Name AND @Name is not null)
	OR ([description] = @Description AND @Description is not null)
	OR ([price] = @Price AND @Price is not null)
	OR ([details] = @Details AND @Details is not null)
	OR ([isShowOnHome] = @IsShowOnHome AND @IsShowOnHome is not null)
	OR ([discount] = @Discount AND @Discount is not null)
	OR ([quantityOrder] = @QuantityOrder AND @QuantityOrder is not null)
	OR ([image] = @Image AND @Image is not null)
	OR ([categoriesId] = @CategoriesId AND @CategoriesId is not null)
	SELECT @@ROWCOUNT			
  END
				



GO
/****** Object:  StoredProcedure [dbo].[uspProducts_Get_List]    Script Date: 3/1/2021 10:03:30 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO

/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Gets all records from the Products table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE [dbo].[uspProducts_Get_List]

AS


				
				SELECT
					[id],
					[name],
					[description],
					[price],
					[details],
					[isShowOnHome],
					[discount],
					[quantityOrder],
					[image],
					[categoriesId]
				FROM
					[dbo].[Products]
					
				SELECT @@ROWCOUNT
			



GO
/****** Object:  StoredProcedure [dbo].[uspProducts_GetByCategoriesId]    Script Date: 3/1/2021 10:03:30 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO

/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the Products table through a foreign key
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE [dbo].[uspProducts_GetByCategoriesId]
(

	@CategoriesId nchar (10)  
)
AS


				SET ANSI_NULLS OFF
				
				SELECT
					[id],
					[name],
					[description],
					[price],
					[details],
					[isShowOnHome],
					[discount],
					[quantityOrder],
					[image],
					[categoriesId]
				FROM
					[dbo].[Products]
				WHERE
					[categoriesId] = @CategoriesId
				
				SELECT @@ROWCOUNT
				SET ANSI_NULLS ON
			



GO
/****** Object:  StoredProcedure [dbo].[uspProducts_GetById]    Script Date: 3/1/2021 10:03:30 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO

/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the Products table through an index
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE [dbo].[uspProducts_GetById]
(

	@Id nchar (10)  
)
AS


				SELECT
					[id],
					[name],
					[description],
					[price],
					[details],
					[isShowOnHome],
					[discount],
					[quantityOrder],
					[image],
					[categoriesId]
				FROM
					[dbo].[Products]
				WHERE
					[id] = @Id
				SELECT @@ROWCOUNT
					
			



GO
/****** Object:  StoredProcedure [dbo].[uspProducts_GetPaged]    Script Date: 3/1/2021 10:03:30 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO

/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Gets records from the Products table passing page index and page count parameters
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE [dbo].[uspProducts_GetPaged]
(

	@WhereClause varchar (8000)  ,

	@OrderBy varchar (2000)  ,

	@PageIndex int   ,

	@PageSize int   
)
AS


				
				BEGIN
				DECLARE @PageLowerBound int
				DECLARE @PageUpperBound int
				
				-- Set the page bounds
				SET @PageLowerBound = @PageSize * @PageIndex
				SET @PageUpperBound = @PageLowerBound + @PageSize

				IF (@OrderBy IS NULL OR LEN(@OrderBy) < 1)
				BEGIN
					-- default order by to first column
					SET @OrderBy = '[id]'
				END

				-- SQL Server 2005 Paging
				DECLARE @SQL AS nvarchar(MAX)
				SET @SQL = 'WITH PageIndex AS ('
				SET @SQL = @SQL + ' SELECT'
				IF @PageSize > 0
				BEGIN
					SET @SQL = @SQL + ' TOP ' + CONVERT(nvarchar, @PageUpperBound)
				END
				SET @SQL = @SQL + ' ROW_NUMBER() OVER (ORDER BY ' + @OrderBy + ') as RowIndex'
				SET @SQL = @SQL + ', [id]'
				SET @SQL = @SQL + ', [name]'
				SET @SQL = @SQL + ', [description]'
				SET @SQL = @SQL + ', [price]'
				SET @SQL = @SQL + ', [details]'
				SET @SQL = @SQL + ', [isShowOnHome]'
				SET @SQL = @SQL + ', [discount]'
				SET @SQL = @SQL + ', [quantityOrder]'
				SET @SQL = @SQL + ', [image]'
				SET @SQL = @SQL + ', [categoriesId]'
				SET @SQL = @SQL + ' FROM [dbo].[Products]'
				IF LEN(@WhereClause) > 0
				BEGIN
					SET @SQL = @SQL + ' WHERE ' + @WhereClause
				END
				SET @SQL = @SQL + ' ) SELECT'
				SET @SQL = @SQL + ' [id],'
				SET @SQL = @SQL + ' [name],'
				SET @SQL = @SQL + ' [description],'
				SET @SQL = @SQL + ' [price],'
				SET @SQL = @SQL + ' [details],'
				SET @SQL = @SQL + ' [isShowOnHome],'
				SET @SQL = @SQL + ' [discount],'
				SET @SQL = @SQL + ' [quantityOrder],'
				SET @SQL = @SQL + ' [image],'
				SET @SQL = @SQL + ' [categoriesId]'
				SET @SQL = @SQL + ' FROM PageIndex'
				SET @SQL = @SQL + ' WHERE RowIndex > ' + CONVERT(nvarchar, @PageLowerBound)
				IF @PageSize > 0
				BEGIN
					SET @SQL = @SQL + ' AND RowIndex <= ' + CONVERT(nvarchar, @PageUpperBound)
				END
				SET @SQL = @SQL + ' ORDER BY ' + @OrderBy
				EXEC sp_executesql @SQL
				
				-- get row count
				SET @SQL = 'SELECT COUNT(1) AS TotalRowCount'
				SET @SQL = @SQL + ' FROM [dbo].[Products]'
				IF LEN(@WhereClause) > 0
				BEGIN
					SET @SQL = @SQL + ' WHERE ' + @WhereClause
				END
				EXEC sp_executesql @SQL
			
				END
			



GO
/****** Object:  StoredProcedure [dbo].[uspProducts_Insert]    Script Date: 3/1/2021 10:03:30 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO

/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Inserts a record into the Products table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE [dbo].[uspProducts_Insert]
(

	@Id nchar (10)  ,

	@Name nvarchar (50)  ,

	@Description nvarchar (255)  ,

	@Price float   ,

	@Details nvarchar (255)  ,

	@IsShowOnHome bit   ,

	@Discount float   ,

	@QuantityOrder int   ,

	@Image nchar (255)  ,

	@CategoriesId nchar (10)  
)
AS


				
				INSERT INTO [dbo].[Products]
					(
					[id]
					,[name]
					,[description]
					,[price]
					,[details]
					,[isShowOnHome]
					,[discount]
					,[quantityOrder]
					,[image]
					,[categoriesId]
					)
				VALUES
					(
					@Id
					,@Name
					,@Description
					,@Price
					,@Details
					,@IsShowOnHome
					,@Discount
					,@QuantityOrder
					,@Image
					,@CategoriesId
					)
									
							
			



GO
/****** Object:  StoredProcedure [dbo].[uspProducts_Update]    Script Date: 3/1/2021 10:03:30 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO

/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Updates a record in the Products table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE [dbo].[uspProducts_Update]
(

	@Id nchar (10)  ,

	@OriginalId nchar (10)  ,

	@Name nvarchar (50)  ,

	@Description nvarchar (255)  ,

	@Price float   ,

	@Details nvarchar (255)  ,

	@IsShowOnHome bit   ,

	@Discount float   ,

	@QuantityOrder int   ,

	@Image nchar (255)  ,

	@CategoriesId nchar (10)  
)
AS


				
				
				-- Modify the updatable columns
				UPDATE
					[dbo].[Products]
				SET
					[id] = @Id
					,[name] = @Name
					,[description] = @Description
					,[price] = @Price
					,[details] = @Details
					,[isShowOnHome] = @IsShowOnHome
					,[discount] = @Discount
					,[quantityOrder] = @QuantityOrder
					,[image] = @Image
					,[categoriesId] = @CategoriesId
				WHERE
[id] = @OriginalId 
				
			



GO
/****** Object:  StoredProcedure [dbo].[uspRoles_Delete]    Script Date: 3/1/2021 10:03:30 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO

/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Deletes a record in the Roles table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE [dbo].[uspRoles_Delete]
(

	@Id nchar (10)  
)
AS


				DELETE FROM [dbo].[Roles] WITH (ROWLOCK) 
				WHERE
					[id] = @Id
					
			



GO
/****** Object:  StoredProcedure [dbo].[uspRoles_Find]    Script Date: 3/1/2021 10:03:30 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO

/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Finds records in the Roles table passing nullable parameters
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE [dbo].[uspRoles_Find]
(

	@SearchUsingOR bit   = null ,

	@Id nchar (10)  = null ,

	@Name nvarchar (50)  = null 
)
AS


				
  IF ISNULL(@SearchUsingOR, 0) <> 1
  BEGIN
    SELECT
	  [id]
	, [name]
    FROM
	[dbo].[Roles]
    WHERE 
	 ([id] = @Id OR @Id IS NULL)
	AND ([name] = @Name OR @Name IS NULL)
						
  END
  ELSE
  BEGIN
    SELECT
	  [id]
	, [name]
    FROM
	[dbo].[Roles]
    WHERE 
	 ([id] = @Id AND @Id is not null)
	OR ([name] = @Name AND @Name is not null)
	SELECT @@ROWCOUNT			
  END
				



GO
/****** Object:  StoredProcedure [dbo].[uspRoles_Get_List]    Script Date: 3/1/2021 10:03:30 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO

/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Gets all records from the Roles table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE [dbo].[uspRoles_Get_List]

AS


				
				SELECT
					[id],
					[name]
				FROM
					[dbo].[Roles]
					
				SELECT @@ROWCOUNT
			



GO
/****** Object:  StoredProcedure [dbo].[uspRoles_GetById]    Script Date: 3/1/2021 10:03:30 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO

/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the Roles table through an index
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE [dbo].[uspRoles_GetById]
(

	@Id nchar (10)  
)
AS


				SELECT
					[id],
					[name]
				FROM
					[dbo].[Roles]
				WHERE
					[id] = @Id
				SELECT @@ROWCOUNT
					
			



GO
/****** Object:  StoredProcedure [dbo].[uspRoles_GetPaged]    Script Date: 3/1/2021 10:03:30 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO

/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Gets records from the Roles table passing page index and page count parameters
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE [dbo].[uspRoles_GetPaged]
(

	@WhereClause varchar (8000)  ,

	@OrderBy varchar (2000)  ,

	@PageIndex int   ,

	@PageSize int   
)
AS


				
				BEGIN
				DECLARE @PageLowerBound int
				DECLARE @PageUpperBound int
				
				-- Set the page bounds
				SET @PageLowerBound = @PageSize * @PageIndex
				SET @PageUpperBound = @PageLowerBound + @PageSize

				IF (@OrderBy IS NULL OR LEN(@OrderBy) < 1)
				BEGIN
					-- default order by to first column
					SET @OrderBy = '[id]'
				END

				-- SQL Server 2005 Paging
				DECLARE @SQL AS nvarchar(MAX)
				SET @SQL = 'WITH PageIndex AS ('
				SET @SQL = @SQL + ' SELECT'
				IF @PageSize > 0
				BEGIN
					SET @SQL = @SQL + ' TOP ' + CONVERT(nvarchar, @PageUpperBound)
				END
				SET @SQL = @SQL + ' ROW_NUMBER() OVER (ORDER BY ' + @OrderBy + ') as RowIndex'
				SET @SQL = @SQL + ', [id]'
				SET @SQL = @SQL + ', [name]'
				SET @SQL = @SQL + ' FROM [dbo].[Roles]'
				IF LEN(@WhereClause) > 0
				BEGIN
					SET @SQL = @SQL + ' WHERE ' + @WhereClause
				END
				SET @SQL = @SQL + ' ) SELECT'
				SET @SQL = @SQL + ' [id],'
				SET @SQL = @SQL + ' [name]'
				SET @SQL = @SQL + ' FROM PageIndex'
				SET @SQL = @SQL + ' WHERE RowIndex > ' + CONVERT(nvarchar, @PageLowerBound)
				IF @PageSize > 0
				BEGIN
					SET @SQL = @SQL + ' AND RowIndex <= ' + CONVERT(nvarchar, @PageUpperBound)
				END
				SET @SQL = @SQL + ' ORDER BY ' + @OrderBy
				EXEC sp_executesql @SQL
				
				-- get row count
				SET @SQL = 'SELECT COUNT(1) AS TotalRowCount'
				SET @SQL = @SQL + ' FROM [dbo].[Roles]'
				IF LEN(@WhereClause) > 0
				BEGIN
					SET @SQL = @SQL + ' WHERE ' + @WhereClause
				END
				EXEC sp_executesql @SQL
			
				END
			



GO
/****** Object:  StoredProcedure [dbo].[uspRoles_Insert]    Script Date: 3/1/2021 10:03:30 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO

/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Inserts a record into the Roles table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE [dbo].[uspRoles_Insert]
(

	@Id nchar (10)  ,

	@Name nvarchar (50)  
)
AS


				
				INSERT INTO [dbo].[Roles]
					(
					[id]
					,[name]
					)
				VALUES
					(
					@Id
					,@Name
					)
									
							
			



GO
/****** Object:  StoredProcedure [dbo].[uspRoles_Update]    Script Date: 3/1/2021 10:03:30 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO

/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Updates a record in the Roles table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE [dbo].[uspRoles_Update]
(

	@Id nchar (10)  ,

	@OriginalId nchar (10)  ,

	@Name nvarchar (50)  
)
AS


				
				
				-- Modify the updatable columns
				UPDATE
					[dbo].[Roles]
				SET
					[id] = @Id
					,[name] = @Name
				WHERE
[id] = @OriginalId 
				
			



GO
/****** Object:  StoredProcedure [dbo].[uspStatus_Delete]    Script Date: 3/1/2021 10:03:30 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO

/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Deletes a record in the Status table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE [dbo].[uspStatus_Delete]
(

	@Id nchar (10)  
)
AS


				DELETE FROM [dbo].[Status] WITH (ROWLOCK) 
				WHERE
					[id] = @Id
					
			



GO
/****** Object:  StoredProcedure [dbo].[uspStatus_Find]    Script Date: 3/1/2021 10:03:30 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO

/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Finds records in the Status table passing nullable parameters
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE [dbo].[uspStatus_Find]
(

	@SearchUsingOR bit   = null ,

	@Id nchar (10)  = null ,

	@Name nvarchar (50)  = null 
)
AS


				
  IF ISNULL(@SearchUsingOR, 0) <> 1
  BEGIN
    SELECT
	  [id]
	, [name]
    FROM
	[dbo].[Status]
    WHERE 
	 ([id] = @Id OR @Id IS NULL)
	AND ([name] = @Name OR @Name IS NULL)
						
  END
  ELSE
  BEGIN
    SELECT
	  [id]
	, [name]
    FROM
	[dbo].[Status]
    WHERE 
	 ([id] = @Id AND @Id is not null)
	OR ([name] = @Name AND @Name is not null)
	SELECT @@ROWCOUNT			
  END
				



GO
/****** Object:  StoredProcedure [dbo].[uspStatus_Get_List]    Script Date: 3/1/2021 10:03:30 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO

/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Gets all records from the Status table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE [dbo].[uspStatus_Get_List]

AS


				
				SELECT
					[id],
					[name]
				FROM
					[dbo].[Status]
					
				SELECT @@ROWCOUNT
			



GO
/****** Object:  StoredProcedure [dbo].[uspStatus_GetById]    Script Date: 3/1/2021 10:03:30 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO

/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the Status table through an index
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE [dbo].[uspStatus_GetById]
(

	@Id nchar (10)  
)
AS


				SELECT
					[id],
					[name]
				FROM
					[dbo].[Status]
				WHERE
					[id] = @Id
				SELECT @@ROWCOUNT
					
			



GO
/****** Object:  StoredProcedure [dbo].[uspStatus_GetPaged]    Script Date: 3/1/2021 10:03:30 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO

/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Gets records from the Status table passing page index and page count parameters
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE [dbo].[uspStatus_GetPaged]
(

	@WhereClause varchar (8000)  ,

	@OrderBy varchar (2000)  ,

	@PageIndex int   ,

	@PageSize int   
)
AS


				
				BEGIN
				DECLARE @PageLowerBound int
				DECLARE @PageUpperBound int
				
				-- Set the page bounds
				SET @PageLowerBound = @PageSize * @PageIndex
				SET @PageUpperBound = @PageLowerBound + @PageSize

				IF (@OrderBy IS NULL OR LEN(@OrderBy) < 1)
				BEGIN
					-- default order by to first column
					SET @OrderBy = '[id]'
				END

				-- SQL Server 2005 Paging
				DECLARE @SQL AS nvarchar(MAX)
				SET @SQL = 'WITH PageIndex AS ('
				SET @SQL = @SQL + ' SELECT'
				IF @PageSize > 0
				BEGIN
					SET @SQL = @SQL + ' TOP ' + CONVERT(nvarchar, @PageUpperBound)
				END
				SET @SQL = @SQL + ' ROW_NUMBER() OVER (ORDER BY ' + @OrderBy + ') as RowIndex'
				SET @SQL = @SQL + ', [id]'
				SET @SQL = @SQL + ', [name]'
				SET @SQL = @SQL + ' FROM [dbo].[Status]'
				IF LEN(@WhereClause) > 0
				BEGIN
					SET @SQL = @SQL + ' WHERE ' + @WhereClause
				END
				SET @SQL = @SQL + ' ) SELECT'
				SET @SQL = @SQL + ' [id],'
				SET @SQL = @SQL + ' [name]'
				SET @SQL = @SQL + ' FROM PageIndex'
				SET @SQL = @SQL + ' WHERE RowIndex > ' + CONVERT(nvarchar, @PageLowerBound)
				IF @PageSize > 0
				BEGIN
					SET @SQL = @SQL + ' AND RowIndex <= ' + CONVERT(nvarchar, @PageUpperBound)
				END
				SET @SQL = @SQL + ' ORDER BY ' + @OrderBy
				EXEC sp_executesql @SQL
				
				-- get row count
				SET @SQL = 'SELECT COUNT(1) AS TotalRowCount'
				SET @SQL = @SQL + ' FROM [dbo].[Status]'
				IF LEN(@WhereClause) > 0
				BEGIN
					SET @SQL = @SQL + ' WHERE ' + @WhereClause
				END
				EXEC sp_executesql @SQL
			
				END
			



GO
/****** Object:  StoredProcedure [dbo].[uspStatus_Insert]    Script Date: 3/1/2021 10:03:30 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO

/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Inserts a record into the Status table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE [dbo].[uspStatus_Insert]
(

	@Id nchar (10)  ,

	@Name nvarchar (50)  
)
AS


				
				INSERT INTO [dbo].[Status]
					(
					[id]
					,[name]
					)
				VALUES
					(
					@Id
					,@Name
					)
									
							
			



GO
/****** Object:  StoredProcedure [dbo].[uspStatus_Update]    Script Date: 3/1/2021 10:03:30 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO

/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Updates a record in the Status table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE [dbo].[uspStatus_Update]
(

	@Id nchar (10)  ,

	@OriginalId nchar (10)  ,

	@Name nvarchar (50)  
)
AS


				
				
				-- Modify the updatable columns
				UPDATE
					[dbo].[Status]
				SET
					[id] = @Id
					,[name] = @Name
				WHERE
[id] = @OriginalId 
				
			



GO
/****** Object:  StoredProcedure [dbo].[uspTransactions_Delete]    Script Date: 3/1/2021 10:03:30 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO

/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Deletes a record in the Transactions table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE [dbo].[uspTransactions_Delete]
(

	@Id nchar (10)  
)
AS


				DELETE FROM [dbo].[Transactions] WITH (ROWLOCK) 
				WHERE
					[id] = @Id
					
			



GO
/****** Object:  StoredProcedure [dbo].[uspTransactions_Find]    Script Date: 3/1/2021 10:03:30 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO

/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Finds records in the Transactions table passing nullable parameters
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE [dbo].[uspTransactions_Find]
(

	@SearchUsingOR bit   = null ,

	@Id nchar (10)  = null ,

	@UserId nchar (10)  = null ,

	@OrderId nchar (10)  = null ,

	@CreatedBy nchar (10)  = null ,

	@CreatedAt datetime   = null ,

	@Message nvarchar (255)  = null ,

	@Status bit   = null 
)
AS


				
  IF ISNULL(@SearchUsingOR, 0) <> 1
  BEGIN
    SELECT
	  [id]
	, [userId]
	, [orderId]
	, [createdBy]
	, [createdAt]
	, [message]
	, [status]
    FROM
	[dbo].[Transactions]
    WHERE 
	 ([id] = @Id OR @Id IS NULL)
	AND ([userId] = @UserId OR @UserId IS NULL)
	AND ([orderId] = @OrderId OR @OrderId IS NULL)
	AND ([createdBy] = @CreatedBy OR @CreatedBy IS NULL)
	AND ([createdAt] = @CreatedAt OR @CreatedAt IS NULL)
	AND ([message] = @Message OR @Message IS NULL)
	AND ([status] = @Status OR @Status IS NULL)
						
  END
  ELSE
  BEGIN
    SELECT
	  [id]
	, [userId]
	, [orderId]
	, [createdBy]
	, [createdAt]
	, [message]
	, [status]
    FROM
	[dbo].[Transactions]
    WHERE 
	 ([id] = @Id AND @Id is not null)
	OR ([userId] = @UserId AND @UserId is not null)
	OR ([orderId] = @OrderId AND @OrderId is not null)
	OR ([createdBy] = @CreatedBy AND @CreatedBy is not null)
	OR ([createdAt] = @CreatedAt AND @CreatedAt is not null)
	OR ([message] = @Message AND @Message is not null)
	OR ([status] = @Status AND @Status is not null)
	SELECT @@ROWCOUNT			
  END
				



GO
/****** Object:  StoredProcedure [dbo].[uspTransactions_Get_List]    Script Date: 3/1/2021 10:03:30 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO

/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Gets all records from the Transactions table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE [dbo].[uspTransactions_Get_List]

AS


				
				SELECT
					[id],
					[userId],
					[orderId],
					[createdBy],
					[createdAt],
					[message],
					[status]
				FROM
					[dbo].[Transactions]
					
				SELECT @@ROWCOUNT
			



GO
/****** Object:  StoredProcedure [dbo].[uspTransactions_GetById]    Script Date: 3/1/2021 10:03:30 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO

/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the Transactions table through an index
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE [dbo].[uspTransactions_GetById]
(

	@Id nchar (10)  
)
AS


				SELECT
					[id],
					[userId],
					[orderId],
					[createdBy],
					[createdAt],
					[message],
					[status]
				FROM
					[dbo].[Transactions]
				WHERE
					[id] = @Id
				SELECT @@ROWCOUNT
					
			



GO
/****** Object:  StoredProcedure [dbo].[uspTransactions_GetByOrderId]    Script Date: 3/1/2021 10:03:30 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO

/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the Transactions table through a foreign key
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE [dbo].[uspTransactions_GetByOrderId]
(

	@OrderId nchar (10)  
)
AS


				SET ANSI_NULLS OFF
				
				SELECT
					[id],
					[userId],
					[orderId],
					[createdBy],
					[createdAt],
					[message],
					[status]
				FROM
					[dbo].[Transactions]
				WHERE
					[orderId] = @OrderId
				
				SELECT @@ROWCOUNT
				SET ANSI_NULLS ON
			



GO
/****** Object:  StoredProcedure [dbo].[uspTransactions_GetByUserId]    Script Date: 3/1/2021 10:03:30 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO

/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the Transactions table through a foreign key
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE [dbo].[uspTransactions_GetByUserId]
(

	@UserId nchar (10)  
)
AS


				SET ANSI_NULLS OFF
				
				SELECT
					[id],
					[userId],
					[orderId],
					[createdBy],
					[createdAt],
					[message],
					[status]
				FROM
					[dbo].[Transactions]
				WHERE
					[userId] = @UserId
				
				SELECT @@ROWCOUNT
				SET ANSI_NULLS ON
			



GO
/****** Object:  StoredProcedure [dbo].[uspTransactions_GetPaged]    Script Date: 3/1/2021 10:03:30 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO

/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Gets records from the Transactions table passing page index and page count parameters
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE [dbo].[uspTransactions_GetPaged]
(

	@WhereClause varchar (8000)  ,

	@OrderBy varchar (2000)  ,

	@PageIndex int   ,

	@PageSize int   
)
AS


				
				BEGIN
				DECLARE @PageLowerBound int
				DECLARE @PageUpperBound int
				
				-- Set the page bounds
				SET @PageLowerBound = @PageSize * @PageIndex
				SET @PageUpperBound = @PageLowerBound + @PageSize

				IF (@OrderBy IS NULL OR LEN(@OrderBy) < 1)
				BEGIN
					-- default order by to first column
					SET @OrderBy = '[id]'
				END

				-- SQL Server 2005 Paging
				DECLARE @SQL AS nvarchar(MAX)
				SET @SQL = 'WITH PageIndex AS ('
				SET @SQL = @SQL + ' SELECT'
				IF @PageSize > 0
				BEGIN
					SET @SQL = @SQL + ' TOP ' + CONVERT(nvarchar, @PageUpperBound)
				END
				SET @SQL = @SQL + ' ROW_NUMBER() OVER (ORDER BY ' + @OrderBy + ') as RowIndex'
				SET @SQL = @SQL + ', [id]'
				SET @SQL = @SQL + ', [userId]'
				SET @SQL = @SQL + ', [orderId]'
				SET @SQL = @SQL + ', [createdBy]'
				SET @SQL = @SQL + ', [createdAt]'
				SET @SQL = @SQL + ', [message]'
				SET @SQL = @SQL + ', [status]'
				SET @SQL = @SQL + ' FROM [dbo].[Transactions]'
				IF LEN(@WhereClause) > 0
				BEGIN
					SET @SQL = @SQL + ' WHERE ' + @WhereClause
				END
				SET @SQL = @SQL + ' ) SELECT'
				SET @SQL = @SQL + ' [id],'
				SET @SQL = @SQL + ' [userId],'
				SET @SQL = @SQL + ' [orderId],'
				SET @SQL = @SQL + ' [createdBy],'
				SET @SQL = @SQL + ' [createdAt],'
				SET @SQL = @SQL + ' [message],'
				SET @SQL = @SQL + ' [status]'
				SET @SQL = @SQL + ' FROM PageIndex'
				SET @SQL = @SQL + ' WHERE RowIndex > ' + CONVERT(nvarchar, @PageLowerBound)
				IF @PageSize > 0
				BEGIN
					SET @SQL = @SQL + ' AND RowIndex <= ' + CONVERT(nvarchar, @PageUpperBound)
				END
				SET @SQL = @SQL + ' ORDER BY ' + @OrderBy
				EXEC sp_executesql @SQL
				
				-- get row count
				SET @SQL = 'SELECT COUNT(1) AS TotalRowCount'
				SET @SQL = @SQL + ' FROM [dbo].[Transactions]'
				IF LEN(@WhereClause) > 0
				BEGIN
					SET @SQL = @SQL + ' WHERE ' + @WhereClause
				END
				EXEC sp_executesql @SQL
			
				END
			



GO
/****** Object:  StoredProcedure [dbo].[uspTransactions_Insert]    Script Date: 3/1/2021 10:03:30 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO

/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Inserts a record into the Transactions table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE [dbo].[uspTransactions_Insert]
(

	@Id nchar (10)  ,

	@UserId nchar (10)  ,

	@OrderId nchar (10)  ,

	@CreatedBy nchar (10)  ,

	@CreatedAt datetime   ,

	@Message nvarchar (255)  ,

	@Status bit   
)
AS


				
				INSERT INTO [dbo].[Transactions]
					(
					[id]
					,[userId]
					,[orderId]
					,[createdBy]
					,[createdAt]
					,[message]
					,[status]
					)
				VALUES
					(
					@Id
					,@UserId
					,@OrderId
					,@CreatedBy
					,@CreatedAt
					,@Message
					,@Status
					)
									
							
			



GO
/****** Object:  StoredProcedure [dbo].[uspTransactions_Update]    Script Date: 3/1/2021 10:03:30 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO

/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Updates a record in the Transactions table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE [dbo].[uspTransactions_Update]
(

	@Id nchar (10)  ,

	@OriginalId nchar (10)  ,

	@UserId nchar (10)  ,

	@OrderId nchar (10)  ,

	@CreatedBy nchar (10)  ,

	@CreatedAt datetime   ,

	@Message nvarchar (255)  ,

	@Status bit   
)
AS


				
				
				-- Modify the updatable columns
				UPDATE
					[dbo].[Transactions]
				SET
					[id] = @Id
					,[userId] = @UserId
					,[orderId] = @OrderId
					,[createdBy] = @CreatedBy
					,[createdAt] = @CreatedAt
					,[message] = @Message
					,[status] = @Status
				WHERE
[id] = @OriginalId 
				
			



GO
/****** Object:  StoredProcedure [dbo].[uspTypes_Delete]    Script Date: 3/1/2021 10:03:30 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO

/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Deletes a record in the Types table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE [dbo].[uspTypes_Delete]
(

	@Id nchar (10)  
)
AS


				DELETE FROM [dbo].[Types] WITH (ROWLOCK) 
				WHERE
					[id] = @Id
					
			



GO
/****** Object:  StoredProcedure [dbo].[uspTypes_Find]    Script Date: 3/1/2021 10:03:30 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO

/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Finds records in the Types table passing nullable parameters
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE [dbo].[uspTypes_Find]
(

	@SearchUsingOR bit   = null ,

	@Id nchar (10)  = null ,

	@Name nvarchar (50)  = null 
)
AS


				
  IF ISNULL(@SearchUsingOR, 0) <> 1
  BEGIN
    SELECT
	  [id]
	, [name]
    FROM
	[dbo].[Types]
    WHERE 
	 ([id] = @Id OR @Id IS NULL)
	AND ([name] = @Name OR @Name IS NULL)
						
  END
  ELSE
  BEGIN
    SELECT
	  [id]
	, [name]
    FROM
	[dbo].[Types]
    WHERE 
	 ([id] = @Id AND @Id is not null)
	OR ([name] = @Name AND @Name is not null)
	SELECT @@ROWCOUNT			
  END
				



GO
/****** Object:  StoredProcedure [dbo].[uspTypes_Get_List]    Script Date: 3/1/2021 10:03:30 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO

/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Gets all records from the Types table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE [dbo].[uspTypes_Get_List]

AS


				
				SELECT
					[id],
					[name]
				FROM
					[dbo].[Types]
					
				SELECT @@ROWCOUNT
			



GO
/****** Object:  StoredProcedure [dbo].[uspTypes_GetById]    Script Date: 3/1/2021 10:03:30 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO

/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the Types table through an index
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE [dbo].[uspTypes_GetById]
(

	@Id nchar (10)  
)
AS


				SELECT
					[id],
					[name]
				FROM
					[dbo].[Types]
				WHERE
					[id] = @Id
				SELECT @@ROWCOUNT
					
			



GO
/****** Object:  StoredProcedure [dbo].[uspTypes_GetPaged]    Script Date: 3/1/2021 10:03:30 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO

/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Gets records from the Types table passing page index and page count parameters
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE [dbo].[uspTypes_GetPaged]
(

	@WhereClause varchar (8000)  ,

	@OrderBy varchar (2000)  ,

	@PageIndex int   ,

	@PageSize int   
)
AS


				
				BEGIN
				DECLARE @PageLowerBound int
				DECLARE @PageUpperBound int
				
				-- Set the page bounds
				SET @PageLowerBound = @PageSize * @PageIndex
				SET @PageUpperBound = @PageLowerBound + @PageSize

				IF (@OrderBy IS NULL OR LEN(@OrderBy) < 1)
				BEGIN
					-- default order by to first column
					SET @OrderBy = '[id]'
				END

				-- SQL Server 2005 Paging
				DECLARE @SQL AS nvarchar(MAX)
				SET @SQL = 'WITH PageIndex AS ('
				SET @SQL = @SQL + ' SELECT'
				IF @PageSize > 0
				BEGIN
					SET @SQL = @SQL + ' TOP ' + CONVERT(nvarchar, @PageUpperBound)
				END
				SET @SQL = @SQL + ' ROW_NUMBER() OVER (ORDER BY ' + @OrderBy + ') as RowIndex'
				SET @SQL = @SQL + ', [id]'
				SET @SQL = @SQL + ', [name]'
				SET @SQL = @SQL + ' FROM [dbo].[Types]'
				IF LEN(@WhereClause) > 0
				BEGIN
					SET @SQL = @SQL + ' WHERE ' + @WhereClause
				END
				SET @SQL = @SQL + ' ) SELECT'
				SET @SQL = @SQL + ' [id],'
				SET @SQL = @SQL + ' [name]'
				SET @SQL = @SQL + ' FROM PageIndex'
				SET @SQL = @SQL + ' WHERE RowIndex > ' + CONVERT(nvarchar, @PageLowerBound)
				IF @PageSize > 0
				BEGIN
					SET @SQL = @SQL + ' AND RowIndex <= ' + CONVERT(nvarchar, @PageUpperBound)
				END
				SET @SQL = @SQL + ' ORDER BY ' + @OrderBy
				EXEC sp_executesql @SQL
				
				-- get row count
				SET @SQL = 'SELECT COUNT(1) AS TotalRowCount'
				SET @SQL = @SQL + ' FROM [dbo].[Types]'
				IF LEN(@WhereClause) > 0
				BEGIN
					SET @SQL = @SQL + ' WHERE ' + @WhereClause
				END
				EXEC sp_executesql @SQL
			
				END
			



GO
/****** Object:  StoredProcedure [dbo].[uspTypes_Insert]    Script Date: 3/1/2021 10:03:30 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO

/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Inserts a record into the Types table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE [dbo].[uspTypes_Insert]
(

	@Id nchar (10)  ,

	@Name nvarchar (50)  
)
AS


				
				INSERT INTO [dbo].[Types]
					(
					[id]
					,[name]
					)
				VALUES
					(
					@Id
					,@Name
					)
									
							
			



GO
/****** Object:  StoredProcedure [dbo].[uspTypes_Update]    Script Date: 3/1/2021 10:03:30 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO

/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Updates a record in the Types table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE [dbo].[uspTypes_Update]
(

	@Id nchar (10)  ,

	@OriginalId nchar (10)  ,

	@Name nvarchar (50)  
)
AS


				
				
				-- Modify the updatable columns
				UPDATE
					[dbo].[Types]
				SET
					[id] = @Id
					,[name] = @Name
				WHERE
[id] = @OriginalId 
				
			



GO
/****** Object:  StoredProcedure [dbo].[uspUsers_Delete]    Script Date: 3/1/2021 10:03:30 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO

/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Deletes a record in the Users table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE [dbo].[uspUsers_Delete]
(

	@Id nchar (10)  
)
AS


				DELETE FROM [dbo].[Users] WITH (ROWLOCK) 
				WHERE
					[id] = @Id
					
			



GO
/****** Object:  StoredProcedure [dbo].[uspUsers_Find]    Script Date: 3/1/2021 10:03:30 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO

/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Finds records in the Users table passing nullable parameters
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE [dbo].[uspUsers_Find]
(

	@SearchUsingOR bit   = null ,

	@Id nchar (10)  = null ,

	@Username nchar (25)  = null ,

	@Password nchar (256)  = null ,

	@PhoneNumber nchar (20)  = null ,

	@Email nchar (50)  = null ,

	@Dob date   = null ,

	@FullName nvarchar (50)  = null ,

	@Address nvarchar (50)  = null ,

	@Total float   = null ,

	@Status bit   = null 
)
AS


				
  IF ISNULL(@SearchUsingOR, 0) <> 1
  BEGIN
    SELECT
	  [id]
	, [username]
	, [password]
	, [phoneNumber]
	, [email]
	, [DOB]
	, [fullName]
	, [address]
	, [total]
	, [status]
    FROM
	[dbo].[Users]
    WHERE 
	 ([id] = @Id OR @Id IS NULL)
	AND ([username] = @Username OR @Username IS NULL)
	AND ([password] = @Password OR @Password IS NULL)
	AND ([phoneNumber] = @PhoneNumber OR @PhoneNumber IS NULL)
	AND ([email] = @Email OR @Email IS NULL)
	AND ([DOB] = @Dob OR @Dob IS NULL)
	AND ([fullName] = @FullName OR @FullName IS NULL)
	AND ([address] = @Address OR @Address IS NULL)
	AND ([total] = @Total OR @Total IS NULL)
	AND ([status] = @Status OR @Status IS NULL)
						
  END
  ELSE
  BEGIN
    SELECT
	  [id]
	, [username]
	, [password]
	, [phoneNumber]
	, [email]
	, [DOB]
	, [fullName]
	, [address]
	, [total]
	, [status]
    FROM
	[dbo].[Users]
    WHERE 
	 ([id] = @Id AND @Id is not null)
	OR ([username] = @Username AND @Username is not null)
	OR ([password] = @Password AND @Password is not null)
	OR ([phoneNumber] = @PhoneNumber AND @PhoneNumber is not null)
	OR ([email] = @Email AND @Email is not null)
	OR ([DOB] = @Dob AND @Dob is not null)
	OR ([fullName] = @FullName AND @FullName is not null)
	OR ([address] = @Address AND @Address is not null)
	OR ([total] = @Total AND @Total is not null)
	OR ([status] = @Status AND @Status is not null)
	SELECT @@ROWCOUNT			
  END
				



GO
/****** Object:  StoredProcedure [dbo].[uspUsers_Get_List]    Script Date: 3/1/2021 10:03:30 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO

/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Gets all records from the Users table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE [dbo].[uspUsers_Get_List]

AS


				
				SELECT
					[id],
					[username],
					[password],
					[phoneNumber],
					[email],
					[DOB],
					[fullName],
					[address],
					[total],
					[status]
				FROM
					[dbo].[Users]
					
				SELECT @@ROWCOUNT
			



GO
/****** Object:  StoredProcedure [dbo].[uspUsers_GetById]    Script Date: 3/1/2021 10:03:30 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO

/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the Users table through an index
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE [dbo].[uspUsers_GetById]
(

	@Id nchar (10)  
)
AS


				SELECT
					[id],
					[username],
					[password],
					[phoneNumber],
					[email],
					[DOB],
					[fullName],
					[address],
					[total],
					[status]
				FROM
					[dbo].[Users]
				WHERE
					[id] = @Id
				SELECT @@ROWCOUNT
					
			



GO
/****** Object:  StoredProcedure [dbo].[uspUsers_GetPaged]    Script Date: 3/1/2021 10:03:30 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO

/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Gets records from the Users table passing page index and page count parameters
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE [dbo].[uspUsers_GetPaged]
(

	@WhereClause varchar (8000)  ,

	@OrderBy varchar (2000)  ,

	@PageIndex int   ,

	@PageSize int   
)
AS


				
				BEGIN
				DECLARE @PageLowerBound int
				DECLARE @PageUpperBound int
				
				-- Set the page bounds
				SET @PageLowerBound = @PageSize * @PageIndex
				SET @PageUpperBound = @PageLowerBound + @PageSize

				IF (@OrderBy IS NULL OR LEN(@OrderBy) < 1)
				BEGIN
					-- default order by to first column
					SET @OrderBy = '[id]'
				END

				-- SQL Server 2005 Paging
				DECLARE @SQL AS nvarchar(MAX)
				SET @SQL = 'WITH PageIndex AS ('
				SET @SQL = @SQL + ' SELECT'
				IF @PageSize > 0
				BEGIN
					SET @SQL = @SQL + ' TOP ' + CONVERT(nvarchar, @PageUpperBound)
				END
				SET @SQL = @SQL + ' ROW_NUMBER() OVER (ORDER BY ' + @OrderBy + ') as RowIndex'
				SET @SQL = @SQL + ', [id]'
				SET @SQL = @SQL + ', [username]'
				SET @SQL = @SQL + ', [password]'
				SET @SQL = @SQL + ', [phoneNumber]'
				SET @SQL = @SQL + ', [email]'
				SET @SQL = @SQL + ', [DOB]'
				SET @SQL = @SQL + ', [fullName]'
				SET @SQL = @SQL + ', [address]'
				SET @SQL = @SQL + ', [total]'
				SET @SQL = @SQL + ', [status]'
				SET @SQL = @SQL + ' FROM [dbo].[Users]'
				IF LEN(@WhereClause) > 0
				BEGIN
					SET @SQL = @SQL + ' WHERE ' + @WhereClause
				END
				SET @SQL = @SQL + ' ) SELECT'
				SET @SQL = @SQL + ' [id],'
				SET @SQL = @SQL + ' [username],'
				SET @SQL = @SQL + ' [password],'
				SET @SQL = @SQL + ' [phoneNumber],'
				SET @SQL = @SQL + ' [email],'
				SET @SQL = @SQL + ' [DOB],'
				SET @SQL = @SQL + ' [fullName],'
				SET @SQL = @SQL + ' [address],'
				SET @SQL = @SQL + ' [total],'
				SET @SQL = @SQL + ' [status]'
				SET @SQL = @SQL + ' FROM PageIndex'
				SET @SQL = @SQL + ' WHERE RowIndex > ' + CONVERT(nvarchar, @PageLowerBound)
				IF @PageSize > 0
				BEGIN
					SET @SQL = @SQL + ' AND RowIndex <= ' + CONVERT(nvarchar, @PageUpperBound)
				END
				SET @SQL = @SQL + ' ORDER BY ' + @OrderBy
				EXEC sp_executesql @SQL
				
				-- get row count
				SET @SQL = 'SELECT COUNT(1) AS TotalRowCount'
				SET @SQL = @SQL + ' FROM [dbo].[Users]'
				IF LEN(@WhereClause) > 0
				BEGIN
					SET @SQL = @SQL + ' WHERE ' + @WhereClause
				END
				EXEC sp_executesql @SQL
			
				END
			



GO
/****** Object:  StoredProcedure [dbo].[uspUsers_Insert]    Script Date: 3/1/2021 10:03:30 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO

/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Inserts a record into the Users table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE [dbo].[uspUsers_Insert]
(

	@Id nchar (10)  ,

	@Username nchar (25)  ,

	@Password nchar (256)  ,

	@PhoneNumber nchar (20)  ,

	@Email nchar (50)  ,

	@Dob date   ,

	@FullName nvarchar (50)  ,

	@Address nvarchar (50)  ,

	@Total float   ,

	@Status bit   
)
AS


				
				INSERT INTO [dbo].[Users]
					(
					[id]
					,[username]
					,[password]
					,[phoneNumber]
					,[email]
					,[DOB]
					,[fullName]
					,[address]
					,[total]
					,[status]
					)
				VALUES
					(
					@Id
					,@Username
					,@Password
					,@PhoneNumber
					,@Email
					,@Dob
					,@FullName
					,@Address
					,@Total
					,@Status
					)
									
							
			



GO
/****** Object:  StoredProcedure [dbo].[uspUsers_Update]    Script Date: 3/1/2021 10:03:30 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO

/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Updates a record in the Users table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE [dbo].[uspUsers_Update]
(

	@Id nchar (10)  ,

	@OriginalId nchar (10)  ,

	@Username nchar (25)  ,

	@Password nchar (256)  ,

	@PhoneNumber nchar (20)  ,

	@Email nchar (50)  ,

	@Dob date   ,

	@FullName nvarchar (50)  ,

	@Address nvarchar (50)  ,

	@Total float   ,

	@Status bit   
)
AS


				
				
				-- Modify the updatable columns
				UPDATE
					[dbo].[Users]
				SET
					[id] = @Id
					,[username] = @Username
					,[password] = @Password
					,[phoneNumber] = @PhoneNumber
					,[email] = @Email
					,[DOB] = @Dob
					,[fullName] = @FullName
					,[address] = @Address
					,[total] = @Total
					,[status] = @Status
				WHERE
[id] = @OriginalId 
				
			



GO
USE [master]
GO
ALTER DATABASE [TheCoffeHouse] SET  READ_WRITE 
GO
