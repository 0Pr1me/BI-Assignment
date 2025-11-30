SELECT
   c.country_name,
   SUM(f.missing_days) AS "Missing_Days_2024"
FROM
   dwh2_033.ft_param_city_month f
JOIN
   dwh2_033.dim_city c ON f.city_key = c.city_key
JOIN
   dwh2_033.dim_timemonth t ON f.month_key = t.month_key
WHERE
   t.year_num = 2024
GROUP BY
   c.country_name
ORDER BY
   "Missing_Days_2024" DESC
LIMIT 10;
