SET search_path TO dwh_033, stg_033;

-- 4. Populate dim_parameter
-- Simple 1:1 load, mapping columns to the 3-level hierarchy.

TRUNCATE TABLE dim_parameter RESTART IDENTITY CASCADE;

INSERT INTO dim_parameter (
    parameter_business_key,
    param_name,
    unit,
    param_purpose,
    param_category
)
SELECT
    id AS parameter_business_key,
    paramname AS param_name,
    unit,
    purpose AS param_purpose,
    category AS param_category
FROM tb_param;
