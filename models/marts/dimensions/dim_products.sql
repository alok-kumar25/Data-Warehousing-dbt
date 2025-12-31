WITH product AS(
    SELECT
    p.PRODUCT_ID,
    p.PRODUCT_NAME,	
    p.SUPPLIER_ID,
    p.CATEGORY_ID,	
    p.QUANTITY_PER_UNIT,	
    p.UNIT_PRICE,
    p.UNITS_IN_STOCK,	
    p.UNITS_ON_ORDER,	
    p.REORDER_LEVEL,	
    p.DISCONTINUED
    FROM
        {{ ref('staging_raw_products')}} p

),

supplier AS(
    SELECT
    s.supplier_id,
    s.COMPANY_NAME,	
    s.CONTACT_NAME,	
    s.CONTACT_TITLE,	
    s.ADDRESS,
    s.CITY,
    s.REGION,	
    s.POSTAL_CODE,	
    s.COUNTRY,
    s.PHONE,
    s.FAX
    FROM
        {{ ref('staging_raw_suppliers')}} s
),

cat AS(
    SELECT
        c.category_id,
        c.DESCRIPTION,
        c.CATEGORY_NAME
    FROM
        {{ ref('staging_raw_categories')}} c 
)

SELECT
    p.PRODUCT_ID,
    p.PRODUCT_NAME,	
    p.SUPPLIER_ID,
    p.CATEGORY_ID,	
    p.QUANTITY_PER_UNIT,	
    p.UNIT_PRICE,
    p.UNITS_IN_STOCK,	
    p.UNITS_ON_ORDER,	
    p.REORDER_LEVEL,	
    p.DISCONTINUED,
    s.COMPANY_NAME,	
    s.CONTACT_NAME,	
    s.CONTACT_TITLE,	
    s.ADDRESS,
    s.CITY,
    s.REGION,	
    s.POSTAL_CODE,	
    s.COUNTRY,
    s.PHONE,
    s.FAX,
    c.DESCRIPTION,
    c.CATEGORY_NAME
FROM
    product p
LEFT JOIN
    supplier s 
    ON p.supplier_id = s.supplier_id
LEFT JOIN
    cat c 
    ON p.category_id = c.category_id