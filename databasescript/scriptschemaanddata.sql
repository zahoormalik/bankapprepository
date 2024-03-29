USE [Sample]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 16/01/2019 19:10:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[AccountTypeId] [int] NOT NULL,
	[CustomerId] [int] NOT NULL,
	[OpenDate] [datetime] NOT NULL,
	[CloseDate] [datetime] NULL,
	[BranchId] [int] NOT NULL,
	[AccountId] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[AccountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AccountType]    Script Date: 16/01/2019 19:10:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountType](
	[AccountType] [varchar](50) NULL,
	[Id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_AccountType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Branch]    Script Date: 16/01/2019 19:10:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Branch](
	[BranchId] [int] IDENTITY(1,1) NOT NULL,
	[BranchName] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](200) NULL,
 CONSTRAINT [PK_Branch] PRIMARY KEY CLUSTERED 
(
	[BranchId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Customer]    Script Date: 16/01/2019 19:10:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[CustomerName] [nvarchar](200) NOT NULL,
	[Address] [nvarchar](500) NULL,
	[CustomerContact] [varchar](16) NULL,
	[CustomerId] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Transaction]    Script Date: 16/01/2019 19:10:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transaction](
	[Amount] [decimal](18, 4) NOT NULL,
	[TransactionDate] [datetime] NOT NULL,
	[AccountId] [int] NOT NULL,
	[TransactionId] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](200) NULL,
	[TransactionType] [int] NOT NULL
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Account] ON 

GO
INSERT [dbo].[Account] ([AccountTypeId], [CustomerId], [OpenDate], [CloseDate], [BranchId], [AccountId]) VALUES (2, 1, CAST(N'2019-01-16T00:00:00.000' AS DateTime), NULL, 99, 6)
GO
INSERT [dbo].[Account] ([AccountTypeId], [CustomerId], [OpenDate], [CloseDate], [BranchId], [AccountId]) VALUES (1, 2, CAST(N'2019-01-14T00:00:00.000' AS DateTime), NULL, 99, 7)
GO
INSERT [dbo].[Account] ([AccountTypeId], [CustomerId], [OpenDate], [CloseDate], [BranchId], [AccountId]) VALUES (3, 3, CAST(N'2019-01-13T00:00:00.000' AS DateTime), NULL, 99, 9)
GO
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
SET IDENTITY_INSERT [dbo].[AccountType] ON 

GO
INSERT [dbo].[AccountType] ([AccountType], [Id]) VALUES (N'Savings', 1)
GO
INSERT [dbo].[AccountType] ([AccountType], [Id]) VALUES (N'Current', 2)
GO
INSERT [dbo].[AccountType] ([AccountType], [Id]) VALUES (N'Student', 3)
GO
SET IDENTITY_INSERT [dbo].[AccountType] OFF
GO
SET IDENTITY_INSERT [dbo].[Branch] ON 

GO
INSERT [dbo].[Branch] ([BranchId], [BranchName], [Address]) VALUES (1, N'Luton', N'Park Street')
GO
INSERT [dbo].[Branch] ([BranchId], [BranchName], [Address]) VALUES (2, N'Harpenden', N'High Street')
GO
SET IDENTITY_INSERT [dbo].[Branch] OFF
GO
SET IDENTITY_INSERT [dbo].[Customer] ON 

GO
INSERT [dbo].[Customer] ([CustomerName], [Address], [CustomerContact], [CustomerId]) VALUES (N'Zahoor', N'Luton', N'07995769177', 1)
GO
INSERT [dbo].[Customer] ([CustomerName], [Address], [CustomerContact], [CustomerId]) VALUES (N'George ', N'St Albans', N'07995769178', 2)
GO
INSERT [dbo].[Customer] ([CustomerName], [Address], [CustomerContact], [CustomerId]) VALUES (N'Claire', N'Hemel', N'07995769179', 3)
GO
SET IDENTITY_INSERT [dbo].[Customer] OFF
GO
SET IDENTITY_INSERT [dbo].[Transaction] ON 

GO
INSERT [dbo].[Transaction] ([Amount], [TransactionDate], [AccountId], [TransactionId], [Description], [TransactionType]) VALUES (CAST(99.0000 AS Decimal(18, 4)), CAST(N'2019-01-01T00:00:00.000' AS DateTime), 6, 5, N'Deposit at Luton Branch', 1)
GO
INSERT [dbo].[Transaction] ([Amount], [TransactionDate], [AccountId], [TransactionId], [Description], [TransactionType]) VALUES (CAST(1.4000 AS Decimal(18, 4)), CAST(N'2019-01-04T00:00:00.000' AS DateTime), 6, 8, N'Costa', 2)
GO
INSERT [dbo].[Transaction] ([Amount], [TransactionDate], [AccountId], [TransactionId], [Description], [TransactionType]) VALUES (CAST(350.0000 AS Decimal(18, 4)), CAST(N'2019-01-03T00:00:00.000' AS DateTime), 9, 9, N'Kwikfit', 2)
GO
INSERT [dbo].[Transaction] ([Amount], [TransactionDate], [AccountId], [TransactionId], [Description], [TransactionType]) VALUES (CAST(2500.0000 AS Decimal(18, 4)), CAST(N'2019-01-08T00:00:00.000' AS DateTime), 9, 10, N'Ref', 1)
GO
SET IDENTITY_INSERT [dbo].[Transaction] OFF
GO
ALTER TABLE [dbo].[Account] ADD  CONSTRAINT [DF_Account_OpenDate]  DEFAULT (getdate()) FOR [OpenDate]
GO
ALTER TABLE [dbo].[Transaction] ADD  DEFAULT ((1)) FOR [TransactionType]
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Account_AccountType] FOREIGN KEY([AccountTypeId])
REFERENCES [dbo].[AccountType] ([Id])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Account_AccountType]
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Account_Customer] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([CustomerId])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Account_Customer]
GO
ALTER TABLE [dbo].[Transaction]  WITH CHECK ADD  CONSTRAINT [FK_Transaction_Account] FOREIGN KEY([AccountId])
REFERENCES [dbo].[Account] ([AccountId])
GO
ALTER TABLE [dbo].[Transaction] CHECK CONSTRAINT [FK_Transaction_Account]
GO
