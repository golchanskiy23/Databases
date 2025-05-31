select s.machine_id, round(avg(e.timestamp-s.timestamp)::numeric, 3) as processing_time
from Activity s
inner join Activity e on s.process_id = e.process_id
where s.machine_id = e.machine_id
and e.activity_type = 'end' and s.activity_type = 'start'
group by s.machine_id
;