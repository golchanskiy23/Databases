select s1.id, s2.student
from Seat s1
inner join Seat s2 on s1.id = s2.id - 1
where s2.id % 2 = 0

union

select s2.id, s1.student
from Seat s1
inner join Seat s2 on s2.id = s1.id + 1
where s2.id % 2 = 0 and s1.id % 2 != 0

union

select id, student
from Seat
where id = (select MAX(id) from Seat) and (select count(*) from Seat) % 2 = 1
order by id
;