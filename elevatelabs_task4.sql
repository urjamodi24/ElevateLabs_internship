use fooddelivery1;
-- 1. Total number of orders placed
SELECT COUNT(*) AS total_orders
FROM Orders;

-- 2. Total revenue generated
SELECT SUM(total_amount) AS total_revenue
FROM Orders
WHERE status = 'Delivered';

-- 3. Average order value (delivered orders only)
SELECT AVG(total_amount) AS avg_order_value
FROM Orders
WHERE status = 'Delivered';

-- 4. Total number of menu items per restaurant
SELECT r.name AS restaurant_name, COUNT(m.item_id) AS menu_item_count
FROM Restaurant r
JOIN MenuItem m ON r.restaurant_id = m.restaurant_id
GROUP BY r.name;

-- 5. Total orders received by each restaurant
SELECT r.name AS restaurant_name, COUNT(o.order_id) AS order_count
FROM Orders o
JOIN Restaurant r ON o.restaurant_id = r.restaurant_id
GROUP BY r.name;

-- 6. Total revenue generated per restaurant
SELECT r.name AS restaurant_name, SUM(o.total_amount) AS revenue
FROM Orders o
JOIN Restaurant r ON o.restaurant_id = r.restaurant_id
WHERE o.status = 'Delivered'
GROUP BY r.name;

-- 7. Delivery agents and how many orders they delivered
SELECT d.name AS delivery_agent, COUNT(o.order_id) AS delivered_orders
FROM DeliveryAgent d
JOIN Orders o ON d.agent_id = o.delivery_agent_id
WHERE o.status = 'Delivered'
GROUP BY d.name;

-- 8. Customers and number of orders they placed
SELECT c.name AS customer_name, COUNT(o.order_id) AS total_orders
FROM Customer c
JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.name;

-- 9. Restaurants with more than 1 menu item
SELECT r.name AS restaurant_name, COUNT(m.item_id) AS item_count
FROM Restaurant r
JOIN MenuItem m ON r.restaurant_id = m.restaurant_id
GROUP BY r.name
HAVING COUNT(m.item_id) > 1;

-- 10. Average rating received by each restaurant
SELECT r.name AS restaurant_name, AVG(rv.rating) AS avg_rating
FROM Review rv
JOIN Restaurant r ON rv.restaurant_id = r.restaurant_id
GROUP BY r.name;
