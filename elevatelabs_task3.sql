use fooddelivery1;

SELECT * FROM Customer;

SELECT name, location, rating 
FROM Restaurant 
WHERE rating > 4;

SELECT name, price 
FROM MenuItem 
WHERE price < 200 
ORDER BY price ASC;

SELECT * 
FROM Orders 
WHERE status = 'Pending';

SELECT name, phone 
FROM DeliveryAgent 
WHERE available_status = TRUE;

SELECT name, email 
FROM Customer 
WHERE phone IS NULL;

SELECT * 
FROM Restaurant 
WHERE name LIKE '%Burger%';

SELECT * 
FROM Orders 
WHERE order_time BETWEEN '2025-07-01' AND '2025-07-10';


SELECT name, price 
FROM MenuItem 
ORDER BY price DESC 
LIMIT 2;


SELECT * 
FROM Review 
WHERE rating = 5;

SELECT o.order_id, c.name AS customer_name, r.name AS restaurant_name, o.total_amount, o.status
FROM Orders o
JOIN Customer c ON o.customer_id = c.customer_id
JOIN Restaurant r ON o.restaurant_id = r.restaurant_id;



-- 12. Get order items with item names and quantity
SELECT oi.order_id, mi.name AS item_name, oi.quantity
FROM OrderItem oi
JOIN MenuItem mi ON oi.item_id = mi.item_id;

-- 13. Get delivery agent name for each order
SELECT o.order_id, d.name AS delivery_agent, o.status
FROM Orders o
JOIN DeliveryAgent d ON o.delivery_agent_id = d.agent_id;

-- 14. Get customers who gave reviews and what they said
SELECT c.name AS customer_name, r.name AS restaurant_name, rv.rating, rv.comment
FROM Review rv
JOIN Customer c ON rv.customer_id = c.customer_id
JOIN Restaurant r ON rv.restaurant_id = r.restaurant_id;

-- 15. Get the number of menu items per restaurant
SELECT r.name AS restaurant_name, COUNT(mi.item_id) AS total_items
FROM Restaurant r
JOIN MenuItem mi ON r.restaurant_id = mi.restaurant_id
GROUP BY r.name;

-- 16. Get total revenue (sum of total_amount) generated per restaurant
SELECT r.name AS restaurant_name, SUM(o.total_amount) AS total_revenue
FROM Orders o
JOIN Restaurant r ON o.restaurant_id = r.restaurant_id
GROUP BY r.name;

-- 17. Find customers who placed more than 1 order
SELECT c.name, COUNT(o.order_id) AS order_count
FROM Customer c
JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.name
HAVING COUNT(o.order_id) > 1;