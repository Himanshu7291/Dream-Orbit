/****** Object:  View [dbo].[Containers_Assigned_Users]    Script Date: 14-04-2023 01:26:15 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[Containers_Assigned_Users]
AS
SELECT Jd.container_number ,AD.*
FROM [api].[DrayDogTerminalData] T
CROSS APPLY OPENJSON(T.TerminalData, '$.containers') WITH (
         container_number VARCHAR(100) '$.container_number'
		,assigned_users NVARCHAR(MAX) '$.assigned_users' AS JSON--array
		)Jd
			OUTER APPLY OPENJSON(Jd.assigned_users) WITH (
			id BIGINT '$.id'
			,first_name varchar (100) '$.first_name'
			,last_name varchar (100) '$.last_name'

)AD
			WHERE T.DataSource = 'draydog'
    AND T.TerminalDataType = 'container'
GO


