SELECT 
    dc.city_name,
    SUM(ft.exceed_days_any) AS total_exceed_days
FROM dwh2_033.ft_param_city_month ft
JOIN dwh2_033.dim_timemonth dt ON ft.month_key = dt.month_key
JOIN dwh2_033.dim_city dc       ON ft.city_key = dc.city_key
JOIN dwh2_033.dim_param dp      ON ft.param_key = dp.param_key
WHERE 
    dt.year_num = 2024
    AND dp.param_name = 'PM10'
    AND dc.city_name <> 'Unknown'
GROUP BY dc.city_name
ORDER BY dc.city_name;