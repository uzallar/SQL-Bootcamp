INSERT INTO person_visits(id, person_id, pizzeria_id, visit_date)
VALUES((SELECT MAX(id) FROM person_visits)+1,
		(SELECT person.id FROM person WHERE person.name= 'Dmitriy'),
		(SELECT pizzeria.id
		FROM pizzeria 
		JOIN menu ON menu.pizzeria_id = pizzeria.id
		WHERE price < 800 and pizzeria.name != 'Papa Johns' 
		ORDER BY pizzeria.id LIMIT 1),
		'2022-01-08');
REFRESH MATERIALIZED VIEW mv_dmitriy_visits_and_eats;

