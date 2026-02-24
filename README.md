# covid-death-and-vaccinations
Publicly available COVID datasets (e.g., deaths, vaccinations, cases)

COVID-19 Data Analysis Lab is a hands-on exploration of global pandemic datasets using SQL, PostgreSQL, Excel, and Power Query.
This repository demonstrates practical techniques for data cleaning, schema design, joins, cumulative calculations, and visualization, with a focus on connecting technical analysis to real-world insights.


 --1.Total_cases vs total_deaths,states like united 
 --2.total_cases vs population(in %),states like india or united 
 --2.max total_cases compared to population(%)
 --3.location with highest (max)total_deaths
 --5.sum=new_cases,new_deaths,new_deathd /new_cases*100,where continent is null group by date(--group by it give global value)
 --6.global value of covid cases and death
 --7.population vs vaccination(peoplevaccinated)

-- second try with CTE----
----create a table for above--
---permenantly create table in view------
---now we can freely use that table for analyse--


- Data Sources:
- [Our World in Data](https://ourworldindata.org/covid-vaccinations)

  # COVID-19 Vaccination & Death Analysis

## ⚙️ Workflow
1. **Data Preparation**  
   - Divided Excel data into two tables:  
      [covid_vaccination.csv]
      [covid_deaths.csv]  
   - Converted to CSV format.

2. **Database Setup** 
   - Created tables matching the CSV schema.  
   - Imported CSVs into PostgreSQL using pgAdmin.
  


**1 global value**

| Metric           | Value        |
|------------------|--------------|
| Total Deaths     | 526,443,682  |
| New Cases        | 150,574,977  |
| Death Percentage | 349.62       |

These values were later used in Tableau dashboards for visualization.

**2  covid death by continent**

| Continent       | Total Death Count |
|-----------------|-------------------|
| South America   | 105,595,385       |
| Oceania         | 256,504           |
| Africa          | 19,064,924        |
| Asia            | 87,116,891        |
| North America   | 153,596,231       |
| Europe          | 160,813,747       |


**3  percent of total cases compared to population**


| Country   | Total Cases | Population   | Percent Infected |
|-----------|-------------|--------------|------------------|
| Austria   | 16,109      | 9,006,400    | 0.179%           |
| Jamaica   | 690         | 2,961,161    | 0.023%           |
| Canada    | 706,897     | 37,742,157   | 1.873%           |
| Djibouti  | 3,935       | 988,002      | 0.398%           |
| Georgia   | 241,637     | 3,989,175    | 6.057%           |
| Gabon     | 2,902       | 2,225,728    | 0.130%           |
| Kenya     | 1,161       | 53,771,300   | 0.002%           |
| Eswatini  | 16,606      | 1,160,164    | 1.431%           |
| France    | 3,689,534   | 68,147,687   | 5.414%           |
| India     | 24,530      | 1,380,004,385| 0.002%           |

📌 *Note: Percent infected is calculated as `(total_cases / population) * 100`.*

**4 percent of population infected**

showing the highest infection count recorded and the percent of the population infected.

| Location       | Population   | Date       | Highest Infection Count | % Population Infected |
|----------------|--------------|------------|--------------------------|-----------------------|
| India          | 1,380,004,385| 2020-01-30 | 1                        | 0.000000072%          |
| India          | 1,380,004,385| 2020-02-02 | 2                        | 0.000000145%          |
| Africa         | 1,340,598,113| 2020-02-14 | 1                        | 0.000000075%          |
| Africa         | 1,340,598,113| 2020-02-27 | 2                        | 0.000000149%          |
| North America  |   592,072,204| 2020-01-22 | 1                        | 0.000000169%          |
| Europe         |   748,680,069| 2020-01-24 | 2                        | 0.000000267%          |
| Brazil         |   212,559,409| 2020-02-26 | 1                        | 0.000000470%          |
| Nigeria        |   206,139,587| 2020-03-04 | 1                        | 0.000000485%          |
| United States  |   331,002,647| 2020-01-22 | 1                        | 0.000000302%          |
| Indonesia      |   273,523,621| 2020-03-04 | 2                        | 0.000000731%          |

📌 *Note: Percent infected is calculated as `(highestinfectioncount / population) * 100`.*


   
## Visualization (Tableau)  

    Imported pgAdmin query results.  
    Built dashboards showing:  
     - Global death trends  
     - Continent comparisons
     - percent of total cases compared to population  
     - percent of population infected 
   

### 📊 Example Visualizations

Screenshots available in [tableau/screenshots](<img width="1484" height="797" alt="Screenshot 2026-02-22 023304" src="https://github.com/user-attachments/assets/467cc0e3-490d-4506-8885-d5bc98d2fd23" />).

### tableau dashboard
     [tableau](https://public.tableau.com/app/profile/anugraha.r.s/viz/coviddashboard_17719306454620/Dashboard1?publish=yes)

### 🔗 Data Source
- [Our World in Data – COVID-19](https://ourworldindata.org/covid-vaccinations)
