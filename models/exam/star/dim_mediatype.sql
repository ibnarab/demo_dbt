{{ config(materialized='table', tags=['star']) }}

SELECT
    MediaTypeId AS mediatype_key,
    Name        AS mediatype_name
FROM {{ source('music', 'MEDIATYPE') }}