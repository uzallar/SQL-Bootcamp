# SQL Practice Tasks — Sets & JOINs

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

**`menu`** — menu directory
- `id` — primary key
- `pizzeria_id` — foreign key to `pizzeria`
- `pizza_name` — pizza name
- `price` — price

**`person_visits`** — visit history
- `id` — primary key
- `person_id` — foreign key to `person`
- `pizzeria_id` — foreign key to `pizzeria`
- `visit_date` — date of visit (e.g. 2022-01-01)

**`person_order`** — order history
- `id` — primary key
- `person_id` — foreign key to `person`
- `menu_id` — foreign key to `menu`
- `order_date` — date of order (e.g. 2022-01-01)

> Note: visits and orders are independent entities. A person can be physically present at one pizzeria while placing a phone/app order at another — or order from home without visiting anywhere.

---

## Task 1

**File:** `day01_ex00.sql`

Write a SQL statement that returns menu IDs and pizza names from the `menu` table combined with person IDs and person names from the `person` table into a single list. Use the column names `object_id` and `object_name`. Order by `object_id`, then by `object_name`.

| object_id | object_name |
|-----------|-------------|
| 1 | Anna |
| 1 | cheese pizza |
| ... | ... |

---

## Task 2

**File:** `day01_ex01.sql`

Modify the query from Task 1 by removing the `object_id` column. Keep duplicates. Show person names first (sorted alphabetically), then pizza names (sorted alphabetically).

| object_name |
|-------------|
| Andrey |
| Anna |
| ... |
| cheese pizza |
| cheese pizza |
| ... |

---

## Task 3

**File:** `day01_ex02.sql`

> **Forbidden:** `DISTINCT`, `GROUP BY`, `HAVING`, any type of `JOIN`

Write a SQL statement that returns unique pizza names from the `menu` table, sorted by `pizza_name` in descending order.

---

## Task 4

**File:** `day01_ex03.sql`

> **Forbidden:** any type of `JOIN`

Write a SQL statement that finds person IDs who both visited a pizzeria and placed an order on the same day. Use `order_date`/`person_id` from `person_order` and `visit_date`/`person_id` from `person_visits`. Name the date column `action_date`. Order by `action_date` ascending, then by `person_id` descending.

| action_date | person_id |
|-------------|-----------|
| 2022-01-01 | 6 |
| 2022-01-01 | 2 |
| 2022-01-01 | 1 |
| 2022-01-03 | 7 |
| ... | ... |

---

## Task 5

**File:** `day01_ex04.sql`

> **Forbidden:** any type of `JOIN`

Write a SQL statement that returns the difference (EXCEPT) of `person_id` values — preserving duplicates — between `person_order` and `person_visits`, filtered to January 7, 2022 only.

---

## Task 6

**File:** `day01_ex05.sql`

Write a SQL statement that returns all possible combinations of rows from the `person` and `pizzeria` tables (Cartesian product). Order by person ID, then by pizzeria ID.

| person.id | person.name | age | gender | address | pizzeria.id | pizzeria.name | rating |
|-----------|-------------|-----|--------|---------|-------------|---------------|--------|
| 1 | Anna | 16 | female | Moscow | 1 | Pizza Hut | 4.6 |
| 1 | Anna | 16 | female | Moscow | 2 | Dominos | 4.3 |
| ... | ... | ... | ... | ... | ... | ... | ... |

---

## Task 7

**File:** `day01_ex06.sql`

Rewrite the query from Task 4 to return person **names** instead of person IDs. Order by `action_date` ascending, then by `person_name` descending.

| action_date | person_name |
|-------------|-------------|
| 2022-01-01 | Irina |
| 2022-01-01 | Anna |
| 2022-01-01 | Andrey |
| ... | ... |

---

## Task 8

**File:** `day01_ex07.sql`

Write a SQL statement that returns the order date from `person_order` and the corresponding person's name and age (formatted as shown) from `person`. Sort both columns in ascending order.

| order_date | person_information |
|------------|--------------------|
| 2022-01-01 | Andrey (age:21) |
| 2022-01-01 | Andrey (age:21) |
| 2022-01-01 | Anna (age:16) |
| ... | ... |

---

## Task 9

**File:** `day01_ex08.sql`

> **Allowed:** `NATURAL JOIN` only
> **Forbidden:** any other type of `JOIN`

Rewrite the query from Task 8 using `NATURAL JOIN`. The result must be identical.

---

## Task 10

**File:** `day01_ex09.sql`

Write **two** SQL statements that return a list of pizzerias that have never been visited by anyone — one using `IN` and one using `EXISTS`.

---

## Task 11

**File:** `day01_ex10.sql`

Write a SQL statement that returns the names of people, the pizzas they ordered, and the pizzeria those pizzas came from. Order by `person_name`, `pizza_name`, and `pizzeria_name` — all ascending.

| person_name | pizza_name | pizzeria_name |
|-------------|------------|---------------|
| Andrey | cheese pizza | Dominos |
| Andrey | mushroom pizza | Dominos |
| Anna | cheese pizza | Pizza Hut |
| ... | ... | ... |
