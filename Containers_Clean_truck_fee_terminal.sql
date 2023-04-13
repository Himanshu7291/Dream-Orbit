/****** Object:  View [dbo].[Containers_Clean_truck_fee_terminal]    Script Date: 14-04-2023 01:26:55 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[Containers_Clean_truck_fee_terminal]
AS
SELECT Jd.container_number, TN.*
FROM [api].[DrayDogTerminalData] T
CROSS APPLY OPENJSON(T.TerminalData, '$.containers') WITH (
		container_number varchar(100) '$.container_number'
		,terminals nvarchar(max) '$.clean_truck_fee.terminals' AS JSON
		)Jd
		OUTER APPLY OPENJSON(Jd.terminals) WITH (
			terminals varchar(100) '$'

)TN
			WHERE T.DataSource = 'draydog'
    AND T.TerminalDataType = 'container'

GO


