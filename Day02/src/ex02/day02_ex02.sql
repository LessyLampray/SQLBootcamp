SELECT COALESCE(person.name, '-') AS person_name,
       COALESCE(visit_date, NULL) AS visit_date,
       COALESCE(Pi.name, '-') AS pizzeria_name
FROM person
         FULL OUTER JOIN
     (SELECT * FROM person_visits WHERE visit_date BETWEEN '2022-01-01' AND '2022-01-03') AS visit_date_1
     ON visit_date_1.person_id = person.id
         FULL OUTER JOIN (SELECT id, name FROM pizzeria) AS Pi
                         ON visit_date_1.pizzeria_id = Pi.id
ORDER BY 1, 2, 3;