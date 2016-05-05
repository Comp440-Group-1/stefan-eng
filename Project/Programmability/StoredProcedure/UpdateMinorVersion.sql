--Updates the minor version number of a major version number
ALTER PROCEDURE [dbo].[UpdateMinorVersion] @ProductID INT,
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
