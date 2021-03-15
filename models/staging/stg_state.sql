
WITH source AS (
  SELECT
  *
  FROM {{ ref('state')}}
),
stage_state AS (
  SELECT
    st,
    state_name
  FROM source
)
SELECT
*
FROM stage_state
