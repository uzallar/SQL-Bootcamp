# SQL Practice Tasks — Recursive Queries and the Traveling Salesman Problem

These tasks focus on solving graph traversal problems using recursive SQL queries.

---

## Task 1

**File:** `team00_ex00.sql`

Create a database representation of a weighted graph and solve the classical Traveling Salesman Problem (TSP).

Requirements:

* create a table describing graph edges using the structure:

| Column   | Description      |
| -------- | ---------------- |
| `point1` | starting node    |
| `point2` | destination node |
| `cost`   | travel cost      |

* populate the table with all graph edges, including both forward and reverse directions;
* use a recursive query to generate all valid tours that:

  * start from city `a`;
  * visit every city exactly once;
  * return to the starting city;
* return only the tour(s) with the minimum total travel cost.

Sort the result by:

1. `total_cost`;
2. `tour`.

Expected output:

| total_cost | tour        |
| ---------: | ----------- |
|         80 | {a,b,d,c,a} |
|        ... | ...         |

---

## Task 2

**File:** `team00_ex01.sql`

Extend the previous solution to include both the shortest and the longest valid tours.

Requirements:

* reuse the recursive solution from Task 1;
* return:

  * all tours with the minimum travel cost;
  * all tours with the maximum travel cost;
* sort the result by:

  1. `total_cost`;
  2. `tour`.

Expected output:

| total_cost | tour        |
| ---------: | ----------- |
|         80 | {a,b,d,c,a} |
|        ... | ...         |
|         95 | {a,d,c,b,a} |
