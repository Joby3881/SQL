use reds;
create table NewT( id int ,name varchar (50), status boolean,  
secondery_name varchar(50) check (reverse(secondery_name)=secondery_name));
insert into NewT values(1 ,'vikas', true, 'php');
select*from NewT;

create table Tb(hs_id int ,p_price int ,s_price int, check(p_price < s_price) );
insert into tb values (1,6000,7000);
insert into Tb values(1,6000,4000);
select * from Tb;

create table Students (registration int ,Sname varchar(100), 
Sid int ,constraint St_Sid_fk foreign key (Sid) references St_hoby(Sid));

insert into Students values(101,'vikas',1);
insert into Students values(102,'mohit',2);
insert into Students values(104,'joby',4);

select*from Students;

create table St_hoby (Sid int primary key  ,hoby varchar (50));

insert into St_hoby values(1,'cricket');
insert into St_hoby values(2,'basketboll');
insert into St_hoby values(3,'tanis');

select*from St_hoby;

drop table customer;
create table customer (C_id int ,C_name varchar (100),C_country varchar (100) ,C_city varchar (100),constraint abc unique (C_city,C_country));

create table customer_info (C_id int ,C_city varchar (100),C_country_name varchar (100), constraint CC_info
 foreign key (C_city, C_country_name) references customer(C_city,C_country));
 
 
 create table company(id int ,name varchar(100));
 insert into company values(2,'vh');

 alter table company add column email varchar(200) default 'new@gmail.com';

select*from company;

rename table company to mycompany;
select*from mycompany;

alter table mycompany rename column email to Email;
select*from mycompany;

alter table mycompany change id Emp_id int;
select*from mycompany;

alter table mycompany modify name char(50);
desc mycompany;


alter table mycompany add primary key(emp_id);
desc mycompany;

alter table mycompany drop primary key;
desc mycompany;

use reds;
create table c_detail(name varchar(30), customer_id int,c_name varchar(50),order_id int) ;
desc c_detail;
alter table c_detail add primary key(customer_id);
desc c_detail;
alter table c_detail modify customer_id int auto_increment;
desc c_detail;

use reds;
create table person(id int, name varchar(50), mark int);
insert into person values(4,'shivam',46);
select * from person;

select max(id), name, count(name), max(mark) from person where name ='aman';
insert into person values(5,'aman',null);
select * from person;
delete from person where id =3;
select id,name, count(name)




