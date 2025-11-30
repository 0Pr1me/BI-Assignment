SELECT
    c.country_name,
    AVG(CASE WHEN (p.param_code IN ('PM1', 'PM1.0') OR p.param_name IN ('PM1', 'PM1.0')) THEN f.recordedvalue_avg END) AS "PM1_Avg_Value",
    AVG(CASE WHEN (p.param_code IN ('NO2') OR p.param_name IN ('NO2')) THEN f.recordedvalue_avg END) AS "NO2_Avg_Value"
FROM
    dwh2_033.ft_param_city_month f
JOIN
    dwh2_033.dim_city c ON f.city_key = c.city_key
JOIN
    dwh2_033.dim_timemonth t ON f.month_key = t.month_key
JOIN
    dwh2_033.dim_param p ON f.param_key = p.param_key
WHERE
    t.year_num = 2024
    -- FIX: Check both code and name, and include common variations if necessary
    AND (
        p.param_code IN ('PM1', 'PM1.0', 'NO2') 
        OR p.param_name IN ('PM1', 'PM1.0', 'NO2')
    )
GROUP BY
    c.country_name
ORDER BY
    c.country_name;
