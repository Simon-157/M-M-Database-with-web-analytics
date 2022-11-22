DROP DATABASE IF EXISTS Laundry;

CREATE DATABASE Laundry;

USE Laundry;


CREATE TABLE Station (
	stationId INT PRIMARY KEY,
	station_name VARCHAR(50),
	station_location VARCHAR(50)
);


CREATE TABLE Inventory(
	inventoryId INT,
	item_name VARCHAR(25) NOT NULL,
	quantity INT NOT NULL,
	price DOUBLE, 
	brand VARCHAR(40),
	date_received DATE NOT NULL,
	PRIMARY KEY (inventoryId)
);


CREATE TABLE  Service(
	serviceId INT,
	service_type VARCHAR(20) NOT NULL,
	price DOUBLE NOT NULL,
	PRIMARY KEY (serviceId)
);

	
CREATE TABLE  Employee(
	employeeId INT,
	fname VARCHAR(30),
	lname VARCHAR(30),
	email VARCHAR(70) NOT NULL UNIQUE,
	PRIMARY KEY (employeeId)
);


CREATE TABLE EmployeeTelephone(
	employee_telephone INT UNIQUE, 
	employeeId INT ,
	FOREIGN KEY (employeeId) REFERENCES Employee(employeeId) ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE Assignment (
	date_worked DATE,
	employee_id INT,
	station_id INT,
	FOREIGN KEY(employee_id) REFERENCES Employee(employeeId) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY(station_id) REFERENCES Station(stationId) ON DELETE CASCADE ON UPDATE CASCADE
);
	

	
CREATE TABLE Equipment(
	equipmentId INT PRIMARY KEY,
	equip_name VARCHAR(50) NOT NULL,
	quantity INT NOT NULL,
	brand VARCHAR(50) NOT NULL,
	last_servicing_date DATE,
	next_servicing_date DATE
);
	
	
CREATE TABLE Subscription (
	subscriptionId INT PRIMARY KEY,
	subscription_type VARCHAR(20),
	weight_tier VARCHAR(15),
   	price DOUBLE
);
	
	
CREATE TABLE Customer(
	customerId INT,
	fname VARCHAR(25) NOT NULL,
	lname VARCHAR(25) NOT NULL,
	gender VARCHAR(7) NOT NULL,
	email VARCHAR(70) NOT NULL UNIQUE,
	PRIMARY KEY (customerId)
);


CREATE TABLE Subscribes_To (
	customer_id INT,
	subscription_id INT,
	FOREIGN KEY(customer_id) REFERENCES Customer(customerId) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (subscription_id) REFERENCES Subscription(subscriptionId) ON DELETE CASCADE ON UPDATE CASCADE
);



CREATE TABLE ServiceOrder(
	serviceOrderId INT AUTO_INCREMENT,
	customerId INT,
	serviceId INT,
	equipmentId INT,
	employeeId INT,
	date_order_made DATE NOT NULL default(CURRENT_DATE),
	date_order_done DATE NOT NULL,
	PRIMARY KEY (serviceOrderId),
	FOREIGN KEY (customerId) REFERENCES Customer (customerId) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (serviceId) REFERENCES Service (serviceId) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (equipmentId) REFERENCES Equipment (equipmentId) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (employeeId) REFERENCES Employee (employeeId) ON DELETE CASCADE ON UPDATE CASCADE
);
	
	
CREATE TABLE Staff (
	customer_id INT PRIMARY KEY, 
	pick_up_time TIME NOT NULL,
	discount DECIMAL(2),
	FOREIGN KEY(customer_id) REFERENCES Customer(customerId) ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE Student (
	customer_id INT PRIMARY KEY,
	hostel_name VARCHAR(50) NOT NULL,
	room_number VARCHAR(10) NOT NULL,
	FOREIGN KEY(customer_id) REFERENCES Customer(customerId) ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE CustomerTelephone(
	customer_telephone VARCHAR (10) UNIQUE,
	customerId INT,
	FOREIGN KEY (customerId) REFERENCES Customer (customerId) ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE Payment (
	paymentId INT PRIMARY KEY,
	payment_type VARCHAR(20) NOT NULL,
	amount_paid DECIMAL(2) NOT NULL,
	serviceOrderId INT,
	FOREIGN KEY(serviceOrderId) REFERENCES ServiceOrder(serviceOrderId) ON DELETE CASCADE ON UPDATE CASCADE
);



CREATE TABLE Supplies_in_use(
	serviceOrderId INT,
	inventoryId INT,
	FOREIGN KEY (serviceOrderId) REFERENCES ServiceOrder (serviceOrderId) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (inventoryId) REFERENCES Inventory (inventoryId) ON DELETE CASCADE ON UPDATE CASCADE
);

	
INSERT INTO Station VALUES (1, 'Lambert', 'Under hostel lobby');
INSERT INTO Station VALUES (2, 'Colo', 'Beside the pool area');


INSERT INTO Subscription VALUES (1, 'No subscription', '0 kg', 0);
INSERT INTO Subscription VALUES (2, 'base subscription', '< 11kg', 800);
INSERT INTO Subscription VALUES (3, 'medium subscription', '11kg - 15kg', 900);
INSERT INTO Subscription VALUES (4, 'super subscription', '15kg - 20kg', 1000);
INSERT INTO Subscription VALUES (5, 'mega subscription', '21kg - 25kg', 1100);
INSERT INTO Subscription VALUES (6, 'bumper harvest', '26 kg >', 1200);



INSERT INTO Employee VALUES (1, 'Larry', 'Oduro', 'LarryO@gmail.com');
INSERT INTO Employee VALUES (2, 'Abigail', 'Mensah', 'MensAbi@gmail.com');
INSERT INTO Employee VALUES (3, 'Kwasi', 'Bempah', 'Bempeasy@hotmail.com');
INSERT INTO Employee VALUES (4, 'Jack', 'Dawson', 'JDdawson@gmail.com');
INSERT INTO Employee VALUES (5, 'Jackie', 'Addo', 'Jacqie@yahoo.com');
INSERT INTO Employee VALUES (6, 'Jasmine', 'Addo', 'JassiB@yahoo.com');
INSERT INTO Employee VALUES (7, 'Henry','Adjei','henry@gmail.com');
INSERT INTO Employee VALUES (8,'Ahiadu','Lincol','ahiadu@yahoo.com');
INSERT INTO Employee VALUES (9,'Ruth','Nortey', 'ruth@yahoo.com');


INSERT INTO EmployeeTelephone VALUES (0554446677, 3);
INSERT INTO EmployeeTelephone VALUES (0232224444, 3);
INSERT INTO EmployeeTelephone VALUES (0205764166, 1);
INSERT INTO EmployeeTelephone VALUES (0249450981, 5);
INSERT INTO EmployeeTelephone VALUES (0505450980, 4);
INSERT INTO EmployeeTelephone VALUES (0240976684, 2);
INSERT INTO EmployeeTelephone VALUES (0240976231, 5);
INSERT INTO EmployeeTelephone VALUES (0500976684, 1);
INSERT INTO EmployeeTelephone VALUES (0500912689, 4);
INSERT INTO EmployeeTelephone VALUES (0240976003, 2);
INSERT INTO EmployeeTelephone VALUES (0270976684, 6);
INSERT INTO EmployeeTelephone VALUES (0560976713, 6);
INSERT INTO EmployeeTelephone VALUES (0540876003, 7);
INSERT INTO EmployeeTelephone VALUES (0551976684, 8);
INSERT INTO EmployeeTelephone VALUES (0256097671, 9);


INSERT INTO SERVICE values (1, 'Ironing',15);
INSERT INTO SERVICE values (2, 'Sun drying',10);
INSERT INTO SERVICE values (3, 'Dry Cleaning', 45);
INSERT INTO SERVICE values (4, 'Washing',30);
INSERT INTO SERVICE values (5, 'Machine Drying',20);


INSERT INTO CUSTOMER values (1,'Ronald' ,'Thompson', 'M', 'ronald.thompson@ashesi.edu.gh');
INSERT INTO CUSTOMER values (2, 'Papa', 'Mendoza', 'M', 'Papa.mendoza@ashesi.edu.gh');
INSERT INTO CUSTOMER values (3, 'Jude', 'Jimenez', 'M', 'Jude.jimenez@ashesi.edu.gh');
INSERT INTO CUSTOMER values (4, 'Delasi', 'Dake', 'F', 'Delasi.dake@ashesi.edu.gh');
INSERT INTO CUSTOMER values (5, 'Hubert', 'Jones', 'M', 'Hubert.jones@ashesi.edu.gh');
INSERT INTO CUSTOMER values (6, 'John', 'Johnson', 'M', 'John.Johnson@ashesi.edu.gh');
INSERT INTO CUSTOMER values (7, 'Stephen', 'Ahiable', 'M', 'Stephen.Ahiable@ashesi.edu.gh');
INSERT INTO CUSTOMER values (8, 'Abena', 'Konadu', 'F', 'Abena.Konadu@ashesi.edu.gh');
INSERT INTO CUSTOMER values (9, 'Frank', 'Bere', 'M', 'Frank.Bere@ashesi.edu.gh');
INSERT INTO CUSTOMER values (10, 'Joe', 'Mansa', 'M', 'Joe.Mansa@ashesi.edu.gh');
INSERT INTO CUSTOMER values (11, 'Audrey', 'Johnson', 'F', 'Audrey.Johnson@ashesi.edu.gh');
INSERT INTO CUSTOMER values (12, 'Jasmine', 'Stone', 'F', 'Jasmine.Stone@ashesi.edu.gh');
INSERT INTO CUSTOMER values (13, 'James', 'Konadu', 'M', 'James.Konadu@ashesi.edu.gh');
INSERT INTO CUSTOMER values (14, 'Kwaku', 'Ohene', 'M', 'Kwaku.Ohene@ashesi.edu.gh');
INSERT INTO CUSTOMER values (15, 'Adwoa', 'Darko', 'F', 'Adwoa.Darko@ashesi.edu.gh');
INSERT INTO CUSTOMER values (16, 'Akua', 'Darko', 'F', 'Akua.Darko@ashesi.edu.gh');
INSERT INTO CUSTOMER values (17, 'Kwabena', 'Danso', 'M', 'Kwabena.Danso@ashesi.edu.gh');
INSERT INTO CUSTOMER values (18, 'Kwaku', 'Agyemang', 'M', 'Kwaku.Agyemang@ashesi.edu.gh');
INSERT INTO CUSTOMER values (19, 'Afia', 'Ansah', 'F', 'Afia.Ansah@ashesi.edu.gh');
INSERT INTO CUSTOMER values (20, 'Efua', 'Ansah', 'F', 'Afua.Ansah@ashesi.edu.gh');
INSERT INTO CUSTOMER values (21, 'Ewurabena', 'Quarshie', 'F', 'Ewurabena.Quarshie@ashesi.edu.gh');
INSERT INTO CUSTOMER values (22, 'Tracy', 'Annas', 'F', 'Tracy.Annas@ashesi.edu.gh');



INSERT INTO INVENTORY values (1, 'Washing Powder', 37, 21, 'OMO', '2022-8-06');
INSERT INTO INVENTORY values (2, 'Washing Blue', 33, 12, 'RECKITT’S', '2022-7-14');
INSERT INTO INVENTORY values (3, 'Bar Soap', 50, 6, 'KEYSOAP', '2022-2-27');
INSERT INTO INVENTORY values (4, 'Fabric Softener', 95, 23,'MRS.MEYERS', '2022-9-29');
INSERT INTO INVENTORY values (5, 'Baking Soda', 43, 11,'ARM&HAMMER', '2022-10-06');
INSERT INTO INVENTORY VALUES ('6', 'Spray Starch', '10', '12', 'STIFF', '2022-08-10');
INSERT INTO INVENTORY VALUES ('7', 'Methylyne Chloride', '5', '55', 'Chemicalo', '2022-06-30');




INSERT INTO EQUIPMENT values (1, 'Washing Machine', 8, 'Samsung', '2021-1-26', '2021-7-26');
INSERT INTO EQUIPMENT values (2, 'Dryer', 4, 'LG', '2022-2-19', '2022-5-19');
INSERT INTO EQUIPMENT values (3, 'Iron', 10, 'Philips', '2021-11-30', '2022-1-30');
INSERT INTO EQUIPMENT values (4, 'Ironing Board', 5, 'Brabandia', '2022-4-11', '2022-5-11');
INSERT INTO EQUIPMENT values (5, 'Drying Rack', 10, 'HoneyCandDo', '2022-8-24', '2022-9-24');
INSERT INTO EQUIPMENT VALUES ('6', 'Dry CLeaning Machine', '1', 'Sharing', '2022-07-01', '2022-09-01');



INSERT INTO CustomerTelephone VALUES (0203456789, 3);
INSERT INTO CustomerTelephone VALUES (0243214356, 5);
INSERT INTO CustomerTelephone VALUES (0278961234, 1);
INSERT INTO CustomerTelephone VALUES (0505764169, 3);
INSERT INTO CustomerTelephone VALUES (0207896709, 6);
INSERT INTO CustomerTelephone VALUES (0201256789, 2);
INSERT INTO CustomerTelephone VALUES (0549898038, 2);
INSERT INTO CustomerTelephone VALUES (0303456980, 4);
INSERT INTO CustomerTelephone VALUES (0244343421, 1);
INSERT INTO CustomerTelephone VALUES (0200002222, 5);


INSERT INTO Student VALUES (5, 'Dufie Annex Hostel', 'B3');
INSERT INTO Student VALUES (3, 'Old Hosanna Hostel', 'FF3');
INSERT INTO Student VALUES (4, 'Dufie Gold  Hostel', 'C3');
INSERT INTO Student VALUES (20, 'Charlotte Hostel', 'E16');
INSERT INTO Student VALUES (18, 'Colombiana Hostel', 'D5');
INSERT INTO Student VALUES (19, 'New Hosanna Hostel', 'G3');
INSERT INTO Student VALUES (16, 'Old Masere Hostel', 'F3');
INSERT INTO Student VALUES (13, 'New Masere Hostel', 'S9');
INSERT INTO Student VALUES (9, 'Dufie Annex Hostel', 'A6');
INSERT INTO Student VALUES (6, 'Charlotte Hostel', 'G18');


INSERT INTO Staff VALUES (2, '13:30', 0.3);
INSERT INTO Staff VALUES (7, '13:30', 0.3);
INSERT INTO Staff VALUES (8, '13:30', 0.25);
INSERT INTO Staff VALUES (10, '13:30', 0.10);
INSERT INTO Staff VALUES (11, '13:30', 0.30);
INSERT INTO Staff VALUES (12, '13:30', 0.25);
INSERT INTO Staff VALUES (14, '13:30', 0.15);
INSERT INTO Staff VALUES (15, '13:30', 0.15);
INSERT INTO Staff VALUES (21, '13:30', 0.10);
INSERT INTO Staff VALUES (22, '13:30', 0.25);


	
    
INSERT INTO ServiceOrder(customerId, serviceId, equipmentId, employeeId, date_order_made, date_order_done) 
VALUES (4, 4, 3, 2, '2022-8-22', '2022-8-23'),
        (5, 4, 3, 3, '2022-8-22', '2022-8-22'),
        (2, 4, 3, 1, '2022-8-22', '2022-8-22'),
        (10, 4, 3, 1, '2022-8-24', '2022-8-24'),
        (5, 5, 2, 5,  '2022-8-22', '2022-8-23'),
        (5, 1, 3, 2,  '2022-8-22', '2022-8-23'),
        (2, 5, 2, 5, '2022-8-22', '2022-8-22'),
		(5, 1, 3, 2, '2022-1-22', '2022-8-23'),
		(2, 5, 2, 5, '2022-2-22', '2022-8-22'),
		( 2, 4, 3, 1, '2022-3-22', '2022-8-22'),
		(10, 4, 3, 1, '2022-7-24', '2022-8-24'),
		(5, 1, 2, 2,  '2022-08-23', '2022-08-23'),
		(4, 3, 6, 4,  '2022-08-23', '2022-08-23'),
		(1, 2, 3, 1,  '2022-08-23', '2022-08-24'),
		(4, 4, 3, 2, '2022-11-01', '2022-11-03'),
		(5, 4, 3, 3, '2022-11-03', '2022-11-04'),
		( 2, 4, 3, 1, '2022-11-02', '2022-11-04'),
		(10, 4, 3, 1, '2022-11-04', '2022-11-04'),
		(5, 5, 2, 5, '2022-11-05', '2022-11-06'),
		(5, 1, 3, 2, '2022-11-02', '2022-11-03'),
		(2, 5, 2, 5, '2022-11-03', '2022-11-04'),
		(5, 1, 3, 2, '2022-11-04', '2022-11-05'),
		(2, 5, 2, 5, '2022-11-12', '2022-11-13'),
		(2, 4, 3, 1, '2022-11-14', '2022-11-15'),
		(10, 4, 3, 1, '2022-11-24', '2022-11-26'),
		(5, 1, 2, 2, '2022-11-23', '2022-11-24'),
		(4, 3, 6, 4, '2022-11-23', '2022-11-25'),
		(1, 2, 3, 1, '2022-11-23', '2022-11-24'),

		(4, 4, 3, 2, '2022-11-01', '2022-11-03'), 
		(3, 4, 3, 3, '2022-11-03', '2022-11-04'),
		(2, 4, 3, 1, '2022-11-02', '2022-11-04'),
		(10, 4, 3, 1, '2022-11-04', '2022-11-04'),
		(9, 5, 2, 5, '2022-11-05', '2022-11-06'),
		(8, 1, 3, 2, '2022-11-02', '2022-11-03'),
		(7, 5, 2, 5, '2022-11-03', '2022-11-04'),
		(5, 1, 3, 2, '2022-11-04', '2022-11-05'),
		(6, 5, 2, 5, '2022-11-12', '2022-11-13'),
		(4, 4, 3, 1, '2022-11-14', '2022-11-15'),
		(3, 4, 3, 1, '2022-11-24', '2022-11-26'),
		(2, 1, 2, 2, '2022-11-23', '2022-11-24'),
		(10, 3, 6, 4, '2022-11-23', '2022-11-25'),
		(5, 2, 3, 7, '2022-11-23', '2022-11-24'),
		(4, 4, 3, 8, '2022-11-01', '2022-11-03'), 
		(3, 4, 3, 9, '2022-11-03', '2022-11-04'),
		(2, 4, 3, 7, '2022-11-02', '2022-11-04'),
		(10, 4, 3, 9, '2022-11-04', '2022-11-04'),
		(11, 4, 3, 9, '2022-10-28', '2022-10-28'), 
		(13, 3, 2, 6, '2022-10-28', '2022-10-28'),
		(11, 5, 2, 7, '2022-10-28', '2022-10-28'),
		(21, 3, 3, 6, '2022-10-28', '2022-10-28'),
		(21, 4, 3, 3, '2022-10-28', '2022-10-28'),
		(21, 5, 2, 9, '2022-10-28', '2022-10-29'),
		(18, 4, 3, 3, '2022-10-28', '2022-10-29'),
		(18, 5, 2, 9, '2022-10-28', '2022-10-29'),
		(12, 4, 3, 4, '2022-10-31', '2022-10-31'),
		(19, 3, 2, 7, '2022-10-31', '2022-10-31'),
		(22, 4, 3, 4, '2022-10-31', '2022-10-31'),
		(22, 5, 2, 9, '2022-10-31', '2022-10-31'),
		(10, 4, 3, 9, '2022-10-31', '2022-10-31'),
		(10, 4, 3, 9, '2022-10-31', '2022-11-01'),
		(10, 4, 3, 9, '2022-10-31', '2022-11-01');


INSERT INTO Payment VALUES(1, 'MoMo', 45.00, 1);
INSERT INTO Payment VALUES(2, 'MoMo', 70.00, 1);
INSERT INTO Payment VALUES(3, 'Cash', 45.00, 1);
INSERT INTO Payment VALUES(4, 'MoMo', 90.00, 1);
INSERT INTO Payment VALUES(5, 'MoMo', 45.00, 2);
INSERT INTO Payment VALUES(6, 'Cash', 45.00, 2);
INSERT INTO Payment VALUES(7, 'MoMo', 45.00, 5);
INSERT INTO Payment VALUES(8, 'MoMo', 45.00, 5);
INSERT INTO Payment VALUES(9, 'Cash', 45.00, 6);
INSERT INTO Payment VALUES(10, 'MoMo', 45.00, 7);
INSERT INTO Payment VALUES(11, 'MoMo', 45.00, 9);
INSERT INTO Payment VALUES(12, 'MoMo', 69.00, 7);
INSERT INTO Payment VALUES(13, 'Cash', 45.00, 3);
INSERT INTO Payment VALUES(14, 'MoMo', 45.00, 7);
INSERT INTO Payment VALUES(15, 'Cash', 85.00, 2);
INSERT INTO Payment VALUES(16, 'MoMo', 95.00, 1);
INSERT INTO Payment VALUES(17, 'MoMo', 45.00, 3);
INSERT INTO Payment VALUES(18, 'Cash', 45.00, 1);
INSERT INTO Payment VALUES(19, 'MoMo', 45.00, 1);
INSERT INTO Payment VALUES(20, 'MoMo', 45.00, 1);
INSERT INTO Payment VALUES(21, 'Cash', 45.00, 1);
INSERT INTO Payment VALUES(22, 'MoMo', 45.00, 1);
INSERT INTO Payment VALUES(23, 'MoMo', 75.00, 1);
INSERT INTO Payment VALUES(24, 'Cash', 45.00, 1);
INSERT INTO Payment VALUES(25, 'MoMo', 45.00, 1);
INSERT INTO Payment VALUES(26, 'MoMo', 45.00, 1);
INSERT INTO Payment VALUES(27, 'MoMo', 45.00, 1);
INSERT INTO Payment VALUES(28, 'MoMo', 15.00, 4);
INSERT INTO Payment VALUES(29, 'Cash', 45.00, 1);
INSERT INTO Payment VALUES(30, 'MoMo', 25.00, 1);
INSERT INTO Payment VALUES(31, 'MoMo', 90.00, 8);
INSERT INTO Payment VALUES(32, 'Cash', 45.00, 1);
INSERT INTO Payment VALUES(33, 'MoMo', 45.00, 3);
INSERT INTO Payment VALUES(34, 'MoMo', 45.00, 1);
INSERT INTO Payment VALUES(35, 'MoMo', 35.00, 1);
INSERT INTO Payment VALUES(36, 'Cash', 45.00, 1);
INSERT INTO Payment VALUES(37, 'MoMo', 45.00, 4);
INSERT INTO Payment VALUES(38, 'Cash', 45.00, 2);
INSERT INTO Payment VALUES(39, 'MoMo', 25.00, 1);
INSERT INTO Payment VALUES(40, 'Bank Transfer', 45.00, 11);
INSERT INTO Payment VALUES(41, 'MoMo', 45.00, 12);
INSERT INTO Payment VALUES(42, 'Cash', 45.00, 12);
INSERT INTO Payment VALUES(43, 'MoMo', 25.00, 13);
INSERT INTO Payment VALUES(44, 'MoMo', 45.00, 17);
INSERT INTO Payment VALUES(45, 'MoMo', 45.00, 1);
INSERT INTO payment VALUES (46, 'Cash', 30, 3);
INSERT INTO payment VALUES (47, 'MoMo', 30, '4');
INSERT INTO payment VALUES (48, 'Subscription', 0.00, 9);
INSERT INTO payment VALUES (49, 'Cash', 10.00, 7);
INSERT INTO payment VALUES (50, 'Cash', 45.00, 11);
INSERT INTO payment VALUES (51, 'Subscription', 0.00, 13);
INSERT INTO payment VALUES (52, 'Subscription', 0.00, 20);
INSERT INTO payment VALUES (53, 'MoMo', 50.00, 8);
INSERT INTO payment VALUES (54, 'Subscription', 0.00, 16);
INSERT INTO payment VALUES (55, 'Cash', 30.00, 25);
INSERT INTO payment VALUES (56, 'Bank Transfer', 45.00, 30);
INSERT INTO payment VALUES (57, 'Cash', 20.00, 33);



INSERT INTO Subscribes_To VALUES (5, 2);
INSERT INTO Subscribes_To VALUES (6, 1);
INSERT INTO Subscribes_To VALUES (16, 2);
INSERT INTO Subscribes_To VALUES (17, 4);
INSERT INTO Subscribes_To VALUES (19, 3);
INSERT INTO Subscribes_To VALUES (11, 1);
INSERT INTO Subscribes_To VALUES (17, 4);
INSERT INTO Subscribes_To VALUES (9, 1);
INSERT INTO Subscribes_To VALUES (8, 1);
INSERT INTO Subscribes_To VALUES (18, 3);
INSERT INTO Subscribes_To VALUES (3, 2);
INSERT INTO Subscribes_To VALUES (1, 5);
INSERT INTO Subscribes_To VALUES (2, 2);
INSERT INTO Subscribes_To VALUES (4, 1);
INSERT INTO Subscribes_To VALUES (13, 5);
INSERT INTO Subscribes_To VALUES (22, 5);
INSERT INTO Subscribes_To VALUES (21, 6);
INSERT INTO Subscribes_To VALUES (20, 6);


INSERT INTO Supplies_in_use VALUES (2, 1);
INSERT INTO Supplies_in_use VALUES (1, 5);
INSERT INTO Supplies_in_use VALUES (3, 1);
INSERT INTO Supplies_in_use VALUES (4, 4);
INSERT INTO Supplies_in_use VALUES (5, 2);
INSERT INTO Supplies_in_use VALUES (6, 6);
INSERT INTO Supplies_in_use VALUES (7, 2);
INSERT INTO Supplies_in_use VALUES (8, 1);
INSERT INTO Supplies_in_use VALUES (9, 7);
INSERT INTO Supplies_in_use VALUES (10, 7);


INSERT INTO assignment VALUES ('2022-8-01', 2, 1);
INSERT INTO assignment VALUES ('2022-8-01', 1, 1);
INSERT INTO assignment VALUES ('2022-8-01', 4, 1);
INSERT INTO assignment VALUES ('2022-8-02', 5, 1);
INSERT INTO assignment VALUES ('2022-8-02', 3, 1);
INSERT INTO assignment VALUES ('2022-8-02', 2, 2);
INSERT INTO assignment VALUES ('2022-8-02', 1, 1);
INSERT INTO assignment VALUES ('2022-8-02', 4, 2);
INSERT INTO assignment VALUES ('2022-8-03', 6, 1);
INSERT INTO assignment VALUES ('2022-8-03', 1, 1);
INSERT INTO assignment VALUES ('2022-8-04', 3, 1);
INSERT INTO assignment VALUES ('2022-8-04', 5, 1);
INSERT INTO assignment VALUES ('2022-8-04', 6, 2);




SELECT * FROM Equipment 
	WHERE next_servicing_date  < 2024-8-20 AND last_servicing_date  > 2021-9-10;


-- Keeping track of customer orders
SELECT ServiceOrder.serviceId, Employee.employeeId, Customer.customerId, Customer.fname, Customer.lname, Customer.email
    FROM ( 
        (ServiceOrder
            INNER JOIN Customer ON ServiceOrder.customerId = Customer.customerId)
            INNER JOIN Employee ON ServiceOrder.employeeId = Employee.employeeId
    	);

SELECT serviceId, customerId
		FROM ServiceOrder
		WHERE date_order_made  BETWEEN  '2022-1-22' AND  '2022-9-22'
ORDER BY customerId;



-- Employees to keep track of customers on subscription system 
SELECT COUNT(customerId)
	FROM customer WHERE customerId in (SELECT Subscribes_To.customer_id from Subscribes_To where Subscribes_To.subscription_id > 1);

                                       
SELECT Customer.fname, Customer.lname, Customer.email
	FROM Customer WHERE Customer.customerId IN (
		SELECT Subscribes_To.customer_id  FROM Subscribes_To
			WHERE Subscribes_To.subscription_id = ( 
                SELECT subscription_id 
                	FROM Subscription WHERE subscription_type  = 'super subscription' )
);                                       
                                       
                                       
                                       

-- Management to accurately record number of orders within a specified period of time
SELECT serviceId, customerId
		FROM ServiceOrder
			WHERE date_order_made 
                BETWEEN  '2022-1-22' AND  '2022-9-22'
                	ORDER BY customerId;

SELECT COUNT(serviceOrderId)
	FROM serviceorder 
    	WHERE date_order_made 
        	BETWEEN '2022-1-22' AND  '2022-9-22';


-- Management to keep track of their most used services 
SELECT service_type FROM service
    WHERE serviceId = (
        SELECT serviceId
        FROM serviceOrder
        GROUP BY serviceId
        ORDER BY COUNT(*) DESC
        LIMIT    1
);


-- To keep records of the revenue generated from each type of service within a given period (example month of November)
SELECT ServiceOrder.serviceId, Service.service_type, SUM(Payment.amount_paid) Revenue
    FROM ( 
        (ServiceOrder
            INNER JOIN Service ON ServiceOrder.serviceId = Service.serviceId)
        	INNER JOIN Payment on ServiceOrder.serviceOrderId = Payment.ServiceOrderId
    	)
        WHERE ServiceOrder.date_order_made BETWEEN  '2022-1-22' AND  '2022-9-22'
        GROUP BY serviceId;
    

    -- To keep track of the number of customers on each type of subscription 

SELECT Subscription.subscription_type, Count(Subscribes_To.subscription_id) Counts
	FROM Subscription
		INNER JOIN Subscribes_To on Subscription.subscriptionId = Subscribes_To.subscription_id
			GROUP BY Subscribes_To.subscription_id;


    -- To keep track of the customer orders and the employees that worked on the orders  
SELECT ServiceOrder.serviceId, Employee.employeeId, Customer.customerId, Customer.fname, Customer.lname, Customer.email
	FROM ( (ServiceOrder
		INNER JOIN Customer ON ServiceOrder.customerId = Customer.customerId)
			INNER JOIN Employee ON ServiceOrder.employeeId = Employee.employeeId);



-- Management to keep track of employees who have worked within a given month and the number of services rendered (Example month of November)

SELECT Employee.employeeId, Employee.fname, Employee.lname, COUNT(*) Total_Orders
    	FROM ServiceOrder
        INNER JOIN Employee on ServiceOrder.employeeId = Employee.employeeId
        WHERE ServiceOrder.date_order_done BETWEEN '2022-11-01' AND '2022-11-31'
        GROUP BY Employee.employeeId;

SELECT * FROM employee 
        LEFT JOIN assignment ON employee.employeeId = assignment.employee_id 
        UNION ALL 
        SELECT * FROM employee 
        RIGHT JOIN assignment ON employee.employeeId = assignment.employee_id 
        WHERE assignment.date_worked IN ('2022-8-02', '2022-8-04');                                       
                                       


-- Management to keep determine the type of service used mostly by customers to be to manage inventory effectively for those services

SELECT Service.service_type, COUNT(ServiceOrder.serviceId)
	FROM ServiceOrder
		INNER JOIN Service On ServiceOrder.serviceId = Service.serviceId
			GROUP BY Service.serviceId;


