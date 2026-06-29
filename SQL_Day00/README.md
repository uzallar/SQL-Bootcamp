# SQL Practice Tasks

## Database Schema

**`pizzeria` table** — pizzeria directory
- `id` — primary key
- `name` — pizzeria name
- `rating` — average rating (0 to 5)

**`person` table** — customer directory
- `id` — primary key
- `name` — person's name
- `age` — age
- `gender` — gender
- `address` — address

**`menu` table** — menu directory
- `id` — primary key
- `pizzeria_id` — foreign key to `pizzeria`
- `pizza_name` — pizza name
- `price` — price

**`person_visits` table** — visit history
- `id` — primary key
- `person_id` — foreign key to `person`
- `pizzeria_id` — foreign key to `pizzeria`
- `visit_date` — date of visit (e.g. 2022-01-01)

**`person_order` table** — order history
- `id` — primary key
- `person_id` — foreign key to `person`
- `menu_id` — foreign key to `menu`
- `order_date` — date of order (e.g. 2022-01-01)

---

## Task 1

**File:** `task_01.sql`

Write a SELECT statement that returns the names and ages of all people from the city of Kazan.

---

## Task 2

**File:** `task_02.sql`

Write a SELECT statement that returns the names and ages of women from the city of Kazan. Sort the result by name.

---

## Task 3

**File:** `task_03.sql`

Write **two syntactically different** queries that return a list of pizzerias (name and rating) with a rating between 3.5 and 5 inclusive, ordered by rating.

- The first query must use comparison operators (`<=`, `>=`).
- The second query must use the `BETWEEN` keyword.

---

## Task 4

**File:** `task_04.sql`

Write a SELECT statement that returns unique person identifiers who either visited pizzerias between January 6 and January 9, 2022 (inclusive), or visited the pizzeria with ID 2. Sort the result by person ID in descending order.

---

## Task 5

**File:** `task_05.sql`

Write a SELECT statement that returns a single calculated field named `person_information`, formatted as follows:

```
Anna (age:16,gender:'female',address:'Moscow')
```

Sort the result by this field in ascending order. Pay attention to the quotation marks in the formula.

---

## Task 6

**File:** `task_06.sql`

> **Forbidden:** `IN`, any type of `JOIN`

Write a query that returns person names (via a subquery in the `SELECT` clause) for orders placed for menu items with IDs 13, 14, and 18, with an order date of January 7, 2022.

Query template:
```sql
SELECT
    (SELECT ...) AS NAME
FROM ...
WHERE ...
```

---

## Task 7

**File:** `task_07.sql`

> **Forbidden:** `IN`, any type of `JOIN`

Extend the query from Task 6 by adding a calculated column named `check_name` based on the following condition:

```
if (person_name == 'Denis') → return true
else → return false
```

---

## Task 8

**File:** `task_08.sql`

Write a query that returns each person's ID, name, and an age interval label (`interval_info`) based on the following logic:

```
if (age >= 10 and age <= 20) → 'interval #1'
else if (age > 20 and age < 24) → 'interval #2'
else → 'interval #3'
```

Sort the result by `interval_info` in ascending order.

---

## Task 9

**File:** `task_09.sql`

Write a query that returns all rows from the `person_order` table where the ID is an even number. Sort the result by ID.

---

## Task 10

**File:** `task_10.sql`

> **Forbidden:** any type of `JOIN`

Write a query that returns person names and pizzeria names from the `person_visits` table for visits between January 7 and January 9, 2022 (inclusive). Use subqueries in both the `SELECT` and `FROM` clauses.

Query template:
```sql
SELECT (...) AS person_name,
       (...) AS pizzeria_name
FROM (SELECT … FROM person_visits WHERE …) AS pv
ORDER BY ...
```

Sort by person name in ascending order and by pizzeria name in descending order.
