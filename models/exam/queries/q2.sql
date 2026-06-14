-- Q2
-- Donnez les morceaux produits en 2000 ou en 2002.

{{ config(materialized='view',tags=['queries']) }}

SELECT
    track_name
FROM {{ ref('fact_track') }}
WHERE prod_year IN (2000, 2002)