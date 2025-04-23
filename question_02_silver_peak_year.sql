--2 for each team print total silver medals and year in which they won maximum silver medal..output 3 columns
-- team,total_silver_medals, year_of_max_silver
with a as
(
select year,team, count(distinct event) as won, 
ROW_NUMBER() over( partition by team order by count(distinct event)  desc) as rn
from events as e
inner join athletes as a 
on a.id = e.athlete_id
where e.medal = 'silver'
group by  year,team
)
select team,sum(won) as total_medal, 
max(case when rn=1 then year end) as max_year
from a;

output:

### Sample Output

| Team      | Total_Medal | Max_Year |
|-----------|-------------|----------|
| Albania   | 1           | 2000     |
| Algeria   | 4           | 2016     |
| Argentina | 23          | 1924     |
