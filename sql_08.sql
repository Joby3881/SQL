use sakila ;

desc actor;
desc actor_info;
select *from actor;
select *from actor_info;
select*from film_actor;

select first_name, last_name,film_id from actor inner join film_actor using(actor_id);

create table st(id int ,sname varchar (20));
insert into st values (1,"vikas");
insert into st values (2,"new");
create table st_hoby(id int ,hobby varchar (30));
insert into st_hoby values (1,"cricket");
insert into st_hoby values (2,"foot ball");
insert into st_hoby values (3,"tenies");

-- methods num. - 1

select count(*)from st  inner join st_hoby;
select *from st  inner join st_hoby using(id);

-- methods num. -2

select *from st ,st_hoby where st.id=st_hoby.id;

-- methods num. -3
-- on clause
select *from st  inner join st_hoby on(st.id=st_hoby.id);

insert into st values (5,"newPerson");

-- left join

select *from st  left outer join st_hoby on(st.id=st_hoby.id);

-- right join 

select *from st  right outer join st_hoby using(id);

select first_name, last_name,film_id from actor 
inner join
 film_actor  using(actor_id) limit 5;
 
 select  actor_id,first_name, last_name,film_id,title, release_year from actor 
 inner join
 film_actor  using(actor_id) 
 inner join film using(film_id);
 
 -- natural join 
 
 select  id,sname,hobby from st  natural join st_hoby;
  select  count(*) from st  natural join st_hoby;
  select  * from st  inner join st_hoby order by st.id;