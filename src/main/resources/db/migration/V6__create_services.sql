CREATE TABLE services (
    id BIGSERIAL PRIMARY KEY,

    name VARCHAR(255) NOT NULL,

    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    advertisement_id BIGINT NOT NULL,

    CONSTRAINT fk_services_advertisement
      FOREIGN KEY (advertisement_id)
          REFERENCES advertisements (ad_id)
);