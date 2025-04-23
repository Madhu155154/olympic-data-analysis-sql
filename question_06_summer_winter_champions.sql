--6 find players who won gold medal in summer and winter olympics both.

select distinct name, 
count(case when season = 'summer' then 1 else null end )as summer,
count(case when season = 'winter' then 1 else null end )as winter 
from events as e
inner join athletes as a 
on a.id = e.athlete_id
where season in ( 'summer','winter') and 
medal = 'gold'
group by name 
having count(case when season = 'summer' then 1 else null end ) > 0 and 
count(case when season = 'winter' then 1 else null end ) > 0;

output:
### Sample Output

| Name                                        | Summer | Winter |
|---------------------------------------------|--------|--------|
| Aleksandr Vladimirovich Popov               | 4      | 1      |
| Edward Patrick Francis "Eddie" Eagan        | 1      | 1      |
| Gillis Emanuel Grafstrm                     | 1      | 2      |
| Kim So-Hui                                  | 1      | 1      |
