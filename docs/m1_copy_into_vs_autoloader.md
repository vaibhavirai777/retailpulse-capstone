# COPY INTO vs Auto Loader - Comparison

1. Idempotency: COPY INTO does not reload the same file twice. Auto Loader also skips already-processed files using its checkpoint.
2. State Management: COPY INTO is stateless and does not require a checkpoint. Auto Loader requires a checkpoint location and schema location.
3. Schema Handling: COPY INTO expects a predefined schema, so a new column can cause failure. Auto Loader in rescue mode can evolve the schema and capture mismatched data in _rescued_data.
4. Use Case: COPY INTO is suitable for one-time loads such as store snapshots. Auto Loader is suitable for continuous, incremental loads such as daily sales.
5. Conclusion: Both approaches were tested for store snapshots and returned the same row counts. Auto Loader was retained for regular ingestion due to its handling of incremental arrival and schema drift.