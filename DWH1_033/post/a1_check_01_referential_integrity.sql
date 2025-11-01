SET search_path TO dwh_033, stg_033;

-- CHECK 1: Referential Integrity (Orphan Rows)
-- This query checks both fact tables for any foreign keys that
-- do not match a primary key in their respective dimension.
-- The result for all counts MUST be 0.

(SELECT
    'ft_reading' AS fact_table,
    'dim_timeday' AS dimension,
    COUNT(f.ft_reading_id) AS orphan_rows
FROM ft_reading f
LEFT JOIN dim_timeday d ON f.day_id = d.day_id
WHERE d.day_id IS NULL)

UNION ALL

(SELECT
    'ft_reading' AS fact_table,
    'dim_location' AS dimension,
    COUNT(f.ft_reading_id) AS orphan_rows
FROM ft_reading f
LEFT JOIN dim_location d ON f.sk_location = d.sk_location
WHERE d.sk_location IS NULL)

UNION ALL

(SELECT
    'ft_reading' AS fact_table,
    'dim_parameter' AS dimension,
    COUNT(f.ft_reading_id) AS orphan_rows
FROM ft_reading f
LEFT JOIN dim_parameter d ON f.sk_parameter = d.sk_parameter
WHERE d.sk_parameter IS NULL)

UNION ALL

(SELECT
    'ft_reading' AS fact_table,
    'dim_reading_mode' AS dimension,
    COUNT(f.ft_reading_id) AS orphan_rows
FROM ft_reading f
LEFT JOIN dim_reading_mode d ON f.sk_reading_mode = d.sk_reading_mode
WHERE d.sk_reading_mode IS NULL)

UNION ALL

(SELECT
    'ft_reading' AS fact_table,
    'dim_alert' AS dimension,
    COUNT(f.ft_reading_id) AS orphan_rows
FROM ft_reading f
LEFT JOIN dim_alert d ON f.sk_alert = d.sk_alert
WHERE d.sk_alert IS NULL)

UNION ALL

(SELECT
    'ft_service' AS fact_table,
    'dim_timeday' AS dimension,
    COUNT(f.ft_service_id) AS orphan_rows
FROM ft_service f
LEFT JOIN dim_timeday d ON f.day_id = d.day_id
WHERE d.day_id IS NULL)

UNION ALL

(SELECT
    'ft_service' AS fact_table,
    'dim_location' AS dimension,
    COUNT(f.ft_service_id) AS orphan_rows
FROM ft_service f
LEFT JOIN dim_location d ON f.sk_location = d.sk_location
WHERE d.sk_location IS NULL)

UNION ALL

(SELECT
    'ft_service' AS fact_table,
    'dim_technician' AS dimension,
    COUNT(f.ft_service_id) AS orphan_rows
FROM ft_service f
LEFT JOIN dim_technician d ON f.sk_technician = d.sk_technician
WHERE d.sk_technician IS NULL)

UNION ALL

(SELECT
    'ft_service' AS fact_table,
    'dim_service_type' AS dimension,
    COUNT(f.ft_service_id) AS orphan_rows
FROM ft_service f
LEFT JOIN dim_service_type d ON f.sk_service_type = d.sk_service_type
WHERE d.sk_service_type IS NULL)
;

