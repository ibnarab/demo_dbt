{{ config(materialized='table', tags=['star']) }}

SELECT
    AlbumId   AS album_key,
    Title     AS album_title,
    ArtistId  AS artist_key,
    Prod_year AS album_prod_year,
    Cd_year   AS album_cd_year
FROM {{ source('music', 'ALBUM') }}