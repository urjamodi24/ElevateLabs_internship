SELECT 
    name,
    (SELECT SUM(total_amount) 
     FROM Orders 
     WHERE Orders.customer_id = Customer.customer_id) AS total_spent
FROM Customer;

SELECT name
FROM Customer
WHERE customer_id IN (
    SELECT customer_id
    FROM Orders
    WHERE restaurant_id IN (
        SELECT restaurant_id
        FROM Restaurant
        WHERE location = 'Delhi'
    )
);


SELECT name
FROM Restaurant r
WHERE EXISTS (
    SELECT 1
    FROM Review rev
    WHERE rev.restaurant_id = r.restaurant_id
);

SELECT name, price
FROM MenuItem m
WHERE price > (
    SELECT AVG(price)
    FROM MenuItem
    WHERE restaurant_id = m.restaurant_id
);


SELECT r.name, avg_ratings.avg_rating
FROM (
    SELECT restaurant_id, AVG(rating) AS avg_rating
    FROM Review
    GROUP BY restaurant_id
) AS avg_ratings
JOIN Restaurant r ON r.restaurant_id = avg_ratings.restaurant_id
WHERE avg_rating > 4.0;


SELECT name,
    (SELECT MAX(review_date)
     FROM Review
     WHERE restaurant_id = r.restaurant_id) AS latest_review
FROM Restaurant r;

SELECT name
FROM Customer c
WHERE NOT EXISTS (
    SELECT 1
    FROM Review r
    WHERE r.customer_id = c.customer_id
);

SELECT name
FROM DeliveryAgent
WHERE agent_id IN (
    SELECT delivery_agent_id
    FROM Orders
    WHERE total_amount > 200
);






