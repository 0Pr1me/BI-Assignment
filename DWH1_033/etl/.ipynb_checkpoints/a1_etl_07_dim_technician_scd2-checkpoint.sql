SET search_path TO dwh_033, stg_033;

-- 7. Populate dim_technician (SCD Type 2)
-- This script transforms employee role assignments (tb_employee) into an
-- SCD Type 2 dimension, tracking history.
-- It also integrates the mentorship data from tb_mentorship_link.

TRUNCATE TABLE dim_technician RESTART IDENTITY CASCADE;

WITH EmployeeMentorship AS (
    -- Create a lookup for mentorship status based on tb_employee.id
    -- An employee can be both a mentor and a mentee.
    SELECT
        e.id AS employee_id,
        MAX(CASE WHEN ml_mentor.mentor_employeeid IS NOT NULL THEN 1 ELSE 0 END) AS is_mentor,
        MAX(CASE WHEN ml_mentee.mentee_employeeid IS NOT NULL THEN 1 ELSE 0 END) AS is_mentee,
        -- Arbitrarily pick one program focus if they are in multiple
        MAX(mp_mentor.program_name) AS mentor_program_name,
        MAX(mp_mentor.program_focus) AS mentor_program_focus,
        MAX(mp_mentee.program_name) AS mentee_program_name,
        MAX(mp_mentee.program_focus) AS mentee_program_focus
    FROM
        tb_employee e
    LEFT JOIN
        tb_mentorship_link ml_mentor ON e.id = ml_mentor.mentor_employeeid
    LEFT JOIN
        tb_mentorship_program mp_mentor ON ml_mentor.program_id = mp_mentor.id
    LEFT JOIN
        tb_mentorship_link ml_mentee ON e.id = ml_mentee.mentee_employeeid
    LEFT JOIN
        tb_mentorship_program mp_mentee ON ml_mentee.program_id = mp_mentee.id
    GROUP BY
        e.id
)
INSERT INTO dim_technician (
    employee_business_key,
    badgenumber,
    -- Role Attributes
    role_name,
    role_category,
    role_level,
    -- Mentorship Attributes
    mentorship_role,
    mentorship_program_name,
    mentorship_program_focus,
    -- SCD2 Attributes
    effective_from,
    effective_to,
    is_current
)
SELECT
    e.id AS employee_business_key,
    e.badgenumber,
    -- Role
    r.rolename,
    r.category,
    CASE
        WHEN r.rolelevel = 1 THEN 'Entry'
        WHEN r.rolelevel = 2 THEN 'Junior'
        WHEN r.rolelevel = 3 THEN 'Senior'
        WHEN r.rolelevel = 4 THEN 'Lead'
        ELSE 'Unknown'
    END AS role_level,
    -- Mentorship
    CASE
        WHEN m.is_mentor = 1 AND m.is_mentee = 1 THEN 'Both'
        WHEN m.is_mentor = 1 THEN 'Mentor'
        WHEN m.is_mentee = 1 THEN 'Mentee'
        ELSE 'None'
    END AS mentorship_role,
    -- Use mentee program details if they are a mentee, else mentor details
    COALESCE(m.mentee_program_name, m.mentor_program_name) AS mentorship_program_name,
    COALESCE(m.mentee_program_focus, m.mentor_program_focus) AS mentorship_program_focus,
    -- SCD2
    e.validfrom AS effective_from,
    COALESCE(e.validto, '9999-12-31') AS effective_to,
    (CASE WHEN e.validto IS NULL THEN TRUE ELSE FALSE END) AS is_current
FROM
    tb_employee e
JOIN
    tb_role r ON e.roleid = r.id
LEFT JOIN
    EmployeeMentorship m ON e.id = m.employee_id;
