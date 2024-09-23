 create database Hostel_Management_System;
 use Hostel_Management_System;
 
 CREATE TABLE Student (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(15),
    address VARCHAR(255)
);

INSERT INTO Student (name, email, phone, address) VALUES
('Anitha', 'anitha@example.com', '7834567890', '123 Main St'),
('Banu', 'banu@example.com', '9087654321', '456 Elm St'),
('Chandra', 'chandra@example.com', '9945678901', '789 Oak St'),
('Roshan', 'roshan@example.com', '8856789012', '101 Pine St'),
('Priya', 'priya@example.com', '9767890123', '202 Maple St'),
('Geetha', 'geetha@example.com', '9678901234', '303 Birch St'),
('Sowmiya', 'sowmiya@example.com', '6789012345', '404 Cedar St'),
('Santhosh', 'santhosh@example.com', '7890123456', '505 Spruce St'),
('Ishu', 'ishu@example.com', '8901234567', '606 Cherry St'),
('Anu', 'anu@example.com', '9012345678', '707 Willow St'),
('Karthi', 'karthi@example.com', '8523456789', '808 Fir St'),
('Kani', 'kani@example.com', '8934567890', '909 Ash St'),
('Puvi', 'puvi@example.com', '9187654321', '1010 Poplar St'),
('Naveena', 'naveena@example.com', '9445678901', '1111 Cypress St'),
('Surya', 'surya@example.com', '8656789012', '1212 Redwood St');

select *from Student;
CREATE TABLE Hostel (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    location VARCHAR(100),
    capacity INT
);

INSERT INTO Hostel (name, location, capacity) VALUES
('Sunrise Hostel', 'Downtown', 50),
('Moonlight Hostel', 'Uptown', 40),
('Starview Hostel', 'Near Campus', 60),
('Hilltop Hostel', 'Suburbs', 30),
('Lakeside Hostel', 'Riverside', 45),
('Mountain View Hostel', 'Countryside', 20),
('Green Valley Hostel', 'Hills', 35),
('Cityscape Hostel', 'City Center', 55),
('Skyline Hostel', 'Highland', 25),
('Cozy Corner Hostel', 'Old Town', 70);

select *from Hostel;
CREATE TABLE Room (
    id INT PRIMARY KEY AUTO_INCREMENT,
    hostel_id INT,
    room_number VARCHAR(10),
    capacity INT,
    FOREIGN KEY (hostel_id) REFERENCES Hostel(id)
);
INSERT INTO Room (hostel_id, room_number, capacity) VALUES
(1, '101', 4),
(1, '102', 4),
(1, '103', 4),
(2, '201', 2),
(2, '202', 2),
(2, '203', 2),
(3, '301', 6),
(3, '302', 6),
(3, '303', 6),
(4, '401', 3);
select *from Room;

CREATE TABLE Warden (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    phone VARCHAR(15),
    email VARCHAR(100)
);
INSERT INTO Warden (name, phone, email) VALUES
('Arun ', '9857437537', 'arun@gmail.com'),
('Babu ', '9573436756', 'babu@gmail.comm'),
('Sathya ', '9843257589', 'sathya@gmail.com'),
('David', '8966367781', 'david@gmail.com'),
('Elakkiya', '6389690877', 'elakkiya@gmail.com'),
('janani', '6835896908', 'janani@gmail.com'),
('latchiya', '9312457689', 'latchiya@gmail.com'),
('naveen', '9043652389', 'naveen@gmail.com'),
('Megala', '9823696869', 'megala@gmail.com'),
('John', '91686967987', 'john@gmail.com'),
('Kavi', '70794692456', 'kavi@gmail.com'),
('Deepa', '9468598061', 'deepa@gmail.com');
select *from Warden;

CREATE TABLE Booking (
    id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    room_id INT,
    check_in_date DATE,
    check_out_date DATE,
    FOREIGN KEY (student_id) REFERENCES Student(id),
    FOREIGN KEY (room_id) REFERENCES Room(id)
);

INSERT INTO Booking (student_id, room_id, check_in_date, check_out_date) VALUES
(1, 1, '2023-09-01', '2024-06-30'),
(2, 2, '2023-09-05', '2024-06-30'),
(3, 3, '2023-09-10', '2024-06-30'),
(4, 4, '2023-09-15', '2024-06-30'),
(5, 5, '2023-09-20', '2024-06-30'),
(6, 6, '2023-09-25', '2024-06-30'),
(7, 7, '2023-09-30', '2024-06-30'),
(8, 8, '2023-10-01', '2024-06-30'),
(9, 9, '2023-10-05', '2024-06-30'),
(10, 10, '2023-10-10', '2024-06-30');

select *from Booking;
CREATE TABLE Payment (
    id INT PRIMARY KEY AUTO_INCREMENT,
    booking_id INT,
    amount DECIMAL(10, 2),
    payment_date DATE,
    payment_method VARCHAR(50),
    FOREIGN KEY (booking_id) REFERENCES Booking(id)
);
INSERT INTO Payment (booking_id, amount, payment_date, payment_method) VALUES
(1, 1000.00, '2023-09-01', 'Credit Card'),
(2, 1000.00, '2023-09-05', 'Debit Card'),
(3, 1000.00, '2023-09-10', 'Cash'),
(4, 800.00, '2023-09-15', 'Bank Transfer'),
(5, 1200.00, '2023-09-20', 'Credit Card'),
(6, 900.00, '2023-09-25', 'Debit Card'),
(7, 1100.00, '2023-09-30', 'Cash'),
(8, 1300.00, '2023-10-01', 'Bank Transfer'),
(9, 1400.00, '2023-10-05', 'Credit Card'),
(10, 1500.00, '2023-10-10', 'Debit Card');
select *from Payment;

CREATE TABLE Food (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    price DECIMAL(10, 2)
);

INSERT INTO Food (name, price) VALUES
('Rice', 2.00),
('Chicken Curry', 5.00),
('Vegetable Salad', 3.00),
('Pasta', 4.00),
('Pizza', 6.00),
('Sandwich', 2.50),
('Burger', 3.50),
('Fries', 1.50),
('Ice Cream', 2.00),
('Samosa', 1.00);
select *from Food;

CREATE TABLE Meal (
    id INT PRIMARY KEY AUTO_INCREMENT,
    food_id INT,
    date DATE,
    meal_type VARCHAR(50),
    FOREIGN KEY (food_id) REFERENCES Food(id)
);

INSERT INTO Meal (food_id, date, meal_type) VALUES
(1, '2023-09-01', 'Breakfast'),
(2, '2023-09-01', 'Lunch'),
(3, '2023-09-01', 'Dinner'),
(4, '2023-09-02', 'Breakfast'),
(5, '2023-09-02', 'Lunch'),
(6, '2023-09-02', 'Dinner'),
(7, '2023-09-03', 'Breakfast'),
(8, '2023-09-03', 'Lunch'),
(9, '2023-09-03', 'Dinner'),
(10, '2023-09-04', 'Breakfast');
select *from Meal;

CREATE TABLE Visitor (
    id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    name VARCHAR(100),
    visit_date DATE,
    FOREIGN KEY (student_id) REFERENCES Student(id)
);

INSERT INTO Visitor (student_id, name, visit_date) VALUES
(1, 'Tom Green', '2023-09-15'),
(2, 'Jerry White', '2023-09-16'),
(3, 'Michael Brown', '2023-09-17'),
(4, 'Sarah Smith', '2023-09-18'),
(5, 'Anna Johnson', '2023-09-19'),
(6, 'Peter Parker', '2023-09-20'),
(7, 'Bruce Wayne', '2023-09-21'),
(8, 'Clark Kent', '2023-09-22'),
(9, 'Diana Prince', '2023-09-23'),
(10, 'Wade Wilson', '2023-09-24');


select *from Visitor;
CREATE TABLE Maintenance (
    id INT PRIMARY KEY AUTO_INCREMENT,
    room_id INT,
    issue_description VARCHAR(255),
    report_date DATE,
    status VARCHAR(50),
    FOREIGN KEY (room_id) REFERENCES Room(id)
);

INSERT INTO Maintenance (room_id, issue_description, report_date, status) VALUES
(1, 'Leaky Faucet', '2023-09-05', 'Pending'),
(2, 'Broken Window', '2023-09-06', 'Completed'),
(3, 'AC Not Working', '2023-09-07', 'Pending'),
(4, 'Heating Issue', '2023-09-08', 'In Progress'),
(5, 'Light Bulb Replacement', '2023-09-09', 'Completed'),
(6, 'Pest Control', '2023-09-10', 'Pending'),
(7, 'Furniture Repair', '2023-09-11', 'In Progress'),
(8, 'Floor Cleaning', '2023-09-12', 'Completed'),
(9, 'Wall Painting', '2023-09-13', 'Pending'),
(10, 'Door Lock Repair', '2023-09-14', 'In Progress');

select *from Maintenance;
CREATE TABLE Event (
    id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(100),
    date DATE,
    description VARCHAR(255)
);
INSERT INTO Event (title, date, description) VALUES
('Freshers Welcome', '2023-09-30', 'Welcome event for new students.'),
('Cultural Fest', '2023-10-15', 'Annual cultural festival.'),
('Sports Day', '2023-10-20', 'Inter-hostel sports competition.'),
('Health Camp', '2023-10-25', 'Free health checkup camp.'),
('Quiz Competition', '2023-11-01', 'Quiz competition among students.'),
('Movie Night', '2023-11-05', 'Outdoor movie screening.'),
('Food Festival', '2023-11-10', 'Food festival with various cuisines.'),
('Tech Talk', '2023-11-15', 'Guest lecture on technology trends.'),
('Workshop', '2023-11-20', 'Skill development workshop.'),
('Farewell Party', '2023-11-30', 'Farewell party for graduating students.');
select *from Event;

CREATE TABLE Room_Assignment (
    id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    room_id INT,
    assignment_date DATE,
    FOREIGN KEY (student_id) REFERENCES Student(id),
    FOREIGN KEY (room_id) REFERENCES Room(id)
);

INSERT INTO Room_Assignment (student_id, room_id, assignment_date) VALUES
(1, 1, '2023-09-01'),
(2, 2, '2023-09-05'),
(3, 3, '2023-09-10'),
(4, 4, '2023-09-15'),
(5, 5, '2023-09-20'),
(6, 6, '2023-09-25'),
(7, 7, '2023-09-30'),
(8, 8, '2023-10-01'),
(9, 9, '2023-10-05'),
(10, 10, '2023-10-10');
select *from Room_Assignment;

SELECT 
    Student.id AS student_id,
    Student.name AS student_name,
    Room.room_number,
    Hostel.name AS hostel_name,
    Booking.check_in_date,
    Booking.check_out_date,
    Payment.amount AS payment_amount,
    Payment.payment_date

FROM Student
LEFT JOIN Booking ON Student.id = Booking.student_id
LEFT JOIN Room ON Booking.room_id = Room.id
LEFT JOIN Hostel ON Room.hostel_id = Hostel.id
LEFT JOIN Payment ON Booking.id = Payment.booking_id;

SELECT 
    Visitor.name AS visitor_name,
    Visitor.visit_date,
    Student.name AS student_name,
    Room.room_number
FROM Visitor
LEFT JOIN Student ON Visitor.student_id = Student.id
LEFT JOIN Room_Assignment ON Student.id = Room_Assignment.student_id
LEFT JOIN Room ON Room_Assignment.room_id = Room.id;

SELECT 
    Maintenance.issue_description,
    Maintenance.report_date,
    Maintenance.status,
    Room.room_number,
    Hostel.name AS hostel_name
FROM Maintenance
LEFT JOIN Room ON Maintenance.room_id = Room.id
LEFT JOIN Hostel ON Room.hostel_id = Hostel.id;

SELECT 
    Meal.date AS meal_date, 
    Meal.meal_type, 
    Food.name AS food_name, 
    Food.price
FROM 
    Meal
LEFT JOIN 
    Food ON Meal.food_id = Food.id;


