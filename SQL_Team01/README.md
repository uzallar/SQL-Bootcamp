# SQL Practice Tasks — Data Warehouse and ETL

## Database Schema

The tasks use a database consisting of three independent data sources:

* `user`
* `balance`
* `currency`

Assume the schema has already been created and populated with sample data before starting the exercises.

> **Note:** The tables do not enforce foreign keys between each other. Missing references and `NULL` values should be handled correctly in all queries.

---

## Task 1

**File:** `team01_ex00.sql`

Create a query that calculates the total balance volume for each user and balance type.

Requirements:

Return the following columns:

| Column                | Description                                                                           |
| --------------------- | ------------------------------------------------------------------------------------- |
| `name`                | User name. Replace `NULL` with `'not defined'`.                                       |
| `lastname`            | User last name. Replace `NULL` with `'not defined'`.                                  |
| `type`                | Balance type.                                                                         |
| `volume`              | Sum of all balance transactions grouped by user and balance type.                     |
| `currency_name`       | Currency name. Replace missing values with `'not defined'`.                           |
| `last_rate_to_usd`    | Most recent exchange rate for the corresponding currency. If unavailable, return `1`. |
| `total_volume_in_usd` | `volume * last_rate_to_usd`.                                                          |

Additional requirements:

* include all available balance records, even if the corresponding user or currency does not exist;
* for each currency use the latest available exchange rate;
* replace missing user names, last names, and currency names with `'not defined'`;
* use `1` when no exchange rate exists.

Sort the result by:

1. `name` descending;
2. `lastname` ascending;
3. `type` ascending.

---

## Task 2

**File:** `team01_ex01.sql`

Before completing the task, insert the following records:

```sql
INSERT INTO currency
VALUES (100, 'EUR', 0.85, '2022-01-01 13:29');

INSERT INTO currency
VALUES (100, 'EUR', 0.79, '2022-01-08 13:29');
```

Create a query that returns every balance transaction together with the corresponding currency value in USD.

Return the following columns:

| Column            | Description                                                                    |
| ----------------- | ------------------------------------------------------------------------------ |
| `name`            | User name. Replace `NULL` with `'not defined'`.                                |
| `lastname`        | User last name. Replace `NULL` with `'not defined'`.                           |
| `currency_name`   | Currency name.                                                                 |
| `currency_in_usd` | Transaction amount converted to USD using the nearest available exchange rate. |

Exchange rate selection rules:

* first, use the most recent exchange rate whose timestamp is **earlier than or equal to** the transaction timestamp;
* if no earlier rate exists, use the nearest exchange rate **after** the transaction timestamp;
* ignore balance records whose currency does not exist in the `currency` table.

Sort the result by:

1. `name` descending;
2. `lastname` ascending;
3. `currency_name` ascending.
