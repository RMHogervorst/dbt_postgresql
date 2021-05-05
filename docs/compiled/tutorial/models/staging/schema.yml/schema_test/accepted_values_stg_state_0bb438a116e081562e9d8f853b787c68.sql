
    
    




with all_values as (

    select distinct
        st as value_field

    from "tutorial"."dbt_tutorial"."stg_state"

),

validation_errors as (

    select
        value_field

    from all_values
    where value_field not in (
        'AC','AL','AP','AM','BA','CE','DF','ES','GO','MA','MT','MS','MG','PA','PB','PR','PE','PI','RJ','RN','RS','RO','RR','SC','SP','SE','TO'
    )
)

select count(*) as validation_errors
from validation_errors


