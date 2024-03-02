SELECT name, rating
FROM pizzeria
         LEFT JOIN person_visits AS pv
                   ON pizzeria.id = pv.pizzeria_id
WHERE pv.pizzeria_id IS NULL;