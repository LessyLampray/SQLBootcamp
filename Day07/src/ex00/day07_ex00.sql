select person_id, COUNT(pizzeria_id) AS count_of_visits
from person_visits pv
GROUP BY (person_id)
order by count_of_visits desc, person_id;
