
    
    



select count(*) as validation_errors
from (

    select
        customer_order_id

    from "tutorial"."dbt_tutorial"."stg_orders"
    where customer_order_id is not null
    group by customer_order_id
    having count(*) > 1

) validation_errors


