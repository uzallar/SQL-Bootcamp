SELECT address, pz.name, COUNT(*) AS count_of_orders
FROM person p
JOIN person_order po ON po.person_id = p.id
JOIN menu m ON po.menu_id = m.id
JOIN pizzeria pz ON pz.id = m.pizzeria_id
GROUP BY p.address, pz.name
ORDER BY address, pz.name;