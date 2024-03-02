with bestOrder as (select p.name, count(pizzeria_id) as count, 'order' as action_type
    from person_order
    join menu m on m.id = person_order.menu_id
    join pizzeria p on p.id = m.pizzeria_id
    group by p.name
    order by count desc
    limit 3),
     bestVisits as (select p2.name, count(pizzeria_id) as count, 'visit'as action_type
         from person_visits
         join pizzeria p2 on p2.id = person_visits.pizzeria_id
         group by p2.name
    order by count desc
         limit 3)

select *
from bestOrder
union
select *
from bestVisits
order by action_type, count desc;


