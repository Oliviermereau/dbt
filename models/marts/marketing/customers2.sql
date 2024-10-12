select
    customer_id,
    first_name,
    last_name,
    first_order_date,
    most_recent_order_date,
    number_of_orders,
    amount
from {{ref("customers")}}
left join {{ref('customer_lifetime_value')}} using (customer_id)
order by customer_id