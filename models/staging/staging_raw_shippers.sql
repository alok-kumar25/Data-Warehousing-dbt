WITH source AS(
    SELECT
        *
    FROM
        {{ source('raw', 'shippers') }}
),

renamed AS(
    SELECT
        shipper_id, 
        company_name, 
        phone
    FROM 
        source
)

SELECT * FROM renamed