-- Q3
-- Donnez les titres et les compositeurs des morceaux du genre 'Rock' ou 'Jazz'.

{{ config(materialized='view',tags=['queries']) }}

SELECT
    f.track_name,
    f.track_composer
FROM {{ ref('fact_track') }} f
JOIN {{ ref('dim_genre') }} g
    ON f.genre_key = g.genre_key
WHERE g.genre_name IN ('Rock', 'Jazz')