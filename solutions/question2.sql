select h.hacker_id, h.name
from hackers h
join submissions s
on s.hacker_id = h.hacker_id
join challenges c
on c.challenge_id = s.challenge_id
join difficulty d
on d.difficulty_level = c.difficulty_level
where s.score = d.score
group by h.hacker_id, h.name
having count(s.challenge_id) > 1
order by count(s.challenge_id) desc, h.hacker_id asc
