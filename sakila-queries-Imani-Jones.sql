use sakila;

-- write a query to find the total rental amount paid for each film 
SELECT film.film_id, sum(amount) as 'total_amount'
FROM film
join inventory on film.film_id = inventory.film_id
join rental on inventory.inventory_id = rental.inventory_id
join payment on rental.rental_id = payment.rental_id
group by film_id;

-- create a view named total_rental_amount using the query from the previous step
create view total_rental_amount as
SELECT film.film_id, sum(amount) as 'total_amount'
FROM film
join inventory on film.film_id = inventory.film_id
join rental on inventory.inventory_id = rental.inventory_id
join payment on rental.rental_id = payment.rental_id
group by film_id;

-- write a sql query to find the total number of copies in inventory for each film
select film.film_id, count(inventory.film_id) as 'total_copies'
from film
join inventory on film.film_id = inventory.film_id
group by film.film_id;

-- create a view names total_film_copies using the query from the previous step
create view total_film_copies as
select film.film_id, count(inventory.film_id) as 'total_copies'
from film
join inventory on film.film_id = inventory.film_id
group by film.film_id;

-- write a sql query that combines data from the fil table, the total_rental_amount, and the total_film_copies
-- to find all films with a total rental amount greater than 200,000 
select film.film_id, title, film.description, rental_duration, rental_rate, replacement_cost, rating, total_copies, total_amount
from film
join total_rental_amount on film.film_id = total_rental_amount.film_id
join total_film_copies on total_rental_amount.film_id = total_film_copies.film_id
where total_amount > 200.00;


