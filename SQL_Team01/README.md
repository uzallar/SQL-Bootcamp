# SQL Practice Tasks — Data Warehouse and Temporal Queries

## Database Schema

The tasks use the database model provided with the exercise.

> **Note:** These tasks assume that all schema changes and data modifications from previous exercises have already been applied.

---

## Task 1

**File:** `team01_ex00.sql`

Write an SQL query that returns the total volume of transactions from user balances, aggregated by user and balance type.

Requirements:

- aggregate all balance records, including inconsistent data;
- return:
  - `name`
  - `lastname`
  - `type`
  - `volume`
  - `currency_name`
  - `last_rate_to_usd`
  - `total_volume_in_usd`
- replace missing values with:
  - `name` → `not defined`
  - `lastname` → `not defined`
  - `currency_name` → `not defined`
  - `last_rate_to_usd` → `1`
- calculate `total_volume_in_usd` as:

```sql
volume * last_rate_to_usd
