-- Make A1 dwh_033, stg_033 schemas the default for this session
SET search_path TO dwh_033, stg_033;

-- =======================================
-- Load [table name]
-- =======================================

-- Step 1: Truncate target table
TRUNCATE TABLE dim_parameter RESTART IDENTITY CASCADE;

INSERT INTO dim_parameter (tb_param_id, paramname, category, unit)
SELECT DISTINCT p.id, p.paramname, p.category, p.unit
FROM tb_param p
ORDER BY p.id;





