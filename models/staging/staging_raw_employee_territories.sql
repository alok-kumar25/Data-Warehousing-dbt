WITH source AS(
    SELECT
        *
    FROM
        {{ source('raw', 'employee_territories') }}
),

renamed AS(
    SELECT
        employee_id,
        territory_id
    FROM
        source
)

SELECT * FROM renamed