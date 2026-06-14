{{ config(materialized='table', tags=['star']) }}

SELECT
    ArtistId   AS artist_key,
    Name       AS artist_name,
    Birthyear  AS artist_birthyear,
    Country    AS artist_country
FROM {{ source('music', 'ARTIST') }}