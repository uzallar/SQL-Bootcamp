SELECT  
	person_order.order_date,
	person.name || ' (age:' || age || ')' AS person_information
FROM 
	person_order
NATURAL JOIN 
	(SELECT person.id AS person_id, person.name, person.age FROM person) person
ORDER BY 
	person_order.order_date ASC,
	person_information ASC;

