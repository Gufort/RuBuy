CREATE TABLE transports (
    id BIGSERIAL PRIMARY KEY,

    brand VARCHAR(255) NOT NULL,
    model VARCHAR(255) NOT NULL,
    year VARCHAR(255) NOT NULL,
    mileage INTEGER NOT NULL,
    fuel_type VARCHAR(255) NOT NULL,
    transmission VARCHAR(255) NOT NULL,
    engine_capacity INTEGER NOT NULL,

    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    advertisement_id BIGINT NOT NULL,

    CONSTRAINT fk_transports_advertisement
        FOREIGN KEY (advertisement_id)
            REFERENCES advertisements (ad_id)
);