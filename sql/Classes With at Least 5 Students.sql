select s.class
from courses s
group by s.class
having count(s.class) >= 5
;