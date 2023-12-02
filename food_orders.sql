-- favourite restaurant by the most active client

SELECT customer_id, COUNT(*) as amount
FROM food_order fo 
group by customer_id 
order by amount desc
limit 1

SELECT *, count(*) as amount
FROM food_order fo 
where customer_id = 52832
GROUP By restaurant_name 
order by amount desc
limit 1

-- We are looking for a restaurant with the longest wait time for orders, its average rating, and minimum of 10 feedbacks.

SELECT *,
avg(rating) av_raiting,
(food_preparation_time + delivery_time) AS waiting_time
FROM food_order fo2
WHERE rating != 'Not given'
AND customer_id IN (
SELECT customer_id
FROM food_order
GROUP BY customer_id
HAVING COUNT(order_id) > 10
)
ORDER BY waiting_time DESC

-- the percentage of the total order amount that is contributed by the top 5 restaurants

SELECT sum(revenue)/(SELECT sum(cost_of_the_order) FROM "food_order") * 100
FROM (SELECT restaurant_name, 
sum(cost_of_the_order) revenue
FROM "food_order"
group by restaurant_name
order by revenue desc
limit 5)






