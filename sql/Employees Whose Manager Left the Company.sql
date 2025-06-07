select e1.employee_id
from Employees e1
where e1.salary < 30000 and e1.manager_id is not null and
e1.manager_id not in(
    select e2.employee_id
    from Employees e2
    where e1.manager_id = e2.employee_id
)
order by e1.employee_id
;