select p.product_id, coalesce(round(sum(case when u.purchase_date >= 
p.start_date and u.purchase_date <= p.end_date then p.price*u.units else 0 
end)::numeric / nullif(sum(case when u.purchase_date >= p.start_date and 
u.purchase_date <= p.end_date then u.units else 0 end)::numeric,0), 2), 0) as average_price
from Prices p
left outer join UnitsSold u on p.product_id = u.product_id
group by p.product_id
;