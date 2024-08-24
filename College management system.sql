CREATE DATABASE College_Management_System;
USE College_Management_System;



CREATE TABLE faculty_department (
    Dept_ID INT PRIMARY KEY AUTO_INCREMENT,
    Dept_Name VARCHAR(100),
    HOD_Name VARCHAR(100)
);         
INSERT INTO faculty_department (Dept_Name, HOD_Name) 
VALUES('Computer Engineering', 'Dr. R. Varshini'),
('IT Systems', 'Dr. V. Sundar'),
('Manufacturing Engineering', 'Dr. S. Kumar'),
('Horticulture', 'Dr. R. Suresh'),
('AI & Machine Learning', 'Dr. S. Kumar'),
('Health Technology', 'Dr. V. Narayan');
            
           select *from faculty_department;
            
            
CREATE TABLE fleet (
    Bus_No INT PRIMARY KEY AUTO_INCREMENT,
    Bus_Identifier VARCHAR(10) NOT NULL
);

INSERT INTO fleet (Bus_Identifier) 
VALUES('201'),
('202'),
('203'),
('204'),
('205');
         
             select *from fleet;

CREATE TABLE academic_staff (
    Staff_ID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100),
    Degree VARCHAR(100),
    Expertise VARCHAR(100),
    Salary DECIMAL(10,2),
    Contact_Email VARCHAR(100),
    Dept_ID INT,
    FOREIGN KEY (Dept_ID) REFERENCES faculty_department(Dept_ID)
);

INSERT INTO academic_staff (Name, Degree, Expertise, Salary, Contact_Email, Dept_ID)
 VALUES('Mr.S. Ramesh', 'M.Sc', 'Artificial Intelligence', 78000.00, 'ramesh@university.edu.in', 1),
('Mr.A. Singh', 'M.Sc', 'Information Security', 83000.00, 'asingh@university.edu.in', 2),
('Ms.K. Jain', 'M.Sc', 'Big Data', 80000.00, 'kjain@university.edu.in', 1),
('Ms.M. Rao', 'M.Sc', 'Web Development', 81000.00, 'mrao@university.edu.in', 1),
('Ms.S. Patel', 'M.Sc', 'Robotic Systems', 82000.00, 'spatel@university.edu.in', 1),
('Mr.T. Nair', 'M.Sc', 'Data Analytics', 84000.00, 'tnair@university.edu.in', 2),
('Mr.J. Kumar', 'M.Sc', 'Cloud Computing', 85000.00, 'jkumar@university.edu.in', 2),
('Mr.G. Rajan','M.Sc', 'Thermodynamics', 86000.00, 'grajan@university.edu.in', 3),
('Mr.L. Ravi', 'M.Sc', 'Fluid Dynamics', 87000.00, 'lravi@university.edu.in', 3),
('Ms.J. Ravi', 'M.Sc', 'Plant Biotechnology', 88000.00, 'jra@university.edu.in', 4),
('Mr.N. Sharma', 'M.Sc', 'Soil Science', 89000.00, 'nsharma@university.edu.in', 4),
('Mr.K. Ashok', 'M.Sc', 'Artificial Intelligence', 90000.00, 'kashok@university.edu.in', 5),
('Ms.M. Pooja', 'M.Sc', 'Biomedical Engineering', 91000.00, 'mpooja@university.edu.in', 6);

         select *from academic_staff;

CREATE TABLE modules (
    Module_ID INT PRIMARY KEY AUTO_INCREMENT,
    Module_Name VARCHAR(100),
    Duration INT,
    Credits INT,
    Dept_ID INT,
    FOREIGN KEY (Dept_ID) REFERENCES faculty_department(Dept_ID)
);

INSERT INTO modules (Module_Name, Duration, Credits, Dept_ID)
 VALUES('B.Sc Computer Engineering', 3, 120, 1),
('B.Sc Software Development', 3, 120, 1),
('B.Sc IT Systems', 3, 120, 2),
('B.Sc Network Systems', 3, 120, 2),
('B.Sc Manufacturing Engineering', 3, 120, 3),
('B.Sc Mechatronics Engineering', 3, 120, 3),
('B.Sc Horticulture Engineering', 3, 120, 4),
('B.Sc Food Science', 3, 120, 4),
('B.Sc AI Engineering', 3, 120, 5),
('B.Sc Data Science', 3, 120, 5),
('B.Sc Health Technology', 3, 120, 6),
('B.Sc Biotechnology', 3, 120, 6);

select *from modules;

CREATE TABLE course_topics (
    Topic_ID INT PRIMARY KEY AUTO_INCREMENT,
    Topic_Name VARCHAR(100),
    Credits INT,
    Semester INT,
    Module_ID INT,
    FOREIGN KEY (Module_ID) REFERENCES modules(Module_ID)
);

INSERT INTO course_topics (Topic_Name, Credits, Semester, Module_ID) 
VALUES('Introduction to Programming', 4, 1, 1), 
('Algorithms', 4, 2, 2),
('Database Systems', 4, 4, 1),
('Computer Architecture', 4, 1, 3),  
('Software Engineering Principles', 4, 3, 4),
('Network Theory', 4, 5, 4),
('Engineering Principles', 4, 1, 5), 
('Thermodynamic Principles', 4, 2, 6),
('Hydraulics', 4, 4, 5),
('Basics of Horticulture', 4, 1, 7),
('Soil Management', 4, 2, 8),
('Crop Science', 4, 4, 8),
('Foundations of AI', 4, 1, 9),  
('Introduction to Machine Learning', 4, 3, 10),
('Data Analytics Fundamentals', 4, 5, 9),
('Biomedical Technology', 4, 1, 11),
('Biomaterials Science', 4, 2, 12),
('Medical Technology', 4, 4, 12);

select *from course_topics;

CREATE TABLE staff_topic (
    Staff_ID INT,
    Topic_ID INT,
    PRIMARY KEY (Staff_ID, Topic_ID),
    FOREIGN KEY (Staff_ID) REFERENCES academic_staff(Staff_ID),
    FOREIGN KEY (Topic_ID) REFERENCES course_topics(Topic_ID)
);

INSERT INTO staff_topic (Staff_ID, Topic_ID) 
VALUES(1, 1),
(1, 2),
(2, 3), 
(3, 4), 
(3, 5), 
(4, 6),
(5, 7), 
(5, 8), 
(6, 9), 
(7, 10), 
(8, 11), 
(9, 12), 
(10, 13), 
(11, 14),
(12, 15), 
(13, 16); 

select *from staff_topic;

CREATE TABLE dormitory (
    Dorm_ID INT PRIMARY KEY AUTO_INCREMENT,
    Dorm_Name VARCHAR(100),
    Dorm_Type ENUM('Male', 'Female')
);

INSERT INTO dormitory (Dorm_Name, Dorm_Type) 
VALUES('Male Dormitory 1', 'Male'),
('Female Dormitory 1', 'Female'),
('Male Dormitory 2', 'Male'),
('Female Dormitory 2', 'Female'),
('Male Dormitory 3', 'Male'),
('Female Dormitory 3', 'Female'),
('Male Dormitory 4', 'Male'),
('Female Dormitory 4', 'Female'),
('Male Dormitory 5', 'Male'),
('Female Dormitory 5', 'Female'),
('Male Dormitory 6', 'Male'),
('Female Dormitory 6', 'Female'),
('Male Dormitory 7', 'Male'),
('Female Dormitory 7', 'Female'),
('Male Dormitory 8', 'Male'),
('Female Dormitory 8', 'Female'),
('Male Dormitory 9', 'Male'),
('Female Dormitory 9', 'Female'),
('Male Dormitory 10', 'Male'),
('Female Dormitory 10', 'Female'),
('Female Dormitory 15', 'Female');

select *from dormitory;

CREATE TABLE student_records (
    Student_ID INT PRIMARY KEY AUTO_INCREMENT,
    Full_Name VARCHAR(100),
    Birth_Date DATE,
    Mobile_No VARCHAR(15),
    Email_ID VARCHAR(100),
    Gender VARCHAR(10),
    Age INT,
    Dept_ID INT,
    Dorm_ID INT NULL,
    Bus_No INT NULL,
    FOREIGN KEY (Dept_ID) REFERENCES faculty_department(Dept_ID),
    FOREIGN KEY (Dorm_ID) REFERENCES dormitory(Dorm_ID),
    FOREIGN KEY (Bus_No) REFERENCES fleet(Bus_No)
);

INSERT INTO student_records(Full_Name, Birth_Date, Mobile_No, Email_ID, Gender, Age, Dept_ID, Dorm_ID, Bus_No) 
VALUES('Sujitha Priya','2004-01-20','9234567890','sujitha@university.edu.in','Female', 20,2, NULL,1),
('Kavitha Srinivasan','2005-02-20','9876543220','kavitha@university.edu.in','Female', 19, 2,NULL,2),
('Vijaya Kumar','2004-03-20','6734595675','vijaya@university.edu.in', 'Female', 20,2, NULL,3),
('Latha Muthusamy','2005-04-20','6453892824','latha@university.edu.in', 'Female', 19,2,NULL,4),
('Divya Rajan','2005-05-20','9876543220','divya@university.edu.in', 'Female', 19, 2,12,NULL),
('Neha Prasad','2005-06-20','6798453078','neha@university.edu.in','Female',19,3,NULL,1),
('Ravi Kumar','2004-07-20','9876543210','ravi@university.edu.in','Male', 20, 1,NULL,2),
('Gokul Raj','2005-08-20','6789345678','gokul@university.edu.in','Male',19,3,NULL,3),
('Ravi Kumar','2005-09-20','6743857600','ravi@university.edu.in', 'Male', 19,3,NULL,4),
('John David','2005-10-20','9753086420','john@university.edu.in', 'Male', 19,3,NULL,1),
('Aditi Jain','2005-11-20','8903405678','aditi@university.edu.in','Female',19,2,NULL,2),
('Pooja Sharma','2005-12-20','8756479000','pooja@university.edu.in','Female',19,2,NULL,3),
('Swathi Ramesh','2005-11-20','9876543200','swathi@university.edu.in','Female',19,2,NULL,4),
('Hema Patel','2005-5-20','8734567800','hemapatel@university.edu.in','Female',19,2,NULL,1),
('Madhavi Nair','2005-6-20','9456321870','madhavi@university.edu.in','Female',19,2,NULL,2),
('Sneha Sundar','2005-9-20','9234567801','sneha@university.edu.in','Female',19,2,NULL,3),
('Shruthi Vijay','2005-8-20','8901234567','shruthi@university.edu.in','Female',19,2,NULL,4);

select *from student_records;

CREATE TABLE student_courses (
    Student_ID INT,
    Module_ID INT,
    PRIMARY KEY (Student_ID, Module_ID),
    FOREIGN KEY (Student_ID) REFERENCES student_records(Student_ID),
    FOREIGN KEY (Module_ID) REFERENCES modules(Module_ID)
);

INSERT INTO student_courses (Student_ID, Module_ID) 
VALUES(1,1),
(2,2),
(3,3),
(4,4),
(5,5),
(6,6),
(7,7),
(8,8),
(9,9),
(10,10),
(11,11),
(12,12),
(13,1),
(14,2),
(15,3),
(16,4);

select * from student_courses;

SELECT 
    a.Name AS Staff_Name,
    a.Degree,
    a.Expertise,
    a.Salary,
    a.Contact_Email,
    d.Dept_Name
FROM 
    academic_staff a
JOIN 
    faculty_department d ON a.Dept_ID = d.Dept_ID;

SELECT 
    s.Full_Name AS Student_Name,
    s.Email_ID,
    d.Dorm_Name AS Dormitory,
    f.Bus_Identifier AS Bus_No
FROM 
    student_records s
LEFT JOIN 
    dormitory d ON s.Dorm_ID = d.Dorm_ID
LEFT JOIN 
    fleet f ON s.Bus_No = f.Bus_No;

SELECT 
    m.Module_Name,
    m.Duration,
    m.Credits,
    t.Topic_Name,
    t.Credits AS Topic_Credits,
    t.Semester
FROM 
    modules m
JOIN 
    course_topics t ON m.Module_ID = t.Module_ID;

SELECT 
    a.Name AS Staff_Name,
    t.Topic_Name,
    m.Module_Name
FROM 
    staff_topic st
JOIN 
    academic_staff a ON st.Staff_ID = a.Staff_ID
JOIN 
    course_topics t ON st.Topic_ID = t.Topic_ID
JOIN 
    modules m ON t.Module_ID = m.Module_ID;

SELECT 
    s.Full_Name AS Student_Name,
    s.Email_ID,
    d.Dept_Name,
    m.Module_Name
FROM 
    student_courses sc
JOIN 
    student_records s ON sc.Student_ID = s.Student_ID
JOIN 
    modules m ON sc.Module_ID = m.Module_ID
JOIN 
    faculty_department d ON s.Dept_ID = d.Dept_ID
WHERE 
    m.Module_Name = 'B.Sc Computer Engineering';

SELECT 
    d.Dept_Name,
    a.Name AS Staff_Name,
    a.Expertise
FROM 
    faculty_department d
JOIN 
    academic_staff a ON d.Dept_ID = a.Dept_ID
JOIN 
    staff_topic st ON a.Staff_ID = st.Staff_ID
JOIN 
    course_topics t ON st.Topic_ID = t.Topic_ID
WHERE 
    d.Dept_ID = a.Dept_ID;
