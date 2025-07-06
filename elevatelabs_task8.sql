use fooddelivery1;
DELIMITER $$

CREATE PROCEDURE AddCustomer (
    IN p_name VARCHAR(100),
    IN p_email VARCHAR(100),
    IN p_phone VARCHAR(15),
    IN p_address TEXT
)
BEGIN
    IF NOT EXISTS (SELECT 1 FROM Customer WHERE email = p_email) THEN
        INSERT INTO Customer (name, email, phone, address)
        VALUES (p_name, p_email, p_phone, p_address);
    ELSE
        SELECT 'Customer with this email already exists.' AS message;
    END IF;
END$$

DELIMITER ;

CALL AddCustomer('Ishaan Kapoor', 'ishaan@example.com', '9988776655', 'Pune');


DELIMITER $$

CREATE FUNCTION GetAverageRating (p_restaurant_id INT)
RETURNS DECIMAL(3,2)
DETERMINISTIC
BEGIN
    DECLARE avg_rating DECIMAL(3,2);

    SELECT AVG(rating)
    INTO avg_rating
    FROM Review
    WHERE restaurant_id = p_restaurant_id;

    RETURN avg_rating;
END$$

DELIMITER ;

SELECT name, GetAverageRating(restaurant_id) AS avg_rating
FROM Restaurant;


