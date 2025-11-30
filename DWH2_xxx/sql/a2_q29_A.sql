SELECT
   c.country_name,
   SUM(CASE WHEN t.year_num = 2023 THEN f.data_volume_kb_sum ELSE 0 END) AS "2023_Data_Volume_KB",
   SUM(CASE WHEN t.year_num = 2024 THEN f.data_volume_kb_sum ELSE 0 END) AS "2024_Data_Volume_KB"
FROM
   dwh2_033.ft_param_city_month f
JOIN
   dwh2_033.dim_city c ON f.city_key = c.city_key
JOIN
   dwh2_033.dim_timemonth t ON f.month_key = t.month_key
WHERE
   c.region_name = 'Eastern Europe' -- Filter for Eastern Europe region
   AND t.year_num IN (2023, 2024)   -- Filter for relevant years
GROUP BY
   c.country_name
ORDER BY
   c.country_name;

