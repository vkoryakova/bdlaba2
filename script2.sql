USE [pizza]
GO
/****** Object:  Table [dbo].[Адрес доставки]    Script Date: 19.06.2023 12:51:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Адрес доставки](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[улица] [nvarchar](50) NULL,
	[дом] [nvarchar](50) NULL,
	[квартира/офис] [int] NULL,
	[id_клиента] [int] NULL,
 CONSTRAINT [PK_Адрес доставки] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Заказ]    Script Date: 19.06.2023 12:51:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Заказ](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[дата и время заказа] [datetime] NULL,
	[статус] [nvarchar](50) NULL,
	[id_адрес доставки] [int] NULL,
	[стоимость] [money] NULL,
	[ip_клиента] [int] NULL,
	[id_пицца] [int] NULL,
 CONSTRAINT [PK_Заказ] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Клиент]    Script Date: 19.06.2023 12:51:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Клиент](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[контактные данные] [int] NULL,
	[ФИО] [nvarchar](50) NULL,
 CONSTRAINT [PK_Клиент] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Курьер]    Script Date: 19.06.2023 12:51:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Курьер](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_заказа] [int] NULL,
	[ФИО] [nvarchar](50) NULL,
	[статус] [nvarchar](50) NULL,
	[контактные данные] [int] NULL,
 CONSTRAINT [PK_Курьер] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[пицца]    Script Date: 19.06.2023 12:51:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[пицца](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[название] [nvarchar](50) NULL,
	[набор продуктов] [nvarchar](50) NULL,
	[кол-во продуктов] [int] NULL,
	[цена] [money] NULL,
 CONSTRAINT [PK_пицца] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Сеть]    Script Date: 19.06.2023 12:51:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Сеть](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[название] [nvarchar](50) NULL,
	[контактные данные] [int] NULL,
	[id_пицца(меню)] [int] NULL,
	[id_курьера] [int] NULL,
 CONSTRAINT [PK_Сеть] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Адрес доставки]  WITH CHECK ADD  CONSTRAINT [FK_Адрес доставки_Клиент1] FOREIGN KEY([id_клиента])
REFERENCES [dbo].[Клиент] ([id])
GO
ALTER TABLE [dbo].[Адрес доставки] CHECK CONSTRAINT [FK_Адрес доставки_Клиент1]
GO
ALTER TABLE [dbo].[Заказ]  WITH CHECK ADD  CONSTRAINT [FK_Заказ_Адрес доставки] FOREIGN KEY([id_адрес доставки])
REFERENCES [dbo].[Адрес доставки] ([id])
GO
ALTER TABLE [dbo].[Заказ] CHECK CONSTRAINT [FK_Заказ_Адрес доставки]
GO
ALTER TABLE [dbo].[Заказ]  WITH CHECK ADD  CONSTRAINT [FK_Заказ_Клиент] FOREIGN KEY([ip_клиента])
REFERENCES [dbo].[Клиент] ([id])
GO
ALTER TABLE [dbo].[Заказ] CHECK CONSTRAINT [FK_Заказ_Клиент]
GO
ALTER TABLE [dbo].[Заказ]  WITH CHECK ADD  CONSTRAINT [FK_Заказ_пицца] FOREIGN KEY([id_пицца])
REFERENCES [dbo].[пицца] ([Id])
GO
ALTER TABLE [dbo].[Заказ] CHECK CONSTRAINT [FK_Заказ_пицца]
GO
ALTER TABLE [dbo].[Курьер]  WITH CHECK ADD  CONSTRAINT [FK_Курьер_Заказ] FOREIGN KEY([id_заказа])
REFERENCES [dbo].[Заказ] ([id])
GO
ALTER TABLE [dbo].[Курьер] CHECK CONSTRAINT [FK_Курьер_Заказ]
GO
ALTER TABLE [dbo].[Сеть]  WITH CHECK ADD  CONSTRAINT [FK_Сеть_Курьер] FOREIGN KEY([id_курьера])
REFERENCES [dbo].[Курьер] ([id])
GO
ALTER TABLE [dbo].[Сеть] CHECK CONSTRAINT [FK_Сеть_Курьер]
GO
ALTER TABLE [dbo].[Сеть]  WITH CHECK ADD  CONSTRAINT [FK_Сеть_пицца] FOREIGN KEY([id_пицца(меню)])
REFERENCES [dbo].[пицца] ([Id])
GO
ALTER TABLE [dbo].[Сеть] CHECK CONSTRAINT [FK_Сеть_пицца]
GO
