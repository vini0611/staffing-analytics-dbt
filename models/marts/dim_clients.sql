with clients as (
    select client_id, company_name as client_name, industry,city, state, 
    contract_status,account_manager
    from {{ref('stg_clients')}}
)
,
placements as (
    select client_id, placement_id, bill_rate, status
    from {{ref('stg_placements')}}
)
,
opportunities as (
    select client_id, opportunity_id, weighted_value, stage
    from {{ref('stg_opportunities')}}
)

select c.*, count(distinct p.placement_id) as total_placements,
sum(case when p.status = 'active' then 1 else 0 end) as active_placements,
coalesce(sum(p.bill_rate), 0) as total_revenue,
sum(case when o.stage not in ('closed_won','closed_lost') then o.weighted_value else 0 end) as open_pipeline_value
from clients c
left join placements p on c.client_id = p.client_id
left join opportunities o on c.client_id = o.client_id
group by c.client_id, c.client_name, c.industry, c.city, c.state, c.contract_status, c.account_manager