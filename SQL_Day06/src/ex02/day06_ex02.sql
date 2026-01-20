SELECT p.name, m.pizza_name, m.price, m.price * (1 - d.discount/100) AS discount_price, pz.name AS pizzeria_name
FROM menu m
JOIN person_order po ON po.menu_id = m.id
JOIN person_discounts d ON po.person_id = d.person_id AND m.pizzeria_id = d.pizzeria_id
JOIN person p ON po.person_id = p.id
JOIN pizzeria pz ON m.pizzeria_id = pz.id
ORDER BY p.name, m.pizza_name;