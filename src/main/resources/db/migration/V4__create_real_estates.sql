CREATE TABLE real_estates (
      id BIGSERIAL PRIMARY KEY,

      property_type VARCHAR(255) NOT NULL,
      total_area DOUBLE PRECISION NOT NULL,
      living_area DOUBLE PRECISION NOT NULL,
      floor INTEGER NOT NULL,
      total_floors INTEGER NOT NULL,
      rooms_count INTEGER NOT NULL,

      created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
      updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

      advertisement_id BIGINT NOT NULL,

      CONSTRAINT fk_real_estates_advertisement
          FOREIGN KEY (advertisement_id)
              REFERENCES advertisements (ad_id)
);