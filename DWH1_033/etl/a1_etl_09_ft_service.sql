SET search_path TO dwh_033, stg_033;

-- 9. Populate ft_service (Fact Table)
-- This script loads service events.
-- It joins to all dimensions to get their surrogate keys.
-- The join to dim_technician is a direct lookup on employee_business_key,
-- as the SCD2 logic is already encapsulated in that dimension table.
-- It calculates the 'is_underqualified_flag' by re-joining staging tables.

TRUNCATE TABLE ft_service RESTART IDENTITY CASCADE;

INSERT INTO ft_service (
    -- Foreign Keys
    day_id,
    sk_location,
    sk_technician,
    sk_service_type,
    -- Measures
    service_cost,
    duration_minutes,
    service_quality_score,
    is_underqualified_flag,
    service_event_count
)
SELECT
    -- Foreign Keys
    TO_CHAR(se.servicedat, 'YYYYMMDD')::INT AS day_id,
    dl.sk_location,
    dt.sk_technician,
    dst.sk_service_type,
    
    -- Measures
    se.servicecost,
    se.durationminutes,
    se.servicequality,
    -- Calculate is_underqualified_flag by comparing levels from staging
    (CASE WHEN r_st.rolelevel < st_st.minlevel THEN 1 ELSE 0 END) AS is_underqualified_flag,
    1 AS service_event_count
FROM
    tb_serviceevent se
-- Joins to get DWH surrogate keys
JOIN
    dim_location dl ON se.sensordevid = dl.device_business_key
JOIN
    dim_technician dt ON se.employeeid = dt.employee_business_key
JOIN
    dim_service_type dst ON se.servicetypeid = dst.service_type_business_key
-- Joins to staging tables *specifically* to calculate the underqualified flag
JOIN
    tb_employee e_st ON se.employeeid = e_st.id
JOIN
    tb_role r_st ON e_st.roleid = r_st.id
JOIN
    tb_servicetype st_st ON se.servicetypeid = st_st.id;
