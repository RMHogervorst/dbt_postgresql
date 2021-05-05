
    
    



select count(*) as validation_errors
from "tutorial"."dbt_tutorial"."customer_orders"
where customer_unique_id is null


