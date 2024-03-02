SELECT pizzeria.name
FROM pizzeria
         INNER JOIN (SELECT * FROM person_visits WHERE visit_date = '2022-01-08') AS pv ON pizzeria.id = pv.pizzeria_id
         INNER JOIN (SELECT * FROM person WHERE name = 'Dmitriy') AS p ON pv.person_id = p.id
         INNER JOIN (SELECT * FROM menu WHERE price < 800) pr ON pizzeria.id = pr.pizzeria_id;