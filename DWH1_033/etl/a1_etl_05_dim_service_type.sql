SET search_path TO dwh_033, stg_033;

-- 5. Populate dim_service_type
-- Simple 1:1 load, mapping columns to the 3-level hierarchy.
-- Note: 'minlevel' from OLTP is an INT (1,2,3,4)
-- We convert it to the string representation for the DWH.

TRUNCATE TABLE dim_service_type RESTART IDENTITY CASCADE;

INSERT INTO dim_service_type (
    service_type_business_key,
    service_type_name,
    details,
    min_qualification_level,
    service_category,
    service_group
)
SELECT
    id AS service_type_business_key,
    typename AS service_type_name,
    details,
    CASE
        WHEN minlevel = 1 THEN 'Entry'
        WHEN minlevel = 2 THEN 'Junior'
        WHEN minlevel = 3 THEN 'Senior'
        WHEN minlevel = 4 THEN 'Lead'
        ELSE 'Unknown'
    END AS min_qualification_level,
    category AS service_category,
    servicegroup AS service_group
FROM tb_servicetype;
