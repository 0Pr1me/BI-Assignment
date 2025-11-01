SET search_path TO dwh_033, stg_033;

-- 8. Populate ft_reading (Fact Table)
-- This script loads reading events.
-- It joins to all dimensions to get their surrogate keys.
-- It uses a CTE to calculate the correct alert level for each reading.

TRUNCATE TABLE ft_reading RESTART IDENTITY CASCADE;

WITH CalculatedAlerts AS (
    -- For each reading event, find the highest-level alert threshold it crossed.
    -- We join tb_paramalert and find all thresholds the value *exceeded*.
    -- Then, we group by the reading event and find the MAX(alertid),
    -- assuming a higher ID means a more severe alert (e.g., 4=Crimson > 3=Red).
    -- If no threshold is crossed, the LEFT JOIN results in NULL, which
    -- we COALESCE to 0 (our 'No Alert' business key).
    SELECT
        r.id AS reading_event_id,
        COALESCE(MAX(pa.alertid), 0) AS alert_business_key
    FROM
        tb_readingevent r
    LEFT JOIN
        tb_paramalert pa ON r.paramid = pa.paramid
        AND r.recordedvalue >= pa.threshold
    GROUP BY
        r.id
)
INSERT INTO ft_reading (
    -- Foreign Keys
    day_id,
    sk_location,
    sk_parameter,
    sk_reading_mode,
    sk_alert,
    -- Measures
    recorded_value,
    data_volume_kb,
    data_quality_score,
    reading_count
)
SELECT
    -- Foreign Keys
    TO_CHAR(r.readat, 'YYYYMMDD')::INT AS day_id,
    dl.sk_location,
    dp.sk_parameter,
    drm.sk_reading_mode,
    da.sk_alert,
    -- Measures
    r.recordedvalue,
    r.datavolumekb,
    r.dataquality,
    1 AS reading_count
FROM
    tb_readingevent r
-- Join to get surrogate keys
JOIN
    dim_location dl ON r.sensordevid = dl.device_business_key
JOIN
    dim_parameter dp ON r.paramid = dp.parameter_business_key
JOIN
    dim_reading_mode drm ON r.readingmodeid = drm.mode_business_key
-- Join to our CTE and dim_alert to get the calculated sk_alert
JOIN
    CalculatedAlerts ca ON r.id = ca.reading_event_id
JOIN
    dim_alert da ON ca.alert_business_key = da.alert_business_key;
