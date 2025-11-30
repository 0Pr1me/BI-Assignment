SELECT
   c.country_name,
   SUM(CASE WHEN t.quarter_num = 1 THEN f.exceed_days_any ELSE 0 END) AS "Q1_Exceed_Days",
   SUM(CASE WHEN t.quarter_num = 2 THEN f.exceed_days_any ELSE 0 END) AS "Q2_Exceed_Days",
   SUM(CASE WHEN t.quarter_num = 3 THEN f.exceed_days_any ELSE 0 END) AS "Q3_Exceed_Days",
   SUM(CASE WHEN t.quarter_num = 4 THEN f.exceed_days_any ELSE 0 END) AS "Q4_Exceed_Days"
FROM
   dwh2_033.ft_param_city_month f
JOIN
   dwh2_033.dim_city c ON f.city_key = c.city_key
JOIN
   dwh2_033.dim_timemonth t ON f.month_key = t.month_key
WHERE
   t.year_num = 2024
   AND c.country_name IN ('Russia', 'Turkey', 'Austria', 'Germany')
GROUP BY
   c.country_name
ORDER BY
   c.country_name;
