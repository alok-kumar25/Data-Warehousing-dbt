WITH source AS(
    SELECT
        *
    FROM
        {{ source('raw','categories')}}
),

renamed AS(
    SELECT
        category_id,
        description,
        category_name
    FROM
        source
)

SELECT * FROM renamed