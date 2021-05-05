
    
    



select count(*) as validation_errors
from "tutorial"."dbt_tutorial"."stg_orders"
where order_id is null


