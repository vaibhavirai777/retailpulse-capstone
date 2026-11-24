-- RetailPulse Capstone - Schema

CREATE TABLE IF NOT EXISTS stores (
    store_id STRING,
    store_name STRING,
    banner STRING,
    region STRING,
    format STRING,
    open_date DATE,
    status STRING,
    snapshot_date DATE
);

CREATE TABLE IF NOT EXISTS products (
    sku STRING,
    product_name STRING,
    category STRING,
    brand STRING,
    pack_size STRING,
    unit_price DOUBLE
);

CREATE TABLE IF NOT EXISTS sales_daily (
    sale_id STRING,
    store_id STRING,
    sku STRING,
    sale_date DATE,
    quantity INT,
    unit_price DOUBLE,
    event_ts TIMESTAMP,
    promo_flag STRING,
    channel STRING
);

CREATE TABLE IF NOT EXISTS sales_history (
    fiscal_year INT,
    fiscal_week INT,
    week_start DATE,
    store_id STRING,
    sku STRING,
    units INT
);

CREATE TABLE IF NOT EXISTS forecast_runs (
    forecast_run_date DATE,
    target_week_start DATE,
    lag_weeks INT,
    store_id STRING,
    sku STRING,
    forecast_units INT
);

CREATE TABLE IF NOT EXISTS planner_overrides (
    override_id STRING,
    forecast_run_date DATE,
    target_week_start DATE,
    store_id STRING,
    sku STRING,
    old_units INT,
    new_units INT,
    planner STRING,
    reason STRING,
    created_ts TIMESTAMP
);
