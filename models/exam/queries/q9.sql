-- Q9
-- Donnez les morceaux de Rock dont les artistes sont en France.

{{ config(materialized='view',tags=['queries']) }}

SELECT
    f.track_name
FROM {{ ref('fact_track') }} f
JOIN {{ ref('dim_genre') }} g
    ON f.genre_key = g.genre_key
JOIN {{ ref('dim_artist') }} a
    ON f.artist_key = a.artist_key
WHERE g.genre_name = 'Rock'
  AND a.artist_country = 'France'