--Updates the major version number of a product
ALTER PROCEDURE [dbo].[UpdateMajorVersion] @ProductID INT AS
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
