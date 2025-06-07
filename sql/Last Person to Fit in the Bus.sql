with AST as (
    select q1.turn, sum(q2.weight) as total
from Queue q1
inner join Queue q2 on q1.turn >= q2.turn
group by q1.turn
having sum(q2.weight) <= 1000
order by total desc limit 1
)

select person_name
from Queue q
inner join AST a on q.turn = a.turn
;