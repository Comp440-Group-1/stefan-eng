-- Drops all the tables deleted in correct order if they exist
-- based on the foreign keys
IF OBJECT_ID('dbo.VersionFeature', 'U') IS NOT NULL 
  DROP TABLE dbo.VersionFeature; 

IF OBJECT_ID('dbo.Feature', 'U') IS NOT NULL 
  DROP TABLE dbo.Feature; 

IF OBJECT_ID('dbo.DownloadLog', 'U') IS NOT NULL 
  DROP TABLE dbo.DownloadLog; 

IF OBJECT_ID('dbo.Download', 'U') IS NOT NULL 
  DROP TABLE dbo.Download; 

IF OBJECT_ID('dbo.Release', 'U') IS NOT NULL 
  DROP TABLE dbo.Release; 

IF OBJECT_ID('dbo.Branch', 'U') IS NOT NULL 
  DROP TABLE dbo.Branch; 

IF OBJECT_ID('dbo.Customer', 'U') IS NOT NULL 
  DROP TABLE dbo.Customer; 

IF OBJECT_ID('dbo.Company', 'U') IS NOT NULL 
  DROP TABLE dbo.Company; 

IF OBJECT_ID('dbo.Address', 'U') IS NOT NULL 
  DROP TABLE dbo.Address; 

IF OBJECT_ID('dbo.Phone', 'U') IS NOT NULL 
  DROP TABLE dbo.Phone; 

IF OBJECT_ID('dbo.Iteration', 'U') IS NOT NULL 
  DROP TABLE dbo.Iteration; 

IF OBJECT_ID('dbo.Version', 'U') IS NOT NULL 
  DROP TABLE dbo.Version; 

IF OBJECT_ID('dbo.Product', 'U') IS NOT NULL 
  DROP TABLE dbo.Product; 