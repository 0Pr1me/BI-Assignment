SELECT 
    dc.city_name,
    -- Pivot Months into Columns
    SUM(CASE WHEN dt.month_num = 1 THEN ft.missing_days ELSE 0 END) AS "Jan_Missing_Days",
    SUM(CASE WHEN dt.month_num = 2 THEN ft.missing_days ELSE 0 END) AS "Feb_Missing_Days",
    SUM(CASE WHEN dt.month_num = 3 THEN ft.missing_days ELSE 0 END) AS "Mar_Missing_Days"
FROM dwh2_033.ft_param_city_month ft
JOIN dwh2_033.dim_timemonth dt ON ft.month_key = dt.month_key
JOIN dwh2_033.dim_city dc       ON ft.city_key = dc.city_key
JOIN dwh2_033.dim_param dp      ON ft.param_key = dp.param_key
WHERE 
    dc.country_name = 'Austria'
    AND dt.year_num = 2023
    AND dt.quarter_num = 1
    AND dp.param_name = 'O3'
GROUP BY dc.city_name
ORDER BY dc.city_name;