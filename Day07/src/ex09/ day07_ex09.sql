with info as (select address, round(max(age::DEC)-(min(age::DEC)/max(age::DEC)),2) as formula, round(avg(age),2) as average
from person
group by address
order by 1)

select address, formula,average, formula > average as comparison
from info


select p.name as name, pizza_name, price,  ((100 - pd.discount) / 100) * m.price as discount_price,
                     p2.name as pizzeria_name
from person_order po
join menu m on m.id = po.menu_id
join person p on p.id = po.person_id
join pizzeria p2 on p2.id = m.pizzeria_id
join person_discounts pd on (po.person_id = pd.person_id and p2.id = pd.pizzeria_id)
order by name, pizza_name
