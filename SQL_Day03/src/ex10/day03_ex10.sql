INSERT INTO person_order (id, person_id, menu_id, order_date)
SELECT (SELECT MAX(id) FROM person_order) + 1, 
		(SELECT person.id FROM person WHERE person.name = 'Denis'),
		(SELECT menu.id FROM menu WHERE pizza_name = 'sicilian pizza'),
		DATE('2022-02-24')
UNION ALL
SELECT 
    (SELECT MAX(id) FROM person_order) + 2,
    (SELECT id FROM person WHERE name = 'Irina'),
    (SELECT id FROM menu WHERE pizza_name = 'sicilian pizza' AND pizzeria_id = (SELECT id FROM pizzeria WHERE name = 'Dominos')),
    DATE('2022-02-24');