-- data cleaning project on a netflix based database

-- a quick look at our table
select * 
from netflix_titles 
limit 10;

-- create a staging table 
create table netflix.netflix
like netflix_titles;

insert into netflix
select *
from netflix_titles;

-- a quick look at our new staging table
select * 
from netflix;

-- check for duplicates based on the show_id

select show_id, count(*) as 'cnt'
from netflix
group by show_id
having count(*) > 1;

select *
from netflix;

-- it seems that there are some null values in director, cast, country 
-- let's see if the other columns are fine

select
	sum(case when show_id is null then 1 else 0 end) as 'show_id_null',
	sum(case when type is null then 1 else 0 end) as 'type_null',
	sum(case when title is null then 1 else 0 end) as 'title_null',
	sum(case when date_added is null then 1 else 0 end) as 'date_added_null',
	sum(case when release_year is null then 1 else 0 end) as 'release_year_null',
	sum(case when rating is null then 1 else 0 end) as 'rating_null',
	sum(case when listed_in is null then 1 else 0 end) as 'listed_in_null',
    sum(case when description is null then 1 else 0 end) as 'description_null'
from netflix;

-- they are fine with no null values

select *
from netflix;

-- let's delete the  rows where both cast and director is null

delete 
from netflix
where 
	(director is null or director = '') 
    and (cast is null or cast = '');
    
-- and check if we did what we wanted 

select director, cast
from netflix
where 
	(director is null or director = '') 
    and (cast is null or cast = '');
    

-- it seems we have a problem with a title. 'PokÃ©mon Master Journeys: The Series'
-- let's address the problem 

select title 
from netflix
where title like "%Master Journeys%";

update netflix
set title  = 'Pokemon Master Journeys: The Series'
where title like 'PokÃ©mon%';

select title 
from netflix
where title like "%Master Journeys%";

select * 
from netflix;

-- let's have a look on the directors

select distinct(director)
from netflix
where director !='';

-- it seems like some of the directors name have a problem
show create table netflix;
alter table netflix modify column director VARCHAR(255) character set utf8mb4 collate utf8mb4_general_ci;

select distinct(director)
from netflix ;

-- which country has the most movies
select country, count(type) as 'total_movies_per_country'
from netflix
where type = 'Movie'
group by country
order by count(type) desc;

-- interesting..let's see in how many movies does the USA is involved
select count(*) as 'total_usa_movies'
from netflix 
where type = 'Movie'
	and country like '%United States%';

select *
from netflix;

-- let's have a look at the date_added

describe netflix;

-- it is text type and i want to change it to date 

alter table netflix
add column date_added_dt date;

update netflix
set date_added_dt = str_to_date(date_added, '%M %d, %Y');

select date_added, date_added_dt
from netflix;

describe netflix;

-- the new column date_added_dt seems to be exactly how we want it
-- so we can drop the old one 

alter table netflix
drop column date_added;

select *
from netflix;