with bestOrder as (select p.name, count(pizzeria_id) as count
        from person_order
        join menu m on m.id = person_order.menu_id
        join pizzeria p on p.id = m.pizzeria_id
        group by p.name
        order by count desc
),
     bestVisits as (select p2.name, count(pizzeria_id) as count
        from person_visits
        join pizzeria p2 on p2.id = person_visits.pizzeria_id
        group by p2.name
        order by count desc
),
     sums as (select *
        from bestOrder
        union all
        select *
        from bestVisits
)

select name, sum(count) as total_count
from sums
group by name
order by total_count desc, name;





