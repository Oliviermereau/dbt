Select order_id, customer_id, amount
from `dbt-tutorial`.stripe.payment as payments left join {{ref('stg_orders')}} as orders
on payments.orderid=orders.order_id