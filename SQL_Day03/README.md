# SQL Practice Tasks — Data Manipulation (DML)

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

> Note: visits and orders are independent entities. A customer may visit one pizzeria while placing an order at another, or place an order remotely without visiting.

---

## Task 1

**File:** `day03_ex00.sql`

Retrieve the pizza name, price, pizzeria name, and visit date for **Kate**, considering only pizzas priced between **800** and **1000**. Sort the result by pizza name, price, and pizzeria name.

| pizza_name | price | pizzeria_name | visit_date |
|------------|------:|---------------|------------|
| cheese pizza | 950 | DinoPizza | 2022-01-04 |
| pepperoni pizza | 800 | Best Pizza | 2022-01-03 |
| ... | ... | ... | ... |

---

## Task 2

**File:** `day03_ex01.sql`

> **Forbidden:** any type of `JOIN`

Find all menu identifiers that have never been ordered. Sort the result by identifier.

| menu_id |
|---------|
| 5 |
| 10 |
| ... |

---

## Task 3

**File:** `day03_ex02.sql`

Using the query from **Task 2**, display the names of pizzas that have never been ordered, along with their prices and the corresponding pizzeria names. Sort by pizza name and price.

| pizza_name | price | pizzeria_name |
|------------|------:|---------------|
| cheese pizza | 700 | Papa Johns |
| cheese pizza | 780 | DoDo Pizza |
| ... | ... | ... |

---

## Task 4

**File:** `day03_ex03.sql`

Find pizzerias that were visited more frequently by women than men, or more frequently by men than women. Preserve duplicate rows when using set operations. Sort the result by pizzeria name.

| pizzeria_name |
|---------------|
| Best Pizza |
| Dominos |
| ... |

---

## Task 5

**File:** `day03_ex04.sql`

Find the union of pizzerias that received orders **only from women** and pizzerias that received orders **only from men**. Do not keep duplicates. Sort the result alphabetically.

| pizzeria_name |
|---------------|
| Papa Johns |
| ... |

---

## Task 6

**File:** `day03_ex05.sql`

Find all pizzerias that **Andrey** visited but never placed an order from. Sort by pizzeria name.

| pizzeria_name |
|---------------|
| Pizza Hut |
| ... |

---

## Task 7

**File:** `day03_ex06.sql`

Find pizzas that have the same name and the same price but are offered by different pizzerias. Use the column names shown below and sort by pizza name.

| pizza_name | pizzeria_name_1 | pizzeria_name_2 | price |
|------------|-----------------|-----------------|------:|
| cheese pizza | Best Pizza | Papa Johns | 700 |
| ... | ... | ... | ... |

---

## Task 8

**File:** `day03_ex07.sql`

Insert a new menu item named **"greek pizza"** with:

- `id = 19`
- `price = 800`
- `pizzeria_id = 2` (Dominos)

---

## Task 9

**File:** `day03_ex08.sql`

> **Forbidden:** hardcoded primary key values and hardcoded `pizzeria_id`

Insert a new pizza named **"sicilian pizza"**.

Requirements:

- calculate the new `id` as `MAX(id) + 1`;
- set the price to `900`;
- determine the `pizzeria_id` using a subquery.

---

## Task 10

**File:** `day03_ex09.sql`

> **Forbidden:** hardcoded primary key values and hardcoded `pizzeria_id`

Record new visits to **Dominos** by **Denis** and **Irina** on **2022-02-24**.

---

## Task 11

**File:** `day03_ex10.sql`

> **Forbidden:** hardcoded primary key values and hardcoded `pizzeria_id`

Register new orders for **Denis** and **Irina** on **2022-02-24** for **"sicilian pizza"**.

---

## Task 12

**File:** `day03_ex11.sql`

Update the price of **"greek pizza"** by reducing it by **10%**.

---

## Task 13

**File:** `day03_ex12.sql`

> **Allowed:** `generate_series(...)`, `INSERT INTO ... SELECT ...`
>
> **Forbidden:**
> - hardcoded primary key values;
> - hardcoded `menu_id`;
> - window functions such as `ROW_NUMBER()`;
> - individual `INSERT` statements.

Register new orders for **every customer** for **"greek pizza"** on **2022-02-25**.

---

## Task 14

**File:** `day03_ex13.sql`

Write two SQL statements:

1. Delete all orders created in **Task 13** based on the order date.
2. Remove **"greek pizza"** from the menu.
