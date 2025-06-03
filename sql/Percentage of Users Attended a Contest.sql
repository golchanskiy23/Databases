with cnt as (
    select COUNT(*) total_users from Users
)
select r.contest_id, ROUND(COUNT(u.user_id) * 100.0 / cnt.total_users, 2) as percentage
from Register r
inner join Users u on r.user_id = u.user_id
cross join cnt
group by r.contest_id, cnt.total_users
order by percentage desc, r.contest_id
;