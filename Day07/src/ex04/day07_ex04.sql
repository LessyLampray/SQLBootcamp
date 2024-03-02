select p.name, count(pizzeria_id) as count_of_visits
from person_visits
join person p on p.id = person_visits.person_id
group by 1
HAVING count(pizzeria_id) > 3