SELECT pizzeria.name AS pizzeria_name
FROM pizzeria
JOIN menu ON menu.pizzeria_id = pizzeria.id
JOIN person_visits ON menu.pizzeria_id = person_visits.pizzeria_id
JOIN person ON person_visits.person_id = person.id
WHERE person.name = 'Dmitriy' AND 
	person_visits.visit_date = '2022.01.08'
	AND menu.price < 800;
