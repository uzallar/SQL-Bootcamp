# SQL Practice Tasks — Transactions and Isolation Levels

## Database Schema

The tasks use the same database schema introduced in previous exercises.

> **Note:** These exercises assume that all schema changes and data modifications from previous tasks have already been applied.

---

## Task 1

**File:** `day08_ex00.sql`

Use two parallel `psql` sessions to demonstrate transaction visibility.

Submit:

* `day08_ex00.sql` containing SQL statements for both sessions with comments;
* a screenshot of Session 1;
* a screenshot of Session 2.

Requirements:

**Session 1**

* start a transaction;
* update the rating of **Pizza Hut** to `5`;
* verify that the updated value is visible inside the current transaction.

**Session 2**

* query the same record before Session 1 commits;
* verify that the old value is still visible.

**Session 1**

* commit the transaction.

**Session 2**

* execute the same query again;
* verify that the committed value is now visible.

---

## Task 2

**File:** `day08_ex01.sql`

Demonstrate the **Lost Update** anomaly using the default `READ COMMITTED` isolation level.

Submit:

* `day08_ex01.sql` with statements for both sessions;
* screenshots of both sessions.

Requirements:

* verify that the transaction isolation level is `READ COMMITTED`;
* if necessary, explicitly set the isolation level;
* use two concurrent sessions;
* both sessions should read the rating of **Pizza Hut**;
* update the rating to `4` in Session 1;
* update the rating to `3.6` in Session 2;
* observe the final result after both transactions complete.

---

## Task 3

**File:** `day08_ex02.sql`

Repeat the previous experiment using the `REPEATABLE READ` isolation level.

Submit:

* `day08_ex02.sql` with statements for both sessions;
* screenshots of both sessions.

Requirements:

* configure both sessions to use `REPEATABLE READ`;
* read the current rating of **Pizza Hut**;
* update the rating to `4` in Session 1;
* update the rating to `3.6` in Session 2;
* analyze the transaction behavior under this isolation level.

---

## Task 4

**File:** `day08_ex03.sql`

Demonstrate the **Non-Repeatable Read** anomaly under the `READ COMMITTED` isolation level.

Submit:

* `day08_ex03.sql` with statements for both sessions;
* screenshots of both sessions.

Requirements:

**Session 1**

* start a transaction;
* read the rating of **Pizza Hut**.

**Session 2**

* update the rating to `3.6`;
* commit the transaction.

**Session 1**

* execute the same query again within the same transaction;
* compare the results.

---

## Task 5

**File:** `day08_ex04.sql`

Repeat the previous experiment using the `SERIALIZABLE` isolation level.

Submit:

* `day08_ex04.sql` with statements for both sessions;
* screenshots of both sessions.

Requirements:

* configure Session 1 to use `SERIALIZABLE`;
* read the rating of **Pizza Hut**;
* update the rating to `3.0` in Session 2;
* execute the same query again in Session 1;
* analyze the observed behavior.

---

## Task 6

**File:** `day08_ex05.sql`

Demonstrate the **Phantom Read** anomaly under the `READ COMMITTED` isolation level.

Submit:

* `day08_ex05.sql` with statements for both sessions;
* screenshots of both sessions.

Requirements:

**Session 1**

* start a transaction;
* calculate the total sum of all restaurant ratings.

**Session 2**

* insert a new restaurant:

```sql
INSERT INTO pizzeria (id, name, rating)
VALUES (10, 'Kazan Pizza', 5);
```

* commit the transaction.

**Session 1**

* execute the aggregate query again;
* compare the results.

---

## Task 7

**File:** `day08_ex06.sql`

Repeat the phantom read experiment using the `REPEATABLE READ` isolation level.

Submit:

* `day08_ex06.sql` with statements for both sessions;
* screenshots of both sessions.

Requirements:

**Session 1**

* start a transaction using `REPEATABLE READ`;
* calculate the total sum of restaurant ratings.

**Session 2**

* insert a new restaurant:

```sql
INSERT INTO pizzeria (id, name, rating)
VALUES (11, 'Kazan Pizza 2', 4);
```

* commit the transaction.

**Session 1**

* execute the aggregate query again;
* compare the results.

---

## Task 8

**File:** `day08_ex07.sql`

Reproduce a deadlock using two concurrent database sessions.

Submit:

* `day08_ex07.sql` containing statements for both sessions;
* screenshots demonstrating the deadlock.

Requirements:

* use the `pizzeria` table;
* create a deadlock using any valid SQL statements;
* the default transaction isolation level may be used;
* ensure that both sessions block each other until the database detects the deadlock.
