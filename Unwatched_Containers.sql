/****** Object:  View [dbo].[Unwatched_Containers]    Script Date: 14-04-2023 01:30:22 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER VIEW [dbo].[Unwatched_Containers]
AS 
SELECT Jd.*
FROM [api].[DrayDogTerminalData] T
		CROSS APPLY OPENJSON(T.TerminalData, '$.unwatched_containers') WITH (
        container_number VARCHAR(100) '$'
    ) Jd

			WHERE T.DataSource = 'draydog'
       AND T.[TerminalDataType] = 'container'
       AND Jd.container_number IS NOT NULL;

GO


