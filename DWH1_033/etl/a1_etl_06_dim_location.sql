SET search_path TO dwh_033, stg_033;

-- 6. Populate dim_location (Conformed Dimension)
-- This dimension denormalizes device, sensor type, city, and country
-- information into a single table.

TRUNCATE TABLE dim_location RESTART IDENTITY CASCADE;

INSERT INTO dim_location (
    device_business_key,
    -- Device Level
    location_name,
    location_type,
    altitude,
    installed_date,
    sensor_manufacturer,
    sensor_technology,
    -- City Level
    city_name,
    city_population,
    latitude,
    longitude,
    -- Country Level
    country_name,
    country_population
)
SELECT
    dev.id AS device_business_key,
    -- Device
    dev.locationname,
    dev.locationtype,
    dev.altitude,
    dev.installedat,
    -- Sensor Type
    st.manufacturer,
    st.technology,
    -- City
    c.cityname,
    c.population,
    c.latitude,
    c.longitude,
    -- Country
    co.countryname,
    co.population
FROM
    tb_sensordevice dev
JOIN
    tb_sensortype st ON dev.sensortypeid = st.id
JOIN
    tb_city c ON dev.cityid = c.id
JOIN
    tb_country co ON c.countryid = co.id;
