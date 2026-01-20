WITH date_cte AS (
	SELECT DATE(date.day)
	FROM generate_series('2022.01.01'::timestamp, '2022.01.10'::timestamp, '1 day') AS date(day)
)

SELECT
	DATE(date.day) AS missing_date
FROM 
	date_cte AS date(day)
LEFT JOIN
	(SELECT 
		visit_date
	FROM 	
		person_visits
	WHERE
		person_visits.person_id = 1 OR person_visits.person_id = 2
	) AS visit_1_2_id ON (visit_1_2_id.visit_date = date.day)
WHERE 
	visit_1_2_id IS NULL
ORDER BY missing_date ASC;
