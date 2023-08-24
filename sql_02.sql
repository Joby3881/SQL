use sakila;
-- select *from actor;
-- select *from sakila.language where name="english";
-- select *from sakila.language where name !="english";
-- select *from sakila.language where language_id <> 3;
-- select *from sakila.language where name >"I";
-- select first_name from actor where first_name >'B'  ;
 -- select * from film where description  like '%drama%' and title like 'a%s' ;
  select title , film_id, release_year, description from film where title like '_f_i%egg';