ALTER PROCEDURE [dbo].[TestSelectProc] @var1 VARCHAR(20) AS SELECT
        *
FROM
        [dbo].[Customer]
WHERE
        FirstName = @var1 ;
