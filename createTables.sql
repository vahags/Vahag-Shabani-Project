--Vahag Shabani 
--ID:104791620
--5/1/2016

USE [s16guest73]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [system](
	[systemID] [int] NOT NULL,
	[systemName] [varchar](30) NOT NULL,
 CONSTRAINT [PK_systems] PRIMARY KEY CLUSTERED 
(
	[systemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

CREATE TABLE [genre](
	[genreID] [int] NOT NULL,
	[genreName] [varchar](30) NOT NULL,
 CONSTRAINT [PK_genre] PRIMARY KEY CLUSTERED 
(
	[genreID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

CREATE TABLE [product](
	[productID] [int] NOT NULL,
	[productName] [varchar](60) NOT NULL,
	[productDescr] [varchar](150) NOT NULL,
	[systemID] [int] NOT NULL,
	[genreID] [int] NOT NULL,
 CONSTRAINT [PK_product] PRIMARY KEY CLUSTERED 
(
	[productID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [product]  WITH CHECK ADD  CONSTRAINT [FK_product_system] FOREIGN KEY([systemID])
REFERENCES [system] ([systemID])
GO

ALTER TABLE [product] CHECK CONSTRAINT [FK_product_system]
GO

ALTER TABLE [product]  WITH CHECK ADD  CONSTRAINT [FK_product_genre] FOREIGN KEY([genreID])
REFERENCES [genre] ([genreID])
GO

ALTER TABLE [product] CHECK CONSTRAINT [FK_product_genre]
GO

CREATE TABLE [productVersion](
	[productVersionID] [int] NOT NULL,
	[productVersionName] [varchar](60) NOT NULL,
 CONSTRAINT [PK_productVersion] PRIMARY KEY CLUSTERED 
(
	[productVersionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

CREATE TABLE [feature](
	[featureID] [int] NOT NULL,
	[featureDescr] [varchar](150) NOT NULL,
	[featureDate] [date] NOT NULL,
	[productID] [int] NOT NULL,
	[productVersionID] [int] NOT NULL,
 CONSTRAINT [PK_feature] PRIMARY KEY CLUSTERED 
(
	[featureID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [feature]  WITH CHECK ADD  CONSTRAINT [FK_feature_product] FOREIGN KEY([productID])
REFERENCES [product] ([productID])
GO

ALTER TABLE [feature] CHECK CONSTRAINT [FK_feature_product]
GO

ALTER TABLE [feature]  WITH CHECK ADD  CONSTRAINT [FK_feature_productVersion] FOREIGN KEY([productVersionID])
REFERENCES [productVersion] ([productVersionID])
GO

ALTER TABLE [feature] CHECK CONSTRAINT [FK_feature_productVersion]
GO

CREATE TABLE [releaseVersion](
	[releaseVersionID] [int] NOT NULL,
	[releaseVersionName] [varchar](60) NOT NULL,
 CONSTRAINT [PK_releaseVersion] PRIMARY KEY CLUSTERED 
(
	[releaseVersionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

CREATE TABLE [releaseType](
	[releaseTypeID] [int] NOT NULL,
	[releaseTypeName] [varchar](60) NOT NULL,
 CONSTRAINT [PK_releaseType] PRIMARY KEY CLUSTERED 
(
	[releaseTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

CREATE TABLE [releases](
	[releaseID] [int] NOT NULL,
	[releaseDate] [date] NOT NULL,
	[releaseVersionID] [int] NOT NULL,
	[releaseTypeID] [int] NOT NULL,
	[featureID] [int] NOT NULL,
 CONSTRAINT [PK_releases] PRIMARY KEY CLUSTERED 
(
	[releaseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [releases]  WITH CHECK ADD  CONSTRAINT [FK_releases_feature] FOREIGN KEY([featureID])
REFERENCES [feature] ([featureID])
GO

ALTER TABLE [releases] CHECK CONSTRAINT [FK_releases_feature]
GO

ALTER TABLE [releases]  WITH CHECK ADD  CONSTRAINT [FK_releases_releaseVersion] FOREIGN KEY([releaseVersionID])
REFERENCES [releaseVersion] ([releaseVersionID])
GO

ALTER TABLE [releases] CHECK CONSTRAINT [FK_releases_releaseVersion]
GO

ALTER TABLE [releases]  WITH CHECK ADD  CONSTRAINT [FK_releases_releaseType] FOREIGN KEY([releaseTypeID])
REFERENCES [releaseType] ([releaseTypeID])
GO

ALTER TABLE [releases] CHECK CONSTRAINT [FK_releases_releaseType]
GO

CREATE TABLE [street](
	[streetID] [int] NOT NULL,
	[streetName] [varchar](100) NOT NULL,
 CONSTRAINT [PK_street] PRIMARY KEY CLUSTERED 
(
	[streetID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

CREATE TABLE [city](
	[cityID] [int] NOT NULL,
	[cityName] [varchar](30) NOT NULL,
 CONSTRAINT [PK_city] PRIMARY KEY CLUSTERED 
(
	[cityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

CREATE TABLE [states](
	[stateID] [int] NOT NULL,
	[stateName] [varchar](30) NOT NULL,
 CONSTRAINT [PK_states] PRIMARY KEY CLUSTERED 
(
	[stateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

CREATE TABLE [country](
	[countryID] [int] NOT NULL,
	[countryName] [varchar](30) NOT NULL,
 CONSTRAINT [PK_country] PRIMARY KEY CLUSTERED 
(
	[countryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

CREATE TABLE [company](
	[companyID] [int] NOT NULL,
	[companyName] [varchar](60) NOT NULL,
	[streetID] [int] NOT NULL,
	[cityID] [int] NOT NULL,
	[stateID] [int] NOT NULL,
	[zipCode] [int] NOT NULL,
	[countryID] [int] NOT NULL,
 CONSTRAINT [PK_company] PRIMARY KEY CLUSTERED 
(
	[companyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [company]  WITH CHECK ADD  CONSTRAINT [FK_company_street] FOREIGN KEY([streetID])
REFERENCES [street] ([streetID])
GO

ALTER TABLE [company] CHECK CONSTRAINT [FK_company_street]
GO

ALTER TABLE [company]  WITH CHECK ADD  CONSTRAINT [FK_company_city] FOREIGN KEY([cityID])
REFERENCES [city] ([cityID])
GO

ALTER TABLE [company] CHECK CONSTRAINT [FK_company_city]
GO

ALTER TABLE [company]  WITH CHECK ADD  CONSTRAINT [FK_company_states] FOREIGN KEY([stateID])
REFERENCES [states] ([stateID])
GO

ALTER TABLE [company] CHECK CONSTRAINT [FK_company_states]
GO

ALTER TABLE [company]  WITH CHECK ADD  CONSTRAINT [FK_company_country] FOREIGN KEY([countryID])
REFERENCES [country] ([countryID])
GO

ALTER TABLE [company] CHECK CONSTRAINT [FK_company_country]
GO

CREATE TABLE [phoneType](
	[phoneTypeID] [int] NOT NULL,
	[phoneTypeName] [varchar](30) NOT NULL,
 CONSTRAINT [PK_phoneType] PRIMARY KEY CLUSTERED 
(
	[phoneTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

CREATE TABLE [users](
	[userName] [varchar](30) NOT NULL,
	[firstName] [varchar](30) NOT NULL,
	[lastName] [varchar](30) NOT NULL,
	[email] [varchar](60) NOT NULL,
	[password] [varchar](30) NOT NULL,
	[phoneNumber] [varchar](30) NOT NULL,
	[phoneTypeID] [int] NOT NULL,
	[companyID] [int] NOT NULL,
 CONSTRAINT [PK_users] PRIMARY KEY CLUSTERED 
(
	[userName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [users]  WITH CHECK ADD  CONSTRAINT [FK_users_company] FOREIGN KEY([companyID])
REFERENCES [company] ([companyID])
GO

ALTER TABLE [users] CHECK CONSTRAINT [FK_users_company]
GO

ALTER TABLE [users]  WITH CHECK ADD  CONSTRAINT [FK_users_phoneType] FOREIGN KEY([phoneTypeID])
REFERENCES [phoneType] ([phoneTypeID])
GO

ALTER TABLE [users] CHECK CONSTRAINT [FK_users_phoneType]
GO

CREATE TABLE [download](
	[downloadID] [int] NOT NULL,
	[downloadDate] [date] NOT NULL,
	[userName] [varchar](30) NOT NULL,
	[releaseID] [int] NOT NULL,
 CONSTRAINT [PK_download] PRIMARY KEY CLUSTERED 
(
	[downloadID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [download]  WITH CHECK ADD  CONSTRAINT [FK_download_releases] FOREIGN KEY([releaseID])
REFERENCES [releases] ([releaseID])
GO

ALTER TABLE [download] CHECK CONSTRAINT [FK_download_releases]
GO

ALTER TABLE [download]  WITH CHECK ADD  CONSTRAINT [FK_download_users] FOREIGN KEY([userName])
REFERENCES [users] ([userName])
GO

ALTER TABLE [download] CHECK CONSTRAINT [FK_download_users]
GO

SET ANSI_PADDING OFF
GO