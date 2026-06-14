{{ config(materialized='table', tags=['star']) }}

SELECT
    GenreId AS genre_key,
    Name    AS genre_name
FROM {{ source('music', 'GENRE') }}