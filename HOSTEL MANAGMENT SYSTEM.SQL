CREATE DATABASE HostelManagement;
USE HostelManagement;

-- Admin Table
CREATE TABLE Admin (
    AdminID INT PRIMARY KEY AUTO_INCREMENT,
    Admin_Name VARCHAR(100),
    Email VARCHAR(100) UNIQUE,
    Password VARCHAR(255)
);

-- Student Table (Previously Customer)
CREATE TABLE Student (
    StudentID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100),
    Email VARCHAR(100) UNIQUE,
    Phone VARCHAR(15),
    Address TEXT,
    Gender ENUM('Male', 'Female', 'Other'),
    Date_Of_Birth DATE
);

-- Room Table
CREATE TABLE Room (
    RoomID INT PRIMARY KEY AUTO_INCREMENT,
    Room_No VARCHAR(10) UNIQUE,
    Room_Type VARCHAR(50),
    Capacity INT,
    Status ENUM('Available', 'Occupied', 'Maintenance'),
    Fees DECIMAL(10,2)
);

-- Booking Table
CREATE TABLE Booking (
    BookingID INT PRIMARY KEY AUTO_INCREMENT,
    StudentID INT,
    RoomID INT,
    Booking_Date DATE,
    Checkin_Date DATE,
    Checkout_Date DATE,
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID) ON DELETE CASCADE,
    FOREIGN KEY (RoomID) REFERENCES Room(RoomID) ON DELETE CASCADE
);

-- Payment Table
CREATE TABLE Payment (
    PaymentID INT PRIMARY KEY AUTO_INCREMENT,
    BookingID INT,
    Amount DECIMAL(10,2),
    Payment_Date DATE,
    Payment_Method ENUM('Cash', 'Card', 'Online'),
    FOREIGN KEY (BookingID) REFERENCES Booking(BookingID) ON DELETE CASCADE
);

-- Staff Table
CREATE TABLE Staff (
    StaffID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100),
    Role VARCHAR(50),
    Salary DECIMAL(10,2),
    Contact_No VARCHAR(15),
    Address TEXT
);

-- Mess Table (Food Management)
CREATE TABLE Mess (
    MessID INT PRIMARY KEY AUTO_INCREMENT,
    Mess_Type ENUM('Veg', 'Non-Veg', 'Both'),
    Cost DECIMAL(10,2)
);

-- Student_Mess (To Handle Many-to-Many Relationship Between Student and Mess)
CREATE TABLE Student_Mess (
    StudentID INT,
    MessID INT,
    PRIMARY KEY (StudentID, MessID),
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID) ON DELETE CASCADE,
    FOREIGN KEY (MessID) REFERENCES Mess(MessID) ON DELETE CASCADE
);

-- Maintenance Table
CREATE TABLE Maintenance (
    MaintenanceID INT PRIMARY KEY AUTO_INCREMENT,
    RoomID INT,
    Description TEXT,
    Cost DECIMAL(10,2),
    Maintenance_Date DATE,
    FOREIGN KEY (RoomID) REFERENCES Room(RoomID) ON DELETE CASCADE
);

-- Visitor Table
CREATE TABLE Visitor (
    VisitorID INT PRIMARY KEY AUTO_INCREMENT,
    StudentID INT,
    Visitor_Name VARCHAR(100),
    Contact_No VARCHAR(15),
    Visit_Date DATE,
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID) ON DELETE CASCADE
);
-- Insert into Admin
INSERT INTO Admin (Admin_Name, Email, Password) VALUES 
('Ravi Kumar', 'ravi.admin@example.com', 'admin123'),
('Priya Sharma', 'priya.admin@example.com', 'securepass');

-- Insert into Student
INSERT INTO Student (Name, Email, Phone, Address, Gender, Date_Of_Birth) VALUES
('Amit Patel', 'amit.student@example.com', '9876543210', 'Ahmedabad, Gujarat', 'Male', '2000-05-14'),
('Neha Singh', 'neha.student@example.com', '9823456789', 'Lucknow, Uttar Pradesh', 'Female', '2001-08-22'),
('Rajesh Verma', 'rajesh.student@example.com', '9765432189', 'Bangalore, Karnataka', 'Male', '1999-12-10');

-- Insert into Room
INSERT INTO Room (Room_No, Room_Type, Capacity, Status, Fees) VALUES
('A101', 'Single', 1, 'Available', 10000.00),
('B202', 'Double', 2, 'Available', 7500.00),
('C303', 'Triple', 3, 'Occupied', 5000.00);

-- Insert into Booking
INSERT INTO Booking (StudentID, RoomID, Booking_Date, Checkin_Date, Checkout_Date) VALUES
(1, 2, '2025-03-01', '2025-03-05', '2025-06-10'),
(2, 3, '2025-03-02', '2025-03-06', '2025-07-12');

-- Insert into Payment
INSERT INTO Payment (BookingID, Amount, Payment_Date, Payment_Method) VALUES
(1, 7500.00, '2025-03-05', 'Online'),
(2, 5000.00, '2025-03-06', 'Card');

-- Insert into Staff
INSERT INTO Staff (Name, Role, Salary, Contact_No, Address) VALUES
('Sunil Mehra', 'Warden', 40000, '9801234567', 'Mumbai, Maharashtra'),
('Kavita Das', 'Cleaner', 18000, '9812345678', 'Delhi, NCR');

-- Insert into Mess
INSERT INTO Mess (Mess_Type, Cost) VALUES
('Veg', 3000),
('Non-Veg', 3500),
('Both', 4500);

-- Insert into Student_Mess
INSERT INTO Student_Mess (StudentID, MessID) VALUES
(1, 1),
(2, 3);

-- Insert into Maintenance
INSERT INTO Maintenance (RoomID, Description, Cost, Maintenance_Date) VALUES
(3, 'Water leakage issue', 1200, '2025-02-15');

-- Insert into Visitor
INSERT INTO Visitor (StudentID, Visitor_Name, Contact_No, Visit_Date) VALUES
(1, 'Rahul Sharma', '9876543210', '2025-03-05'),
(2, 'Priya Mehta', '9823456789', '2025-03-08');
SELECT * FROM Admin;
SELECT * FROM Student;
SELECT * FROM Room;
SELECT * FROM Booking;
SELECT * FROM Payment;
SELECT * FROM Staff;
SELECT * FROM Mess;
SELECT * FROM Student_Mess;
SELECT * FROM Maintenance;
SELECT * FROM Visitor;