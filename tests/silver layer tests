SELECT   [cid]
      ,[bdate]
      ,[gen]
  FROM [DataWarehouse].[bronze].[erp_cust_az12];


select * from bronze.crm_cust_info;


select bdate 
from [DataWarehouse].[silver].[erp_cust_az12] 
where bdate > GETDATE();

select distinct gen 
from[DataWarehouse].[silver].[erp_cust_az12] ;



-- CHECK FOR NULLS OR DUPLICATES IN PRIMARY KEY, cst_info table
select cst_id, count(*)
from silver.crm_cust_info
group by cst_id
having count(*) > 1 OR cst_id is null;


-- check for unwanted spaces in string columns (fname, lastname, material status, gndr)
SELECT cst_firstname
from silver.crm_cust_info
where cst_firstname != TRIM(cst_firstname);

SELECT cst_lastname
from silver.crm_cust_info
where cst_lastname != TRIM(cst_lastname);


SELECT cst_gndr
from silver.crm_cust_info
where cst_gndr != TRIM(cst_gndr);


-- check status, gndr
-- check data consistency

select distinct cst_gndr 
from silver.crm_cust_info;

SELECT distinct cst_material_status
from silver.crm_cust_info;

-- check cst_create_date column

SELECT cst_create_date
from silver.crm_cust_info;
-- -------------------------------------------

-- prd_info table
SELECT  [prd_id]
      ,[prd_key]
      ,[prd_nm]
      ,[prd_cost]
      ,[prd_line]
      ,[prd_start_dt]
      ,[prd_end_dt]
  FROM [DataWarehouse].[bronze].[crm_prd_info];


-- check for null or duplicates at PK
SELECT prd_id, count(*)
from  [DataWarehouse].[bronze].[crm_prd_info]
group by prd_id
having count(*) > 1 or prd_id is null;
-- output : null

-- check prd_key, we need to split it, and take the first 5 chars, category id (first five chars)




-- now check for prd_nm, if it has unwanted spaces
select prd_nm 
from bronze.crm_prd_info
where prd_nm != TRIM(prd_nm);
-- all good


-- check prd_cost for null or negative numbers

select prd_cost 
from bronze.crm_prd_info
where prd_cost < 0 or prd_cost is null;

-- only null values


-- move to prd_line
select distinct prd_line
from bronze.crm_prd_info;

-- check for end date < start_date

select *
from bronze.crm_prd_info
where prd_end_dt < prd_start_dt;

SELECT  [prd_id]
      ,[prd_key]
      ,[prd_nm]
      ,[prd_cost]
      ,[prd_line]
      ,[prd_start_dt]
      , lead(prd_start_dt) over(PARTITION BY prd_key order by prd_start_dt asc)-1 as prd_end_dt
  FROM [DataWarehouse].[bronze].[crm_prd_info]
  where prd_key in ('AC-HE-HL-U509-R', 'AC-HE-HL-U509');


  -- CHECK FOR NULLS OR DUPLICATES IN PRIMARY KEY
select cst_id, count(*)
from bronze.crm_cust_info
group by cst_id
having count(*) > 1 OR cst_id is null;


-- check for unwanted spaces in string columns (fname, lastname, material status, gndr)
SELECT cst_firstname
from bronze.crm_cust_info
where cst_firstname != TRIM(cst_firstname);

SELECT cst_lastname
from bronze.crm_cust_info
where cst_lastname != TRIM(cst_lastname);


SELECT cst_gndr
from bronze.crm_cust_info
where cst_gndr != TRIM(cst_gndr);


-- check status, gndr
-- check data consistency

select distinct cst_gndr 
from bronze.crm_cust_info;

SELECT distinct cst_material_status
from bronze.crm_cust_info;

-- check cst_create_date column

SELECT cst_create_date
from bronze.crm_cust_info;






-- validatin bronze.sales_details
SELECT TOP (1000) [sls_ord_num]
      ,[sls_prd_key]
      ,[sls_cust_id]
      ,[sls_ord_dt]
      ,[sls_ship_dt]
      ,[sls_due_dt]
      ,[sls_sales]
      ,[sls_quantity]
      ,[sls_price]
  FROM [DataWarehouse].[bronze].[crm_sales_details];

  select sls_ord_dt
  from  [DataWarehouse].[bronze].[crm_sales_details]
  where sls_ord_dt = 0 or LEN(sls_ord_dt) != 8;

  
  select sls_ship_dt
  from  [DataWarehouse].[bronze].[crm_sales_details]
  where sls_ship_dt = 0 or LEN(sls_ship_dt) != 8;


  -- check if order date is earlier than shipping date or due date
  select *
  from bronze.crm_sales_details
  where sls_ord_dt > sls_ship_dt or sls_ord_dt > sls_due_dt;

  -- check if sales = quantity * price
  select sls_sales ,sls_quantity, sls_price
  from bronze.crm_sales_details
  where (sls_sales <> sls_quantity * sls_price)     or
  sls_sales is null or sls_quantity is null or sls_price is null
  order by sls_sales, sls_quantity, sls_price;
  -- there must be no nrgative, zeros, nulls




SELECT  [id]
      ,[cat]
      ,[subcat]
      ,[maintenance]
  FROM [DataWarehouse].[bronze].[erp_px_cat_g1v2];

  select cat_id from silver.crm_prd_info ;





  select id 
  from 
  [DataWarehouse].[bronze].[erp_px_cat_g1v2]
  group by id 
  having count(*) > 1 ;

  select id from   [DataWarehouse].[bronze].[erp_px_cat_g1v2]
 where id is null;


 SELECT  [id]
      ,[cat]
      
  FROM [DataWarehouse].[bronze].[erp_px_cat_g1v2]
  where cat != TRIM(cat);

  SELECT  [id]
      ,[cat]
      ,[subcat]
      ,[maintenance]
  FROM [DataWarehouse].[bronze].[erp_px_cat_g1v2]
where id not in (select cat_id from silver.crm_prd_info);
