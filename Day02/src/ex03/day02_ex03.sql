WITH generated_days AS (
    SELECT generate_series('2022-01-01'::timestamp, '2022-01-10'::timestamp, interval '1 day')::date AS date
)
SELECT date::date AS missing_date
FROM generated_days
LEFT JOIN (
    SELECT * FROM person_visits WHERE person_id = 1 OR person_id = 2
) Pe ON date = Pe.visit_date
WHERE Pe.visit_date IS NULL
ORDER BY date;