SELECT date::date AS missing_date
FROM generate_series('2022-01-01'::date, '2022-01-10'::date, interval '1 day') AS date
         LEFT JOIN (SELECT *
                    FROM person_visits
                    WHERE person_id = 1
                       OR person_id = 2) AS pi
                   ON date = pi.visit_date
WHERE pi.visit_date IS NULL
ORDER BY date;