select p.name, COUNT(pizzeria_id) AS count_of_visits
from person_visits pv
join person p on p.id = pv.person_id
GROUP BY (p.name)
order by count_of_visits desc, p.name
limit 4;
