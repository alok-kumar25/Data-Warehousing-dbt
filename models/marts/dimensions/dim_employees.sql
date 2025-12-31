WITH emp AS(
    SELECT
    e.EMPLOYEE_ID,
    e.LAST_NAME,
    e.FIRST_NAME,	
    e.TITLE,
    e.TITLE_OF_COURTESY,	
    e.BIRTH_DATE,
    e.HIRE_DATE,
    e.ADDRESS,
    e.CITY,
    e.REGION,	
    e.POSTAL_CODE,	
    e.COUNTRY,
    e.HOME_PHONE,	
    e.EXTENSION,
    e.REPORTS_TO,
    et.territory_id
    FROM
        {{ ref('staging_raw_employees')}} e 
    LEFT JOIN 
        {{ ref('staging_raw_employee_territories')}} et 
        ON e.employee_id = et.employee_id
),

territories AS(
    SELECT
        t.TERRITORY_ID, 
        t.TERRITORY_DESCRIPTION,
        r.REGION_DESCRIPTION
    FROM
        {{ ref('staging_raw_territories')}} t
    JOIN
        {{ ref('staging_raw_region')}} r
        ON t.region_id = r.region_id
)

SELECT
    e.EMPLOYEE_ID,
    e.LAST_NAME,
    e.FIRST_NAME,	
    e.TITLE,
    e.TITLE_OF_COURTESY,	
    e.BIRTH_DATE,
    e.HIRE_DATE,
    e.ADDRESS,
    e.CITY,
    e.REGION,	
    e.POSTAL_CODE,	
    e.COUNTRY,
    e.HOME_PHONE,	
    e.EXTENSION,
    e.REPORTS_TO,
    t.TERRITORY_ID, 
    t.TERRITORY_DESCRIPTION, 	
    t.REGION_DESCRIPTION
FROM
    emp e 
LEFT JOIN
    territories t
    ON e.territory_id = t.territory_id