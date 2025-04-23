--7 find players who won gold, silver and bronze medal in a single olympics.
--print player name along with year.
with a 
as 
(
select year,name,medal,
dense_rank() over(partition by year , name order by medal ) as rw
from events as e
inner join athletes as a 
on a.id = e.athlete_id
where medal not in ('na')
)
select year ,name, count(distinct medal) as medals from a
group by year ,name
having count(distinct medal) >= 3;

output: 
### Sample Output

| Year | Name                  | Medals |
|------|------------------------|--------|
| 1968 | Akinori Nakayama      | 3      |
| 1972 | Akinori Nakayama      | 3      |
| 2010 | Aksel Lund Svindal    | 3      |
