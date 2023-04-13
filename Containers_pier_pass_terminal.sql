/****** Object:  View [dbo].[Containers_pier_pass_terminal]    Script Date: 14-04-2023 01:29:09 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[Containers_pier_pass_terminal]
AS
SELECT Jd.container_number , TN.*
FROM [api].[DrayDogTerminalData] T
CROSS APPLY OPENJSON(T.TerminalData, '$.containers') WITH (
        container_number VARCHAR(100) '$.container_number'
		,terminals nvarchar(max) '$.pier_pass.terminals' AS JSON
		)Jd
		OUTER APPLY OPENJSON(Jd.terminals) WITH (
			terminals varchar(100) '$'

)TN
			WHERE T.DataSource = 'draydog'
    AND T.TerminalDataType = 'container'

GO


