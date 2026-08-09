-- Enterprise Asset Table
CREATE TABLE IF NOT EXISTS assets (
    id SERIAL PRIMARY KEY,
    asset_code VARCHAR(50) UNIQUE NOT NULL,
    name VARCHAR(250) NOT NULL,
    category VARCHAR(100),
    purchase_date DATE,
    cost DECIMAL(12, 2),
    status VARCHAR(50) DEFAULT 'ACTIVE'
);
