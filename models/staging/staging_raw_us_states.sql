WITH source AS(
    SELECT
        *
    FROM
        {{ source('raw', 'us_states') }}
),

renamed AS(
    SELECT
        state_id, 
        state_name, 
        state_abbr, 
        state_region
    FROM 
        source
)

SELECT * FROM renamed