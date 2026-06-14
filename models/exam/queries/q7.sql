-- Q7
-- Donnez le genre de musique le plus écouté dans les années 2000.

{{ config(materialized='view',tags=['queries']) }}

SELECT
    g.genre_name,
    COUNT(*) AS nb_tracks
FROM {{ ref('fact_track') }} f
JOIN {{ ref('dim_genre') }} g
    ON f.genre_key = g.genre_key
WHERE f.prod_year BETWEEN 2000 AND 2009
GROUP BY g.genre_key, g.genre_name
ORDER BY nb_tracks DESC
LIMIT 1