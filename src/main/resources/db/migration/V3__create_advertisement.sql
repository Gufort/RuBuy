CREATE TABLE advertisements (
    ad_id BIGSERIAL PRIMARY KEY,

    user_id BIGINT NOT NULL,
    city_id INTEGER NOT NULL,
    category_id INTEGER NOT NULL,

    status VARCHAR(255) NOT NULL DEFAULT 'active',

    price NUMERIC(12, 2) NOT NULL,

    title VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,

    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_advertisements_user
        FOREIGN KEY (user_id)
            REFERENCES users (id),

    CONSTRAINT fk_advertisements_city
        FOREIGN KEY (city_id)
            REFERENCES cities (city_id)
);