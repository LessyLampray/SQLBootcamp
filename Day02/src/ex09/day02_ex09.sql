SELECT DISTINCT p.name
FROM person AS p
INNER JOIN person_order AS po ON p.id = po.person_id
INNER JOIN menu AS m ON po.menu_id = m.id
WHERE p.gender = 'female' AND m.pizza_name IN ('pepperoni pizza', 'cheese pizza')
GROUP BY p.id, p.name
HAVING COUNT(DISTINCT m.pizza_name) = 2
ORDER BY p.name;
