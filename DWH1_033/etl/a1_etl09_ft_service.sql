CREATE TABLE dwh_xxx.ft_service (
    -- Foreign Keys
    dim_timeday_pk INT NOT NULL,
    dim_location_pk INT NOT NULL,
    dim_technician_pk INT NOT NULL,
    dim_service_type_pk INT NOT NULL,

    -- Measures
    service_cost DECIMAL(10, 2),
    duration_minutes INT,
    service_quality_score SMALLINT,
    is_underqualified_flag SMALLINT NOT NULL DEFAULT 0,
    service_event_count SMALLINT NOT NULL DEFAULT 1,

    -- Audit
    etl_load_timestamp TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    -- Constraints
    CONSTRAINT fk_service_time FOREIGN KEY (dim_timeday_pk) REFERENCES dwh_xxx.dim_timeday(dim_timeday_pk),
    CONSTRAINT fk_service_location FOREIGN KEY (dim_location_pk) REFERENCES dwh_xxx.dim_location(dim_location_pk),
    CONSTRAINT fk_service_technician FOREIGN KEY (dim_technician_pk) REFERENCES dwh_xxx.dim_technician(dim_technician_pk),
    CONSTRAINT fk_service_type FOREIGN KEY (dim_service_type_pk) REFERENCES dwh_xxx.dim_service_type(dim_service_type_pk)
);