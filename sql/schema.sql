
CREATE DATABASE IF NOT EXISTS cart_abandonment;

USE cart_abandonment;

CREATE TABLE IF NOT EXISTS sessions (
    session_id VARCHAR(20) PRIMARY KEY,
    customer_id VARCHAR(20),
    session_start DATETIME,
    device_type VARCHAR(20),
    product_id VARCHAR(20),
    product_category VARCHAR(50),
    product_price DECIMAL(10,2),
    quantity INT,
    discount_pct DECIMAL(5,2),
    shipping_charge DECIMAL(10,2),
    cart_id VARCHAR(20)
);

CREATE TABLE IF NOT EXISTS events (
    event_id VARCHAR(20) PRIMARY KEY,
    session_id VARCHAR(20),
    event_name VARCHAR(30),
    event_timestamp DATETIME,
    payment_method VARCHAR(30),
    payment_status VARCHAR(20),
    payment_failure_reason VARCHAR(100),
    order_id VARCHAR(20),

    FOREIGN KEY (session_id)
    REFERENCES sessions(session_id)
);
