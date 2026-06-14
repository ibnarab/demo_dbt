-- Q11
-- Donnez les playlists où figurent des morceaux d'artistes nés avant 1990.

{{ config(materialized='view',tags=['queries']) }}

SELECT DISTINCT
    p.playlist_name
FROM {{ ref('dim_playlist') }} p
JOIN {{ source('music', 'PLAYLISTTRACK') }} pt
    ON p.playlist_key = pt.PlaylistId
JOIN {{ ref('fact_track') }} f
    ON pt.TrackId = f.track_key
JOIN {{ ref('dim_artist') }} a
    ON f.artist_key = a.artist_key
WHERE a.artist_birthyear < 1990