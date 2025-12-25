WITH source AS(
    SELECT
        *
    FROM
        {{ source('raw', 'suppliers') }}
),

renamed AS(
    SELECT
        supplier_id, company_name, 
        contact_name, contact_title, 
        address, city, region, postal_code, 
        country, phone, fax
    FROM 
        source
)

SELECT * FROM renamed