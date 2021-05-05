
  create view "tutorial"."dbt_tutorial"."stg_customer__dbt_tmp" as (
    WITH source AS (
  SELECT * FROM "tutorial"."dbt_tutorial"."customer"
),

stage_customer AS (
  SELECT
    customer_order_id,
    customer_unique_id,
    customer_zip_code_prefix,
    customer_city,
    customer_st
  FROM source
)

SELECT
*
FROM stage_customer
  );
