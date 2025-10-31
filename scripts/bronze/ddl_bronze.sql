USE DataWarehouse

IF OBJECT_ID('bronze.crm_cust_info','Ú')IS NOT NULL
	DROP TABLE bronze.crm_cust_info;
CREATE TABLE bronze.crm_cust_info(
cst_id INT,
cst_key NVARCHAR(50),
cst_firstname NVARCHAR(50),
cst_lastname NVARCHAR(50),
cst_material_status NVARCHAR(50),
cst_gndr NVARCHAR(50),
cst_create_date DATE
);


IF OBJECT_ID('bronze.crm_prd_info','Ú')IS NOT NULL
	DROP TABLE bronze.crm_prd_info;
CREATE TABLE bronze.crm_prd_info(
prd_id INT,
prd_key NVARCHAR(50),
prd_nm NVARCHAR(50),
prd_cost INT,
prd_line NVARCHAR(50),
prd_start_dt DATE,
prd_end_dt DATE
);

IF OBJECT_ID('bronze.crm_sls_details','Ú')IS NOT NULL
	DROP TABLE bronze.crm_sls_details;
CREATE TABLE bronze.crm_sls_details(
sls_ord_num NVARCHAR(50),
sls_prd_key NVARCHAR(50),
sls_cust_id INT,
sls_order_dt INT,
sls_ship_dt INT,
sls_due_dt INT,
sls_sales INT,
sls_quantity INT,
sls_price INT
);



IF OBJECT_ID('bronze.erp_cust_az','Ú')IS NOT NULL
	DROP TABLE bronze.erp_cust_az;
CREATE TABLE bronze.erp_cust_az(
cust_cid NVARCHAR(50),
cust_bdate DATE,
cust_gen NVARCHAR(50),
);


IF OBJECT_ID('bronze.erp_loc','Ú')IS NOT NULL
	DROP TABLE bronze.erp_loc;
CREATE TABLE bronze.erp_loc(
loc_cid NVARCHAR(50),
loc_cntry  NVARCHAR(50),
);


IF OBJECT_ID('bronze.erp_px_cat','Ú')IS NOT NULL
	DROP TABLE bronze.erp_px_cat;
CREATE TABLE bronze.erp_px_cat(
px_id NVARCHAR(50),
px_cat  NVARCHAR(50),
px_subcat  NVARCHAR(50),
px_maintenance NVARCHAR(50)
);
