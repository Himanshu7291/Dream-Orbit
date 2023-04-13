/****** Object:  View [dbo].[Unknown_State_Containers]    Script Date: 14-04-2023 01:29:43 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE VIEW [dbo].[Unknown_State_Containers]
AS
SELECT Jd.*
FROM [api].[DrayDogTerminalData] T
		CROSS APPLY OPENJSON(T.TerminalData, '$.unknown_state_containers') WITH (
        container_number VARCHAR(100) '$'
    ) Jd

			WHERE T.DataSource = 'draydog'
       AND T.[TerminalDataType] = 'container'
       AND Jd.container_number IS NOT NULL;

GO


