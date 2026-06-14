with pop as (
    select * from {{ source('tpch', 'CUSTOMER') }}
),

final as (
    select * from pop
)

select * from final