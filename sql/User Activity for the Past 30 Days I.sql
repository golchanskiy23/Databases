select activity_date as day, count(distinct user_id) as active_users
from Activity
where activity_date >= date '2019-06-28' and activity_date <= date '2019-07-27'
group by  activity_date
order by activity_date
;