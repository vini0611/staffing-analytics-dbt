with source as (
select * from {{ ref('raw_clients')  }}
)
, cleaned as (
select
    id as client_id,
    company_name,
    industry,
    city,
    state,
    contact_name,
    lower(contact_email) as contact_email,
    cast(contract_start_date as date) as contract_start_date,
    contract_status,
    account_manager
from source
)

select * from cleaned