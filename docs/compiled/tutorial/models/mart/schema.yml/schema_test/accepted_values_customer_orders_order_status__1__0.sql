
    
    




with all_values as (

    select distinct
        order_status as value_field

    from "tutorial"."dbt_tutorial"."customer_orders"

),

validation_errors as (

    select
        value_field

    from all_values
    where value_field not in (
        '1','0'
    )
)

select count(*) as validation_errors
from validation_errors


