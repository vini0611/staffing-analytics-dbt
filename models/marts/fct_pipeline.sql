with opportunity as (
   select opportunity_id,
   opportunity_name,
   stage,
   estimated_value,
   probability,
   weighted_value,
   expected_close_date,
   closed_date,
   lost_reason,
   sales_rep,
   client_id
   from {{ ref('stg_opportunities') }}
)
, 
clients as (
   select company_name as client_name ,
   industry,
   client_id
   from {{ ref('stg_clients') }}
)

, pipeline as(
    select o.*, c.client_name, c.industry
    from opportunity o
    left join clients c on o.client_id = c.client_id
)

select * from pipeline