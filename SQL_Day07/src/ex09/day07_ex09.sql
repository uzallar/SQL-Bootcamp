SELECT 
	address, 
	ROUND((MAX(age::numeric)) - (MIN(age::numeric)/MAX(age::numeric)), 2) AS formula, 
	ROUND(AVG(age::numeric),  2) AS average,
	MAX(age) - (MIN(age)/MAX(age)) > AVG(age) AS comparsion
FROM person p
GROUP BY address
ORDER BY address;