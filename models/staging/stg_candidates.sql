with source as(
select * from {{ ref('raw_candidates')  }}
)
, cleaned as (
select
    id as candidate_id,
    concat(first_name, ' ', last_name) as full_name,
    lower(email) as email,
    phone,
    city,
    state,
    skill_set,
    years_experience,
    availability_status,
    cast(created_date as date) as created_date
from source)

select * from cleaned
