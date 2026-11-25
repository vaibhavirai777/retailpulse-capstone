# Design Notes - M0: Foundation & Setup

## 1. Catalog & Schema Design
**Decision:** Use a single catalog `workspace` with four schemas: `rp_landing`, `rp_bronze`, `rp_silver`, `rp_gold`.

**Rationale:** Free Edition has limited options for creating separate catalogs. Using one catalog with clearly separated schemas keeps the Medallion Architecture intact while staying within Free Edition constraints.

## 2. Landing Zone - Volumes
**Decision:** Create two Volumes under `rp_landing`: `raw` and `ops`.

**Rationale:**
- `raw` : Stores immutable source CSV / JSON files. Raw data is never overwritten.
- `ops` : Stores Auto Loader checkpoints (`ops/chk/<table>`) and schema locations (`ops/schemas/<dataset>`).

## 3. Free Edition Constraints That Affect Our Design (Section 3, in our own words)

| Free Edition Limit | What It Means For Us | Our Design Decision |
| :--- | :--- | :--- |
| Serverless compute only, streaming supports only `availableNow` trigger | No always-on / continuous streams | Every stream is incremental-batch with `availableNow`, arrival simulated with `release` |
| Max 5 concurrent job tasks | Wide DAGs will queue up | Job DAG kept at most 3 tasks wide |
| One active pipeline per pipeline type | Both engineers cannot run their own pipeline at same time | One shared pipeline, owner per source file |
| One SQL warehouse, 2X-Small | Dashboards over raw silver will be slow | Dashboards read pre-aggregated Gold only |
| Daily fair-use compute quota | Loop of full refreshes can lock us out till tomorrow | Data is ~62 MB, full refresh only when needed, schedules paused |
| No custom storage / external locations | Managed tables and managed volumes only | No external locations, studied from docs only |
| Outbound internet limited | Cannot download public datasets from notebook | Generator is pure Python, needs no internet |
| Python and SQL only, no RDD API, no Spark UI | Some tutorials will not run as written | DataFrame / SQL only, tune with query profile |
| One workspace per account, no SSO/SCIM | Hard to test permissions against second person | Row filter driven by `current_user()` mapping table |
| Inactive accounts may be deleted | Work kept only in workspace can be lost | Everything lives in Git repo |

## 4. Smoke Test Results - M0

| Check | Status | Evidence |
| :--- | :--- | :--- |
| Schemas + Volumes Created | ✅ PASS | `rp_landing`, `rp_bronze`, `rp_silver`, `rp_gold` verified in Catalog Explorer |
| Repo Layout + Git | ✅ PASS | `retailpulse-capstone` repo on branch `main` |
| Bronze Tables Created | ✅ PASS | `products`, `sales_daily`, `stores` |
| Notebook Ingestion Test | ✅ PASS | `spark.read.table("workspace.rp_bronze.stores").show(5)` returned 5 rows |
| Lakeflow Pipeline | ⚠️ FALLBACK | Pipeline UI not accessible in Free Edition. `dlt` code ready in `pipelines/m0_smoke_test`. To be retried in M4 as per brief fallback. |

## 5. Conclusion
M0 foundation is complete. Schemas, Volumes, repo structure, and Bronze ingestion are verified. Free Edition constraints documented above drive all later design decisions.