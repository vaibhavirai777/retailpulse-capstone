-- RetailPulse Capstone - M0 Foundations
-- PDF ke hisaab se: pehle schemas aur volumes banao

CREATE SCHEMA IF NOT EXISTS rp_landing;
CREATE SCHEMA IF NOT EXISTS rp_bronze;
CREATE SCHEMA IF NOT EXISTS rp_silver;
CREATE SCHEMA IF NOT EXISTS rp_gold;

-- Managed Volumes for landing zone
CREATE VOLUME IF NOT EXISTS rp_landing.raw;
CREATE VOLUME IF NOT EXISTS rp_landing.ops;
