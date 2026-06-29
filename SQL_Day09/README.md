# SQL Practice Tasks — Triggers and Database Functions

## Database Schema

The tasks use the same database schema introduced in previous exercises.

> **Note:** These exercises assume that all schema changes and data modifications from previous tasks have already been applied.

---

## Task 1

**File:** `day09_ex00.sql`

Implement an audit mechanism for `INSERT` operations on the `person` table.

Requirements:

* create a table named `person_audit`;
* use the same columns as `person` and add the following fields:

| Column       | Type                       | Description                                                                                  |
| ------------ | -------------------------- | -------------------------------------------------------------------------------------------- |
| `created`    | `timestamp with time zone` | creation timestamp, default current timestamp, `NOT NULL`                                    |
| `type_event` | `char(1)`                  | event type (`I`, `U`, `D`), default `'I'`, `NOT NULL`, with check constraint `ch_type_event` |
| `row_id`     | `bigint`                   | copy of `person.id`, `NOT NULL`                                                              |
| `name`       | `varchar`                  | copied value                                                                                 |
| `age`        | `integer`                  | copied value                                                                                 |
| `gender`     | `varchar`                  | copied value                                                                                 |
| `address`    | `varchar`                  | copied value                                                                                 |

Create:

* trigger function `fnc_trg_person_insert_audit`;
* trigger `trg_person_insert_audit` with:

  * `AFTER INSERT`;
  * `FOR EACH ROW`.

Verify the trigger using:

```sql
INSERT INTO person(id, name, age, gender, address)
VALUES (10, 'Damir', 22, 'male', 'Irkutsk');
```

---

## Task 2

**File:** `day09_ex01.sql`

Extend the audit mechanism to handle `UPDATE` operations.

Requirements:

* create trigger function `fnc_trg_person_update_audit`;
* create trigger `trg_person_update_audit`;
* store the **previous** values of the modified row.

Verify using:

```sql
UPDATE person
SET name = 'Bulat'
WHERE id = 10;

UPDATE person
SET name = 'Damir'
WHERE id = 10;
```

---

## Task 3

**File:** `day09_ex02.sql`

Implement auditing for `DELETE` operations.

Requirements:

* create trigger function `fnc_trg_person_delete_audit`;
* create trigger `trg_person_delete_audit`;
* store the deleted row in `person_audit`.

Verify using:

```sql
DELETE FROM person
WHERE id = 10;
```

---

## Task 4

**File:** `day09_ex03.sql`

Replace the three audit triggers with a single generic implementation.

Requirements:

* remove the existing audit triggers;
* remove the corresponding trigger functions;
* clear the `person_audit` table;
* create a new trigger function named `fnc_trg_person_audit`;
* create a trigger named `trg_person_audit`;
* handle `INSERT`, `UPDATE`, and `DELETE` inside one function using separate `IF / ELSIF` branches.

Verify using:

```sql
INSERT INTO person(id, name, age, gender, address)
VALUES (10, 'Damir', 22, 'male', 'Irkutsk');

UPDATE person
SET name = 'Bulat'
WHERE id = 10;

UPDATE person
SET name = 'Damir'
WHERE id = 10;

DELETE FROM person
WHERE id = 10;
```

---

## Task 5

**File:** `day09_ex04.sql`

Create SQL functions that return customers filtered by gender.

Create the following functions:

* `fnc_persons_female`
* `fnc_persons_male`

Both functions should return table data and can be queried as:

```sql
SELECT *
FROM fnc_persons_male();

SELECT *
FROM fnc_persons_female();
```

---

## Task 6

**File:** `day09_ex05.sql`

Replace the previous functions with a parameterized version.

Requirements:

* remove the functions created in Task 5;
* create a SQL function named `fnc_persons`;
* add an input parameter:

```text
pgender DEFAULT 'female'
```

The function should return customers matching the specified gender.

Examples:

```sql
SELECT *
FROM fnc_persons(pgender := 'male');

SELECT *
FROM fnc_persons();
```

---

## Task 7

**File:** `day09_ex06.sql`

Create a PL/pgSQL function named `fnc_person_visits_and_eats_on_date`.

Input parameters:

| Parameter | Default value  |
| --------- | -------------- |
| `pperson` | `'Dmitriy'`    |
| `pprice`  | `500`          |
| `pdate`   | `'2022-01-08'` |

The function should return the names of restaurants that:

* were visited by the specified customer on the selected date;
* offered at least one pizza cheaper than the specified price.

Example calls:

```sql
SELECT *
FROM fnc_person_visits_and_eats_on_date(pprice := 800);

SELECT *
FROM fnc_person_visits_and_eats_on_date(
    pperson := 'Anna',
    pprice := 1300,
    pdate := '2022-01-01'
);
```

---

## Task 8

**File:** `day09_ex07.sql`

Implement a function named `func_minimum`.

Requirements:

* accept a variable-length array of numeric values;
* return the minimum value.

Example:

```sql
SELECT func_minimum(
    VARIADIC arr => ARRAY[10.0, -1.0, 5.0, 4.4]
);
```

---

## Task 9

**File:** `day09_ex08.sql`

Create a function named `fnc_fibonacci`.

Requirements:

* accept an integer parameter `pstop`;
* default value: `10`;
* return all Fibonacci numbers smaller than `pstop`.

Example:

```sql
SELECT *
FROM fnc_fibonacci(100);

SELECT *
FROM fnc_fibonacci();
```
