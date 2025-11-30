SELECT 
    dc.city_name,
    SUM(ft.missing_days) AS total_missing_days
FROM dwh2_033.ft_param_city_month ft
JOIN dwh2_033.dim_timemonth dt ON ft.month_key = dt.month_key
JOIN dwh2_033.dim_city dc       ON ft.city_key = dc.city_key
WHERE 
    dt.year_num = 2024
    AND dc.city_name <> 'Unknown'
GROUP BY dc.city_name
ORDER BY total_missing_days DESC
LIMIT 10;