WITH orders AS (
  SELECT * FROM {{ ref('stg_orders')}}
),
customer AS (
  SELECT * FROM {{ ref('stg_customer')}}
),
delivery_info AS(
  SELECT
  customer_st,
  {{ datetime_diff(
    'order_delivered_customer_date',
    'order_estimated_delivery_date',
    'minute')}} AS delivery_prediction_mismatch_minutes
  FROM orders
  INNER JOIN customer ON orders.customer_order_id = customer.customer_order_id
)
SELECT * FROM delivery_info
