SELECT name, COUNT(*) AS count_of_visits
FROM person_visits pv
JOIN person p ON pv.person_id = p.id
GROUP BY name
ORDER BY 2 DESC, 1 ASC
LIMIT 4;