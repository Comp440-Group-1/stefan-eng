-- ----------------------------
--  Table structure for Address
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID('[dbo].[Address]') AND type IN ('U'))
	DROP TABLE [dbo].[Address]
GO
CREATE TABLE [dbo].[Address] (
	[AddressID] int NOT NULL,
	[City] varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[State] varchar(2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Zipcode] varchar(5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Address] varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
ON [PRIMARY]
GO

-- ----------------------------
--  Table structure for Branch
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID('[dbo].[Branch]') AND type IN ('U'))
	DROP TABLE [dbo].[Branch]
GO
CREATE TABLE [dbo].[Branch] (
	[BranchID] int NOT NULL,
	[Location] varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
ON [PRIMARY]
GO

-- ----------------------------
--  Table structure for Company
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID('[dbo].[Company]') AND type IN ('U'))
	DROP TABLE [dbo].[Company]
GO
CREATE TABLE [dbo].[Company] (
	[CompanyID] int NOT NULL,
	[Name] varchar(30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AddressID] int NULL
)
ON [PRIMARY]
GO

-- ----------------------------
--  Table structure for Customer
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID('[dbo].[Customer]') AND type IN ('U'))
	DROP TABLE [dbo].[Customer]
GO
CREATE TABLE [dbo].[Customer] (
	[CustomerID] int NOT NULL,
	[AddressID] int NULL,
	[PhoneID] int NULL,
	[CompanyID] int NULL,
	[CustomerEmail] varchar(254) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
ON [PRIMARY]
GO

-- ----------------------------
--  Table structure for Download
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID('[dbo].[Download]') AND type IN ('U'))
	DROP TABLE [dbo].[Download]
GO
CREATE TABLE [dbo].[Download] (
	[DownloadID] int NOT NULL,
	[ReleaseID] int NULL,
	[Location] varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
ON [PRIMARY]
GO

-- ----------------------------
--  Table structure for DownloadLog
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID('[dbo].[DownloadLog]') AND type IN ('U'))
	DROP TABLE [dbo].[DownloadLog]
GO
CREATE TABLE [dbo].[DownloadLog] (
	[DownloadLogID] int NOT NULL,
	[Date] datetime2(0) NULL,
	[CustomerID] int NULL,
	[DownloadID] int NULL,
	[ProductID] int NULL
)
ON [PRIMARY]
GO

-- ----------------------------
--  Table structure for Feature
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID('[dbo].[Feature]') AND type IN ('U'))
	DROP TABLE [dbo].[Feature]
GO
CREATE TABLE [dbo].[Feature] (
	[FeatureID] int NOT NULL,
	[Description] varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
ON [PRIMARY]
GO

-- ----------------------------
--  Table structure for Iteration
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID('[dbo].[Iteration]') AND type IN ('U'))
	DROP TABLE [dbo].[Iteration]
GO
CREATE TABLE [dbo].[Iteration] (
	[IterationID] int NOT NULL,
	[Label] varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ProductID] int NULL,
	[CommitSHA] varchar(40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[BugOrFeature] varchar(8) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
ON [PRIMARY]
GO

-- ----------------------------
--  Table structure for Phone
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID('[dbo].[Phone]') AND type IN ('U'))
	DROP TABLE [dbo].[Phone]
GO
CREATE TABLE [dbo].[Phone] (
	[PhoneID] int NOT NULL,
	[PhoneType] varchar(6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PhoneNumber] varchar(10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
ON [PRIMARY]
GO

-- ----------------------------
--  Table structure for Product
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID('[dbo].[Product]') AND type IN ('U'))
	DROP TABLE [dbo].[Product]
GO
CREATE TABLE [dbo].[Product] (
	[ProductID] int NOT NULL,
	[Description] varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Name] varchar(15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
ON [PRIMARY]
GO

-- ----------------------------
--  Table structure for Release
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID('[dbo].[Release]') AND type IN ('U'))
	DROP TABLE [dbo].[Release]
GO
CREATE TABLE [dbo].[Release] (
	[ReleaseID] int NOT NULL,
	[VersionID] int NULL,
	[IterationID] int NULL,
	[BranchID] int NULL,
	[ReleaseNotes] varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ReleaseDate] datetime2(0) NULL,
	[ReleaseType] varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
ON [PRIMARY]
GO

-- ----------------------------
--  Table structure for Version
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID('[dbo].[Version]') AND type IN ('U'))
	DROP TABLE [dbo].[Version]
GO
CREATE TABLE [dbo].[Version] (
	[VersionID] int NOT NULL,
	[ProductID] int NOT NULL,
	[VersionNumber] int NULL
)
ON [PRIMARY]
GO

-- ----------------------------
--  Table structure for VersionFeature
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID('[dbo].[VersionFeature]') AND type IN ('U'))
	DROP TABLE [dbo].[VersionFeature]
GO
CREATE TABLE [dbo].[VersionFeature] (
	[FeatureID] int NOT NULL,
	[VersionID] int NOT NULL
)
ON [PRIMARY]
GO


-- ----------------------------
--  Primary key structure for table Address
-- ----------------------------
ALTER TABLE [dbo].[Address] ADD
	CONSTRAINT [PK__Address__091C2A1BFED9A2BA] PRIMARY KEY CLUSTERED ([AddressID]) 
	WITH (PAD_INDEX = OFF,
		IGNORE_DUP_KEY = OFF,
		ALLOW_ROW_LOCKS = ON,
		ALLOW_PAGE_LOCKS = ON)
	ON [default]
GO

-- ----------------------------
--  Primary key structure for table Branch
-- ----------------------------
ALTER TABLE [dbo].[Branch] ADD
	CONSTRAINT [PK__Branch__A1682FA5AB150B89] PRIMARY KEY CLUSTERED ([BranchID]) 
	WITH (PAD_INDEX = OFF,
		IGNORE_DUP_KEY = OFF,
		ALLOW_ROW_LOCKS = ON,
		ALLOW_PAGE_LOCKS = ON)
	ON [default]
GO

-- ----------------------------
--  Primary key structure for table Company
-- ----------------------------
ALTER TABLE [dbo].[Company] ADD
	CONSTRAINT [PK__Company__2D971C4CBC589463] PRIMARY KEY CLUSTERED ([CompanyID]) 
	WITH (PAD_INDEX = OFF,
		IGNORE_DUP_KEY = OFF,
		ALLOW_ROW_LOCKS = ON,
		ALLOW_PAGE_LOCKS = ON)
	ON [default]
GO

-- ----------------------------
--  Primary key structure for table Customer
-- ----------------------------
ALTER TABLE [dbo].[Customer] ADD
	CONSTRAINT [PK__Customer__A4AE64B80B208D4C] PRIMARY KEY CLUSTERED ([CustomerID]) 
	WITH (PAD_INDEX = OFF,
		IGNORE_DUP_KEY = OFF,
		ALLOW_ROW_LOCKS = ON,
		ALLOW_PAGE_LOCKS = ON)
	ON [default]
GO

-- ----------------------------
--  Primary key structure for table Download
-- ----------------------------
ALTER TABLE [dbo].[Download] ADD
	CONSTRAINT [PK__Download__73D5A71059F2C2FB] PRIMARY KEY CLUSTERED ([DownloadID]) 
	WITH (PAD_INDEX = OFF,
		IGNORE_DUP_KEY = OFF,
		ALLOW_ROW_LOCKS = ON,
		ALLOW_PAGE_LOCKS = ON)
	ON [default]
GO

-- ----------------------------
--  Primary key structure for table DownloadLog
-- ----------------------------
ALTER TABLE [dbo].[DownloadLog] ADD
	CONSTRAINT [PK__Download__D54EA640F522F1A7] PRIMARY KEY CLUSTERED ([DownloadLogID]) 
	WITH (PAD_INDEX = OFF,
		IGNORE_DUP_KEY = OFF,
		ALLOW_ROW_LOCKS = ON,
		ALLOW_PAGE_LOCKS = ON)
	ON [default]
GO

-- ----------------------------
--  Primary key structure for table Feature
-- ----------------------------
ALTER TABLE [dbo].[Feature] ADD
	CONSTRAINT [PK__Feature__82230A2942CDDD5A] PRIMARY KEY CLUSTERED ([FeatureID]) 
	WITH (PAD_INDEX = OFF,
		IGNORE_DUP_KEY = OFF,
		ALLOW_ROW_LOCKS = ON,
		ALLOW_PAGE_LOCKS = ON)
	ON [default]
GO

-- ----------------------------
--  Primary key structure for table Iteration
-- ----------------------------
ALTER TABLE [dbo].[Iteration] ADD
	CONSTRAINT [PK__Iteratio__3D3A78A0FE3B8ADC] PRIMARY KEY CLUSTERED ([IterationID]) 
	WITH (PAD_INDEX = OFF,
		IGNORE_DUP_KEY = OFF,
		ALLOW_ROW_LOCKS = ON,
		ALLOW_PAGE_LOCKS = ON)
	ON [default]
GO

-- ----------------------------
--  Primary key structure for table Phone
-- ----------------------------
ALTER TABLE [dbo].[Phone] ADD
	CONSTRAINT [PK__Phone__F3EE4BD09B418818] PRIMARY KEY CLUSTERED ([PhoneID]) 
	WITH (PAD_INDEX = OFF,
		IGNORE_DUP_KEY = OFF,
		ALLOW_ROW_LOCKS = ON,
		ALLOW_PAGE_LOCKS = ON)
	ON [default]
GO

-- ----------------------------
--  Primary key structure for table Product
-- ----------------------------
ALTER TABLE [dbo].[Product] ADD
	CONSTRAINT [PK__Product__B40CC6ED3C6948B4] PRIMARY KEY CLUSTERED ([ProductID]) 
	WITH (PAD_INDEX = OFF,
		IGNORE_DUP_KEY = OFF,
		ALLOW_ROW_LOCKS = ON,
		ALLOW_PAGE_LOCKS = ON)
	ON [default]
GO

-- ----------------------------
--  Primary key structure for table Release
-- ----------------------------
ALTER TABLE [dbo].[Release] ADD
	CONSTRAINT [PK__Release__5D7A69ED67251D1A] PRIMARY KEY CLUSTERED ([ReleaseID]) 
	WITH (PAD_INDEX = OFF,
		IGNORE_DUP_KEY = OFF,
		ALLOW_ROW_LOCKS = ON,
		ALLOW_PAGE_LOCKS = ON)
	ON [default]
GO

-- ----------------------------
--  Primary key structure for table Version
-- ----------------------------
ALTER TABLE [dbo].[Version] ADD
	CONSTRAINT [PK__Version__16C6402F7066ABE3] PRIMARY KEY CLUSTERED ([VersionID]) 
	WITH (PAD_INDEX = OFF,
		IGNORE_DUP_KEY = OFF,
		ALLOW_ROW_LOCKS = ON,
		ALLOW_PAGE_LOCKS = ON)
	ON [default]
GO

-- ----------------------------
--  Primary key structure for table VersionFeature
-- ----------------------------
ALTER TABLE [dbo].[VersionFeature] ADD
	CONSTRAINT [PK__VersionF__634F6E2BD6BAC8CD] PRIMARY KEY CLUSTERED ([FeatureID],[VersionID]) 
	WITH (PAD_INDEX = OFF,
		IGNORE_DUP_KEY = OFF,
		ALLOW_ROW_LOCKS = ON,
		ALLOW_PAGE_LOCKS = ON)
	ON [default]
GO

-- ----------------------------
--  Foreign keys structure for table Company
-- ----------------------------
ALTER TABLE [dbo].[Company] ADD
	CONSTRAINT [fk_Company_Address_1] FOREIGN KEY ([AddressID]) REFERENCES [dbo].[Address] ([AddressID]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
--  Foreign keys structure for table Customer
-- ----------------------------
ALTER TABLE [dbo].[Customer] ADD
	CONSTRAINT [fk_Customer_Address_1] FOREIGN KEY ([AddressID]) REFERENCES [dbo].[Address] ([AddressID]) ON DELETE NO ACTION ON UPDATE NO ACTION,
	CONSTRAINT [fk_Customer_Phone_1] FOREIGN KEY ([PhoneID]) REFERENCES [dbo].[Phone] ([PhoneID]) ON DELETE NO ACTION ON UPDATE NO ACTION,
	CONSTRAINT [fk_Customer_Company_1] FOREIGN KEY ([CompanyID]) REFERENCES [dbo].[Company] ([CompanyID]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
--  Foreign keys structure for table Download
-- ----------------------------
ALTER TABLE [dbo].[Download] ADD
	CONSTRAINT [fk_Download_Release_1] FOREIGN KEY ([ReleaseID]) REFERENCES [dbo].[Release] ([ReleaseID]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
--  Foreign keys structure for table DownloadLog
-- ----------------------------
ALTER TABLE [dbo].[DownloadLog] ADD
	CONSTRAINT [fk_DownloadLog_Download_1] FOREIGN KEY ([DownloadID]) REFERENCES [dbo].[Download] ([DownloadID]) ON DELETE NO ACTION ON UPDATE NO ACTION,
	CONSTRAINT [fk_DownloadLog_Customer_1] FOREIGN KEY ([CustomerID]) REFERENCES [dbo].[Customer] ([CustomerID]) ON DELETE NO ACTION ON UPDATE NO ACTION,
	CONSTRAINT [fk_DownloadLog_Product_1] FOREIGN KEY ([ProductID]) REFERENCES [dbo].[Product] ([ProductID]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
--  Foreign keys structure for table Iteration
-- ----------------------------
ALTER TABLE [dbo].[Iteration] ADD
	CONSTRAINT [fk_Iteration_Product_1] FOREIGN KEY ([ProductID]) REFERENCES [dbo].[Product] ([ProductID]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
--  Foreign keys structure for table Release
-- ----------------------------
ALTER TABLE [dbo].[Release] ADD
	CONSTRAINT [fk_Release_Iteration_1] FOREIGN KEY ([IterationID]) REFERENCES [dbo].[Iteration] ([IterationID]) ON DELETE NO ACTION ON UPDATE NO ACTION,
	CONSTRAINT [fk_Release_Branch_1] FOREIGN KEY ([BranchID]) REFERENCES [dbo].[Branch] ([BranchID]) ON DELETE NO ACTION ON UPDATE NO ACTION,
	CONSTRAINT [fk_Release_Version_1] FOREIGN KEY ([VersionID]) REFERENCES [dbo].[Version] ([VersionID]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
--  Foreign keys structure for table Version
-- ----------------------------
ALTER TABLE [dbo].[Version] ADD
	CONSTRAINT [fk_Version_Product_1] FOREIGN KEY ([ProductID]) REFERENCES [dbo].[Product] ([ProductID]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
--  Foreign keys structure for table VersionFeature
-- ----------------------------
ALTER TABLE [dbo].[VersionFeature] ADD
	CONSTRAINT [fk_FeatureID] FOREIGN KEY ([FeatureID]) REFERENCES [dbo].[Feature] ([FeatureID]) ON DELETE NO ACTION ON UPDATE NO ACTION,
	CONSTRAINT [fk_VersionFeature_Version_1] FOREIGN KEY ([VersionID]) REFERENCES [dbo].[Version] ([VersionID]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
--  Options for table Address
-- ----------------------------
ALTER TABLE [dbo].[Address] SET (LOCK_ESCALATION = TABLE)
GO

-- ----------------------------
--  Options for table Branch
-- ----------------------------
ALTER TABLE [dbo].[Branch] SET (LOCK_ESCALATION = TABLE)
GO

-- ----------------------------
--  Options for table Company
-- ----------------------------
ALTER TABLE [dbo].[Company] SET (LOCK_ESCALATION = TABLE)
GO

-- ----------------------------
--  Options for table Customer
-- ----------------------------
ALTER TABLE [dbo].[Customer] SET (LOCK_ESCALATION = TABLE)
GO

-- ----------------------------
--  Options for table Download
-- ----------------------------
ALTER TABLE [dbo].[Download] SET (LOCK_ESCALATION = TABLE)
GO

-- ----------------------------
--  Options for table DownloadLog
-- ----------------------------
ALTER TABLE [dbo].[DownloadLog] SET (LOCK_ESCALATION = TABLE)
GO

-- ----------------------------
--  Options for table Feature
-- ----------------------------
ALTER TABLE [dbo].[Feature] SET (LOCK_ESCALATION = TABLE)
GO

-- ----------------------------
--  Options for table Iteration
-- ----------------------------
ALTER TABLE [dbo].[Iteration] SET (LOCK_ESCALATION = TABLE)
GO

-- ----------------------------
--  Options for table Phone
-- ----------------------------
ALTER TABLE [dbo].[Phone] SET (LOCK_ESCALATION = TABLE)
GO

-- ----------------------------
--  Options for table Product
-- ----------------------------
ALTER TABLE [dbo].[Product] SET (LOCK_ESCALATION = TABLE)
GO

-- ----------------------------
--  Options for table Release
-- ----------------------------
ALTER TABLE [dbo].[Release] SET (LOCK_ESCALATION = TABLE)
GO

-- ----------------------------
--  Options for table Version
-- ----------------------------
ALTER TABLE [dbo].[Version] SET (LOCK_ESCALATION = TABLE)
GO

-- ----------------------------
--  Options for table VersionFeature
-- ----------------------------
ALTER TABLE [dbo].[VersionFeature] SET (LOCK_ESCALATION = TABLE)
GO

