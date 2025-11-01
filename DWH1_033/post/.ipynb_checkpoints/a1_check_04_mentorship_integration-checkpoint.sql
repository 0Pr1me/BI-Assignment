SET search_path TO dwh_033, stg_033;

-- CHECK 4: Table_X/Y Integration (Mentorship)
-- This query confirms that the data from tb_mentorship_program and
-- tb_mentorship_link was correctly processed and loaded into dim_technician.
-- It shows the count of technicians in each mentorship role.

SELECT
    mentorship_role,
    COUNT(DISTINCT employee_business_key) AS num_technicians
FROM
    dim_technician
WHERE
    is_current = TRUE -- Only check current status
GROUP BY
    mentorship_role
ORDER BY
    num_technicians DESC;
