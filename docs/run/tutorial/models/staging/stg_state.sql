
  create view "tutorial"."dbt_tutorial"."stg_state__dbt_tmp" as (
    WITH source AS (
  SELECT
  *
  FROM "tutorial"."dbt_tutorial"."state"
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
  );
