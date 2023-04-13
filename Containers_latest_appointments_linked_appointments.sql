/****** Object:  View [dbo].[Containers_latest_appointments_linked_appointments]    Script Date: 14-04-2023 01:28:33 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE VIEW [dbo].[Containers_latest_appointments_linked_appointments]
AS	
SELECT LD.*
FROM [api].[DrayDogTerminalData] T
CROSS APPLY OPENJSON(T.TerminalData, '$.containers') WITH (
  linked_appointments NVARCHAR(max) '$.latest_appointment.linked_appointments' AS JSON--array
)Jd
OUTER APPLY OPENJSON(Jd.linked_appointments) WITH (
			container_number varchar (100) '$.container_number'
			,terminal_reference varchar(100) '$.terminal_reference'
			)LD
						WHERE T.DataSource = 'draydog'
    AND T.TerminalDataType = 'container'
    AND LD.container_number IS NOT NULL
GO


