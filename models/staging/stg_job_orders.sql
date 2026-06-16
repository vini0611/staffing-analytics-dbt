with source as(
    select * from {{ref('raw_job_orders')  }}
)
, cleaned as (
select 
    id as job_order_id,
    client_id,
    title as job_title,
    skill_required,
    city,
    state,
    employment_type,
    cast(bill_rate as decimal(10, 2)) as bill_rate,
    cast(pay_rate as decimal(10, 2)) as pay_rate,
    openings,
    status,
    cast(opened_date as date) as open_date,
    cast(filled_date as date) as filled_date
    from source)

select * from cleaned