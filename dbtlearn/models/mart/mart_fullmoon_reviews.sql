{{
    config(
        materialized = 'table'
    )
}}

with fct_reviews as (select * from {{ref('fct_reviews')}}),

fullmoon as (select * from {{ref('seed_full_moon_dates')}})

select 
    r.*,
    f.full_moon_date,
    case when f.full_moon_date is null then 'not fullmoon' else 'fullmoon' end as is_fullmoon,
from fct_reviews r
left join fullmoon f
on (r.review_date = dateadd(day, 1, full_moon_date))
