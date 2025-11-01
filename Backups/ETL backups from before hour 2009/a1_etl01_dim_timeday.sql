SET search_path TO dwh_033, stg_033;

-- 1. Populate dim_timeday
-- This script generates a date for every day between the earliest and latest
-- event in *both* the reading and service event tables.

INSERT INTO dim_timeday (
    day_id,
    date_actual,
    day_of_week,
    day_name,
    month,
    month_name,
    quarter,
    year,
    is_weekend_flag
)
WITH DateRange AS (
    -- Find the min and max dates from both event tables
    SELECT
        LEAST(MIN(readat), MIN(servicedat)) AS min_date,
        GREATEST(MAX(readat), MAX(servicedat)) AS max_date
    FROM tb_readingevent
    FULL OUTER JOIN tb_serviceevent ON tb_readingevent.readat = tb_serviceevent.servicedat
),
DateSeries AS (
    -- Generate all dates in that range
    SELECT
        generate_series(min_date, max_date, '1 day'::interval)::date AS date_actual
    FROM DateRange
)
-- Extract attributes for each date
SELECT
    TO_CHAR(date_actual, 'YYYYMMDD')::INT AS day_id,
    date_actual,
    EXTRACT(ISODOW FROM date_actual) AS day_of_week,
    TO_CHAR(date_actual, 'Day') AS day_name,
    EXTRACT(MONTH FROM date_actual) AS month,
    TO_CHAR(date_actual, 'Month') AS month_name,
    EXTRACT(QUARTER FROM date_actual) AS quarter,
    EXTRACT(YEAR FROM date_actual) AS year,
    CASE
        WHEN EXTRACT(ISODOW FROM date_actual) IN (6, 7) THEN 'Y'
        ELSE 'N'
    END AS is_weekend_flag
FROM DateSeries;
