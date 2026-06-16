with source as (
select * from {{ ref('raw_placements')  }}
)
, cleaned as (
select id as placement_id,
    candidate_id,
    job_order_id,
    client_id,
    cast(start_date as date) as start_date,
    cast(end_date as date) as end_date,
    placement_type,
    cast(bill_rate as decimal(10, 2)) as bill_rate,
    cast(pay_rate as decimal(10, 2)) as pay_rate,
    status,    cast(bill_rate as decimal(10, 2)) - cast(pay_rate as decimal(10, 2)) as margin_per_hour
from source
)
select * from cleaned