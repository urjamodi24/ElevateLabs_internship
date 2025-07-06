CREATE DATABASE FoodDelivery1;
USE FoodDelivery1;

-- 1. Customer Table
CREATE TABLE Customer (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(15),
    address TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 2. Restaurant Table
CREATE TABLE Restaurant (
    restaurant_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    location VARCHAR(150),
    contact_number VARCHAR(15),
    rating DECIMAL(2,1),
    open_time TIME,
    close_time TIME
);

-- 3. MenuItem Table
CREATE TABLE MenuItem (
    item_id INT PRIMARY KEY AUTO_INCREMENT,
    restaurant_id INT,
    name VARCHAR(100),
    description TEXT,
    price DECIMAL(10,2),
    is_available BOOLEAN DEFAULT TRUE,
    FOREIGN KEY (restaurant_id) REFERENCES Restaurant(restaurant_id)
);

-- 4. DeliveryAgent Table
CREATE TABLE DeliveryAgent (
    agent_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    phone VARCHAR(15),
    vehicle_number VARCHAR(20),
    available_status BOOLEAN DEFAULT TRUE
);

-- 5. Order Table
CREATE TABLE Orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    restaurant_id INT,
    delivery_agent_id INT,
    order_time DATETIME DEFAULT CURRENT_TIMESTAMP,
    delivery_time DATETIME,
    status ENUM('Pending', 'Delivered', 'Cancelled'),
    total_amount DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id),
    FOREIGN KEY (restaurant_id) REFERENCES Restaurant(restaurant_id),
    FOREIGN KEY (delivery_agent_id) REFERENCES DeliveryAgent(agent_id)
);

-- 6. Review Table
CREATE TABLE Review (
    review_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    restaurant_id INT,
    rating INT CHECK (rating BETWEEN 1 AND 5),
    comment TEXT,
    review_date DATE,
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id),
    FOREIGN KEY (restaurant_id) REFERENCES Restaurant(restaurant_id)
);
