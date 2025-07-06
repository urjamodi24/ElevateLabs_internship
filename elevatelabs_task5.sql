use fooddelivery1;
-- Add Customers
INSERT INTO Customer (name, email, phone, address) VALUES
  ('Ishita Rao', 'ishita@example.com', '9876541111', 'Chennai'),
  ('Devansh Patel', 'devansh@example.com', '7776655443', 'Ahmedabad');

-- Add Restaurants
INSERT INTO Restaurant (name, location, contact_number, rating, open_time, close_time) VALUES
  ('Tandoori Nights', 'Chandigarh', '9822222222', 3.9, '12:00:00', '23:30:00');

-- Add MenuItems
INSERT INTO MenuItem (restaurant_id, name, description, price) VALUES
  (3, 'Tandoori Chicken', 'Spicy grilled chicken', 300.00),
  (3, 'Garlic Naan', 'Naan with garlic butter', 40.00);

-- Add Orders (Devansh has no orders; Ishita has one)
INSERT INTO Orders (customer_id, restaurant_id, delivery_agent_id, delivery_time, status, total_amount) VALUES
  (4, 3, 1, '2025-07-04 20:00:00', 'Delivered', 340.00);

-- Add Order Items
INSERT INTO OrderItem (order_id, item_id, quantity) VALUES
  (3, 4, 1),
  (3, 5, 2);


-- Customers and their Orders (only those who placed orders)
SELECT c.name AS customer_name, o.order_id, o.status
FROM Customer c
INNER JOIN Orders o ON c.customer_id = o.customer_id;



-- All customers with their orders (if any)
SELECT c.name AS customer_name, o.order_id, o.status
FROM Customer c
LEFT JOIN Orders o ON c.customer_id = o.customer_id;

-- All orders with customer name (even if customer info is missing)
SELECT o.order_id, c.name AS customer_name, o.status
FROM Orders o
RIGHT JOIN Customer c ON o.customer_id = c.customer_id;


-- Simulate FULL JOIN between Customer and Orders
SELECT c.customer_id, c.name AS customer_name, o.order_id, o.status
FROM Customer c
LEFT JOIN Orders o ON c.customer_id = o.customer_id

UNION

SELECT c.customer_id, c.name AS customer_name, o.order_id, o.status
FROM Customer c
RIGHT JOIN Orders o ON c.customer_id = o.customer_id;


SELECT o.order_id, mi.name AS item_name, oi.quantity
FROM OrderItem oi
JOIN Orders o ON oi.order_id = o.order_id
JOIN MenuItem mi ON oi.item_id = mi.item_id;

SELECT r.name AS restaurant_name, mi.name AS menu_item
FROM Restaurant r
LEFT JOIN MenuItem mi ON r.restaurant_id = mi.restaurant_id;





