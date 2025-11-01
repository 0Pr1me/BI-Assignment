SET search_path TO dwh_033, stg_033;

-- CHECK 2: Fact Row Count vs. Source
-- This query compares the row counts of the source event tables (in stg)
-- with the final fact tables (in dwh).
-- The counts for `reading_events` and `service_events` should match.

SELECT
    'Reading Events' AS data_source,
    (SELECT COUNT(*) FROM stg_033.tb_readingevent) AS source_rows,
    (SELECT COUNT(*) FROM dwh_033.ft_reading) AS fact_rows

UNION ALL

SELECT
    'Service Events' AS data_source,
    (SELECT COUNT(*) FROM stg_033.tb_serviceevent) AS source_rows,
    (SELECT COUNT(*) FROM dwh_033.ft_service) AS fact_rows;
