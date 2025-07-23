use master;
GO


-- check if database datawarehouse exists, drop it if yes
IF EXISTS (SELECT name from sys.databases where name = N'DataWarehouse')
Begin
	DROP DATABASE DataWarehouse;
END
GO


-- CREATE NEW DATABASE
create database DataWarehouse;
GO

-- SWITCH CONTEXT TO THE NEW DB
use DataWarehouse;
GO

-- create schemas TO ORGANIZE DATA LAYERS
create schema bronze;
GO
create schema silver;
GO
create schema gold;
GO
