WITH source AS(
    SELECT
        *
    FROM
        {{ source('raw', 'employees')}}
),

renamed AS(
    SELECT
        employee_id, last_name, first_name, title, 
        title_of_courtesy, birth_date, hire_date, 
        address, city, region, postal_code, country, 
        home_phone, extension, reports_to
    FROM
        source
)

SELECT * FROM renamed