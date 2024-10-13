with customers as (

    select * from {{ ref('stg_customers') }}

),

customer_orders as (

    select
        customer_id,

        min(order_date) as first_order_date,
        max(order_date) as most_recent_order_date,
        count(order_id) as number_of_orders,
        sum(amount) as lifetime_value
    from {{ ref('fct_orders')}}

    group by 1

),

final as (

    select
        customer_id,
        first_name,
        last_name,
        first_order_date,
        most_recent_order_date,
        coalesce(customer_orders.number_of_orders, 0) as number_of_orders,
        lifetime_value

    from customers

    left join customer_orders using (customer_id)

)

select * from final

order by customer_id
