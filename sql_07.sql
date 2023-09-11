-- use sakila;
 -- select first_name ,concat("Mr " ,first_name) as full_name from actor order by full_name;
-- group by  
 -- select first_name , length(first_name) from actor;
   
   -- multiple row  =>output
   -- similar => opretions
    -- group => group opretions
    
   use world;
    select * from country;
    create table t1 (id int ,city varchar (20));
    insert into t1 values (1,"hii"),(2,"hii12"),(null,"hii3");
    select * from t1;
    select count(*) from t1; -- COUNT(*) command in SQL is used to count the number of rows in a database table.
	select count(id) from t1; -- COUNT(*) command in SQL is used to count the number of 'id' rows in a database table.
	select  distinct city from t1; --  DISTINCT keyword is used in the SELECT statement to retrieve unique values from a specific column.
	select count(distinct city) from t1; -- Counting the DISTINCT city coloum but it count reapting value only one time.
    
    select * from city where countrycode="afg";
    select countrycode, count(id) from city  group by countrycode;
	select countrycode, count(id), sum(population)as total_population from city  group by countrycode; -- "AS" keyword is used for aliasing. It allows you to give a table or column a temporary name (an alias).
    select countrycode , count(id), sum(population)as total from city group by countrycode  having sum(population)>500 order by total;
      
	select countrycode ,sum(population) from city  where population >200000 group by countrycode;
	select countrycode ,sum(population) from city group by countrycode;
    
	select * from country;
	select continent, count(*) from country group by continent;
	select continent, region, count(*) from country  group by continent, region having continent="europe"; 
    select continent, region, count(*) from country  group by continent, region having continent="europe" order by count(*); 
	select continent, region, count(*) from country where continent="europe" group by continent, region order by count(*); -- where close condition mot applicable in agrication data.
    