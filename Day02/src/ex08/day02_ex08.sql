SELECT name
FROM person
         INNER JOIN (SELECT * FROM person_order) AS po ON person.id = po.person_id
         INNER JOIN (SELECT * FROM menu where pizza_name = 'pepperoni pizza' or pizza_name = 'mushroom pizza') AS m
                    ON m.id = po.menu_id
WHERE gender = 'male'
  and (address = 'Moscow' OR address = 'Samara')
ORDER BY name DESC
