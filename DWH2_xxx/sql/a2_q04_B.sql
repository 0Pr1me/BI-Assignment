SELECT 
    dc.region_name,
    -- Pivot Quarters into Columns
    SUM(CASE WHEN dt.quarter_num = 1 THEN ft.data_volume_kb_sum ELSE 0 END) AS "Q1_Volume_KB",
    SUM(CASE WHEN dt.quarter_num = 2 THEN ft.data_volume_kb_sum ELSE 0 END) AS "Q2_Volume_KB",
    SUM(CASE WHEN dt.quarter_num = 3 THEN ft.data_volume_kb_sum ELSE 0 END) AS "Q3_Volume_KB",
    SUM(CASE WHEN dt.quarter_num = 4 THEN ft.data_volume_kb_sum ELSE 0 END) AS "Q4_Volume_KB"
FROM dwh2_033.ft_param_city_month ft
JOIN dwh2_033.dim_timemonth dt ON ft.month_key = dt.month_key
JOIN dwh2_033.dim_city dc       ON ft.city_key = dc.city_key
WHERE 
    dt.year_num = 2024
    AND dc.region_name <> 'Unknown'
GROUP BY dc.region_name
ORDER BY dc.region_name;