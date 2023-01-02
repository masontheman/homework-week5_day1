--select,from,join,on,where,group by,having,order by,offset,limit
select * from actor a;
--Question 1:
select last_name, count(*) from actor a where last_name = 'Wahlberg' group by last_name ;
--Awnser: 2


--Question 2:
select count(*) from payment where amount between 3.99 and 5.99;
--Awnser: 5,607
select count(*),amount from payment where amount between 3.99 and 5.99 group by amount;
--4.99: 3424, 5.99: 1188, 5.98: 7, 3.99: 3.99

--Question 3:
--List of movies that have an inventory of atlest 7 with the 2 stores combined
select * from inventory i;
select film_id, count(*) from inventory i group by film_id having count(film_id) = 7;
select film_id from inventory i group by film_id having count(film_id) = 7;
--Awnser: 116
--List of movies in descending order by inventory status of a praticular move, the most was 
select store_id, count(film_id),film_id  from inventory i group by store_id,film_id having count(film_id) > 1 order by count(film_id) desc;
--The most one single store had was an inventory of 4 movies

--Question 4:
select * from customer c;
--customers with the first name Willie
select first_name,count(*) from customer c where first_name = 'Willie' group by first_name;
select count(first_name) from customer c where first_name = 'Willie';
--Awnser: 2
--Get both first and last name of the 2
select first_name,last_name from customer c where first_name = 'Willie' group by first_name,last_name;

--Qustion 5
select count(staff_id) from rental r group by staff_id;
--Awnser: staff_id 1

--Question 6
select * from address a ;
select count(district) from address a group by district;
--Awnser 378

--Question 7
select * from film_actor fa2;
select film_id,count(film_id) from film_actor fa group by film_id order by count(film_id) desc;
select film_id,count(film_id),last_update from film_actor fa group by film_id,last_update  order by count(film_id) desc;
--Awnser: 508 with 15 actors and it was last updated on 2006-02-15 10:05:03.000

--Question 8
select * from customer c ;
select count(last_name) from customer c where last_name  like '%es';
select last_name from customer c where last_name  like '%es';
--Awnser: 21


--Question 9
select * from payment p ;
select amount, count(amount) 
from payment p 
where customer_id 
between 380 and 430 
group by amount
having count(amount) > 250;
--Awnser 2.99: 290, 4.99: 281, and 0.99: 269

--Quesion 10
select * from film;
select rating, count(rating) from film f group by rating;
--Awnser 5 categories and PG13 has 223 movies which is the most
select rating, count(rating),release_year,language_id,rental_rate from film f group by rating,release_year,language_id,rental_rate order by count(*) desc;
--Every Movie is from 2006 abd every movie in the same language
--PG13 with a rental rate of 4.99 had the most purcahses with 77
select rating, count(rating),release_year,language_id,rental_rate,special_features from film f group by rating,release_year,language_id,rental_rate,special_features order by count(*) desc;
--G rated movies with Commentaries and Behind the scenes sold the most out of the group by criteria with 10 copies sold


