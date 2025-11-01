--Modified file
-- Make A1 dwh_033 schema the default for this session
SET search_path TO dwh_033;

-- -------------------------------
-- 2) DROP TABLE before attempting to create DWH schema tables
-- (Drop facts first, in reverse order of creation)
-- -------------------------------
DROP TABLE IF EXISTS ft_service;
DROP TABLE IF EXISTS ft_reading;

-- (Drop dimensions)
DROP TABLE IF EXISTS dim_timeday;
DROP TABLE IF EXISTS dim_location;
DROP TABLE IF EXISTS dim_technician;
DROP TABLE IF EXISTS dim_service_type;
DROP TABLE IF EXISTS dim_parameter;
DROP TABLE IF EXISTS dim_reading_mode;
DROP TABLE IF EXISTS dim_alert;

-- -------------------------------
-- 3) CREATE TABLE statements for dimensions
-- (Dimensions must be created before the fact tables that reference them)
-- -------------------------------

-- Time Dimension (Daily Grain)
CREATE TABLE dim_timeday (
    day_id INT NOT NULL PRIMARY KEY, -- YYYYMMDD format
    date_actual DATE NOT NULL,
    day_of_week SMALLINT NOT NULL,
    day_name VARCHAR(10) NOT NULL,
    month SMALLINT NOT NULL,
    month_name VARCHAR(10) NOT NULL,
    quarter SMALLINT NOT NULL,
    year INT NOT NULL,
    is_weekend_flag CHAR(1) NOT NULL,
    etl_load_timestamp TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT uq_dim_timeday_date UNIQUE (date_actual)
);

-- Location Dimension (Conformed)
-- Hierarchy: Country -> City -> Device
CREATE TABLE dim_location (
    sk_location BIGSERIAL PRIMARY KEY, -- SK
    device_business_key INT NOT NULL,  -- ID from tb_sensordevice
    -- Device Level (Level 3)
    location_name VARCHAR(255),
    location_type VARCHAR(100),
    altitude DECIMAL(10, 2),
    installed_date DATE,
    sensor_manufacturer VARCHAR(255),
    sensor_technology VARCHAR(255),
    -- City Level (Level 2)
    city_name VARCHAR(255) NOT NULL,
    city_population BIGINT,
    latitude DECIMAL(9, 6),
    longitude DECIMAL(9, 6),
    -- Country Level (Level 1)
    country_name VARCHAR(255) NOT NULL,
    country_population BIGINT,
    -- Audit
    etl_load_timestamp TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT uq_dim_location_bk UNIQUE (device_business_key)
);

-- Technician Dimension (SCD Type 2)
CREATE TABLE dim_technician (
    sk_technician BIGSERIAL PRIMARY KEY,
    employee_business_key INT NOT NULL,  -- From tb_employee.id
    badgenumber VARCHAR(100) NOT NULL,   -- Business key
    -- Role Attributes
    role_name VARCHAR(100),
    role_category VARCHAR(100),
    role_level VARCHAR(50), -- e.g., 'Senior', 'Junior'
    -- Mentorship Attributes
    mentorship_role VARCHAR(50), -- e.g., 'Mentor', 'Mentee', 'None'
    mentorship_program_name VARCHAR(255),
    mentorship_program_focus VARCHAR(255),
    -- SCD2 Attributes
    effective_from DATE NOT NULL,
    effective_to DATE NOT NULL,
    is_current BOOLEAN NOT NULL,
    -- Audit
    etl_load_timestamp TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT ux_technician_bk_timerange UNIQUE (employee_business_key, badgenumber, effective_from, effective_to)
);

-- Service Type Dimension
-- Hierarchy: Service Group -> Service Category -> Service Type
CREATE TABLE dim_service_type (
    sk_service_type BIGSERIAL PRIMARY KEY,      -- SK
    service_type_business_key INT NOT NULL, -- ID from tb_servicetype
    -- Service Type Level (Level 3)
    service_type_name VARCHAR(255),
    details TEXT,
    min_qualification_level VARCHAR(50),
    -- Service Category Level (Level 2)
    service_category VARCHAR(100),
    -- Service Group Level (Level 1)
    service_group VARCHAR(100),
    -- Audit
    etl_load_timestamp TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT uq_dim_service_type_bk UNIQUE (service_type_business_key)
);

-- Parameter Dimension
-- Hierarchy: Parameter Category -> Parameter Purpose -> Parameter Name
CREATE TABLE dim_parameter (
    sk_parameter BIGSERIAL PRIMARY KEY,   -- SK
    parameter_business_key INT NOT NULL,  -- ID from tb_param
    -- Parameter Name Level (Level 3)
    param_name VARCHAR(255) NOT NULL,
    unit VARCHAR(50),
    -- Parameter Purpose Level (Level 2)
    param_purpose VARCHAR(255),
    -- Parameter Category Level (Level 1)
    param_category VARCHAR(100),
    -- Audit
    etl_load_timestamp TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT uq_dim_parameter_bk UNIQUE (parameter_business_key)
);

-- Reading Mode Dimension
CREATE TABLE dim_reading_mode (
    sk_reading_mode BIGSERIAL PRIMARY KEY, -- SK
    mode_business_key INT NOT NULL,        -- ID from tb_readingmode
    mode_name VARCHAR(100),
    latency INT,
    details TEXT,
    etl_load_timestamp TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT uq_dim_reading_mode_bk UNIQUE (mode_business_key)
);

-- Alert Level Dimension
CREATE TABLE dim_alert (
    sk_alert BIGSERIAL PRIMARY KEY,    -- SK
    alert_business_key INT NOT NULL,   -- ID from tb_alert
    alert_name VARCHAR(100),
    colour VARCHAR(50),
    details TEXT,
    etl_load_timestamp TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT uq_dim_alert_bk UNIQUE (alert_business_key)
);


-- -------------------------------
-- 4) CREATE TABLE statements for facts
-- -------------------------------

-- FACT 1: ft_reading (Sensor Readings, Data Quality, and Alerts)
CREATE TABLE ft_reading (
    ft_reading_id BIGSERIAL PRIMARY KEY, -- Simple surrogate PK for the fact
    
    -- Foreign Keys
    day_id INT NOT NULL,                -- -> dim_timeday.day_id
    sk_location BIGINT NOT NULL,        -- -> dim_location.sk_location
    sk_parameter BIGINT NOT NULL,       -- -> dim_parameter.sk_parameter
    sk_reading_mode BIGINT NOT NULL,    -- -> dim_reading_mode.sk_reading_mode
    sk_alert BIGINT NOT NULL,           -- -> dim_alert.sk_alert

    -- Measures
    recorded_value DECIMAL(12, 4),
    data_volume_kb INT,
    data_quality_score SMALLINT,
    reading_count SMALLINT NOT NULL DEFAULT 1,

    -- Audit
    etl_load_timestamp TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    -- Constraints
    CONSTRAINT fk_reading_timeday FOREIGN KEY (day_id) REFERENCES dim_timeday(day_id),
    CONSTRAINT fk_reading_location FOREIGN KEY (sk_location) REFERENCES dim_location(sk_location),
    CONSTRAINT fk_reading_parameter FOREIGN KEY (sk_parameter) REFERENCES dim_parameter(sk_parameter),
    CONSTRAINT fk_reading_mode FOREIGN KEY (sk_reading_mode) REFERENCES dim_reading_mode(sk_reading_mode),
    CONSTRAINT fk_reading_alert FOREIGN KEY (sk_alert) REFERENCES dim_alert(sk_alert)
);

-- Helpful indexes for ft_reading
CREATE INDEX ix_ft_reading_day ON ft_reading(day_id);
CREATE INDEX ix_ft_reading_location ON ft_reading(sk_location);
CREATE INDEX ix_ft_reading_parameter ON ft_reading(sk_parameter);
CREATE INDEX ix_ft_reading_mode ON ft_reading(sk_reading_mode);
CREATE INDEX ix_ft_reading_alert ON ft_reading(sk_alert);


-- FACT 2: ft_service (Maintenance Events, Cost, and Performance)
CREATE TABLE ft_service (
    ft_service_id BIGSERIAL PRIMARY KEY, -- Simple surrogate PK for the fact
    
    -- Foreign Keys
    day_id INT NOT NULL,                   -- -> dim_timeday.day_id
    sk_location BIGINT NOT NULL,           -- -> dim_location.sk_location (Conformed)
    sk_technician BIGINT NOT NULL,         -- -> dim_technician.sk_technician (SCD2)
    sk_service_type BIGINT NOT NULL,       -- -> dim_service_type.sk_service_type

    -- Measures
    service_cost DECIMAL(10, 2),
    duration_minutes INT,
    service_quality_score SMALLINT,
    is_underqualified_flag SMALLINT NOT NULL DEFAULT 0, -- 1 = Yes, 0 = No
    service_event_count SMALLINT NOT NULL DEFAULT 1,

    -- Audit
    etl_load_timestamp TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    -- Constraints
    CONSTRAINT fk_service_timeday FOREIGN KEY (day_id) REFERENCES dim_timeday(day_id),
    CONSTRAINT fk_service_location FOREIGN KEY (sk_location) REFERENCES dim_location(sk_location),
    CONSTRAINT fk_service_technician FOREIGN KEY (sk_technician) REFERENCES dim_technician(sk_technician),
    CONSTRAINT fk_service_type FOREIGN KEY (sk_service_type) REFERENCES dim_service_type(sk_service_type)
);

-- Helpful indexes for ft_service
CREATE INDEX ix_ft_service_day ON ft_service(day_id);
CREATE INDEX ix_ft_service_location ON ft_service(sk_location);
CREATE INDEX ix_ft_service_technician ON ft_service(sk_technician);
CREATE INDEX ix_ft_service_type ON ft_service(sk_service_type);
