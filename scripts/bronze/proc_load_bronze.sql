USE DataWarehouse;
GO
EXEC bronze.load_bronze;
GO
CREATE OR ALTER PROCEDURE bronze.load_bronze AS
BEGIN
	DECLARE @start_time DATETIME,@end_time DATETIME;
	BEGIN TRY
		PRINT'===========================================';;
		PRINT'Loading Bronze Layer';
		PRINT'==========================================='

		PRINT'-------------------------------------------';
		PRINT'Loading CRM Tables';
		PRINT'-------------------------------------------';
		
		SET @start_time = GETDATE();
		PRINT'>>Truncating Table :bronze.crm_cust_info';
		TRUNCATE TABLE bronze.crm_cust_info;
		
		PRINT'>>Inserting data into:bronze.crm_cust_info';
		BULK INSERT bronze.crm_cust_info
		FROM 'A:\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
		WITH(
		FIRSTROW=2,
		FIELDTERMINATOR=',',
		TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT'>>Load Duration '+CAST(DATEDIFF(second,@start_time,@end_time)AS NVARCHAR)+'seconds';


		PRINT'>>Truncating Table :bronze.crm_prd_info';
		TRUNCATE TABLE bronze.crm_prd_info

		PRINT'>>Inserting data into:bronze.crm_prd_info';
		BULK INSERT bronze.crm_prd_info
		FROM 'A:\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
		WITH(
		FIRSTROW=2,
		FIELDTERMINATOR=',',
		TABLOCK
		);


		PRINT'>>Truncating Table :bronze.crm_sls_details';
		TRUNCATE TABLE bronze.crm_sls_details

		PRINT'>>Inserting data into:bronze.crm_sls_details';
		BULK INSERT bronze.crm_sls_details
		FROM 'A:\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
		WITH(
		FIRSTROW=2,
		FIELDTERMINATOR=',',
		TABLOCK
		);

		PRINT'-------------------------------------------';
		PRINT'Loading ERP Tables';
		PRINT'-------------------------------------------';

		PRINT'>>Truncating Table :bronze.erp_cust_az';
		TRUNCATE TABLE bronze.erp_cust_az

		PRINT'>>Inserting data into :bronze.erp_cust_az';
		BULK INSERT bronze.erp_cust_az
		FROM 'A:\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\CUST_AZ12.csv'
		WITH(
		FIRSTROW=2,
		FIELDTERMINATOR=',',
		TABLOCK
		);


		PRINT'>>Truncating Table :bronze.erp_loc';
		TRUNCATE TABLE bronze.erp_loc

		PRINT'>>Inserting data into :bronze.erp_loc';
		BULK INSERT bronze.erp_loc
		FROM 'A:\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\LOC_A101.csv'
		WITH(
		FIRSTROW=2,
		FIELDTERMINATOR=',',
		TABLOCK
		);

	
		PRINT'>>Truncating Table :bronze.erp_px_cat';
		TRUNCATE TABLE bronze.erp_px_cat

		PRINT'>>Inserting data into :bronze.erp_px_cat';
		BULK INSERT bronze.erp_px_cat
		FROM 'A:\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\PX_CAT_G1V2.csv'
		WITH(
		FIRSTROW=2,
		FIELDTERMINATOR=',',
		TABLOCK
		);
	END TRY
	BEGIN CATCH
		PRINT'=========================================';
		PRINT'ERROR OCCURE WHEN LOADING BRONZE LAYER';
		PRINT'ERROR MESSAGE'+ERROR_MESSAGE();
		PRINT'ERROR MESSAGE'+CAST(ERROR_NUMBER()AS NVARCHAR);
		PRINT'=========================================';
	END CATCH

END




