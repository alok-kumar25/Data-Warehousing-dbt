WITH source AS(
    SELECT
        *
    FROM
        {{ source('raw', 'region') }}
),

renamed AS(
    SELECT
        region_id, 
        region_description
    FROM 
        source
)

SELECT * FROM renamed