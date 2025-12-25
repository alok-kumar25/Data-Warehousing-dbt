WITH source AS(
    SELECT
        *
    FROM
        {{ source('raw', 'order_details') }}
),

renamed AS(
    SELECT
    order_id, product_id, 
    unit_price, quantity, 
    discount
    FROM
        source
)

SELECT * FROM renamed