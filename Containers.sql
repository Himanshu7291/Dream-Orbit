/****** Object:  View [dbo].[Containers]    Script Date: 14-04-2023 01:25:24 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[Containers]
AS
SELECT Jd.*
FROM [api].[DrayDogTerminalData] T
CROSS APPLY OPENJSON(T.TerminalData, '$.containers') WITH (
        container_number VARCHAR(100) '$.container_number'
        ,customer VARCHAR(100) '$.customer'
		,cycle_state VARCHAR(100) '$.cycle_state'
		,next_available_appointment VARCHAR(100) '$.next_available_appointment'
		,master_bl VARCHAR(100) '$.master_bl'
		,id BIGINT'$.added_by_user.id'
	    ,first_name varchar (100) '$.added_by_user.first_name'
		,last_name varchar (100) '$.added_by_user.last_name'
		,auto_book_on VARCHAR(100) '$.auto_book_on'
		,auto_book_request_status VARCHAR(100) '$.auto_book_request_status'
		,last_related_terminal VARCHAR(100) '$.last_related_terminal'
		,pier_pass_container_number VARCHAR(100) '$.pier_pass.container_number'
		,pier_pass_claimed_by_other_company VARCHAR(10) '$.pier_pass.claimed_by_other_company'
		,pier_pass_fee_paid VARCHAR(10) '$.pier_pass.fee_paid'
		,pier_pass_has_hold VARCHAR(10) '$.pier_pass.has_hold'
		,pier_pass_observed DATETIME2(7) '$.pier_pass.observed'
		,clean_truck_fee_container_number VARCHAR(100) '$.clean_truck_fee.container_number'
		,clean_truck_fee_claimed_by_other_company VARCHAR(100) '$.clean_truck_fee.claimed_by_other_company'
		,clean_truck_fee_fee_paid VARCHAR(10) '$.clean_truck_fee.fee_paid'
		,clean_truck_fee_has_hold VARCHAR(10) '$.clean_truck_fee.has_hold'
		,clean_truck_fee_observed DATETIME2(7) '$.clean_truck_fee.observed'
		,import_status_container_number VARCHAR(100) '$.import_status.container_number'       
		,import_status_terminal VARCHAR(100) '$.import_status.terminal'
		,import_status_source VARCHAR(100) '$.import_status.source'
		,import_status_last_free_date DATETIME2(7) '$.import_status.last_free_date'      
		,import_status_master_bill_of_lading VARCHAR(100) '$.import_status.master_bill_of_lading'      
		,import_status_shipping_line VARCHAR(100) '$.import_status.shipping_line'      
		,import_status_container_type VARCHAR(100) '$.import_status.container_type'      
		,import_status_location VARCHAR(100) '$.import_status.location'      
		,import_status_parsed_location VARCHAR(100) '$.import_status.parsed_location'      
		,import_status_terminal_block VARCHAR(100) '$.import_status.terminal_block'
		,import_status_demurrage_fees VARCHAR(100) '$.import_status.demurrage_fees'      
		,import_status_ready_for_appointment VARCHAR(10) '$.import_status.ready_for_appointment'      
		,import_status_available_for_pickup VARCHAR(10) '$.import_status.available_for_pickup'      
		,import_status_wheeled VARCHAR(10) '$.import_status.wheeled'      
		,import_status_closed_area VARCHAR(100) '$.import_status.terminal'      
		,import_status_raw_data VARCHAR(100) '$.import_status.raw_data' --  need to check
		,import_status_loaded VARCHAR(100) '$.import_status.extra_data.loaded'
		,import_status_vessel VARCHAR(100) '$.import_status.extra_data.vessel'
		,import_status_voyage VARCHAR(100) '$.import_status.extra_data.voyage'
		,import_status_time_in DATETIME2(7) '$.import_status.extra_data.time_in'
		,import_status_available VARCHAR(100) '$.import_status.extra_data.available'
		,import_status_discharged VARCHAR(100) '$.import_status.extra_data.discharged'
		,import_status_gross_weight VARCHAR(100) '$.import_status.extra_data.gross_weight'
		,import_status_bill_of_lading VARCHAR(100) '$.import_status.extra_data.bill_of_lading'
		,import_status_terminal_demurrage_owed VARCHAR(100) '$.import_status.terminal_demurrage_owed'
		,import_status_observed DATETIME2(7) '$.import_status.observed'
		,import_status_id BIGINT '$.import_status.id'
		,import_status_cycle_id VARCHAR(100) '$.import_status.cycle_id'
		,import_status_last_observed DATETIME2(7) '$.import_status.last_observed'
		,import_status_parsed_shipping_line VARCHAR(100) '$.import_status.parsed_shipping_line'
		,import_status_parsed_container_type VARCHAR(100) '$.import_status.parsed_container_type'   
		,outbound_gate_transaction_container_number VARCHAR(100) '$.outbound_gate_transaction.container_number'
		,outbound_gate_transaction_terminal VARCHAR(100) '$.outbound_gate_transaction.terminal'
		,outbound_gate_transaction_chassis_number VARCHAR(100) '$.outbound_gate_transaction.chassis_number'
		,outbound_gate_transaction_time DATETIME2(7) '$.outbound_gate_transaction.time'
		,outbound_gate_transaction_loaded VARCHAR(10) '$.outbound_gate_transaction.loaded'
   		,outbound_gate_transaction_direction VARCHAR(100) '$.outbound_gate_transaction.direction'
		,outbound_gate_transaction_drivers_license_number VARCHAR(100) '$.outbound_gate_transaction.drivers_license_number'
		,outbound_gate_transaction_truck_rfid_number VARCHAR(100) '$.outbound_gate_transaction.truck_rfid_number'
		,outbound_gate_transaction_truck_license_plate_number VARCHAR(100) '$.outbound_gate_transaction.truck_license_plate_number'
		,outbound_gate_transaction_status VARCHAR(100) '$.outbound_gate_transaction.extra_data.status'
		,outbound_gate_transaction_gate_key VARCHAR(100) '$.outbound_gate_transaction.extra_data.gate_key'
		,outbound_gate_transaction_shipping_line VARCHAR(100) '$.outbound_gate_transaction.extra_data.shipping_line'
		,inbound_gate_transaction_inbound_gate_transaction varchar(100) '$.inbound_gate_transaction' --no data
		,latest_appointment_container_number VARCHAR(100) '$.latest_appointment.container_number'
 		  ,latest_appointment_id VARCHAR(100) '$.latest_appointment.container_number'
 		  ,latest_appointment_loaded VARCHAR(100) '$.latest_appointment.loaded'
 		  ,latest_appointment_status VARCHAR(100) '$.latest_appointment.container_number'
 		  ,latest_appointment_direction VARCHAR(100) '$.latest_appointment.direction'
 		  ,latest_appointment_window_start DATETIME2(7) '$.latest_appointment.window_start'
 		  ,latest_appointment_window_end DATETIME2(7) '$.latest_appointment.window_end'
 		  ,latest_appointment_terminal VARCHAR(100) '$.latest_appointment.terminal'
 		 , latest_appointment_terminal_reference VARCHAR(100) '$.latest_appointment.terminal_reference'
 		  ,latest_appointment_truck_license_plate_number VARCHAR(100) '$.latest_appointment.truck_license_plate_number'
 		  ,latest_appointment_terminal_block VARCHAR(100) '$.latest_appointment.terminal_block'
 		  ,latest_appointment_observed DATETIME2(7) '$.latest_appointment.observed'
 		 , latest_appointment_last_observed DATETIME2(7) '$.latest_appointment.last_observed'
 		 , latest_appointment_created_at_terminal DATETIME2(7) '$.latest_appointment.created_at_terminal'
 		 , latest_appointment_source VARCHAR(100) '$.latest_appointment.source'
 		 , latest_appointment_type VARCHAR(100) '$.latest_appointment.extra_data.type'
 		 , latest_appointment_voyage VARCHAR(100) '$.latest_appointment.extra_data.voyage'
 		 , latest_appointment_shipping_line VARCHAR(100) '$.latest_appointment.extra_data.shipping_line'
 		 , latest_appointment_container_type VARCHAR(100) '$.latest_appointment.extra_data.container_type'
 		 , latest_appointment_truck_visit_id VARCHAR(100) '$.latest_appointment.extra_data.truck_visit_id'
 		 , latest_appointment_terminal_status VARCHAR(100) '$.latest_appointment.extra_data.terminal_status'
) Jd

			WHERE T.DataSource = 'draydog'
    AND T.TerminalDataType = 'container'
AND Jd.container_number IS NOT NULL
GO


