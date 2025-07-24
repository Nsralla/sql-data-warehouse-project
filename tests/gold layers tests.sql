SELECT distinct gender FROM gold.dim_customers;

SELECT * FROM gold.dim_products;
SELECT * FROM gold.dim_customers;
SELECT * FROM gold.fact_sales;



-- FOREIGN KEY INTEGRATION
SELECT * FROM
gold.fact_sales fs
	left join gold.dim_customers dc on dc.customer_id = fs.customer_id
	where fs.customer_id is null;









	


SELECT cst_id, COUNT(*)
FROM (

SELECT distinct [cst_id]
      ,[cst_key]
      ,[cst_firstname]
      ,[cst_lastname]
      ,[cst_material_status]
      ,[cst_gndr]
      ,[cst_create_date]
      ,ca.bdate
      ,ca.gen
      ,la.cntry
  FROM [DataWarehouse].[silver].[crm_cust_info]
  LEFT JOIN silver.erp_cust_az12 ca
  on cst_key = cid
  LEFT JOIN silver.erp_loc_a101 la
  on cst_key = la.cid) T
  GROUP BY cst_id 
  having COUNT(*) > 1;

  -- CHECK FOR DUPLICATES ROWS







SELECT distinct
      [cst_gndr]
      ,ca.gen
  FROM [DataWarehouse].[silver].[crm_cust_info]
  LEFT JOIN silver.erp_cust_az12 ca
  on cst_key = cid
  order by 1,2
;



select cst_gndr, gen,
    CASE
        when cst_gndr in ('Female', 'Male') and gen = 'n/a' then cst_gndr 
        when gen in ('Female', 'Male') and cst_gndr = 'n/a' then gen  
        when cst_gndr = 'n/a' and gen is null then 'n/a'
        else cst_gndr
    END new_gen
from   [DataWarehouse].[silver].[crm_cust_info]
  LEFT JOIN silver.erp_cust_az12 ca
  on cst_key = cid;







