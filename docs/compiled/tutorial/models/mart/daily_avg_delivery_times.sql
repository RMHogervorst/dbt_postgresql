WITH
delivery_KPI_precalc AS (
    SELECT *
    from "tutorial"."dbt_tutorial"."stg_delivery_kpi"
),
daily_aggregate AS (
  SELECT
  day,
  AVG(complete_purchase_delivery_time_minutes) AS avg_complete_purchase_delivery_time_minutes,
  AVG(purchase_carrier_time_minutes) AS avg_purchase_carrier_time_minutes,
  AVG(delivery_time_minutes) AS avg_delivery_time_minutes
  FROM delivery_KPI_precalc
  GROUP BY day
)
SELECT * FROM daily_aggregate
ORDER BY day DESC