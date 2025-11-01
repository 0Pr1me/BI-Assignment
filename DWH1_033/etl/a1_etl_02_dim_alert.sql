SET search_path TO dwh_033, stg_033;

-- 2. Populate dim_alert
-- First, insert a special 'No Alert' row with business key 0.
-- This row is used by ft_reading when a recorded value doesn't cross any threshold.

TRUNCATE TABLE dim_alert RESTART IDENTITY CASCADE;

INSERT INTO dim_alert (
    alert_business_key,
    alert_name,
    colour,
    details
)
VALUES (
    0,
    'No Alert',
    'Green',
    'No threshold exceeded'
);

-- Next, load all alert levels from the staging table.
INSERT INTO dim_alert (
    alert_business_key,
    alert_name,
    colour,
    details
)
SELECT
    id AS alert_business_key,
    alertname,
    colour,
    details
FROM tb_alert;
