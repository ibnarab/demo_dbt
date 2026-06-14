-- Q4
-- Donnez les 10 albums les plus longs.

{{ config(materialized='view',tags=['queries']) }}

SELECT
    a.album_title,
    SUM(f.track_milliseconds) AS total_duration_ms
FROM {{ ref('fact_track') }} f
JOIN {{ ref('dim_album') }} a
    ON f.album_key = a.album_key
GROUP BY a.album_key, a.album_title
ORDER BY total_duration_ms DESC
LIMIT 10