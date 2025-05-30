with l as (select * from {{ ref('dim_listings_cleansed') }}),
h as (select * from {{ ref("dim_hosts_cleansed")}})

select
    l.listing_id,
    l.host_id,
    l.listing_name,
    l.listing_url,
    l.room_type,
    l.minimum_nights,
    l.price,
    h.host_name,
    h.is_superhost as host_is_superhost,
    l.created_at,
    GREATEST(l.updated_at, h.updated_at) as updated_at
from l 
left join h on (l.host_id = h.host_id)
