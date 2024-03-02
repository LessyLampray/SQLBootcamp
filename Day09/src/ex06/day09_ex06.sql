create or replace function fnc_person_visits_and_eats_on_date(in pperson varchar default 'Dmitriy', in pprice numeric default 500, in pdate date default '2022-01-08')
	returns table (
        name varchar
	) as
 $code$
    begin
    return query
    ((SELECT pi.name
    FROM (SELECT *
        FROM person_visits pv
        WHERE pv.visit_date = pdate) q1
        JOIN (SELECT * FROM person WHERE person.name = pperson) q2
            ON q1.person_id = q2.id
        JOIN pizzeria pi
            ON q1.pizzeria_id = pi.id
        JOIN (SELECT * FROM menu WHERE menu.price < pprice) q3
            ON pi.id = q3.pizzeria_id)
    INTERSECT
    (SELECT pi.name
    FROM (SELECT *
        FROM person_order po
        WHERE po.order_date = pdate) q1
        JOIN (SELECT * FROM person WHERE person.name = pperson) q2
            ON q1.person_id = q2.id
        JOIN (SELECT * FROM menu WHERE menu.price < pprice) q3
            ON q1.menu_id = q3.id
        JOIN pizzeria pi ON q3.pizzeria_id = pi.id));
    END;
 $code$
 language plpgsql;

SELECT *
FROM fnc_person_visits_and_eats_on_date(pprice := 800);
SELECT *
FROM fnc_person_visits_and_eats_on_date(pperson := 'Anna', pprice := 1300, pdate := '2022-01-01');
