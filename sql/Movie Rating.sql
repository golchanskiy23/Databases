(select u.name as results
from MovieRating mr
inner join Users u on u.user_id = mr.user_id
group by u.user_id, u.name
order by count(mr.rating) desc, u.name asc
limit 1
)

union all

(select m.title as results
from MovieRating mr
inner join Movies m on m.movie_id = mr.movie_id
where to_char(mr.created_at, 'YYYY-mm')='2020-02'
group by m.title
order by avg(mr.rating::double precision) desc, m.title asc
limit 1)
;