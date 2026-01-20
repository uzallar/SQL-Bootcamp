WITH gender_visits AS (
    SELECT pz.name AS pizzeria_name, p.gender, COUNT(*) AS visits
    FROM person_visits pv
    JOIN pizzeria pz ON pv.pizzeria_id = pz.id
    JOIN person p ON pv.person_id = p.id
    GROUP BY pz.name, p.gender
),
visits_comp AS (
    SELECT gv1.pizzeria_name,
        	gv1.gender AS more_visited_by,
        	gv1.visits AS female_visits,
        	gv2.visits AS male_visits
    FROM gender_visits gv1
    JOIN gender_visits gv2 ON gv1.pizzeria_name = gv2.pizzeria_name
    WHERE gv1.gender = 'female' AND gv2.gender = 'male' AND gv1.visits > gv2.visits
    
    UNION ALL
    
    SELECT gv1.pizzeria_name,
        	gv1.gender AS more_visited_by,
        	gv1.visits AS female_visits,
        	gv2.visits AS male_visits
    FROM gender_visits gv1
    JOIN gender_visits gv2 ON gv1.pizzeria_name = gv2.pizzeria_name
    WHERE gv1.gender = 'male' AND gv2.gender = 'female' AND gv1.visits > gv2.visits
)

SELECT 
    pizzeria_name
FROM 
    visits_comp
ORDER BY 
    pizzeria_name;
