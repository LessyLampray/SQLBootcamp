SELECT id, name
FROM person
UNION
SELECT id, pizza_name
FROM menu
ORDER BY id, name;