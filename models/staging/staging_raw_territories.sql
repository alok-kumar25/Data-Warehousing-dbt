WITH source AS(
    SELECT
        *
    FROM
        {{ source('raw', 'territories') }}
),

renamed AS(
    SELECT
        territory_id, 
        territory_description, 
        region_id
    FROM 
        source
)

SELECT * FROM renamed