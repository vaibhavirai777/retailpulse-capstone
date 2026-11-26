# M1 - Bronze Schema Notes (Inferred, Not Assumed)

Schemas were verified by printing the Auto Loader inferred schema for each dataset.

- bronze_sales: sale_id STRING, store_id STRING, sku STRING, quantity STRING, sale_date STRING, event_ts TIMESTAMP, plus _ingest_ts, _source_file, _rescued_data
- bronze_stores: store_id STRING, banner, region, format, status
- bronze_products: sku STRING, category, price
- bronze_history: Same structure as sales, representing historical data
- bronze_forecasts: forecast_run_date, target_week_start, store_id, sku, forecast_units
- bronze_overrides: Forecast cell, new_units, created_ts, planner

Design Decision:
quantity and sale_date were retained as STRING in Bronze to prevent ingestion failures on malformed values. Safe casting is performed in Silver using try_cast and try_to_timestamp.