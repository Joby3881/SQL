
-- sub query
use employees;
show tables;
select hire_date from employees where emp_no=10003;
select * from employees where hire_date>'1986-08-28';

 -- nested query
  --  subquery return 1 row  => ,<, >, <=
select * from employees
where hire_date> (select hire_date from employees where emp_no=10003);
select * from employees 
where emp_no=(select emp_no from employees where first_name ='georgi' and birth_date='1953-09-02');

select * from titles;
select * from titles where emp_no=10001;
select * from titles where title=(select title from titles where emp_no=10001);
select title from titles where emp_no in (10001,10002);
select * from titles where title=any(select title from titles where emp_no in (10001,10002));
select salary from  salaries where emp_no=10002;
select * from  salaries where salary=any(select salary from  salaries where emp_no=10002);

-- sabhi value pr equal ki tarah campare karega 
select * from  salaries where salary>any(select salary from  salaries where emp_no=10002);

-- maximum value of result set
select * from  salaries where salary<any(select salary from  salaries where emp_no=10002);
select * from  salaries where salary >= any(select salary from  salaries where emp_no=10002); 
select * from  salaries where salary <= any(select salary from  salaries where emp_no=10002);
