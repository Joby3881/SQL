-- using raw subquery
use employees;
select * from departments;
select emp_no, year(from_date) as fd from titles where title = "manager" and (emp_no, year(from_date)) in 
(select emp_no, year(from_date) from titles where title <> "manager");
-- vo data jiska title manager h or unka emp_no vo aana chaiye jin emp_no ka title manager nhi ho
-- raw subquery ek se jyada data return or compare krta h
-- co related query = bhr ki table ka data tbhi milega jb andar vali query chlegi bhr ki taable h to andar vali tabble ka data extract krna
select count(*) from departments; 
-- yha se 9 milega
select count(*) from departments where exists (select * from dept_emp where emp_no < 100);
-- yha se 0 milega
-- yha se output 0 aayga kuki andar vali query kch return nhi krti to bhr vali bhi nhi kregi kuki andar ki query me sbhi emp_no 10000 se bde hi h
-- ise hi co related query khate h
-- exists keyword = jab andar vali query koi output nhi de to bhr vali bhi nhi deni chaiye
use sakila;
select first_name, last_name from staff;
select first_name, last_name from customer;
select first_name, last_name from staff where exists (select * from customer where customer.first_name = staff.first_name and customer.last_name = staff.last_name);
-- kch nhi aayga mtlb staff or customer table me ek bhi esa data nhi h jisme staff or customer dono ka first or last name sman ho
-- ise hm join s bhi kr skte h
select inventory.film_id, count(*) from inventory, film where inventory.film_id = film.film_id group by film_id;
select count(*) from film where exists (select count(*) from inventory, film where inventory.film_id=film.film_id group by inventory.film_id having count(*) >8);
select count(*) from film where not exists (select count(*) from inventory, film where inventory.film_id=film.film_id group by inventory.film_id having count(*) >8); -- not exist means ander wali sub quary zero de rahi hai tho bhr vali chalegi
-- yha vo film id milegi jisme id dono table me equal h duplicate nhi aaygi or ye bhi milega ki kis id me total kitna data (film) h mtlb movies of count milega
-- count ye btata h hr ek film_id film table se kitni bar inventory table me gyi
-- where not exists likhe to anadar vali koi output nhi degi bhr vali chlegi
use employees;
select emp_no, first_name, last_name, title from employees join titles using (emp_no) where title = "manager";
-- yha s vo data milega jiska title manager h
-- select emp_no, first_name, last_name, title from employees join titles using (emp_no) where title = "manager" and exists 
select emp_no, year(birth_date) from employees;
select a from (select emp_no, year(birth_date) as a  from employees) as xyz;
select birthy from (select emp_no, year(birth_date) as birthy from employees) as xyz;
-- yha se birth_date ka year milega 
-- nested query in from clause
-- agr from use krte h to is trh alias dena jruri h vrna error aati h
select * from employees;
select count(*) from employees;
select * from salaries;
select emp_no, monthly_salary from (select emp_no, salary/12 as monthly_salary from salaries) as ms limit 5;
-- only 5 tk emp_no or monthly_salary milegi
use sakila;
show tables;
select * from payment;
select amount, film_id from payment join rental using (rental_id) join inventory using (inventory_id) join film using (film_id);
-- yha se 3 table judi h payment se amount nikala use film_id se jodne k liye filmm_id ki jrurt thi jo payment me nhi thi uske liye bich me rental_id ko joda
select sum(amount), film_id from payment join rental using (rental_id)
 join inventory using (inventory_id) 
 join film using (film_id) group by film_id;
-- yha se hr ek film_id ka total amount nikala h 
select * from 
(select sum(amount), film_id from payment join rental using (rental_id)
 join inventory using (inventory_id) 
 join film using (film_id) group by film_id) as groupmovie;
 -- yha se bhi hr ek film_id ka total amount nikala h
select sum(newamount) from 
(select sum(amount) as newamount, film_id from payment join rental using (rental_id)
 join inventory using (inventory_id) 
 join film using (film_id) group by film_id) as groupmovie;
 -- total sare amount ka bhi sum milega
 select avg(newamount) from 
(select sum(amount) as newamount, film_id from payment join rental using (rental_id)
 join inventory using (inventory_id) 
 join film using (film_id) group by film_id) as groupmovie;
  
 -- total sare amount ka avg milega
 use sakila;
 select * from payment;
 select payment_id, rental_id, amount from payment;
  select
  case 
  when rental_id = 76 then "xyz"
  when rental_id>=1000 then "joby"
  else rental_id
  end "newcol",
  rental_id, payment_id, amount from payment;
  
  select
  case rental_id
  when 76 then "xyz"
  when 1000 then "joe"
  else rental_id
  end "newcol",
  rental_id, payment_id, amount from payment;
  
  -- ceil = decimal+1
  -- floor = origional decimal
  -- round = based or decimal if >5 = +1
  -- else = <5 = original
  select round(193.444,2) from dual;
  -- 193.44 milega
  select round(193.484,2) from dual;
  -- 193.48 milega kuki decimal k bad 2nd number 8 h vo 5 se bda h to bdega nhi kuki
  select round(193.685,2) from dual;
  -- 193.68 mlega 
  select round(193.644,2) from dual;
 --  193.64 milega
  select round(143.444,-1) from dual;
  -- yha -1 ka mtlb hme 143 k 3 se khelna h ab 3 hmare 5 se chota h to 3 ki jgh 0 ho jayga usse phle 4 h to ye ese ka ese rhega kuki 3 hmara 5 se chota tha isliye 140 mila 
    select round(166.444,-1) from dual;
  -- yha -1 ka mtlb hme 146 k 6 se khelna h ab 6 hmare 5 se bda h to 6 ki jgh 0 ho jayga usse phle 6 h to ye ek bdega kuki 6 hmara 5 se bda tha isliye 170 mila
  select mod (7,2) from dual;
  -- yha se 1 milega mtlb ye (%)modulas nikalta h
  use employees;
  select * from employees;
  -- q.1 employe no fname year lname complete name unka jinka byear empv 10003 k byrae s jyada ho or unki hire year < 10005
  -- q.2 get the information of these user where the hire year is > among all the hire year of emp_no 1000 to 10007
  -- q.3 find outb the emp  no deprtno and deprt name of those user who has work in my company for more than 28 years
  -- q.4 find out the empno deprtno and name of emp and next working monday from the date colom
  -- q.5 find the empname empno deprtno deprtname and the year the total no of mmonth into your comapny only those user where the total no of month working > 400
  use employees;
select *from employees;
show tables;

-- Que. 1 
 select emp_no, first_name,last_name, concat(first_name," ",last_name)as fullname ,birth_date,hire_date from employees
 where year(birth_date)>(select year(birth_date) from employees where emp_no=10003 ) 
 and year(hire_date)<(select year(hire_date) from employees where emp_no=10005) ;
 
 -- Que. 2
 select *from employees where year(hire_date)>all(select year(hire_date) from employees where emp_no between 10003 and 10007);
 
 -- Que. 3
select  departments.dept_name ,dept_emp.emp_no, dept_emp.dept_no  from departments 
 inner join dept_emp  on dept_emp.dept_no=departments.dept_no
 where departments.dept_no in (select dept_no from dept_emp where  TIMESTAMPDIFF( year,from_date,CURRENT_TIMESTAMP())>28);
 
 select *,TIMESTAMPDIFF( year,from_date,CURRENT_TIMESTAMP()) from dept_emp ;
 
-- Que. 4
 select emp_no,dept_emp.dept_no, concat(first_name," ",last_name)as fullName,hire_date,
 ADDDATE(hire_date, INTERVAL 9-DAYOFWEEK(hire_date) day)as NextWorkingDate 
 from employees inner join dept_emp using(emp_no);
 
 -- Que. 5
select emp_no,dept_emp.dept_no,departments.dept_name,TIMESTAMPDIFF( month,hire_date,CURRENT_TIMESTAMP()) as months
from employees inner join dept_emp
using (emp_no) inner join departments using(dept_no)
 where TIMESTAMPDIFF( month,hire_date,CURRENT_TIMESTAMP())>400;
