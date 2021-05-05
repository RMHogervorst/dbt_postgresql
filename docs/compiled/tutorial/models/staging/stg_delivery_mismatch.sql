WITH orders AS (
  SELECT * FROM "tutorial"."dbt_tutorial"."stg_orders"
),
customer AS (
  SELECT * FROM "tutorial"."dbt_tutorial"."stg_customer"
),
delivery_info AS(
  SELECT
  customer_st,
  

((extract (
  minute from (
      order_delivered_customer_date::timestamp - order_estimated_delivery_date::timestamp
                       )
           )
  ))::integer
 AS delivery_prediction_mismatch_minutes
  FROM orders
  INNER JOIN customer ON orders.customer_order_id = customer.customer_order_id
)
SELECT * FROM delivery_info