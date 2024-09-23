create database food_delivery_management;
use food_delivery_management;

CREATE TABLE Customer (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(15),
    address TEXT
);
INSERT INTO Customer (name, email, phone, address) VALUES
('John', 'john@example.com', '1234567890', '123 Elm St'),
('Janani', 'janani@example.com', '0987654321', '456 Oak St'),
('Aliya', 'aliya@example.com', '2345678901', '789 Maple St'),
('Balu', 'balu@example.com', '5678901234', '101 Pine St'),
('Chandru', 'chandru@example.com', '6789012345', '202 Birch St'),
('Dharshini', 'dharshini@example.com', '3456789012', '303 Cedar St'),
('Iniya', 'iniya@example.com', '8901234567', '404 Spruce St'),
('Harish', 'harish@example.com', '4567890123', '505 Cherry St'),
('Gopika', 'gopika@example.com', '7890123456', '606 Ash St'),
('Logu', 'logu@example.com', '0123456789', '707 Poplar St'),
('Yazhini', 'yazhini@example.com', '5678901234', '808 Willow St'),
('Jenifer', 'jack@example.com', '1234567890', '909 Walnut St'),
('Kiran', 'kiran@example.com', '0987654321', '1010 Cypress St'),
('Mariyam', 'mariyam@example.com', '2345678901', '1111 Chestnut St'),
('Ravi', 'ravi@example.com', '3456789012', '1212 Palm St');
select *from Customer;

CREATE TABLE Restaurant (
    restaurant_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    location TEXT NOT NULL,
    phone VARCHAR(15),
    email VARCHAR(100)
);
INSERT INTO Restaurant (name, location, phone, email) VALUES
('Pizza Palace', '123 Pizza Rd', '7734567890', 'pizza@example.com'),
('Burger Haven', '456 Burger Ave', '9887654321', 'burger@example.com'),
('Taco Town', '789 Taco Ln', '9745678901', 'taco@example.com'),
('Sushi Central', '101 Sushi Blvd', '9656789012', 'sushi@example.com'),
('Pasta Point', '202 Pasta St', '9578901234', 'pasta@example.com'),
('Noodle Nest', '303 Noodle Pl', '9489012345', 'noodle@example.com'),
('Salad Spot', '404 Salad Dr', '9390123456', 'salad@example.com'),
('Grill House', '505 Grill Rd', '8901234567', 'grill@example.com'),
('Curry Corner', '606 Curry Ave', '8823456789', 'curry@example.com'),
('Sandwich Stop', '707 Sandwich St', '8534567890', 'sandwich@example.com');

CREATE TABLE Food_Item (
    food_id INT PRIMARY KEY AUTO_INCREMENT,
    restaurant_id INT,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    price DECIMAL(8, 2) NOT NULL,
    FOREIGN KEY (restaurant_id) REFERENCES Restaurant(restaurant_id)
);

INSERT INTO Food_Item (restaurant_id, name, description, price) VALUES
(1, 'Margherita Pizza', 'Classic pizza with mozzarella and tomato', 10.50),
(1, 'Pepperoni Pizza', 'Pizza topped with pepperoni slices', 12.00),
(2, 'Cheeseburger', 'Burger with cheese, lettuce, and tomato', 8.75),
(2, 'Double Bacon Burger', 'Burger with double bacon and cheese', 11.50),
(3, 'Chicken Tacos', 'Soft tacos with grilled chicken', 7.25),
(3, 'Beef Tacos', 'Soft tacos with seasoned beef', 8.00),
(4, 'California Roll', 'Sushi roll with avocado and crab', 9.00),
(4, 'Spicy Tuna Roll', 'Sushi roll with tuna and spicy mayo', 10.00),
(5, 'Spaghetti Bolognese', 'Pasta with meat sauce', 11.50),
(5, 'Fettuccine Alfredo', 'Pasta with creamy Alfredo sauce', 12.00);

CREATE TABLE `Order` (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    restaurant_id INT,
    total_amount DECIMAL(10, 2) NOT NULL,
    status VARCHAR(50) DEFAULT 'Pending',
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id),
    FOREIGN KEY (restaurant_id) REFERENCES Restaurant(restaurant_id)
);

INSERT INTO `Order` (customer_id, restaurant_id, total_amount, status) VALUES
(1, 1, 20.00, 'Delivered'),
(2, 2, 15.50, 'Pending'),
(3, 3, 25.75, 'Cancelled'),
(4, 4, 19.90, 'Delivered'),
(5, 5, 30.00, 'Pending'),
(6, 6, 12.00, 'Delivered'),
(7, 7, 8.50, 'Delivered'),
(8, 8, 18.75, 'In Progress'),
(9, 9, 10.50, 'Pending'),
(10, 10, 22.00, 'Delivered');

CREATE TABLE Order_Item (
    order_item_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    food_id INT,
    quantity INT NOT NULL,
    price DECIMAL(8, 2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES `Order`(order_id),
    FOREIGN KEY (food_id) REFERENCES Food_Item(food_id)
);

INSERT INTO Order_Item (order_id, food_id, quantity, price) VALUES
(1, 1, 2, 10.50),
(1, 2, 1, 12.00),
(2, 3, 2, 8.75),
(3, 5, 3, 7.25),
(4, 7, 1, 9.00),
(5, 9, 2, 9.50),
(6, 12, 1, 9.00),
(7, 15, 1, 7.50),
(8, 18, 2, 12.00),
(9, 20, 1, 6.50),
(10, 11, 1, 12.00);

CREATE TABLE Delivery (
    delivery_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    delivery_address TEXT,
    delivery_status VARCHAR(50) DEFAULT 'In Progress',
    delivery_fee DECIMAL(8, 2),
    FOREIGN KEY (order_id) REFERENCES `Order`(order_id)
);
INSERT INTO Delivery (order_id, delivery_address, delivery_status, delivery_fee) VALUES
(1, '123 Elm St', 'Delivered', 2.50),
(2, '456 Oak St', 'Pending', 3.00),
(3, '789 Maple St', 'Cancelled', 0.00),
(4, '101 Pine St', 'Delivered', 2.75),
(5, '202 Birch St', 'Pending', 3.50),
(6, '303 Cedar St', 'Delivered', 2.25),
(7, '404 Spruce St', 'Delivered', 2.75),
(8, '505 Cherry St', 'In Progress', 3.00),
(9, '606 Ash St', 'Pending', 2.50),
(10, '707 Poplar St', 'Delivered', 2.75);

CREATE TABLE Payment (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    payment_method VARCHAR(50) NOT NULL,
    amount_paid DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES `Order`(order_id)
);

INSERT INTO Payment (order_id, payment_method, amount_paid) VALUES
(1, 'Credit Card', 20.00),
(2, 'Debit Card', 15.50),
(3, 'Cash', 0.00),
(4, 'Credit Card', 19.90),
(5, 'Credit Card', 30.00),
(6, 'Cash', 12.00),
(7, 'Debit Card', 8.50),
(8, 'Credit Card', 18.75),
(9, 'Cash', 10.50),
(10, 'Credit Card', 22.00);

CREATE TABLE Delivery_Agent (
    agent_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    phone VARCHAR(15) UNIQUE NOT NULL,
    email VARCHAR(100)
);
INSERT INTO Delivery_Agent (name, phone, email) VALUES
('john', '8723456890', 'john@example.com'),
('Gopika', '9876543345', 'gopika@example.com'),
('Chandru', '8735368990', 'chandru@example.com'),
('Iniya', '7526868688', 'iniya@example.com'),
('Logu', '9365845687', 'logu@example.com'),
('Balu', '8836478324', 'balu@example.com'),
('Harish', '8943566745', 'harish@example.com'),
('Mariyam', '9035354654', 'mariyam@example.com'),
('Yazhini', '9156776856', 'yazhini@example.com'),
('Ravi', '8021476546', 'ravi@example.com');

CREATE TABLE Agent_Assignment (
    assignment_id INT PRIMARY KEY AUTO_INCREMENT,
    agent_id INT,
    order_id INT,
    FOREIGN KEY (agent_id) REFERENCES Delivery_Agent(agent_id),
    FOREIGN KEY (order_id) REFERENCES `Order`(order_id)
);

INSERT INTO Agent_Assignment (agent_id, order_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);

CREATE TABLE Category (
    category_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL
);

INSERT INTO Category (name) VALUES
('Pizza'),
('Burger'),
('Tacos'),
('Sushi'),
('Pasta'),
('Soup'),
('Salad'),
('Grill'),
('Curry'),
('Sandwiches');

CREATE TABLE Food_Category (
    food_id INT,
    category_id INT,
    PRIMARY KEY (food_id, category_id),
    FOREIGN KEY (food_id) REFERENCES Food_Item(food_id),
    FOREIGN KEY (category_id) REFERENCES Category(category_id)
);

INSERT INTO Food_Category (food_id, category_id) VALUES
(1, 1),
(2, 1),
(3, 2),
(4, 2),
(5, 3),
(6, 3),
(7, 4),
(8, 4),
(9, 5),
(10, 5);

CREATE TABLE Review (
    review_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    restaurant_id INT,
    rating INT CHECK (rating >= 1 AND rating <= 5),
    comment TEXT,
    review_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id),
    FOREIGN KEY (restaurant_id) REFERENCES Restaurant(restaurant_id)
);

INSERT INTO Review (customer_id, restaurant_id, rating, comment) VALUES
(1, 1, 5, 'Delicious pizza, fast delivery.'),
(2, 2, 4, 'Great burgers, a bit expensive.'),
(3, 3, 5, 'Loved the tacos, will order again.'),
(4, 4, 4, 'Good sushi, fast service.'),
(5, 5, 3, 'Pasta was okay, delivery took a while.'),
(6, 6, 5, 'Noodles were excellent, great taste.'),
(7, 7, 4, 'Fresh salad, very satisfying.'),
(8, 8, 5, 'Perfectly grilled chicken, loved it.'),
(9, 9, 5, 'The curry was so flavorful!'),
(10, 10, 3, 'Sandwich was average, delivery was fast.');

SELECT
    Customer.name AS customer_name,
    `Order`.id AS order_id,
    Restaurant.name AS restaurant_name,
    Food_Item.name AS food_item_name,
    Order_Item.quantity AS quantity,
    Order_Item.price AS item_price,
    `Order`.total_amount AS total_order_amount
FROM
    Customer
JOIN
    `Order` ON Customer.id = `Order`.customer_id
JOIN
    Order_Item ON `Order`.id = Order_Item.order_id
JOIN
    Food_Item ON Order_Item.food_id = Food_Item.id
JOIN
    Restaurant ON Food_Item.restaurant_id = Restaurant.id;

SELECT
    `Order`.id AS order_id,
    Customer.name AS customer_name,
    Restaurant.name AS restaurant_name,
    Food_Item.name AS food_item_name,
    Review.rating AS customer_rating,
    Review.comment AS customer_comment
FROM
    `Order`
JOIN
    Customer ON `Order`.customer_id = Customer.id
JOIN
    Order_Item ON `Order`.id = Order_Item.order_id
JOIN
    Food_Item ON Order_Item.food_id = Food_Item.id
JOIN
    Restaurant ON Food_Item.restaurant_id = Restaurant.id
LEFT JOIN
    Review ON Customer.id = Review.customer_id AND Restaurant.id = Review.restaurant_id;
SELECT
    Customer.name AS customer_name,
    `Order`.id AS order_id,
    Delivery.delivery_status AS delivery_status,
    Delivery_Agent.name AS agent_name,
    Payment.payment_method AS payment_method,
    Payment.amount_paid AS amount_paid
FROM
    Customer
JOIN
    `Order` ON Customer.id = `Order`.customer_id
LEFT JOIN
    Delivery ON `Order`.id = Delivery.order_id
LEFT JOIN
    Delivery_Agent ON Delivery.agent_id = Delivery_Agent.id
LEFT JOIN
    Payment ON `Order`.id = Payment.order_id;


SELECT
    Delivery_Agent.name AS agent_name,
    Delivery_Agent.phone AS agent_phone,
    Customer.name AS customer_name,
    Customer.address AS delivery_address,
    Delivery.delivery_status AS delivery_status,
    `Order`.total_amount AS order_amount
FROM
    Delivery_Agent
JOIN
    Agent_Assignment ON Delivery_Agent.id = Agent_Assignment.agent_id
JOIN
    `Order` ON Agent_Assignment.order_id = `Order`.id
LEFT JOIN
    Delivery ON `Order`.id = Delivery.order_id
JOIN
    Customer ON `Order`.customer_id = Customer.id;
