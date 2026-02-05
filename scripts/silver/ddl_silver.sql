/*
=================================================================
DDL Script: Create silver tables
=================================================================
Script purpose:
This script create 'silver'schema,dropping existing tables
if they already exist
Run this script to redefine the  the DDL structure of bronze table 
==================================================================

*/


USE DataWarehouse
GO

--IF OBJECT_ID('silver.crm_cust_info','Ú')IS NOT NULL
--	DROP TABLE silver.crm_cust_info;
DROP TABLE IF EXISTS silver.crm_cust_info;
GO

CREATE TABLE silver.crm_cust_info(
cst_id INT,
cst_key NVARCHAR(50),
cst_firstname NVARCHAR(50),
cst_lastname NVARCHAR(50),
cst_material_status NVARCHAR(50),
cst_gndr NVARCHAR(50),
cst_create_date DATE,
dwh_create_date DATETIME2 DEFAULT GETDATE()
);


--IF OBJECT_ID('silver.crm_prd_info','Ú')IS NOT NULL
--	DROP TABLE silver.crm_prd_info;
DROP TABLE IF EXISTS silver.crm_prd_info;
GO
CREATE TABLE silver.crm_prd_info(
prd_id INT,
cat_id NVARCHAR(50),
prd_key NVARCHAR(50),
prd_nm NVARCHAR(50),
prd_cost INT,
prd_line NVARCHAR(50),
prd_start_dt DATE,
prd_end_dt DATE,
dwh_create_date DATETIME2 DEFAULT GETDATE()
);

--IF OBJECT_ID('silver.crm_sls_details','Ú')IS NOT NULL
--	DROP TABLE silver.crm_sls_details;
DROP TABLE IF EXISTS silver.crm_sls_details;
GO
CREATE TABLE silver.crm_sls_details(
sls_ord_num NVARCHAR(50),
sls_prd_key NVARCHAR(50),
sls_cust_id INT,
sls_order_dt DATE,
sls_ship_dt DATE,
sls_due_dt DATE,
sls_sales INT,
sls_quantity INT,
sls_price INT,
dwh_create_date DATETIME2 DEFAULT GETDATE()
);



--IF OBJECT_ID('silver.erp_cust_az','Ú')IS NOT NULL
--	DROP TABLE silver.erp_cust_az;
DROP TABLE IF EXISTS silver.erp_cust_az;
GO
CREATE TABLE silver.erp_cust_az(
cust_cid NVARCHAR(50),
cust_bdate DATE,
cust_gen NVARCHAR(50),
dwh_create_date DATETIME2 DEFAULT GETDATE()
);


--IF OBJECT_ID('silver.erp_loc','Ú')IS NOT NULL
--	DROP TABLE silver.erp_loc;
DROP TABLE IF EXISTS silver.erp_loc;
GO
CREATE TABLE silver.erp_loc(
loc_cid NVARCHAR(50),
loc_cntry  NVARCHAR(50),
dwh_create_date DATETIME2 DEFAULT GETDATE()
);


--IF OBJECT_ID('silver.erp_px_cat','Ú')IS NOT NULL
--	DROP TABLE silver.erp_px_cat;
DROP TABLE IF EXISTS silver.erp_px_cat;
GO
CREATE TABLE silver.erp_px_cat(
px_id NVARCHAR(50),
px_cat  NVARCHAR(50),
px_subcat  NVARCHAR(50),
px_maintenance NVARCHAR(50),
dwh_create_date DATETIME2 DEFAULT GETDATE()
);




