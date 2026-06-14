-- Q6
-- Donnez le nombre de morceaux produits par chaque artiste.

{{ config(materialized='view',tags=['queries']) }}

SELECT
    ar.artist_name,
    COUNT(f.track_key) AS nb_tracks
FROM {{ ref('dim_artist') }} ar
LEFT JOIN {{ ref('fact_track') }} f
    ON ar.artist_key = f.artist_key
GROUP BY ar.artist_key, ar.artist_name
ORDER BY nb_tracks DESC