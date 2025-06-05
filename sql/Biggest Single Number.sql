select case when count(*) = 0 then null else max(num) end as num
from MyNumbers
where(num) in (select num
from MyNumbers
group by num
having count(num) = 1)
;