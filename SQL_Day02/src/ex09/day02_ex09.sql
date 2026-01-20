SELECT p.name
FROM person p
WHERE p.gender = 'female'
  AND EXISTS (
    SELECT p.name
    FROM person_order po
    JOIN menu ON po.menu_id = menu.id
    WHERE po.person_id = p.id
      AND menu.pizza_name = 'pepperoni pizza'
  )
  AND EXISTS (
    SELECT p.name
    FROM person_order po
    JOIN menu ON po.menu_id = menu.id
    WHERE po.person_id = p.id
      AND menu.pizza_name = 'cheese pizza'
  )
ORDER BY p.name;