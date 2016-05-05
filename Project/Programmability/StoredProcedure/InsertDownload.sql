ALTER PROCEDURE [dbo].[InsertDownload] @DownloadDate datetime,
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
