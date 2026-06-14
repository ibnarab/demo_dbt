{{ config(materialized='table', tags=['star']) }}

SELECT
    PlaylistId AS playlist_key,
    Name       AS playlist_name
FROM {{ source('music', 'PLAYLIST') }}