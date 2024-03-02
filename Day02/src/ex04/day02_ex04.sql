SELECT me.pizza_name AS pizza_name, name AS pizzeria_name, me.price AS price
FROM pizzeria
INNER JOIN (SELECT pizza_name, pizzeria_id, price FROM menu) AS me
ON me.pizzeria_id = pizzeria.id
WHERE me.pizza_name = 'mushroom pizza' OR me.pizza_name = 'pepperoni pizza'
ORDER BY pizza_name, pizzeria_name;