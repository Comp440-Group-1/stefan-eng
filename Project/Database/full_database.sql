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
	[Country] varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[StreetAddress] varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
ON [PRIMARY]
GO

-- ----------------------------
--  Records of Address
-- ----------------------------
BEGIN TRANSACTION
GO
INSERT INTO [dbo].[Address] VALUES ('1', 'Los Angeles', 'CA', '91601', 'USA', '123 Privet Street');
INSERT INTO [dbo].[Address] VALUES ('2', 'Northridge', 'CA', '91325', 'USA', '18111 Nordhoff Steet');
INSERT INTO [dbo].[Address] VALUES ('3', 'London', null, null, 'England', '348 Jinx Road');
GO
COMMIT
GO

-- ----------------------------
--  Table structure for Branch
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID('[dbo].[Branch]') AND type IN ('U'))
	DROP TABLE [dbo].[Branch]
GO
CREATE TABLE [dbo].[Branch] (
	[BranchID] int NOT NULL,
	[Location] varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[BranchName] varchar(10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
ON [PRIMARY]
GO

-- ----------------------------
--  Records of Branch
-- ----------------------------
BEGIN TRANSACTION
GO
INSERT INTO [dbo].[Branch] VALUES ('1', '/master', 'master');
GO
COMMIT
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
--  Records of Company
-- ----------------------------
BEGIN TRANSACTION
GO
INSERT INTO [dbo].[Company] VALUES ('1', 'ABC records', '1');
INSERT INTO [dbo].[Company] VALUES ('2', 'ZYX Corp', '3');
INSERT INTO [dbo].[Company] VALUES ('3', '99 Store', null);
GO
COMMIT
GO

-- ----------------------------
--  Table structure for Customer
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID('[dbo].[Customer]') AND type IN ('U'))
	DROP TABLE [dbo].[Customer]
GO
CREATE TABLE [dbo].[Customer] (
	[CustomerID] int NOT NULL,
	[PhoneID] int NULL,
	[CompanyID] int NULL,
	[CustomerEmail] varchar(254) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FirstName] varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[LastName] varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
ON [PRIMARY]
GO

-- ----------------------------
--  Records of Customer
-- ----------------------------
BEGIN TRANSACTION
GO
INSERT INTO [dbo].[Customer] VALUES ('1', '1', '1', 'p.smith@abc.com', 'Peter', 'Smith');
INSERT INTO [dbo].[Customer] VALUES ('2', '2', '2', 'maria@zyx.com', 'Maria', 'Bounte');
INSERT INTO [dbo].[Customer] VALUES ('3', '3', '3', 'david.sommerset@99cents.store', 'David', 'Sommerset');
INSERT INTO [dbo].[Customer] VALUES ('4', '4', '3', 'maria.bounte@99cents.store', 'Maria', 'Bounte');
GO
COMMIT
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
--  Records of Download
-- ----------------------------
BEGIN TRANSACTION
GO
INSERT INTO [dbo].[Download] VALUES ('1', '7', '/download/a');
INSERT INTO [dbo].[Download] VALUES ('2', '5', '/downloads/b');
GO
COMMIT
GO

-- ----------------------------
--  Table structure for DownloadLog
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID('[dbo].[DownloadLog]') AND type IN ('U'))
	DROP TABLE [dbo].[DownloadLog]
GO
CREATE TABLE [dbo].[DownloadLog] (
	[DownloadDate] datetime2(0) NULL,
	[CustomerID] int NULL,
	[DownloadID] int NULL
)
ON [PRIMARY]
GO

-- ----------------------------
--  Records of DownloadLog
-- ----------------------------
BEGIN TRANSACTION
GO
INSERT INTO [dbo].[DownloadLog] VALUES ('2000-03-01 00:00:00', '4', '2');
INSERT INTO [dbo].[DownloadLog] VALUES ('2000-07-01 00:00:00', '3', '2');
INSERT INTO [dbo].[DownloadLog] VALUES ('2015-01-01 00:00:00', '1', '1');
INSERT INTO [dbo].[DownloadLog] VALUES ('2015-01-01 00:00:00', '1', '2');
INSERT INTO [dbo].[DownloadLog] VALUES ('2015-01-01 00:00:00', '4', '1');
INSERT INTO [dbo].[DownloadLog] VALUES ('2015-11-26 00:00:00', '4', '2');
GO
COMMIT
GO

-- ----------------------------
--  Table structure for Feature
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID('[dbo].[Feature]') AND type IN ('U'))
	DROP TABLE [dbo].[Feature]
GO
CREATE TABLE [dbo].[Feature] (
	[FeatureDescription] varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
)
ON [PRIMARY]
GO

-- ----------------------------
--  Records of Feature
-- ----------------------------
BEGIN TRANSACTION
GO
INSERT INTO [dbo].[Feature] VALUES ('address verification');
INSERT INTO [dbo].[Feature] VALUES ('login module');
INSERT INTO [dbo].[Feature] VALUES ('patient authentication');
INSERT INTO [dbo].[Feature] VALUES ('patient e-bill');
INSERT INTO [dbo].[Feature] VALUES ('patient medication form');
INSERT INTO [dbo].[Feature] VALUES ('patient profile');
INSERT INTO [dbo].[Feature] VALUES ('patient registration');
INSERT INTO [dbo].[Feature] VALUES ('patient release form');
INSERT INTO [dbo].[Feature] VALUES ('patient reporting');
INSERT INTO [dbo].[Feature] VALUES ('patient reporting bug fix');
INSERT INTO [dbo].[Feature] VALUES ('physician profile');
GO
COMMIT
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
--  Records of Iteration
-- ----------------------------
BEGIN TRANSACTION
GO
INSERT INTO [dbo].[Iteration] VALUES ('1', 'stable', '1', '8f64731394e1ea6dc34c4ba8e8f04cf83e00d553', null);
INSERT INTO [dbo].[Iteration] VALUES ('2', 'dev', '2', 'f576341458c8a7481da1e5e8be7214c994f3077f', null);
GO
COMMIT
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
	[PhoneNumber] varchar(15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
ON [PRIMARY]
GO

-- ----------------------------
--  Records of Phone
-- ----------------------------
BEGIN TRANSACTION
GO
INSERT INTO [dbo].[Phone] VALUES ('1', 'work', '123-485-8973');
INSERT INTO [dbo].[Phone] VALUES ('2', 'work', '1-28-397863896');
INSERT INTO [dbo].[Phone] VALUES ('3', 'mobile', '179-397-87968');
INSERT INTO [dbo].[Phone] VALUES ('4', 'mobile', '178-763-98764');
GO
COMMIT
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
	[Name] varchar(15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Platform] varchar(15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
ON [PRIMARY]
GO

-- ----------------------------
--  Records of Product
-- ----------------------------
BEGIN TRANSACTION
GO
INSERT INTO [dbo].[Product] VALUES ('2', 'health records system for the patients', 'EHR System', 'Linux');
INSERT INTO [dbo].[Product] VALUES ('1', 'health records system for the patients', 'EHR System', 'Windows');
GO
COMMIT
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
--  Records of Release
-- ----------------------------
BEGIN TRANSACTION
GO
INSERT INTO [dbo].[Release] VALUES ('1', '1', '2', '1', 'Best Release Yet', '2000-01-01 00:00:00', 'new product release');
INSERT INTO [dbo].[Release] VALUES ('5', '5', '2', '1', 'Best Release Yet', '2000-01-01 00:00:00', 'new product release');
INSERT INTO [dbo].[Release] VALUES ('7', '2', '1', '1', 'Best Release Yet', '2000-01-01 00:00:00', 'new product release');
INSERT INTO [dbo].[Release] VALUES ('9', '4', '1', '1', 'Best Release Yet', '2000-01-01 00:00:00', 'new product release');
INSERT INTO [dbo].[Release] VALUES ('11', '1', '1', '1', 'Best Release Yet', '2000-01-01 00:00:00', 'new product release');
INSERT INTO [dbo].[Release] VALUES ('13', '3', '1', '1', 'Pretty good release', '2000-05-01 00:00:00', 'new features release');
INSERT INTO [dbo].[Release] VALUES ('15', '5', '1', '1', 'Pretty good release', '2000-05-01 00:00:00', 'new features release');
INSERT INTO [dbo].[Release] VALUES ('17', '2', '2', '1', 'Pretty good release', '2000-05-01 00:00:00', 'new features release');
INSERT INTO [dbo].[Release] VALUES ('19', '4', '2', '1', 'Pretty good release', '2000-05-01 00:00:00', 'new features release');
INSERT INTO [dbo].[Release] VALUES ('21', '1', '2', '1', 'Pretty good release', '2000-06-13 00:00:00', 'bug-fix release');
GO
COMMIT
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
	[VersionMajorNumber] int NULL,
	[VersionMinorNumber] int NULL
)
ON [PRIMARY]
GO

-- ----------------------------
--  Records of Version
-- ----------------------------
BEGIN TRANSACTION
GO
INSERT INTO [dbo].[Version] VALUES ('1', '1', '1', '1');
INSERT INTO [dbo].[Version] VALUES ('2', '2', '1', '2');
INSERT INTO [dbo].[Version] VALUES ('3', '2', '1', '1');
INSERT INTO [dbo].[Version] VALUES ('4', '1', '2', '1');
INSERT INTO [dbo].[Version] VALUES ('5', '2', '2', '2');
INSERT INTO [dbo].[Version] VALUES ('6', '1', '2', '2');
INSERT INTO [dbo].[Version] VALUES ('7', '1', '3', '0');
INSERT INTO [dbo].[Version] VALUES ('8', '1', '3', '1');
GO
COMMIT
GO

-- ----------------------------
--  Table structure for VersionFeature
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID('[dbo].[VersionFeature]') AND type IN ('U'))
	DROP TABLE [dbo].[VersionFeature]
GO
CREATE TABLE [dbo].[VersionFeature] (
	[FeatureDescription] varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[VersionID] int NOT NULL
)
ON [PRIMARY]
GO

-- ----------------------------
--  Records of VersionFeature
-- ----------------------------
BEGIN TRANSACTION
GO
INSERT INTO [dbo].[VersionFeature] VALUES ('address verification', '1');
INSERT INTO [dbo].[VersionFeature] VALUES ('address verification', '3');
INSERT INTO [dbo].[VersionFeature] VALUES ('login module', '1');
INSERT INTO [dbo].[VersionFeature] VALUES ('login module', '2');
INSERT INTO [dbo].[VersionFeature] VALUES ('patient authentication', '4');
INSERT INTO [dbo].[VersionFeature] VALUES ('patient authentication', '5');
INSERT INTO [dbo].[VersionFeature] VALUES ('patient e-bill', '4');
INSERT INTO [dbo].[VersionFeature] VALUES ('patient e-bill', '5');
INSERT INTO [dbo].[VersionFeature] VALUES ('patient medication form', '4');
INSERT INTO [dbo].[VersionFeature] VALUES ('patient medication form', '5');
INSERT INTO [dbo].[VersionFeature] VALUES ('patient profile', '1');
INSERT INTO [dbo].[VersionFeature] VALUES ('patient profile', '2');
INSERT INTO [dbo].[VersionFeature] VALUES ('patient registration', '1');
INSERT INTO [dbo].[VersionFeature] VALUES ('patient registration', '2');
INSERT INTO [dbo].[VersionFeature] VALUES ('patient release form', '1');
INSERT INTO [dbo].[VersionFeature] VALUES ('patient release form', '2');
INSERT INTO [dbo].[VersionFeature] VALUES ('patient reporting', '4');
INSERT INTO [dbo].[VersionFeature] VALUES ('patient reporting', '5');
INSERT INTO [dbo].[VersionFeature] VALUES ('patient reporting bug fix', '5');
INSERT INTO [dbo].[VersionFeature] VALUES ('physician profile', '1');
INSERT INTO [dbo].[VersionFeature] VALUES ('physician profile', '2');
GO
COMMIT
GO

-- ----------------------------
--  Procedure structure for UpdateMajorVersion
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID('[dbo].[UpdateMajorVersion]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE [dbo].[UpdateMajorVersion]
GO
CREATE PROCEDURE [dbo].[UpdateMajorVersion]  @ProductID INT AS
DECLARE @newvid INT,
 @newmajor INT
IF NOT EXISTS(
	SELECT
		*
	FROM
		[dbo].[Version]
	WHERE
		ProductID = @ProductID
)
BEGIN
	RAISERROR(
		'That product is not in the table, cannot increment version',
		16,
		1
	) ; RETURN ;
END
ELSE
	-- Get the max id in the table, and add one to it for new id
	SELECT
		@newvid = MAX(VersionID) + 1
	FROM
		[dbo].[Version]
	GROUP BY
		VersionID ; -- Get the max minor version number for the Product 
		SELECT
			@newmajor = MAX(VersionMajorNumber) + 1
		FROM
			[dbo].[Version]
		GROUP BY
			ProductID ; -- Insert the new row with the updated version into the version table
			INSERT INTO [dbo].[Version](
				[VersionID],
				[ProductID],
				[VersionMajorNumber],
				[VersionMinorNumber]
			)
		VALUES
			(@newvid, @ProductID, @newmajor, 0) ;
GO

-- ----------------------------
--  Procedure structure for DownloadsPerProductVersion
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID('[dbo].[DownloadsPerProductVersion]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE [dbo].[DownloadsPerProductVersion]
GO
CREATE PROCEDURE [dbo].[DownloadsPerProductVersion]  AS -- Returns Product, version, month, count
SELECT
	CAST(
		Version.VersionMajorNumber AS VARCHAR(10)
	) + '.' + CAST(
		Version.VersionMinorNumber AS VARCHAR(10)
	) AS 'Version',
	Product.Name,
	COUNT(*) AS 'Count'
FROM
	DownloadLog
INNER JOIN Download ON DownloadLog.DownloadID = Download.DownloadID
INNER JOIN Release ON Download.ReleaseID = Release.ReleaseID
INNER JOIN Version ON Release.VersionID = Version.VersionID
INNER JOIN Product ON Version.ProductID = Product.ProductID
GROUP BY
	Version.VersionMajorNumber,
	Version.VersionMinorNumber,
	Product.Name
GO

-- ----------------------------
--  Procedure structure for MonthlyDownloads
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID('[dbo].[MonthlyDownloads]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE [dbo].[MonthlyDownloads]
GO
CREATE PROCEDURE [dbo].[MonthlyDownloads]  AS SELECT
	CAST(
		MONTH(DownloadLog.DownloadDate) AS VARCHAR(2)
	) + '-' + CAST(
		YEAR(DownloadLog.DownloadDate) AS VARCHAR(4)
	) AS "Month-Year",
	-- Take the major and minor number and combine into X.XX format
	CAST(
		Version.VersionMajorNumber AS VARCHAR(10)
	) + '.' + CAST(
		Version.VersionMinorNumber AS VARCHAR(10)
	) AS 'Version',
	Product.Name AS 'Product',
	COUNT(*) AS 'Total Download Count'
FROM
	DownloadLog
INNER JOIN Download ON DownloadLog.DownloadID = Download.DownloadID
INNER JOIN Release ON Download.ReleaseID = Release.ReleaseID
INNER JOIN Version ON Release.VersionID = Version.VersionID
INNER JOIN Product ON Version.ProductID = Product.ProductID
GROUP BY
	Version.VersionMajorNumber,
	Version.VersionMinorNumber,
	Product.Name,
	CAST(
		MONTH(DownloadLog.DownloadDate) AS VARCHAR(2)
	) + '-' + CAST(
		YEAR(DownloadLog.DownloadDate) AS VARCHAR(4)
	)
GO

-- ----------------------------
--  Procedure structure for NewFeatureCount
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID('[dbo].[NewFeatureCount]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE [dbo].[NewFeatureCount]
GO
CREATE PROCEDURE [dbo].[NewFeatureCount] 
	@ProductID varchar(15),
	@VersionMajorNumber int
AS

	IF NOT EXISTS(SELECT * FROM Version WHERE VersionMajorNumber = @VersionMajorNumber AND ProductID = @ProductID)
	BEGIN
		RAISERROR(
		'No versions exists for that product with that major number',
		16,
		1
	) ; RETURN ;
	END

	DECLARE @featureCount INT;
	-- Need to do intersection if we have more than one version
	IF @VersionMajorNumber >= 1
	BEGIN
		SET @featureCount = (SELECT DISTINCT COUNT (*) FROM (SELECT DISTINCT 
			VersionFeature.FeatureDescription
		FROM Product
		INNER JOIN Version ON Version.ProductID = Product.ProductID
		INNER JOIN VersionFeature ON VersionFeature.VersionID = Version.VersionID
		WHERE Product.ProductID = @ProductID AND Version.ProductID = 1 AND VersionMajorNumber <= @VersionMajorNumber

		INTERSECT

		SELECT DISTINCT 
			VersionFeature.FeatureDescription
		FROM Product
		INNER JOIN Version ON Version.ProductID = Product.ProductID
		INNER JOIN VersionFeature ON VersionFeature.VersionID = Version.VersionID
		WHERE Product.ProductID = @ProductID AND Version.ProductID = 1 AND VersionMajorNumber <  @VersionMajorNumber) I)
	END
	ELSE
	BEGIN
		SET @featureCount = (SELECT COUNT(DISTINCT 
			VersionFeature.FeatureDescription)
		FROM Product
		INNER JOIN Version ON Version.ProductID = Product.ProductID
		INNER JOIN VersionFeature ON VersionFeature.VersionID = Version.VersionID
		WHERE Product.ProductID = @ProductID AND Version.ProductID = 1 AND VersionMajorNumber <= @VersionMajorNumber)
	END
	
	IF @featureCount > 0
	BEGIN
		PRINT(CAST(@featureCount AS VARCHAR(50)) + ' features in the version ' + CAST(@VersionMajorNumber AS VARCHAR(5)) + ' release.')		
	END
	ELSE
		PRINT('It is a bug-fix release. There are no new features')



GO

-- ----------------------------
--  Procedure structure for TestSelectProc
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID('[dbo].[TestSelectProc]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE [dbo].[TestSelectProc]
GO
CREATE PROCEDURE [dbo].[TestSelectProc]  @var1 VARCHAR(20) AS SELECT
	*
FROM
	[dbo].[Customer]
WHERE
	FirstName = @var1 ;
GO

-- ----------------------------
--  Procedure structure for InsertDownload
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID('[dbo].[InsertDownload]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE [dbo].[InsertDownload]
GO
CREATE PROCEDURE [dbo].[InsertDownload]  @DownloadDate datetime,
 @CustomerID INT,
 @DownloadID INT AS -- Checks if Customer exists with given ID and Download exists with download ID
IF NOT EXISTS(
	SELECT
		*
	FROM
		[dbo].[Customer]
	WHERE
		CustomerID = @CustomerID
)
OR NOT EXISTS(
	SELECT
		*
	FROM
		[dbo].[Download]
	WHERE
		DownloadID = @DownloadID
)
BEGIN
	RAISERROR(
		'No customer exists with that ID',
		16,
		1
	) ; RETURN ;
END
ELSE
	INSERT INTO DownloadLog(
		[DownloadDate],
		[CustomerID],
		[DownloadID]
	)
VALUES
	(
		@DownloadDate,
		@CustomerID,
		@DownloadID
	)
GO

-- ----------------------------
--  Procedure structure for UpdateMinorVersion
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID('[dbo].[UpdateMinorVersion]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE [dbo].[UpdateMinorVersion]
GO
CREATE PROCEDURE [dbo].[UpdateMinorVersion]  @ProductID INT,
 @MajorVersion VARCHAR(10) AS
DECLARE @newvid INT,
 @newminor INT
IF NOT EXISTS(
	SELECT
		*
	FROM
		[dbo].[Version]
	WHERE
		ProductID = @ProductID
)
BEGIN
	RAISERROR(
		'That product is not in the table, cannot increment version',
		16,
		1
	) ; RETURN ;
END
IF NOT EXISTS(
	SELECT
		*
	FROM
		[dbo].[Version]
	WHERE
		ProductID = @ProductID
	AND VersionMajorNumber = @MajorVersion
)
BEGIN
	RAISERROR(
		'That version is not in the table, cannot increment version',
		16,
		1
	) ; RETURN ;
END
ELSE
	-- Get the max id in the table, and add one to it for new id
	SELECT
		@newvid = MAX(VersionID) + 1
	FROM
		[dbo].[Version]
	GROUP BY
		VersionID ; -- Get the max minor version number for the Product/Major number pair
		SELECT
			@newminor = MAX(VersionMinorNumber) + 1
		FROM
			[dbo].[Version]
		GROUP BY
			ProductID,
			VersionMajorNumber ; -- Insert the new row with the updated version into the version table
			INSERT INTO [dbo].[Version](
				[VersionID],
				[ProductID],
				[VersionMajorNumber],
				[VersionMinorNumber]
			)
		VALUES
			(
				@newvid,
				@ProductID,
				@MajorVersion,
				@newminor
			) ;
GO


-- ----------------------------
--  Primary key structure for table Address
-- ----------------------------
ALTER TABLE [dbo].[Address] ADD
	CONSTRAINT [AddressID] PRIMARY KEY CLUSTERED ([AddressID]) 
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
	CONSTRAINT [BranchID] PRIMARY KEY CLUSTERED ([BranchID]) 
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
	CONSTRAINT [CompanyID] PRIMARY KEY CLUSTERED ([CompanyID]) 
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
	CONSTRAINT [CustomerID] PRIMARY KEY CLUSTERED ([CustomerID]) 
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
	CONSTRAINT [DownloadID] PRIMARY KEY CLUSTERED ([DownloadID]) 
	WITH (PAD_INDEX = OFF,
		IGNORE_DUP_KEY = OFF,
		ALLOW_ROW_LOCKS = ON,
		ALLOW_PAGE_LOCKS = ON)
	ON [default]
GO

-- ----------------------------
--  Uniques structure for table DownloadLog
-- ----------------------------
ALTER TABLE [dbo].[DownloadLog] ADD
	CONSTRAINT [unique_dl] UNIQUE NONCLUSTERED ([DownloadDate] ASC, [CustomerID] ASC, [DownloadID] ASC) 
	WITH (PAD_INDEX = OFF,
		IGNORE_DUP_KEY = OFF,
		ALLOW_ROW_LOCKS = ON,
		ALLOW_PAGE_LOCKS = ON)
	ON [PRIMARY]
GO

-- ----------------------------
--  Primary key structure for table Feature
-- ----------------------------
ALTER TABLE [dbo].[Feature] ADD
	CONSTRAINT [FeatureID] PRIMARY KEY CLUSTERED ([FeatureDescription]) 
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
	CONSTRAINT [IterationID] PRIMARY KEY CLUSTERED ([IterationID]) 
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
	CONSTRAINT [PhoneID] PRIMARY KEY CLUSTERED ([PhoneID]) 
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
	CONSTRAINT [ProductID] PRIMARY KEY CLUSTERED ([ProductID]) 
	WITH (PAD_INDEX = OFF,
		IGNORE_DUP_KEY = OFF,
		ALLOW_ROW_LOCKS = ON,
		ALLOW_PAGE_LOCKS = ON)
	ON [default]
GO

-- ----------------------------
--  Uniques structure for table Product
-- ----------------------------
ALTER TABLE [dbo].[Product] ADD
	CONSTRAINT [_copy_1] UNIQUE NONCLUSTERED ([Description] DESC, [Name] ASC, [Platform] ASC) 
	WITH (PAD_INDEX = OFF,
		IGNORE_DUP_KEY = OFF,
		ALLOW_ROW_LOCKS = ON,
		ALLOW_PAGE_LOCKS = ON)
	ON [PRIMARY]
GO

-- ----------------------------
--  Primary key structure for table Release
-- ----------------------------
ALTER TABLE [dbo].[Release] ADD
	CONSTRAINT [ReleaseID] PRIMARY KEY CLUSTERED ([ReleaseID]) 
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
	CONSTRAINT [VersionID] PRIMARY KEY CLUSTERED ([VersionID]) 
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
	CONSTRAINT [PK__VersionF__EB1FEADB9E3847BB] PRIMARY KEY CLUSTERED ([FeatureDescription],[VersionID]) 
	WITH (PAD_INDEX = OFF,
		IGNORE_DUP_KEY = OFF,
		ALLOW_ROW_LOCKS = ON,
		ALLOW_PAGE_LOCKS = ON)
	ON [default]
GO

-- ----------------------------
--  Uniques structure for table VersionFeature
-- ----------------------------
ALTER TABLE [dbo].[VersionFeature] ADD
	CONSTRAINT [UQ__VersionF__EB1FEADA2D7C90F7] UNIQUE NONCLUSTERED ([FeatureDescription] ASC, [VersionID] ASC) 
	WITH (PAD_INDEX = OFF,
		IGNORE_DUP_KEY = OFF,
		ALLOW_ROW_LOCKS = ON,
		ALLOW_PAGE_LOCKS = ON)
	ON [PRIMARY]
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
	CONSTRAINT [fk_DownloadLog_Customer_1] FOREIGN KEY ([CustomerID]) REFERENCES [dbo].[Customer] ([CustomerID]) ON DELETE NO ACTION ON UPDATE NO ACTION
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
	CONSTRAINT [fk_VersionFeature_Version_1] FOREIGN KEY ([VersionID]) REFERENCES [dbo].[Version] ([VersionID]) ON DELETE NO ACTION ON UPDATE NO ACTION,
	CONSTRAINT [fk_VersionFeature_Feature_1] FOREIGN KEY ([FeatureDescription]) REFERENCES [dbo].[Feature] ([FeatureDescription]) ON DELETE NO ACTION ON UPDATE NO ACTION
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

