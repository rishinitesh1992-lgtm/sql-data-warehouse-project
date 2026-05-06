Stored procedure: Load Bronze layer
Script Purpose: - This stored procedure loads data into the bronze schema from external CSV files.
It performs the following fx:-
-- Truncates the bronze tables before loading data.
-- Uses the Bulk Insert command to load data from CSV files to bronze tables.

Parameters: 
None.
This sp doe snot accept any parameters or return any values.
Usage Example: 
		EXEC bronze.load_bronze;

USE [Datawarehouse]
GO
/****** Object:  StoredProcedure [bronze].[load_bronze]    Script Date: 5/6/2026 4:44:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER     procedure [bronze].[load_bronze] as BEGIN
	declare @start_time datetime, @end_time datetime;
	set @start_time = GETDATE ();
	truncate table bronze.crm_cust_info
	bulk insert bronze.crm_cust_info
	from 'C:\Financial Modelling\Corporate finance fundamentals\Sql - Bootcamp\source_crm\cust_info.csv'
	with  (
	firstrow = 2,
	fieldterminator = ',',
	tablock );
	set @end_time = GETDATE ();
	print '>> Load Duration: ' + CAST(datediff(second, @start_time, @end_time) as nvarchar ) + ' seconds';


	set @start_time = GETDATE ();
	truncate table bronze.crm_prd_info
	bulk insert bronze.crm_prd_info
	from 'C:\Financial Modelling\Corporate finance fundamentals\Sql - Bootcamp\source_crm\prd_info.csv'
	with (
	firstrow = 2,
	fieldterminator = ',',
	tablock );
	set @end_time = GETDATE ();
	print '>> Load Duration: ' + CAST(datediff(second, @start_time, @end_time) as nvarchar ) + ' seconds';

	set @start_time = GETDATE ();
	truncate table bronze.crm_sales_details
	bulk insert bronze.crm_sales_details
	from 'C:\Financial Modelling\Corporate finance fundamentals\Sql - Bootcamp\source_crm\sales_details.csv'
	with (
	firstrow = 2,
	fieldterminator = ',',
	tablock );
	set @end_time = GETDATE ();
	print '>> Load Duration: ' + CAST(datediff(second, @start_time, @end_time) as nvarchar ) + ' seconds';


	set @start_time = GETDATE ();
	truncate table bronze.erp_loc_a101
	bulk insert bronze.erp_loc_a101
	from 'C:\Financial Modelling\Corporate finance fundamentals\Sql - Bootcamp\source_erp\loc_a101.csv'
	with (
	firstrow = 2,
	fieldterminator = ',',
	tablock );
	set @end_time = GETDATE ();
	print '>> Load Duration: ' + CAST(datediff(second, @start_time, @end_time) as nvarchar ) + ' seconds';


	set @start_time = GETDATE ();
	truncate table bronze.erp_px_cat_g1v2
	bulk insert bronze.erp_px_cat_g1v2
	from 'C:\Financial Modelling\Corporate finance fundamentals\Sql - Bootcamp\source_erp\px_cat_g1v2.csv'
	with (
	firstrow = 2,
	fieldterminator = ',',
	tablock );
	set @end_time = GETDATE ();
	print '>> Load Duration: ' + CAST(datediff(second, @start_time, @end_time) as nvarchar ) + ' seconds';

	
	set @start_time = GETDATE ();
	truncate table bronze.erp_cust_az12
	bulk insert bronze.erp_cust_az12
	from 'C:\Financial Modelling\Corporate finance fundamentals\Sql - Bootcamp\source_erp\cust_az12.csv'
	with (
	firstrow = 2,
	fieldterminator = ',',
	tablock );
	set @end_time = GETDATE ();
	print '>> Load Duration: ' + CAST(datediff(second, @start_time, @end_time) as nvarchar ) + ' seconds';END
