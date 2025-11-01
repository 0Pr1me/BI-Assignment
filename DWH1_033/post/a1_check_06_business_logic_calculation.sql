SET search_path TO dwh_033, stg_033;

-- CHECK 6: Calculated Business Logic
-- This query checks the results of our custom ETL logic.
-- 1. 'Underqualified Flag': Shows how many services were flagged.
--    We expect to see some, as per the case description.
-- 2. 'Alert Levels': Shows the distribution of readings by alert level.
--    We must see a count for 'No Alert'.

(SELECT
    'Underqualified Flag' AS check_type,
    -- FIXED: Use a CASE statement to convert the SMALLINT (0/1)
    -- to a TEXT value, which matches the data type of 'alert_name'.
    CASE
        WHEN is_underqualified_flag = 1 THEN 'Yes - Underqualified'
        ELSE 'No - Qualified'
    END AS value,
    COUNT(*) AS event_count
FROM ft_service
GROUP BY is_underqualified_flag)

UNION ALL

(SELECT
    'Alert Levels' AS check_type,
    a.alert_name AS value,
    COUNT(f.ft_reading_id) AS event_count
FROM ft_reading f
JOIN dim_alert a ON f.sk_alert = a.sk_alert
GROUP BY a.alert_name)

ORDER BY check_type, value;

