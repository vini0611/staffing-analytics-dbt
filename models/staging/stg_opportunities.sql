with source as(
select * from {{ ref('raw_opportunities')  }}
)

, cleaned as (
select id as opportunity_id,    
client_id,
opportunity_name,
stage,
cast(estimated_value as decimal(10, 2)) as estimated_value,
cast(probability as decimal(10, 2)) as probability,
cast(expected_close_date as date) as expected_close_date,
cast(closed_date as date) as closed_date,
lost_reason,
owner as sales_rep,
cast(created_date as date) as created_date,
cast(estimated_value as decimal(10, 2)) * cast(probability as decimal(10, 2)) / 100 as weighted_value
from source)

select * from cleaned