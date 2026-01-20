(SELECT pz.name, COUNT(*) AS count, 'order' AS action_type
FROM pizzeria pz
JOIN menu ON  menu.pizzeria_id  = pz.id
JOIN person_order po ON po.menu_id = menu.id
GROUP BY pz.name
ORDER BY count DESC
LIMIT 3)

UNION

(SELECT pz.name, COUNT(*) AS count, 'visit' AS action_type
FROM pizzeria pz
JOIN person_visits pv ON  pv.pizzeria_id  = pz.id
GROUP BY pz.name
ORDER BY count DESC
LIMIT 3)

ORDER BY action_type ASC, count DESC;