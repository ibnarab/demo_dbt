{{ config(materialized='table', tags=['star']) }}

SELECT
    t.TrackId         AS track_key,
    t.Name            AS track_name,
    t.Composer        AS track_composer,
    t.Milliseconds    AS track_milliseconds,
    t.Bytes           AS track_bytes,
    t.UnitPrice       AS track_unit_price,
    t.AlbumId         AS album_key,
    t.GenreId         AS genre_key,
    t.MediaTypeId     AS mediatype_key,
    al.ArtistId       AS artist_key,
    al.Prod_year      AS prod_year,
    al.Cd_year        AS cd_year
FROM {{ source('music', 'TRACK') }} t
JOIN {{ source('music', 'ALBUM') }} al
  ON t.AlbumId = al.AlbumId
  WHERE al.Cd_year IS NOT NULL