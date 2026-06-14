-- Q1
-- Donnez les titres des albums qui ont plus de 1 CD.

{{ config(materialized='view',tags=['queries']) }}

SELECT
    album_title
FROM {{ ref('dim_album') }}
WHERE album_cd_year IS NOT NULL
GROUP BY album_key, album_title
HAVING COUNT(album_cd_year) > 1