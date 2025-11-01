SET search_path TO dwh_033, stg_033;

-- CHECK 7: Dimension Row Count (dim_location)
-- This check validates that our complex, denormalized dim_location
-- (which is built from tb_sensordevice, tb_sensortype, tb_city, and tb_country)
-- contains exactly one row for every device in the source table.
-- The counts MUST be identical.

SELECT
    (SELECT COUNT(*) FROM stg_033.tb_sensordevice) AS source_device_rows,
    (SELECT COUNT(*) FROM dwh_033.dim_location) AS dim_location_rows;
