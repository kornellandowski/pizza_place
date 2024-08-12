-- Dahboard 1 - orders 

select 
	o.order_id,
	i.item_price ,
	o.quantity ,
	i.item_cat ,
	i.item_name,
	o.created_at,
	a.delivery_address1,
	a.delivery_address2,
	a.delivery_city,
	a.delivery_zipcode,
	o.delivery 
from orders o 
left join item i on o.item_id = i.item_id 
left join address a on o.add_id = a.add_id ;

-- Dashboard 2 - Inventory menagment 
--CREATE view stock1 as (
with measures as(
select 
	o.item_id ,
	i.sku ,
	i.item_name ,
	r.ing_id ,
	i2.ing_name ,
	r.quantity as recipe_quantity,
	sum(o.quantity)  as order_quantity,
	i2.ing_weight ,
	i2.ing_price 
from orders o 
	left join item i  on  o.item_id = i.item_id 
	left join recipe r on i.sku = r.recipe_id 
	left join ingredient i2 on i2.ing_id = r.ing_id 
group by 
	o.item_id ,
	i.sku ,
	i.item_name ,
	r.ing_id ,
	r.quantity ,
	i2.ing_name ,
	i2.ing_weight ,
	i2.ing_price 
	)
select 
	item_name,
	ing_id,
	ing_name,
	ing_weight,
	ing_price,
	order_quantity,
	recipe_quantity,
	order_quantity * recipe_quantity as order_weight,
	ing_price / ing_weight as unit_cost,
	(order_quantity * recipe_quantity) * (ing_price / ing_weight) as ingredient_cost
from measures m ;

--);
-- created a view for easier accesybility 


with weights as (
select 
	ing_id ,
	ing_name ,
	sum(order_weight) as ordered_weight
from stock1 s 
group by
	ing_id ,
	ing_name
)
select 
	w.ing_name,
	w.ordered_weight,
	i2.ing_weight * i.quantity AS total_inv_weight ,
	(i2.ing_weight * i.quantity) - w.ordered_weight as remaining_weight
from weights w 
left join inventory i on i.item_id = w.ing_id
left join ingredient i2  on  i2.ing_id = w.ing_id

-- dashboard 3 - staff information 

select 
	date(r."date") ,
	s.first_name, 
	s.last_name ,
	s.hourly_rate ,
	sh.start_time ,
	sh.end_time ,
	extract(epoch from sh.end_time - sh.start_time) / 3600 as hours_in_shift,
	(extract(epoch from sh.end_time - sh.start_time) / 3600) * s.hourly_rate as staff_cost
from rota r 
left join staff s on r.staff_id = s.staff_id 
left join  shift sh  on r.shift_id  = sh.shift_id  

select distinct * from stock1 s  
