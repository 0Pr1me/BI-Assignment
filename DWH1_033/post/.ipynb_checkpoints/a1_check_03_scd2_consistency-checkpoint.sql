SET search_path TO dwh_033, stg_033;

-- CHECK 3: SCD Type 2 Consistency (dim_technician)
-- This query checks for two potential errors in the SCD2 dimension:
-- 1. 'overlap_errors': Finds any employee who has multiple records
--    valid for the same time period. (Should be 0)
-- 2. 'current_errors': Finds any employee who has zero or more than one
--    record flagged as 'is_current = TRUE'. (Should be 0)

WITH OverlapCheck AS (
    SELECT
        employee_business_key,
        effective_from,
        LEAD(effective_from) OVER (
            PARTITION BY employee_business_key
            ORDER BY effective_from
        ) AS next_effective_from,
        effective_to
    FROM dim_technician
),
CurrentCheck AS (
    SELECT
        employee_business_key,
        COUNT(*) AS current_rows
    FROM dim_technician
    WHERE is_current = TRUE
    GROUP BY employee_business_key
)
SELECT
    'overlap_errors' AS check_type,
    COUNT(*) AS error_count
FROM OverlapCheck
WHERE effective_to <> next_effective_from AND next_effective_from IS NOT NULL

UNION ALL

SELECT
    'current_errors' AS check_type,
    COUNT(*) AS error_count
FROM CurrentCheck
WHERE current_rows <> 1;
