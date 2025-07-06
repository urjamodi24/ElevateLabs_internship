use fooddelivery1;

CREATE VIEW OrderSummary AS
SELECT 
    o.order_id,
    c.name AS customer_name,
    r.name AS restaurant_name,
    o.total_amount,
    o.status,
    o.delivery_time
FROM Orders o
JOIN Customer c ON o.customer_id = c.customer_id
JOIN Restaurant r ON o.restaurant_id = r.restaurant_id;

-- Example usage:
SELECT * FROM OrderSummary WHERE status = 'Delivered';


CREATE VIEW AvailableMenuItems AS
SELECT 
    m.item_id,
    m.name AS item_name,
    m.price,
    r.name AS restaurant_name
FROM MenuItem m
JOIN Restaurant r ON m.restaurant_id = r.restaurant_id
WHERE m.is_available = TRUE;


SELECT * FROM AvailableMenuItems ORDER BY price DESC;


CREATE VIEW RestaurantAvgRating AS
SELECT 
    r.name AS restaurant_name,
    AVG(rv.rating) AS avg_rating
FROM Restaurant r
JOIN Review rv ON r.restaurant_id = rv.restaurant_id
GROUP BY r.restaurant_id;


SELECT * FROM RestaurantAvgRating WHERE avg_rating > 4.0;


CREATE VIEW PublicCustomerInfo AS
SELECT 
    name,
    address
FROM Customer;


SELECT * FROM PublicCustomerInfo;


CREATE VIEW ValidReviews AS
SELECT 
    c.name AS customer_name,
    r.name AS restaurant_name,
    rv.rating,
    rv.comment,
    rv.review_date
FROM Review rv
JOIN Customer c ON rv.customer_id = c.customer_id
JOIN Restaurant r ON rv.restaurant_id = r.restaurant_id
WHERE rv.comment IS NOT NULL;


SELECT * FROM ValidReviews ORDER BY rating DESC;


