/****** Object:  View [dbo].[Containers_Import_statuses]    Script Date: 14-04-2023 01:27:54 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE VIEW [dbo].[Containers_Import_statuses]
AS
SELECT IST.*
FROM [api].[DrayDogTerminalData] T
CROSS APPLY OPENJSON(T.TerminalData, '$.containers') WITH (

import_statuses nvarchar(max) '$.import_statuses' AS JSON
)Jd
OUTER APPLY OPENJSON(Jd.import_statuses) WITH (
	    container_number VARCHAR(100) '$.container_number'       
		,terminal VARCHAR(100) '$.terminal'
		,source VARCHAR(100) '$.source'
		,last_free_date DATETIME2(7) '$.last_free_date'      
		,master_bill_of_lading VARCHAR(100) '$.master_bill_of_lading'      
		,shipping_line VARCHAR(100) '$.shipping_line'      
		,container_type VARCHAR(100) '$.container_type'      
		,location VARCHAR(100) '$.location'      
		,parsed_location VARCHAR(100) '$.parsed_location'      
		,terminal_block VARCHAR(100) '$.terminal_block'      
		,holds VARCHAR(100) '$.holds' --array   
		,demurrage_fees VARCHAR(100) '$.demurrage_fees'      
		,ready_for_appointment VARCHAR(100)'$.ready_for_appointment'      
		,available_for_pickup VARCHAR(100) '$.available_for_pickup'      
		,wheeled VARCHAR(100) '$.wheeled'      
		,closed_area VARCHAR(100) '$.terminal'      
		,raw_data VARCHAR(100) '$.raw_data' --  need to check
		,loaded VARCHAR(100) '$.extra_data.loaded'
		,vessel VARCHAR(100) '$.extra_data.vessel'
		,voyage VARCHAR(100) '$.extra_data.voyage'
		,time_in DATETIME2(7) '$.extra_data.time_in'
		,available VARCHAR(100) '$.extra_data.available'
		,discharged VARCHAR(100) '$.extra_data.discharged'
		,gross_weight VARCHAR(100) '$.extra_data.gross_weight'
		,bill_of_lading VARCHAR(100) '$.extra_data.bill_of_lading'
		,terminal_demurrage_owed VARCHAR(100) '$.terminal_demurrage_owed'
		,observed DATETIME2(7) '$.observed'
		,id BIGINT '$.id'
		,cycle_id BIGINT '$.cycle_id'
		,last_observed DATETIME2(7)'$.last_observed'
		,parsed_shipping_line VARCHAR(100) '$.parsed_shipping_line'
		,parsed_container_type VARCHAR(100) '$.parsed_container_type' 
			)IST


WHERE T.DataSource = 'draydog'
    AND T.TerminalDataType = 'container'
GO


