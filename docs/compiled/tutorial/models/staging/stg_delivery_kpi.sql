WITH orders AS (
  SELECT * FROM "tutorial"."dbt_tutorial"."stg_orders"
  WHERE order_status = 'delivered'
),
delivery_KPI_precalc AS (
  SELECT
  order_id,
  order_purchase_timestamp,
  DATE_TRUNC('day', order_purchase_timestamp) AS day,
  

((extract (
  minute from (
      order_delivered_customer_date::timestamp - order_purchase_timestamp::timestamp
                       )
           )
  ))::integer
 AS complete_purchase_delivery_time_minutes,
    

((extract (
  minute from (
      order_delivered_carrier_date::timestamp - order_purchase_timestamp::timestamp
                       )
           )
  ))::integer
 AS purchase_carrier_time_minutes,
      

((extract (
  minute from (
      order_delivered_customer_date::timestamp - order_delivered_carrier_date::timestamp
                       )
           )
  ))::integer
 AS delivery_time_minutes
  FROM orders
)

SELECT * FROM delivery_KPI_precalc