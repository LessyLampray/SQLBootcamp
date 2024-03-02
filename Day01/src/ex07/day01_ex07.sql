SELECT order_date, concat(person.name, ' (age:', person.age, ')') AS person_information
FROM person_order
INNER JOIN person ON person.id = person_order.person_id
ORDER BY order_date, person_information;
