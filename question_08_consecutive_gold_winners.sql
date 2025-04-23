--8 find players who have won gold medals in consecutive 3 summer olympics in the same event . Consider only olympics 2000 onwards. 
--Assume summer olympics happens every 4 year starting 2000. print player name and event name.

with a as 
(
select year, name , event
from events as e
inner join athletes as a 
on a.id = e.athlete_id
where medal = 'gold' and year  >= 2000
group by year, name , event
) 
select * 
from ( 
select *, 
lag(year,1) over(partition by name,event order by year ) as prev_year
, lead(year,1) over(partition by name,event order by year ) as next_year
from a ) b 
where year = prev_year + 4  and year = next_year-4;

output: 
### Sample Output

| Year | Name                          | Event                                                    | Prev_Year | Next_Year |
|------|-------------------------------|-----------------------------------------------------------|-----------|-----------|
| 2012 | Allyson Michelle Felix        | Athletics Women's 4 x 400 metres Relay                    | 2008      | 2016      |
| 2008 | Anastasiya Semyonovna Davydova| Synchronized Swimming Women's Team                        | 2004      | 2012      |
| 2008 | Artur Borisovich Taymazov     | Wrestling Men's Super-Heavyweight, Freestyle              | 2004      | 2012      |

