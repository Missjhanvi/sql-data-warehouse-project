USE master;
--Drop and recreate DatawWrehouse Database
IF EXISTS(SELECT 1 FROM sys.database WHERE name='DataWarehouse')
BEGIN
  ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE
  DROP DATABASE DataWarehouse;
END;
GO

CREATE DATABASE DataWarehouse;

USE DataWarehouse;

CREATE SCHEMA bronze;
GO--saperator
CREATE SCHEMA silver;
GO
CREATE SCHEMA gold;
GO
