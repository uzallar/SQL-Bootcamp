# SQL Practice Tasks — Database Design and Data Integrity

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

> **Note:** These tasks assume that all database changes from previous exercises have already been applied, including data modifications introduced in earlier DML and view-related tasks.

---

## Task 1

**File:** `day06_ex00.sql`

Introduce a new feature for managing customer-specific discounts.

Create a table named `person_discounts` with the following structure:

- `id` — primary key (use the same data type as other table identifiers);
- `person_id` — foreign key referencing `person`;
- `pizzeria_id` — foreign key referencing `pizzeria`;
- `discount` — discount percentage stored as a `numeric` value.

Use the following naming convention for foreign key constraints:

```
fk_{table_name}_{column_name}
```

Example:

```
fk_person_discounts_person_id
```

---

## Task 2

**File:** `day06_ex01.sql`

Populate the `person_discounts` table using data from `person_order`.

Requirements:

- use `INSERT INTO ... SELECT`;
- aggregate records by `person_id` and `pizzeria_id`;
- assign discount values according to the total number of orders:

| Number of Orders | Discount |
|-----------------:|---------:|
| 1 | 10.5 |
| 2 | 22 |
| 3 or more | 30 |

Generate primary keys using:

```sql
ROW_NUMBER() OVER ()
```

---

## Task 3

**File:** `day06_ex02.sql`

Return the order history including:

- customer name;
- pizza name;
- original price;
- discounted price;
- pizzeria name.

The discounted price should be calculated using the customer's personal discount from the `person_discounts` table.

Sort the result by customer name and pizza name.

| name | pizza_name | price | discount_price | pizzeria_name |
|------|------------|------:|---------------:|---------------|
| Andrey | cheese pizza | 800 | 624 | Dominos |
| Andrey | mushroom pizza | 1100 | 858 | Dominos |
| ... | ... | ... | ... | ... |

---

## Task 4

**File:** `day06_ex03.sql`

Create a unique multi-column index named:

```
idx_person_discounts_unique
```

The index must prevent duplicate combinations of:

- `person_id`
- `pizzeria_id`

Provide a simple query together with `EXPLAIN ANALYZE` demonstrating that the index is used.

---

## Task 5

**File:** `day06_ex04.sql`

Improve data integrity by adding the following constraints to the `person_discounts` table:

- `person_id` must be `NOT NULL` (constraint name `ch_nn_person_id`);
- `pizzeria_id` must be `NOT NULL` (constraint name `ch_nn_pizzeria_id`);
- `discount` must be `NOT NULL` (constraint name `ch_nn_discount`);
- set the default value of `discount` to `0`;
- restrict `discount` to values between `0` and `100` using a check constraint named `ch_range_discount`.

---

## Task 6

**File:** `day06_ex05.sql`

Add descriptive comments to the `person_discounts` table and each of its columns.

The comments may be written in either English or Russian and should explain the business purpose of the table and its attributes.

---

## Task 7

**File:** `day06_ex06.sql`

> **Forbidden:** using hardcoded row counts when initializing the sequence.

Create a database sequence named:

```
seq_person_discounts
```

Requirements:

- the sequence should start from `1`;
- configure the `id` column of `person_discounts` to use the sequence as its default value;
- adjust the current sequence value so that the next generated identifier equals:

```
(number of existing rows in person_discounts) + 1
```

This ensures that newly inserted records do not violate the primary key constraint.
