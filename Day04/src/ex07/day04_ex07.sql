INSERT INTO person_visits
VALUES (
    (SELECT MAX(id) + 1 FROM person_visits),
    (SELECT id FROM person WHERE name = 'Dmitriy'),
    (SELECT pizzeria_id FROM pizzeria JOIN menu m ON pizzeria.id = m.pizzeria_id WHERE price < 800 LIMIT 1),
    '2022-01-08'
);

REFRESH MATERIALIZED VIEW mv_dmitriy_visits_and_eats;
