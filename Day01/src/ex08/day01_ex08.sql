SELECT order_date, concat(name, ' (age:', age, ')') as person_information
FROM person_order
NATURAL JOIN (select id as person_id, name, age from person) as ns
ORDER BY order_date, person_information;