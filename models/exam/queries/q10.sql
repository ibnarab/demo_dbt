-- Q10
-- Donnez la moyenne des tailles des morceaux par genre musical.

{{ config(materialized='view',tags=['queries']) }}

SELECT
    g.genre_name,
    AVG(f.track_bytes) AS avg_size_bytes
FROM {{ ref('fact_track') }} f
JOIN {{ ref('dim_genre') }} g
    ON f.genre_key = g.genre_key
GROUP BY g.genre_key, g.genre_name
ORDER BY avg_size_bytes DESC