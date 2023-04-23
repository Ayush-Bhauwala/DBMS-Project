INSERT INTO UserTable VALUES ('123456789012', 'John Smith', 30, 10, 'Main Street', 'New York', 'NY', '10001', 'johnsmith@gmail.com', 'password123');
INSERT INTO UserTable VALUES ('234567890123', 'Jane Doe', 25, 20, 'Broadway', 'Los Angeles', 'CA', '90001', 'janedoe@yahoo.com', 'password456');
INSERT INTO AdminTable VALUES ('123456789012');
INSERT INTO ManagerTable VALUES ('234567890123');
INSERT INTO TenantTable VALUES ('345678901234');
INSERT INTO OwnerTable VALUES ('456789012345');
INSERT INTO PhoneTable VALUES ('123456789012', '1234567890');
INSERT INTO PhoneTable VALUES ('234567890123', '2345678901');
INSERT INTO PropertyTable VALUES (1, '456789012345', '2023-05-01', '2024-05-01', 1500.00, 2.50, 1000.00, 800.00, 2, 2000, 'Downtown', 'Chicago', 'IL', '60601');
INSERT INTO FacilitiesTable VALUES (1, 'Swimming Pool');
INSERT INTO HistoryTable VALUES (1, '2023-05-01', '2024-05-01', '345678901234', 50, 1500.00);
INSERT INTO CommercialTable VALUES (1);
INSERT INTO ResidentialTable VALUES (1, 2);
INSERT INTO UserTable VALUES ('567890123456', 'Michael Johnson', 40, 30, 'First Street', 'San Francisco', 'CA', '94101', 'michaeljohnson@gmail.com', 'password789');
INSERT INTO UserTable VALUES ('678901234567', 'Sarah Lee', 35, 40, 'Second Avenue', 'Seattle', 'WA', '98101', 'sarahlee@yahoo.com', 'password012');
INSERT INTO AdminTable VALUES ('567890123456');
INSERT INTO ManagerTable VALUES ('678901234567');
INSERT INTO TenantTable VALUES ('789012345678');
INSERT INTO OwnerTable VALUES ('890123456789');
INSERT INTO PhoneTable VALUES ('345678901234', '3456789012');
INSERT INTO PhoneTable VALUES ('456789012345', '4567890123');
INSERT INTO PropertyTable VALUES (2, '890123456789', '2023-06-01', '2024-06-01', 2000.00, 3.00, 1200.00, 1000.00, 3, 2005, 'Midtown', 'Houston', 'TX', '77001');
INSERT INTO FacilitiesTable VALUES (2, 'Gym');
INSERT INTO HistoryTable VALUES (2, '2023-06-01', '2024-06-01', '789012345678', 100, 2000.00);
INSERT INTO CommercialTable VALUES (2);
INSERT INTO ResidentialTable VALUES (2, 3);

INSERT INTO UserTable VALUES ('901234567890', 'David Kim', 45, 50, 'Third Boulevard', 'Boston', 'MA', '02101', 'davidkim@gmail.com', 'password345');
INSERT INTO UserTable VALUES ('012345678901', 'Emily Chen', 50, 60, 'Fourth Road', 'Miami', 'FL', '33101', 'emilychen@yahoo.com', 'password678');
INSERT INTO AdminTable VALUES ('901234567890');
INSERT INTO ManagerTable VALUES ('012345678901');
INSERT INTO TenantTable VALUES ('123456789012');
INSERT INTO OwnerTable VALUES ('234567890123');
INSERT INTO PhoneTable VALUES ('567890123456', '5678901234');
INSERT INTO PhoneTable VALUES ('678901234567', '6789012345');
INSERT INTO PropertyTable VALUES (3, '123456789012', '2023-07-01', '2024-07-01', 2500.00, 3.50, 1500.00, 1200.00, 4, 2010, 'Uptown', 'Denver', 'CO', '80201');
INSERT INTO FacilitiesTable VALUES (3, 'Parking');
INSERT INTO HistoryTable VALUES (3, '2023-07-01', '2024-07-01', '123456789012', 150, 2500.00);
INSERT INTO CommercialTable VALUES (3);
INSERT INTO ResidentialTable VALUES (3, 4);
INSERT INTO UserTable (AadhaarID, Name, Age, Door_no, Street, City, State, Pincode, Login_email, Login_password)
VALUES 
('123456789012', 'John Doe', 25, 10, 'Main Street', 'New York', 'NY', '10001', 'johndoe@example.com', 'password123'),
('234567890123', 'Jane Smith', 32, 20, 'Broadway', 'New York', 'NY', '10002', 'janesmith@example.com', 'password456'),
('345678901234', 'Bob Johnson', 40, 30, 'Madison Avenue', 'Chicago', 'IL', '60601', 'bobjohnson@example.com', 'password789'),
('456789012345', 'Alice Lee', 28, 40, 'Hollywood Boulevard', 'Los Angeles', 'CA', '90001', 'alicelee@example.com', 'passwordabc');
INSERT INTO AdminTable (AadhaarID)
VALUES 
('123456789012'),
('234567890123');
INSERT INTO ManagerTable (AadhaarID)
VALUES 
('345678901234');
INSERT INTO TenantTable (AadhaarID)
VALUES 
('456789012345');
INSERT INTO OwnerTable (AadhaarID)
VALUES 
('123456789012'),
('234567890123'),
('345678901234');
INSERT INTO PhoneTable (AadhaarID, Phone)
VALUES 
('123456789012', '1234567890'),
('123456789012', '0987654321'),
('234567890123', '1112223333'),
('345678901234', '4445556666'),
('456789012345', '7778889999');
INSERT INTO PropertyTable (PropertyID, OwnerID, Date_available_from, Date_available_till, Rent_per_month, Percent_annual_hike, Total_area, Plinth_area, Floor_no, Construction_year, Locality, City, State, Pincode)
VALUES 
(1, '123456789012', '2023-05-01', '2024-04-30', 2000, 5, 1000, 800, 2, 2005, 'Central Park', 'New York', 'NY', '10003'),
(2, '234567890123', '2023-05-01', '2024-04-30', 3000, 7, 1200, 900, 3, 2010, 'Times Square', 'New York', 'NY', '10004'),
(3, '345678901234', '2023-05-01', '2024-04-30', 1500, 3, 800, 600, 1, 1998, 'Magnificent Mile', 'Chicago', 'IL', '60602'),
(4, '345678901234', '2023-05-01', '2024-04-30', 2500, 5, 1500, 1200, 2, 2015, 'Wrigleyville', 'Chicago', 'IL', '60603');