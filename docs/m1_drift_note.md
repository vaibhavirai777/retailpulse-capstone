# M1 - Auto Loader Schema Drift Note

## Configuration
- cloudFiles.schemaEvolutionMode = rescue
- Checkpoint: rp_landing.ops/chk/<table>
- Schema Location: rp_landing.ops/schemas/<dataset>

## Observed Drift
- Around Week 5: New column `promo_flag` appeared in sales files.
- Around Week 10: New column `channel` appeared in sales files.
- Older files did not contain these columns.

## Behaviour
- The ingestion job did not fail on drift.
- New columns were added to the bronze table automatically.
- Existing rows received NULL for the new columns, which is expected.
- Values that did not match the inferred schema were captured in `_rescued_data` instead of being dropped.

## Conclusion
- Rescue mode allows the pipeline to continue during schema drift without data loss.
- `_rescued_data` must be monitored, as it holds the rows that need review.
- No cleaning or transformation is performed in Bronze. Cleaning is handled in Silver.