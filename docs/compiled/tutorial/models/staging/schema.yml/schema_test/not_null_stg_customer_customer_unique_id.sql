
    
    



select count(*) as validation_errors
from "tutorial"."dbt_tutorial"."stg_customer"
where customer_unique_id is null


