WITH orders AS (
  SELECT * FROM {{ ref('stg_orders')}}
  WHERE order_status = 'delivered'
),
delivery_KPI_precalc AS (
  SELECT
  order_id,
  order_purchase_timestamp,
  DATE_TRUNC('day', order_purchase_timestamp) AS day,
  {{ datetime_diff(
    'order_delivered_customer_date',
    'order_purchase_timestamp', 'minute') }} AS complete_purchase_delivery_time_minutes,
    {{ datetime_diff(
      'order_delivered_carrier_date',
      'order_purchase_timestamp', 'minute') }} AS purchase_carrier_time_minutes,
      {{ datetime_diff(
        'order_delivered_customer_date',
        'order_delivered_carrier_date', 'minute') }} AS delivery_time_minutes
  FROM orders
)

SELECT * FROM delivery_KPI_precalc
