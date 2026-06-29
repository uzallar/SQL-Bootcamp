# SQL Practice Tasks — Database Indexing and Query Optimization

## Database Schema

**`pizzeria`** — pizzeria directory
- `id` — primary key
- `name` — pizzeria name
- `rating` — average rating (0 to 5)

**`person`** — customer directory
- `id` — primary key
- `name` — person's name
- `age` — age
- `gender` — gender
- `address` — address

**`menu`** — available pizzas
- `id` — primary key
- `pizzeria_id` — foreign key to `pizzeria`
- `pizza_name` — pizza name
- `price` — price

**`person_visits`** — visit history
- `id` — primary key
- `person_id` — foreign key to `person`
- `pizzeria_id` — foreign key to `pizzeria`
- `visit_date` — date of visit

**`person_order`** — order history
- `id` — primary key
- `person_id` — foreign key to `person`
- `menu_id` — foreign key to `menu`
- `order_date` — date of order

> **Note:** These tasks assume that all database changes from the previous exercises have already been applied.

---

## Task 1

**File:** `day05_ex00.sql`

Create a B-tree index for every foreign key in the database.

Use the naming convention:

```
idx_{table_name}_{column_name}
```

Example:

```
idx_menu_pizzeria_id
```

---

## Task 2

**File:** `day05_ex01.sql`

Write a query that returns pizza names together with their corresponding pizzeria names.

Then verify that the indexes created in **Task 1** are used by the query using `EXPLAIN ANALYZE`.

| pizza_name | pizzeria_name |
|------------|---------------|
| cheese pizza | Pizza Hut |
| ... | ... |

---

## Task 3

**File:** `day05_ex02.sql`

Create a functional B-tree index named `idx_person_name` on the `person` table using the uppercase version of the `name` column.

Provide an example query together with `EXPLAIN ANALYZE` demonstrating that the index is used.

---

## Task 4

**File:** `day05_ex03.sql`

Create a multi-column B-tree index named `idx_person_order_multi` optimized for the following query:

```sql
SELECT person_id, menu_id, order_date
FROM person_order
WHERE person_id = 8
  AND menu_id = 19;
```

Verify that PostgreSQL performs an **Index Only Scan** by using `EXPLAIN ANALYZE`.

---

## Task 5

**File:** `day05_ex04.sql`

Create a unique B-tree index named `idx_menu_unique` on the following columns:

- `pizzeria_id`
- `pizza_name`

Provide a query together with `EXPLAIN ANALYZE` showing that the index is used.

---

## Task 6

**File:** `day05_ex05.sql`

Create a partially unique B-tree index named `idx_person_order_order_date` on:

- `person_id`
- `menu_id`

The uniqueness constraint should apply only to rows where:

```
order_date = '2022-01-01'
```

Verify the index with `EXPLAIN ANALYZE`.

---

## Task 7

**File:** `day05_ex06.sql`

Optimize the execution time of the following query by creating a new B-tree index named `idx_1`.

```sql
SELECT
    m.pizza_name AS pizza_name,
    MAX(rating) OVER (
        PARTITION BY rating
        ORDER BY rating
        ROWS BETWEEN UNBOUNDED PRECEDING
        AND UNBOUNDED FOLLOWING
    ) AS k
FROM menu m
INNER JOIN pizzeria pz
    ON m.pizzeria_id = pz.id
ORDER BY 1, 2;
```

Demonstrate the improvement by comparing the output of `EXPLAIN ANALYZE` before and after creating the index.
