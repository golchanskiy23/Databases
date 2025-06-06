with A as (
    select distinct product_id 
    from Products
), B as (
    select product_id, new_price as price
    from Products
    where (product_id, change_date) in
    (   
        select product_id, max(change_date) as change
        from Products
        where change_date <= date '2019-08-16'
        group by product_id
    )
)
select a.product_id , (case when b.price is null then 10 else b.price end) as price
from A a
left outer join B b on a.product_id = b.product_id
;