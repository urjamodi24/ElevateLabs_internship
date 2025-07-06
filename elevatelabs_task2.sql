use fooddelivery1;
INSERT INTO Customer (name, email, phone, address)
VALUES 
  ('Aarav Mehta', 'aarav@example.com', '9876543210', 'Bangalore'),
  ('Sana Sharma', 'sana@example.com', NULL, 'Mumbai'), -- phone is NULL
  ('Rohan Iyer', 'rohan@example.com', '9123456789', NULL);
  
INSERT INTO Restaurant (name, location, contact_number, rating, open_time, close_time)
VALUES 
  ('Spice Hub', 'Delhi', '9812345678', 4.3, '10:00:00', '22:00:00'),
  ('Burger Town', 'Hyderabad', '9911223344', 4.0, '11:00:00', '23:00:00');
  
INSERT INTO MenuItem (restaurant_id, name, description, price)
VALUES 
  (1, 'Paneer Tikka', 'Grilled cottage cheese', 220.00),
  (1, 'Butter Naan', NULL, 35.00), -- description is NULL
  (2, 'Veg Burger', 'Lettuce, tomato, patty', 150.00);
  
INSERT INTO DeliveryAgent (name, phone, vehicle_number)
VALUES 
  ('Raj Malhotra', '9900011122', 'KA03AB1234'),
  ('Neha Verma', '9888877766', 'TS09XY5678');
  
  
INSERT INTO Orders (customer_id, restaurant_id, delivery_agent_id, delivery_time, status, total_amount)
VALUES 
  (1, 1, 1, '2025-07-04 13:30:00', 'Delivered', 255.00),
  (2, 2, 2, NULL, 'Pending', 150.00);

CREATE TABLE OrderItem (
    order_item_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    item_id INT,
    quantity INT DEFAULT 1,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (item_id) REFERENCES MenuItem(item_id)
);

INSERT INTO OrderItem (order_id, item_id, quantity)
VALUES 
  (1, 1, 1), -- Paneer Tikka
  (1, 2, 2), -- Butter Naan
  (2, 3, 1); -- Veg Burger
  
INSERT INTO Review (customer_id, restaurant_id, rating, comment, review_date)
VALUES 
  (1, 1, 5, 'Excellent food and delivery!', '2025-07-03'),
  (2, 2, 4, NULL, '2025-07-04'); -- comment is NULL

UPDATE Customer
SET phone = '9000012345'
WHERE customer_id = 2;

UPDATE DeliveryAgent
SET available_status = FALSE
WHERE agent_id = 2;

UPDATE MenuItem
SET price = price * 0.9
WHERE item_id = 1;

SET SQL_SAFE_UPDATES = 0;


DELETE FROM Review
WHERE comment IS NULL;


DELETE FROM Customer
WHERE customer_id = 3;

show tables;

