# SQL Practice Tasks — Views and Materialized Views

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

> **Note:** This task set assumes that all data modifications from the previous DML exercises have already been applied.

---

## Task 1

**File:** `day04_ex00.sql`

Create two database views based on the `person` table by filtering customers according to gender.

Use the following view names:

- `v_persons_female`
- `v_persons_male`

Each view should contain the same columns as the original table.

---

## Task 2

**File:** `day04_ex01.sql`

Using the views created in **Task 1**, return a combined list of all person names. Sort the result alphabetically.

| name |
|------|
| Andrey |
| Anna |
| ... |

---

## Task 3

**File:** `day04_ex02.sql`

> **Allowed:** `generate_series(...)`

Create a database view named `v_generated_dates` that contains every date from **2022-01-01** through **2022-01-31**.

Sort the generated dates in ascending order.

| generated_date |
|----------------|
| 2022-01-01 |
| 2022-01-02 |
| ... |

---

## Task 4

**File:** `day04_ex03.sql`

Using the `v_generated_dates` view, return all dates in **January 2022** when no visits were recorded.

Sort the result by `missing_date`.

| missing_date |
|--------------|
| 2022-01-11 |
| 2022-01-12 |
| ... |

---

## Task 5

**File:** `day04_ex04.sql`

Create a database view named `v_symmetric_union` that returns the symmetric difference between two sets of visits:

- **R** — records from `person_visits` on **2022-01-02**
- **S** — records from `person_visits` on **2022-01-06**

The result should contain only the `person_id` column and be sorted in ascending order.

The required set expression is:

```
(R − S) ∪ (S − R)
```

| person_id |
|----------:|
| 1 |
| 3 |
| ... |

---

## Task 6

**File:** `day04_ex05.sql`

Create a database view named `v_price_with_discount`.

The view should return:

- customer name;
- pizza name;
- original price;
- discounted price with a **10%** reduction.

Calculate the discounted value as:

```
price - price * 0.1
```

Convert `discount_price` to an integer and sort the result by customer name and pizza name.

| name | pizza_name | price | discount_price |
|------|------------|------:|---------------:|
| Andrey | cheese pizza | 800 | 720 |
| Andrey | mushroom pizza | 1100 | 990 |
| ... | ... | ... | ... |

---

## Task 7

**File:** `day04_ex06.sql`

Create a materialized view named `mv_dmitriy_visits_and_eats`.

Populate it with the result of the query that finds the pizzeria visited by **Dmitriy** on **2022-01-08**, where pizzas priced below **800** were available.

---

## Task 8

**File:** `day04_ex07.sql`

> **Forbidden:** hardcoded primary key values, `person_id`, and `pizzeria_id`

Insert a new visit for **Dmitriy** that satisfies the same conditions used to build `mv_dmitriy_visits_and_eats`, but for a different pizzeria.

After inserting the new record, refresh the materialized view so that it reflects the updated data.

---

## Task 9

**File:** `day04_ex08.sql`

Remove all database views and materialized views created throughout these exercises.
