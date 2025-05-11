with l as (select * from {{ref("dim_listings_cleansed")}}),
r as (select * from {{ref("src_reviews")}})

select 
    l.listing_id,
    l.listing_name,
    l.listing_url,
    l.created_at,
    r.review_date
from l
join r on (l.listing_id = r.listing_id)
where date(review_date) < date(created_at)
