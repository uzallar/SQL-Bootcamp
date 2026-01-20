WITH visited_only_by_women AS (
    SELECT DISTINCT pz.name AS pizzeria_name
    FROM person_order po
    JOIN menu m ON po.menu_id = m.id
    JOIN pizzeria pz ON m.pizzeria_id = pz.id
    JOIN person p ON po.person_id = p.id
    WHERE p.gender = 'female'
    EXCEPT
    SELECT DISTINCT pz.name AS pizzeria_name
    FROM person_order po
    JOIN menu m ON po.menu_id = m.id
    JOIN pizzeria pz ON m.pizzeria_id = pz.id
    JOIN person p ON po.person_id = p.id
    WHERE p.gender = 'male'
),

visited_only_by_man AS (
    SELECT DISTINCT pz.name AS pizzeria_name
    FROM person_order po
    JOIN menu m ON po.menu_id = m.id
    JOIN pizzeria pz ON m.pizzeria_id = pz.id
    JOIN person p ON po.person_id = p.id
    WHERE p.gender = 'male'
    EXCEPT
    SELECT DISTINCT pz.name AS pizzeria_name
    FROM person_order po
    JOIN menu m ON po.menu_id = m.id
    JOIN pizzeria pz ON m.pizzeria_id = pz.id
    JOIN person p ON po.person_id = p.id
    WHERE p.gender = 'female'
)

SELECT pizzeria_name
FROM visited_only_by_women
UNION
SELECT pizzeria_name
FROM visited_only_by_man
ORDER BY pizzeria_name;

