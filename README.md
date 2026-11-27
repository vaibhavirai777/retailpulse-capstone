# RetailPulse Capstone - Bronze Silver Gold Pipeline

RetailPulse is a Databricks Medallion Architecture project for retail demand forecasting. 
Raw CSVs -> Bronze -> Silver -> Gold -> Forecast.

## Architecture

- **Landing:** `rp_landing` (Volumes: `raw`, `ops`)
- **Bronze:** `rp_bronze` - Raw ingestion, no business logic
- **Silver:** `rp_silver` - Cleaned, deduplicated, validated
- **Gold:** `rp_gold` - Business-ready aggregates + Forecast

## Project Milestones

- [x] **M0 - Foundations:** Schemas (`rp_landing`, `rp_bronze`, `rp_silver`, `rp_gold`) + Volumes (`raw`, `ops`) + Repo Layout
- [ ] **M1 - Raw Data Generation:** Generator notebook for stores, products, sales_daily
- [ ] **M2 - Bronze Ingestion:** Auto Loader / COPY INTO to Bronze
- [ ] **M3 - Silver Cleaning:** Dedupe, validation, quarantine
- [ ] **M4 - Gold + Forecast:** Weekly aggregates + 4-week lag forecast
- [ ] **M5 - Planner Overrides + Audit:** Override table + audit log
- [ ] **M6 - DQ + Tests + Dashboard:** Data Quality checks + Dashboard

## Repo Layout

- `notebooks/` - Data generation, Bronze, Silver, Gold notebooks
- `data/` - Raw CSV files
- `docs/` - Project documentation
