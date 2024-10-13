select
  customer_id, status
from {{ ref('stg_customers') }} left join {{ ref('stg_orders') }} using (customer_id)
where status != "return_pending"