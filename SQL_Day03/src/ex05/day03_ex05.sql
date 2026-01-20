WITH orders AS (
SELECT pz.name AS pizzeria_name
FROM person_order po
JOIN menu m ON po.menu_id = m.id
JOIN pizzeria pz ON m.pizzeria_id = pz.id
JOIN person p ON po.person_id = p.id
WHERE p.name = 'Andrey'
),
visits AS (
SELECT pz.name AS pizzeria_name
FROM person_visits pv
JOIN pizzeria pz ON pv.pizzeria_id = pz.id
JOIN person p ON pv.person_id = p.id
WHERE p.name = 'Andrey'
)

SELECT pizzeria_name
FROM visits
EXCEPT
SELECT pizzeria_name
FROM orders
ORDER BY pizzeria_name;


