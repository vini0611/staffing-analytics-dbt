with placements as (
select *
    from {{ ref('stg_placements') }}
),
candidates as (
select *
    from {{ ref('stg_candidates') }} )
,
job_orders as (
select *
    from {{ ref('stg_job_orders') }} )
,clients as (
select *
    from {{ ref('stg_clients') }} )
,final as (
select p.placement_id,p.start_date,p.end_date,p.placement_type,p.bill_rate,p.pay_rate,
p.margin_per_hour,p.status,c.full_name as candidate_name,
c.skill_set, cl.company_name as client_name,j.job_title
    from placements p
    left join candidates c on p.candidate_id = c.candidate_id
    left join clients cl on p.client_id = cl.client_id
    left join job_orders j on p.job_order_id = j.job_order_id)

select * from final