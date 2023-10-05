use sakila;
select * from actor;
select actor_id, first_name from actor;
-- virtul view
create view actor_view as select actor_id, first_name from actor;
select * from actor_view;

use reds; 
create table test(id int, name varchar(20));
insert into test values(1,'joby');
insert into test values(2,'Noby');
select * from testview;
select * from test;
insert into test values(100,'Gavi');
select * from testview;
insert into testview values("regex");
select * from test;

-- delete from view
delete from testview where name ="Gavi";
select * from test;
show tables;
create or replace view testview as select id,name from test;
select * from test;
select * from testview;
show tables;
drop view testview;

use sakila;
select * from city;
select * from country;
select * from country inner join city using (country_id);
select  country_id, country, city_id, city from country inner join city using (country_id);
create view cityfinder_view as select  country_id, country, city_id, city from country inner join city using (country_id);
select * from cityfinder_view;
insert into cityfinder_view values(223,"jhj",323,"japan");
-- we can only update datas only normal view  if using group by, cartition joint or sub quary etc in the view that does not done any manupulation.

use reds;
select * from test;
select count(name) from test;
select count(*) from test;

alter table test add column salary int;
select * from test;
insert into test values(4,null,100);
insert into test values(null,null,200);
insert into test values(100,null,null);
select * from test;
select id, name, salary, coalesce(id, name, salary) from test;
-- coalesce it will return the not null value.

-- eak jiss table ke ander move id, movie name, duration and prize
-- eak table customer id, cus_name
-- muje sare customer id, cut_name sare moves chahiye jiss ne dekhi hai
-- relation ship banega 
-- get all information wether they are watch or not
-- get a total yeaer of moves after 2000 year
-- find out the total amout spend by user and find out athe aversgr duration he has watch
-- get only the customer id cut name ofer of movies those person watch max num
use reds;
create table movies(id int primary key, m_name varchar(150), m_duration time , price int);
create table m_customer (id int unique not null,c_name varchar(150), date date, foreign key(id) references movies(id));
insert into movies values
    (1, 'Movie 1', '02:30:00', 10),
    (2, 'Movie 2', '02:15:00', 12), 
    (3, 'Movie 3', '02:45:00', 8),
    (4, 'Movie 4', '02:10:00', 15),
    (5, 'Movie 5', '03:00:00', 11);
    
    insert into m_customer values
    (1, 'vikas', '2023-10-03'),
    (2, 'joby', '2023-10-04'),
    (3, 'atony', '2023-10-05'),
    (4, 'rahul sharma', '2023-10-06'),
    (5, 'rahul sharma', '2023-10-07');
    select * from movies;
    select * from m_customer;

