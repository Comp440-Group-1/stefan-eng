ALTER PROCEDURE [dbo].[DownloadsPerProductVersion] AS -- Returns Product, version, month, count
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
