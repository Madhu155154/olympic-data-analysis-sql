--4 in each year which player has won maximum gold medal . Write a query to print year,player name 
--and no of golds won in that year . In case of a tie print comma separated player names.

with a as 
(
select year, name, count(name) as won
from events as e
inner join athletes as a 
on a.id = e.athlete_id
where e.medal = 'gold' 
group by  year, name
), 
b as
(
select *, 
rank() over(partition by year order by won desc ) as ra, 
row_number() over(partition by year order by won desc ) as rn
from a 
) 
select year, won , 
STRING_AGG(name, '  ,') as name
from b 
where ra = 1
group by year, won;

output: 

### Sample Output

| Year | Won | Name                                                                                                                                               |
|------|-----|----------------------------------------------------------------------------------------------------------------------------------------------------|
| 1906 | 3   | Giorgio Cesana, Francesco Verri, Emilio Fontanella, Enrico Bruna, Louis Marcel Richardet, Maxime Omer Mathieu "Max" Omer-Dcugis                   |
| 1908 | 3   | Melvin Winfield "Mel" Sheppard, Henry Taylor                                                                                                       |
| 1912 | 3   | Gustaf Vilhelm Carlberg, Alfred Page "Al" Lane, Johan Pietari "Hannes" Kolehmainen                                                                |
| 1928 | 3   | Georg "Georges" Miez                                                                                                                               |



