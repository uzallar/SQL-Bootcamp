SELECT 
    COALESCE(st1.name, st2.name) AS name,
    COALESCE(st1.count, 0) + COALESCE(st2.count, 0) AS total_count
FROM 
    (SELECT 
        pz.name, 
        COUNT(*) AS count
     FROM 
        pizzeria pz
     JOIN 
        menu ON menu.pizzeria_id = pz.id
     JOIN 
        person_order po ON po.menu_id = menu.id
     GROUP BY 
        pz.name) AS st1
FULL JOIN 
    (SELECT 
        pz.name, 
        COUNT(*) AS count
     FROM 
        pizzeria pz
     JOIN 
        person_visits pv ON pv.pizzeria_id = pz.id
     GROUP BY 
        pz.name) AS st2 
ON 
    st1.name = st2.name
ORDER BY 
    total_count DESC, 
    name ASC;