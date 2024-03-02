SELECT
    person.name AS person_name,
    menu.pizza_name AS pizza_name,
    pizzeria.name AS pizzeria_name
FROM person_order AS new
JOIN person ON new.person_id = person.id
JOIN menu ON new.menu_id = menu.id
JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
ORDER BY person_name, pizza_name, pizzeria_name;
