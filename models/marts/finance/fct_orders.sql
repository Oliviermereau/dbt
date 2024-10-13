select order_id, customer_id, case when payments.status = 'success' then amount/100 end as amount
from `dbt-tutorial`.stripe.payment as payments
left join {{ ref("stg_orders") }} as orders on payments.orderid = orders.order_id
