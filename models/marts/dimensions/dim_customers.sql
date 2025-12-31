WITH customer AS(
    SELECT
        CUSTOMER_ID,
        COMPANY_NAME,	
        CONTACT_NAME,	
        CONTACT_TITLE,	
        ADDRESS,
        CITY,
        REGION,	
        POSTAL_CODE,	
        COUNTRY,
        PHONE,
        FAX
    FROM
        {{ ref("staging_raw_customers")}} 
)

SELECT * FROM customer