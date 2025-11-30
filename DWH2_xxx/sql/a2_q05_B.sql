SELECT 
    dp.category AS param_category,
    -- Pivot Years into Columns
    SUM(CASE WHEN dt.year_num = 2023 THEN ft.data_volume_kb_sum ELSE 0 END) AS "2023_Volume_KB",
    SUM(CASE WHEN dt.year_num = 2024 THEN ft.data_volume_kb_sum ELSE 0 END) AS "2024_Volume_KB"
FROM dwh2_033.ft_param_city_month ft
JOIN dwh2_033.dim_timemonth dt ON ft.month_key = dt.month_key
JOIN dwh2_033.dim_param dp      ON ft.param_key = dp.param_key
WHERE 
    dt.year_num IN (2023, 2024)
    AND dp.category <> 'Unknown'
GROUP BY dp.category
ORDER BY dp.category;