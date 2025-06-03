with act as (select player_id, min(event_date) as first_login
from Activity
group by player_id)
select round(sum(case when a.event_date=act.first_login + interval'1 day' then 1 else 0 end)::numeric /count(distinct act.player_id),2) as fraction
from Activity a
inner join act on a.player_id = act.player_id
; 
