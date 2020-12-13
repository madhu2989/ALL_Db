USE [flipkart]
GO

/****** Object:  Table [dbo].[orderTable]    Script Date: 22-01-2019 18:09:56 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[orderTableNew](
	[orderId] [varchar](200) primary key,
	[cusName] [varchar](50) NULL,
	[cusAddress] [varchar](50) NULL,
	[totalprice] [money] NULL,
	[Totalquantity] [int] NULL
) 

CREATE TABLE [dbo].[orderDetailsNew](
	[orderDetailsId] [int] IDENTITY(50,1) NOT NULL,
	[orderId] [Varchar](200) NULL,
	[itemId] [int] NULL,
	[size] [varchar](10) NULL,
	[quantity] [int] NULL
)

GO

SET ANSI_PADDING OFF
GO


