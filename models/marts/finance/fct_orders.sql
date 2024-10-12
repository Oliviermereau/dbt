Select order_id, customer_id, amount
from {{ref("stg_payments")}} as payments left join {{ref('stg_orders')}} as orders
on payments.orderid=orders.order_id