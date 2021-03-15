
WITH source AS (
  SELECT
    *
  FROM {{ ref('orders') }}
),
stage_orders AS (
  SELECT
    order_id,
    customer_order_id,
    order_status,
    order_purchase_timestamp,
    order_approved_at,
    order_delivered_carrier_date,
    order_delivered_customer_date,
    order_estimated_delivery_date
  FROM source
)
SELECT
  *
FROM stage_orders
