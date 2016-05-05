-- Return a summary of the number of new features
-- Does an intersection of all features except the current version,
-- with the intersection of all features to get the new features.
-- Performs the operation in this way because we are probably storing same
-- features across multiple major versions

ALTER PROCEDURE [dbo].[NewFeatureCount]
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
