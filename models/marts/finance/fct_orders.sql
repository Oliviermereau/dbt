with
    orders as (select * from {{ ref("stg_orders") }}),

    order_payments as (
        select
            order_id,
            sum(case when stg_payments.status = 'success' then amount end) as amount
        from {{ ref("stg_payments") }}
        group by 1
    ),

    final as (
        select order_id, customer_id, order_date, amount

        from orders

        left join order_payments using (order_id)
    )
select *
from final
