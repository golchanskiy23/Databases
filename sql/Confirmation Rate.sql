select s.user_id, round(sum(case when c.action = 'confirmed' then 1 else 0 end)::numeric / count(*),2) as confirmation_rate
from Signups s
left outer join Confirmations c on c.user_id = s.user_id
group by s.user_id
;