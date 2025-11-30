SELECT
    c.country_name,
    SUM(CASE WHEN t.month_num = 1 THEN f.exceed_days_any ELSE 0 END) AS "Jan_Exceed",
    SUM(CASE WHEN t.month_num = 2 THEN f.exceed_days_any ELSE 0 END) AS "Feb_Exceed",
    SUM(CASE WHEN t.month_num = 3 THEN f.exceed_days_any ELSE 0 END) AS "Mar_Exceed"
FROM
    dwh2_033.ft_param_city_month f
JOIN
    dwh2_033.dim_city c ON f.city_key = c.city_key
JOIN
    dwh2_033.dim_timemonth t ON f.month_key = t.month_key
JOIN
    dwh2_033.dim_param p ON f.param_key = p.param_key
WHERE
    -- FIX: Check both Code and Name, and handle potential "PM2.5" vs "PM2" mismatch
    (p.param_code IN ('PM2', 'PM2.5') OR p.param_name IN ('PM2', 'PM2.5'))
    AND t.year_num = 2024
    AND t.quarter_num = 1
GROUP BY
    c.country_name
ORDER BY
    c.country_name;
