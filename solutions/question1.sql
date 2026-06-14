with cte as (
select case when g.grade >= 8 then s.name else NULL end as name, g.grade, s.marks as mark, case when g.grade >= 8 then s.name else cast(s.marks as varchar(10)) end as order_fn
from students s
join grades g
on s.marks >= g.min_mark
and s.marks <= g.max_mark
)

select name, grade, mark
from cte
order by grade desc, order_fn asc;
