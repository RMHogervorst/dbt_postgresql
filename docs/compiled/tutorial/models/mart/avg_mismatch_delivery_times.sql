WITH
delivery_info AS (
  SELECT * FROM "tutorial"."dbt_tutorial"."stg_delivery_mismatch"
),
state_map AS (
  SELECT * FROM "tutorial"."dbt_tutorial"."stg_state"
),
delivery_average  AS (
  SELECT
  customer_st,
  AVG(delivery_prediction_mismatch_minutes) as avg_mismatch_minutes,
  stddev_samp(delivery_prediction_mismatch_minutes) as stdev_mismatch_minutes,
  MIN(delivery_prediction_mismatch_minutes) as min_mismatch_minutes,
  MAX(delivery_prediction_mismatch_minutes) as max_mismatch_minutes,
  count(*) AS N_orders
  FROM delivery_info
  GROUP BY customer_st
)

SELECT
state_name,
N_orders,
avg_mismatch_minutes,
stdev_mismatch_minutes,
min_mismatch_minutes,
max_mismatch_minutes
FROM delivery_average INNER JOIN state_map
  ON delivery_average.customer_st = state_map.st
ORDER BY avg_mismatch_minutes DESC