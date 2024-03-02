SELECT pizza_name, p2.name
FROM menu
INNER JOIN (SELECT * FROM person_order) po ON menu.id = po.menu_id
INNER JOIN (SELECT * FROM person WHERE name = 'Denis' OR name = 'Anna') p ON p.id = po.person_id
INNER JOIN (SELECT * FROM pizzeria) p2 ON p2.id = menu.pizzeria_id
ORDER BY 1, 2;