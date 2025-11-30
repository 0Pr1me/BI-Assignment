-- Question 1: For parameter PM2, show Exceed Days (any) by Country x Month for Q1 of 2024.
-- Return Countries on rows and the first three months of 2024 (Jan–Mar) on columns.





-- SELECT
--     c.country_name,
--     SUM(CASE WHEN t.month_num = 1 THEN f.exceed_days_any ELSE 0 END) AS "Jan_Exceed",
--     SUM(CASE WHEN t.month_num = 2 THEN f.exceed_days_any ELSE 0 END) AS "Feb_Exceed",
--     SUM(CASE WHEN t.month_num = 3 THEN f.exceed_days_any ELSE 0 END) AS "Mar_Exceed"
-- FROM
--     dwh2_033.ft_param_city_month f
-- JOIN
--     dwh2_033.dim_city c ON f.city_key = c.city_key
-- JOIN
--     dwh2_033.dim_timemonth t ON f.month_key = t.month_key
-- JOIN
--     dwh2_033.dim_param p ON f.param_key = p.param_key
-- WHERE
--     p.param_code = 'PM2'       -- Filter for parameter PM2
--     AND t.year_num = 2024      -- Filter for Year 2024
--     AND t.quarter_num = 1      -- Filter for Q1 (Jan, Feb, Mar)
-- GROUP BY
--     c.country_name
-- ORDER BY
--     c.country_name;


-- SELECT *
-- FROM dwh2_033.ft_param_city_month
-- LIMIT 10;


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
    p.param_code = 'PM2'       -- Filter for parameter PM2
    AND t.year_num = 2024      -- Filter for Year 2024
    AND t.quarter_num = 1      -- Filter for Q1 (Jan, Feb, Mar)
GROUP BY
    c.country_name
ORDER BY
    c.country_name;