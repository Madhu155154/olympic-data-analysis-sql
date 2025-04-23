----1 which team has won the maximum gold medals over the years--


select  top 1 team, count(team) as won
from events as e
inner join athletes as a 
on a.id = e.athlete_id
where e.medal = 'gold'
group by  team
order by count(team) desc

output:
team	         won
United States	 2515
