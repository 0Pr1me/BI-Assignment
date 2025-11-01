SET search_path TO dwh_033, stg_033;

-- CHECK 5: Measure Ranges and Domains
-- This query checks that key measures fall within their expected
-- business ranges (e.g., quality scores 1-5, costs are not negative).
-- All `bad_rows` counts should be 0.

SELECT
    'ft_reading.data_quality_score' AS measure,
    COUNT(*) AS bad_rows
FROM ft_reading
WHERE data_quality_score NOT BETWEEN 1 AND 5

UNION ALL

SELECT
    'ft_service.service_quality_score' AS measure,
    COUNT(*) AS bad_rows
FROM ft_service
WHERE service_quality_score NOT BETWEEN 1 AND 5

UNION ALL

SELECT
    'ft_service.service_cost' AS measure,
    COUNT(*) AS bad_rows
FROM ft_service
WHERE service_cost < 0;
