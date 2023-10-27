-- view is a stored quary table ke form me.
-- vie mainly 2 type
-- simple, complex
-- simple view: jisme koi clauses nahi hote like aggrigation, join and fuction
-- where close only used called simple view.
-- complex view jise me ye sare clauses use hota hai this is called view.
-- why we shoud view 
-- 1.view can manege complexicty manege.
-- 2.reusability
-- 3.Scurity 
-- 4.backword compatibility (naye data dalatho bhi koi farkh nahi padtha) 
drop table employees123;
create table employees123(id int, name varchar(20), salary int);
insert into employees123 values(10,"abc",100),(20,"def",200),(30,"new",300);
select * from employees123;
create view empView as select id, name from employees123;
select * from empView;
insert into empview values(40,"japan");
select * from employees123 where id=30;
alter view empview as select id, name from employees123 where id=30;
select * from empview;
insert into empview values(50,"Iraq");

drop table dept123;
create table dept123(id int, deptname varchar(20));
insert into dept123 values(10,"HR"),(20,"Marketing"),(30,"Oops");
select * from dept123;
select * from employees123;
select employees123.id, name, deptname from employees123 inner join dept123 using(id);
create view empjoin 
as select employees123.id, name, deptname from employees123 inner join dept123 using(id);
select * from empjoin;
insert into empjoin(id, name) values(60,"kilo"); 
select * from employees123;
select * from empjoin;
insert into empjoin(id, deptname) values(60,"Reds"); -- partialy modified view.

