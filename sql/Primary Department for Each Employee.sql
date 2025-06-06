with SingleDept as (
  select employee_id
  from Employee
  group by employee_id
  having count(DISTINCT department_id) = 1
)
select e.employee_id, e.department_id
from Employee e
where e.primary_flag = 'Y'

union

select e.employee_id, e.department_id
from Employee e
join SingleDept s on e.employee_id = s.employee_id
;
