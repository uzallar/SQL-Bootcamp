SELECT 
	person_order.order_date AS action_date, 
	(SELECT person.name FROM person WHERE person.id = person_order.person_id) AS person_name
FROM 
	person_order
	
INTERSECT

SELECT 
	person_visits.visit_date, 
	(SELECT person.name FROM person WHERE person.id = person_visits.person_id) as person_name
FROM 
	person_visits
	
ORDER BY 
	action_date ASC, person_name DESC;
