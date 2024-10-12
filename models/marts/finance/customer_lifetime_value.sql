Select customer_id, sum (amount) as amount
from {{ref("fct_orders")}}
group by customer_id