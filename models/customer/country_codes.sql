WITH country_codes as (
    select * from {{ ref('country_code') }}
)

select * from country_codes