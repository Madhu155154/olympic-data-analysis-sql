--3 which player has won maximum gold medals  amongst the players 
--which have won only gold medal (never won silver or bronze) over the years

--3.1
select  name, count(name) as won
from events as e
inner join athletes as a 
on a.id = e.athlete_id
where e.medal = 'gold'
group by name
order by count(name) desc

--3.2
select  name, count(name) as won
from events as e
inner join athletes as a 
on a.id = e.athlete_id
where e.medal = 'gold' and 
a.id not in ( 
select distinct a.id 
from events as e
inner join athletes as a 
on a.id = e.athlete_id
where e.medal in ( 'silver', 'bronze'))
group by name
order by count(name) desc
