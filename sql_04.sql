 USE sakila;
-- Q1 JO actore hai unka id 2 to 7 and name nike ho 'ya' 'ed' se start ho 
-- 1 select *from actor where actor_id between 2 and 7and(first_name='nike' or first_name='ed');

-- Q2 'ae' last name me nahi aye.
-- 2 select *from actor where not (last_name like '%a%e%');

-- Q3 name grace, mattew, joe se na ho <15 tak;
-- 3 select *from actor where not(first_name='grace' or first_name='mattew') and not (first_name='joe') and actor_id<15;
-- Q4
-- 4 select *from actor where not (last_name like '%a%' or first_name like '%i%') and actor_id between 10 and 20;





