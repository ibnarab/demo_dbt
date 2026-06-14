-- Q8
-- Donnez les noms de toutes les playlists où figurent des morceaux de plus de 4 minutes.

{{ config(materialized='view',tags=['queries']) }}

SELECT DISTINCT
    p.playlist_name
FROM {{ ref('dim_playlist') }} p
JOIN {{ source('music', 'PLAYLISTTRACK') }} pt
    ON p.playlist_key = pt.PlaylistId
JOIN {{ ref('fact_track') }} f
    ON pt.TrackId = f.track_key
WHERE f.track_milliseconds > 240000