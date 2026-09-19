CREATE TABLE jobs (
    id BIGSERIAL PRIMARY KEY,

    name VARCHAR(255) NOT NULL,

    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    advertisement_id BIGINT NOT NULL,

    CONSTRAINT fk_jobs_advertisement
        FOREIGN KEY (advertisement_id)
        REFERENCES advertisements (ad_id)
);