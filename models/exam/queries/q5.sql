-- Q5
-- Donnez le nombre d'albums produits pour chaque artiste.

{{ config(materialized='view',tags=['queries']) }}

SELECT
    ar.artist_name,
    COUNT(DISTINCT al.album_key) AS nb_albums
FROM {{ ref('dim_artist') }} ar
LEFT JOIN {{ ref('dim_album') }} al
    ON ar.artist_key = al.artist_key
GROUP BY ar.artist_key, ar.artist_name
ORDER BY nb_albums DESC