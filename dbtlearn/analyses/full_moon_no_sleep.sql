WITH mart_fullmoon_reviews AS (
 SELECT * FROM {{ ref('mart_fullmoon_reviews') }}
)
SELECT
 is_fullmoon,
 review_sentiment,
 COUNT(*) as reviews
FROM
 mart_fullmoon_reviews
GROUP BY
 is_fullmoon,
 review_sentiment
ORDER BY
 is_fullmoon,
 review_sentiment