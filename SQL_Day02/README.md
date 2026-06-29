# SQL Practice Tasks — Deep Dive into JOINs

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

**File:** `day02_ex00.sql`

> **Forbidden:** `NOT IN`, `IN`, `NOT EXISTS`, `EXISTS`, `UNION`, `EXCEPT`, `INTERSECT`

Write a SQL statement that returns a list of pizzerias with their rating that have not been visited by anyone.

---

## Task 2

**File:** `day02_ex01.sql`

> **Allowed:** `generate_series(...)`
> **Forbidden:** `NOT IN`, `IN`, `NOT EXISTS`, `EXISTS`, `UNION`, `EXCEPT`, `INTERSECT`

Write a SQL statement that returns the dates missing from January 1 through January 10, 2022 (inclusive) for visits by people with IDs 1 or 2 (i.e. days when neither of them visited). Order by date ascending.

| missing_date |
|--------------|
| 2022-01-03 |
| 2022-01-04 |
| 2022-01-05 |
| ... |

---

## Task 3

**File:** `day02_ex02.sql`

> **Forbidden:** `NOT IN`, `IN`, `NOT EXISTS`, `EXISTS`, `UNION`, `EXCEPT`, `INTERSECT`

Write a SQL statement that returns the full list of person names (whether they visited or not) and the full list of pizzeria names (whether they were visited or not) for the period from January 1 to January 3, 2022. Replace `NULL` values in `person_name` and `pizzeria_name` with `'-'`. Order by all 3 columns.

| person_name | visit_date | pizzeria_name |
|-------------|------------|---------------|
| - | null | DinoPizza |
| - | null | DoDo Pizza |
| Andrey | 2022-01-01 | Dominos |
| Andrey | 2022-01-02 | Pizza Hut |
| Anna | 2022-01-01 | Pizza Hut |
| Denis | null | - |
| Dmitriy | null | - |
| ... | ... | ... |

---

## Task 4

**File:** `day02_ex03.sql`

> **Allowed:** `generate_series(...)`
> **Forbidden:** `NOT IN`, `IN`, `NOT EXISTS`, `EXISTS`, `UNION`, `EXCEPT`, `INTERSECT`

Rewrite the query from Task 2 using the CTE (Common Table Expression) pattern. Move the date generation logic into the CTE. The result must be identical to Task 2.

| missing_date |
|--------------|
| 2022-01-03 |
| 2022-01-04 |
| 2022-01-05 |
| ... |

---

## Task 5

**File:** `day02_ex04.sql`

Find the pizza name, pizzeria name, and price for all pizzerias that offer mushroom or pepperoni pizza. Sort the result by pizza name, then by pizzeria name.

| pizza_name | pizzeria_name | price |
|------------|---------------|-------|
| mushroom pizza | Dominos | 1100 |
| mushroom pizza | Papa Johns | 950 |
| pepperoni pizza | Best Pizza | 800 |
| ... | ... | ... |

---

## Task 6

**File:** `day02_ex05.sql`

Find the names of all females over the age of 25. Sort the result by name.

| name |
|------|
| Elvira |
| ... |

---

## Task 7

**File:** `day02_ex06.sql`

Find all pizza names and their corresponding pizzeria names (from the `menu` table) that were ordered by Denis or Anna. Sort the result by both columns.

| pizza_name | pizzeria_name |
|------------|---------------|
| cheese pizza | Best Pizza |
| cheese pizza | Pizza Hut |
| ... | ... |

---

## Task 8

**File:** `day02_ex07.sql`

Find the name of the pizzeria that Dmitriy visited on January 8, 2022, where he could order pizza for less than 800 rubles.

---

## Task 9

**File:** `day02_ex08.sql`

Find the names of all men from Moscow or Samara who ordered either pepperoni or mushroom pizza (or both). Sort the result by name in descending order.

| name |
|------|
| Dmitriy |
| ... |

---

## Task 10

**File:** `day02_ex09.sql`

Find the names of all women who ordered both pepperoni and cheese pizza (at any time and at any pizzeria). Sort the result by name.

| name |
|------|
| Anna |
| ... |

---

## Task 11

**File:** `day02_ex10.sql`

Find pairs of people who live at the same address. Sort the result by the first person's name, the second person's name, and the shared address. Use the column names shown below.

| person_name1 | person_name2 | common_address |
|--------------|--------------|----------------|
| Andrey | Anna | Moscow |
| Denis | Kate | Kazan |
| Elvira | Denis | Kazan |
| ... | ... | ... |
