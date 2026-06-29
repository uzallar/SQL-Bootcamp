# SQL Practice Tasks — Aggregate Queries and Analytical Operations

## Database Schema

The tasks use the following database structure.

### `pizzeria`

Stores information about available restaurants.

- `id` — primary key
- `name` — restaurant name
- `rating` — average customer rating

### `person`

Stores customer information.

- `id` — primary key
- `name` — customer name
- `age` — age
- `gender` — gender
- `address` — address

### `menu`

Contains pizzas available in each restaurant.

- `id` — primary key
- `pizzeria_id` — foreign key referencing `pizzeria`
- `pizza_name` — pizza name
- `price` — pizza price

### `person_visits`

Stores customer visit history.

- `id` — primary key
- `person_id` — foreign key referencing `person`
- `pizzeria_id` — foreign key referencing `pizzeria`
- `visit_date` — visit date

### `person_order`

Stores customer order history.

- `id` — primary key
- `person_id` — foreign key referencing `person`
- `menu_id` — foreign key referencing `menu`
- `order_date` — order date

> **Note:** These tasks assume that all schema changes and data modifications introduced in previous exercises have already been applied.

---

## Task 1

**File:** `day07_ex00.sql`

Write an SQL query that returns the identifier of each customer together with the total number of restaurant visits.

Requirements:

- calculate the total number of visits from `person_visits`;
- return:
  - `person_id`;
  - `count_of_visits`;
- sort by:
  1. `count_of_visits` in descending order;
  2. `person_id` in ascending order.

Expected output:

| person_id | count_of_visits |
|-----------|----------------:|
| 9 | 4 |
| 4 | 3 |

---

## Task 2

**File:** `day07_ex01.sql`

Modify the previous query so that it displays customer names instead of identifiers.

Requirements:

- join with the `person` table;
- return only the four customers with the highest number of visits;
- sort the final result alphabetically by customer name.

Expected output:

| name | count_of_visits |
|------|----------------:|
| Dmitriy | 4 |
| Denis | 3 |

---

## Task 3

**File:** `day07_ex02.sql`

Determine the three most popular restaurants based on visits and orders.

Requirements:

- calculate statistics separately for visits and orders;
- add an `action_type` column containing either `'visit'` or `'order'`;
- return the three most popular restaurants for each category;
- sort by:
  1. `action_type` (ascending);
  2. `count` (descending).

Expected output:

| name | count | action_type |
|------|------:|-------------|
| Dominos | 6 | order |
| ... | ... | ... |
| Dominos | 7 | visit |
| ... | ... | ... |

---

## Task 4

**File:** `day07_ex03.sql`

Create a combined report containing restaurant statistics for both visits and orders.

Requirements:

- aggregate visit counts;
- aggregate order counts;
- combine both datasets by restaurant name;
- calculate the total number of interactions as `total_count`;
- include restaurants even if they exist in only one dataset;
- sort by:
  1. `total_count` (descending);
  2. restaurant name (ascending).

Expected output:

| name | total_count |
|------|------------:|
| Dominos | 13 |
| DinoPizza | 9 |

---

## Task 5

**File:** `day07_ex04.sql`

> **Forbidden:** `WHERE`

Return customers who have visited restaurants more than three times.

Requirements:

- return:
  - customer name;
  - number of visits;
- perform filtering using grouping logic instead of a `WHERE` clause.

Expected output:

| name | count_of_visits |
|------|----------------:|
| Dmitriy | 4 |

---

## Task 6

**File:** `day07_ex05.sql`

> **Forbidden:**
>
> - `GROUP BY`
> - set operators (`UNION`, `INTERSECT`, `EXCEPT`, etc.)

Return the list of unique customer names that have placed at least one order.

Requirements:

- eliminate duplicates;
- sort alphabetically.

Expected output:

| name |
|------|
| Andrey |
| Anna |
| ... |

---

## Task 7

**File:** `day07_ex06.sql`

Calculate summary statistics for every restaurant.

Return:

- restaurant name;
- total number of orders;
- average pizza price (rounded to two decimal places);
- maximum pizza price;
- minimum pizza price.

Sort the result alphabetically by restaurant name.

Expected output:

| name | count_of_orders | average_price | max_price | min_price |
|------|----------------:|--------------:|----------:|----------:|
| Best Pizza | 5 | 780.00 | 850 | 700 |
| DinoPizza | 5 | 880.00 | 1000 | 800 |

---

## Task 8

**File:** `day07_ex07.sql`

Calculate the overall average restaurant rating.

Requirements:

- return a single column named `global_rating`;
- round the result to four decimal places.

---

## Task 9

**File:** `day07_ex08.sql`

Generate restaurant statistics grouped by customer address.

Assume that customers visit restaurants located in the same city as their address.

Return:

- address;
- restaurant name;
- total number of customer orders.

Sort by:

1. address;
2. restaurant name.

Expected output:

| address | name | count_of_orders |
|---------|------|----------------:|
| Kazan | Best Pizza | 4 |
| Kazan | DinoPizza | 4 |

---

## Task 10

**File:** `day07_ex09.sql`

Generate aggregated statistics for each address.

Return:

- `address`;
- `formula`, calculated as:

```sql
MAX(age) - (MIN(age) / MAX(age))
```

- average age (`average`);
- a Boolean column named `comparison` indicating whether the calculated formula is greater than the average age.

Requirements:

- round numeric values where appropriate;
- sort the result by address.

Expected output:

| address | formula | average | comparison |
|---------|---------:|--------:|:----------:|
| Kazan | 44.71 | 30.33 | true |
| Moscow | 20.24 | 18.50 | true |
| ... | ... | ... | ... |

