with Low as(
    select 'Low Salary' as category,count(income) as accounts_count
    from Accounts
    where income < 20000
), Average as (
    select 'Average Salary' as category, count(income) as accounts_count
    from Accounts
    where income >= 20000 and income <= 50000
), High as (
    select 'High Salary' as category, count(income) as accounts_count
    from Accounts
    where income > 50000
)

select category, accounts_count
from Low
union
select category, accounts_count
from Average
union
select category, accounts_count
from High
;