with candidates as (
    select
    candidate_id,
    full_name,
    email,
    skill_set,
    years_experience,availability_status,
    city,
    state
    from {{ ref('stg_candidates') }}
)
, placements as (
    select
    candidate_id,
    placement_id,
    bill_rate,
    start_date,
    status
    from {{ ref('stg_placements') }}
)

, final as(
    select c.candidate_id, 
    c.full_name,
     c.email, 
     c.skill_set,
    c.years_experience,
    c.availability_status, 
    c.city, c.state, 
    count(p.placement_id) as total_placements,
    sum(case when p.status = 'active' then 1 else 0 end) as active_placements,
    sum(bill_rate) as total_bill_rate,
    max(start_date) as most_recent_placement_date
    from candidates c
    left join placements p on c.candidate_id = p.candidate_id
    group by c.candidate_id, c.full_name, c.email, c.skill_set, 
    c.years_experience, c.availability_status, c.city, c.state
)

select * from final