SET search_path TO dwh_033, stg_033;

-- 3. Populate dim_reading_mode
-- Simple 1:1 load from the source table.

TRUNCATE TABLE dim_reading_mode RESTART IDENTITY CASCADE;

INSERT INTO dim_reading_mode (
    mode_business_key,
    mode_name,
    latency,
    details
)
SELECT
    id AS mode_business_key,
    modename,
    latency,
    details
FROM tb_readingmode;
