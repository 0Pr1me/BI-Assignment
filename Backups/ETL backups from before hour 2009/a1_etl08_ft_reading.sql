CREATE TABLE dwh_xxx.ft_reading (
    -- Foreign Keys
    dim_timeday_pk INT NOT NULL,
    dim_location_pk INT NOT NULL,
    dim_parameter_pk INT NOT NULL,
    dim_reading_mode_pk INT NOT NULL,
    dim_alert_pk INT NOT NULL,

    -- Measures
    recorded_value DECIMAL(12, 4),
    data_volume_kb INT,
    data_quality_score SMALLINT,
    reading_count SMALLINT NOT NULL DEFAULT 1,

    -- Audit
    etl_load_timestamp TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    -- Constraints
    CONSTRAINT fk_reading_time FOREIGN KEY (dim_timeday_pk) REFERENCES dwh_xxx.dim_timeday(dim_timeday_pk),
    CONSTRAINT fk_reading_location FOREIGN KEY (dim_location_pk) REFERENCES dwh_xxx.dim_location(dim_location_pk),
    CONSTRAINT fk_reading_parameter FOREIGN KEY (dim_parameter_pk) REFERENCES dwh_xxx.dim_parameter(dim_parameter_pk),
    CONSTRAINT fk_reading_mode FOREIGN KEY (dim_reading_mode_pk) REFERENCES dwh_xxx.dim_reading_mode(dim_reading_mode_pk),
    CONSTRAINT fk_reading_alert FOREIGN KEY (dim_alert_pk) REFERENCES dwh_xxx.dim_alert(dim_alert_pk)
);