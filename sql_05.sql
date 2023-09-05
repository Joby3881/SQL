-- string fuction.
create database sakila2;
use sakila2;
select * from film_list;
select * from film_list order by category;
select * from film_list order by category asc;
select * from film_list order by category desc;
select catagory, title from film_list order by price;
select * from address order by district;
select district,address,address_id from address order by district;
select district,address,address_id from address order by district desc, address_id asc;
select * from address limit 3;
select * from address limit 3,2;
select * from address limit 13,3;
select * from address limit 3 offset 3;
select 2+2 from duel;
select now() from duel;
select length("d");
select char_length("F");
select concat("h","e");
select concat_ws("$","hey","hello","hi");
select substr("hello",-2);
select substr( substr("hello",1,3),2);
select instr("hello","el");  -- index possition find karr ne ke liye use hota hai.
select locate("a","rajasthan",3); -- 
select ltrim("     xyz");
select rtrim("xyz   ");
select trim("   xyz  ");  -- both side wide space remove
select trim(leading" "from"   z  yz");
select  trim(both "z" from "zzz zz li z"); -- ans : zz li.
select  trim(both "z" from " zzz zz li z"); -- ans : zzz zz li.
-- select  rpad();
select replace("tushars","s","#"); -- ana : tu#har#.

