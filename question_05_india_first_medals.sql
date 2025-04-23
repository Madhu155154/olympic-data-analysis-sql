--5 in which event and year India has won its first gold medal,first silver medal and first bronze medal
--print 3 columns medal,year,sport
with a as 
(
select medal, year, sport, 
ROW_NUMBER() over(partition by medal order by year ) as rw
from events as e
inner join athletes as a 
on a.id = e.athlete_id
where team='India' and medal not in ('na')
--order by rw asc
) 
select *from a 
where rw = 1;

output:

### Sample Output

| Medal  | Year | Sport     | RW |
|--------|------|-----------|----|
| Bronze | 1952 | Wrestling | 1  |
| Gold   | 1924 | Alpinism  | 1  |
| Silver | 1900 | Athletics | 1  |
