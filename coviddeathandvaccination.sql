---------coviddeaths----------

select * from coviddeaths;

 --1.Total_cases vs total_deaths,states like united 
 select location,Total_cases,total_deaths,(Total_cases/total_deaths)*100 
 from coviddeaths

 --2.total_cases vs population(in %),states like india or united 
 select location,total_cases,population,(total_cases/population)*100
 from coviddeaths

 --2.max total_cases compared to population(%)
 select location,total_cases,population,max(total_cases/population)*100
 from coviddeaths
 group by location,total_cases,population;

--3.location with highest (max)total_deaths
select location,total_deaths,max(total_deaths)
from coviddeaths
group by location,total_deaths
order by total_deaths

--where continent is null, max(total_deaths) cast as iint.
select location,max(total_deaths)
from coviddeaths
where continent is null
group by location
--5.sum=new_cases,new_deaths,new_deathd /new_cases*100,where continent is null group by date(--group by it give global value)
select date,(sum(total_deaths)/sum(new_cases))*100
from coviddeaths
where continent is not null
group by date

--6,global value
select (sum(total_deaths)/sum(new_cases))*100
from coviddeaths
where continent is null
--group by date

------------------------------------join------------------------------------------------------------
Select * from coviddeaths 
Join covidvaccination
On coviddeaths.location = covidvaccination.location and 
Coviddeaths.date=covidvaccination.date 

--population vs vaccination(peoplevaccinated)

select coviddeaths.population,coviddeaths.date ,coviddeaths.location,coviddeaths.continent,covidvaccination.new_vaccinations,
sum(covidvaccination.new_vaccinations) over(partition by coviddeaths.location order by coviddeaths.date ) as peoplevaccinated
--,(coviddeaths.population/peoplevaccinated)---doesnt work need to use CTE or--
from coviddeaths
join  covidvaccination  on
coviddeaths.location = covidvaccination.location and
coviddeaths.date = covidvaccination.date
where coviddeaths.continent is not null

-- second try with CTE----

with population_vs_vacc  as
(
select coviddeaths.population,coviddeaths.date ,coviddeaths.location,coviddeaths.continent,covidvaccination.new_vaccinations,
sum(covidvaccination.new_vaccinations) over(partition by coviddeaths.location order by coviddeaths.date ) 
as peoplevaccinated
from coviddeaths
join  covidvaccination  on
coviddeaths.location = covidvaccination.location and
coviddeaths.date = covidvaccination.date
where coviddeaths.continent is not null

)

select *,(peoplevaccinated/population)*100
from population_vs_vacc   --here we get the total vaciinated peole compared to their own country in a column

----create a table for above---------------------------------------

create table popu_vs_vacc
(
population numeric,
date date,
location varchar (250),
continent varchar (250),
new_vaccinations numeric,
peoplevaccinated numeric
);
insert into popu_vs_vacc
select
coviddeaths.population,coviddeaths.date ,coviddeaths.location,coviddeaths.continent,covidvaccination.new_vaccinations,
sum(covidvaccination.new_vaccinations) over(partition by coviddeaths.location order by coviddeaths.date ) as peoplevaccinated
from coviddeaths
join  covidvaccination  on
coviddeaths.location = covidvaccination.location and
coviddeaths.date = covidvaccination.date
where coviddeaths.continent is not null;

select *,(peoplevaccinated/population)*100 as percentagevaccinated
from popu_vs_vacc ;

-----permenantly create table in view------

create  view  ppopu_vs_vacc as
select coviddeaths.population,coviddeaths.date ,coviddeaths.location,coviddeaths.continent,covidvaccination.new_vaccinations,
sum(covidvaccination.new_vaccinations) over(partition by coviddeaths.location order by coviddeaths.date ) as peoplevaccinated
from coviddeaths
join  covidvaccination  on
coviddeaths.location = covidvaccination.location and
coviddeaths.date = covidvaccination.date
where coviddeaths.continent is not null


---now we can freely use that table for analyse--

select *,(peoplevaccinated/population)*100 as percentagevaccinated
from ppopu_vs_vacc
