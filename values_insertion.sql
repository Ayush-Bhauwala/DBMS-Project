DELETE FROM ManagerTable;
DELETE FROM AdminTable;
DELETE FROM OwnerTable;
DELETE FROM ResidentialTable;
DELETE FROM CommercialTable;
DELETE FROM FacilitiesTable;
DELETE FROM HistoryTable;
DELETE FROM PropertyTable;
DELETE FROM PhoneTable;
DELETE FROM TenantTable;
DELETE FROM UserTable;

INSERT INTO UserTable VALUES ('111122223333', 'Ayush', 20, 10, 'Main Street', 'New York', 'NY', '100011', 'ayush@gmail.com', 'password123');
INSERT INTO UserTable VALUES ('234567890123', 'Jane Doe', 25, 20, 'Broadway', 'Los Angeles', 'CA', '900011', 'janedoe@yahoo.com', 'password456');
INSERT INTO AdminTable VALUES ('111122223333');
INSERT INTO ManagerTable VALUES ('234567890123');

INSERT INTO UserTable VALUES ('567890123456', 'Michael Johnson', 40, 30, 'First Street', 'San Francisco', 'CA', '941011', 'michaeljohnson@gmail.com', 'password789');
INSERT INTO OwnerTable VALUES('567890123456');

INSERT INTO UserTable VALUES ('345678901234', 'Arnav', 20, 11, 'MG Road', 'New Delhi', 'Delhi', '500123', 'arnav@gmail.com', '__@/password123');
INSERT INTO TenantTable VALUES ('345678901234');

INSERT INTO PhoneTable VALUES ('111122223333', '9234567890');
INSERT INTO PhoneTable VALUES ('234567890123', '9345678901');
INSERT INTO PhoneTable VALUES ('567890123456', '9893458833');
INSERT INTO PhoneTable VALUES ('567890123456', '9800234098');
INSERT INTO PhoneTable VALUES ('345678901234', '9087567893');

INSERT INTO PropertyTable VALUES (1, '567890123456', '01-MAY-2022', '01-MAY-2024', 1500.00, 2.50, 1000.00, 800.00, 2, 2000, 'Downtown', 'Chicago', 'IL', '606011');
INSERT INTO FacilitiesTable VALUES (1, 'Swimming Pool');
INSERT INTO HistoryTable VALUES (1, '01-APR-2023', '01-JUN-2025', '345678901234', 50, 1500.00);
INSERT INTO ResidentialTable VALUES (1, 2);

INSERT INTO UserTable VALUES ('892437889344', 'Madhav', 22, 42, 'Sarjapur', 'Bangalore', 'Karnataka', '560102', 'madhav@gmail.com', 'fhd34ui4rf2-.ds');
INSERT INTO ManagerTable VALUES ('892437889344');
INSERT INTO PhoneTable VALUES ('892437889344', '9230956872');

INSERT INTO UserTable VALUES ('895348394579', 'Siddharth', 30, 10, 'Begumpet', 'Hyderabad', 'Telangana', '500071', 'siddharth@gmail.com', 'fbh3289z/p]4');
INSERT INTO ManagerTable VALUES ('895348394579');
INSERT INTO PhoneTable VALUES ('895348394579', '8967584443');

INSERT INTO UserTable VALUES ('798493489489', 'James King', 44, 180, 'Downing Street', 'San Francisco', 'CA', '941011', 'jamesking@gmail.com', 'paswr12sword789');
INSERT INTO OwnerTable VALUES('798493489489');
INSERT INTO PhoneTable VALUES ('798493489489', '9901098451');

INSERT INTO UserTable VALUES ('130485445943', 'Harry Kane', 28, 100, 'Beverly Street', 'London', 'Manchester', '703482', 'harrykane@gmail.com', 'L_spurs00');
INSERT INTO OwnerTable VALUES('130485445943');
INSERT INTO PhoneTable VALUES ('130485445943', '9909535233');
INSERT INTO PhoneTable VALUES ('130485445943', '9886010188');
INSERT INTO PhoneTable VALUES ('130485445943', '9809012345');

INSERT INTO PropertyTable VALUES (2, '567890123456', '01-JUN-2023', '01-JUN-2023', 2000.00, 3.00, 1200.00, 1000.00, 3, 2005, 'Midtown', 'Houston', 'TX', '770011');
INSERT INTO ResidentialTable VALUES (2, 2);
INSERT INTO FacilitiesTable VALUES (2, 'Gym');

INSERT INTO PropertyTable VALUES (3, '798493489489', '23-APR-2023', '30-DEC-2023', 6000.00, 5.00, 3200.00, 1000.00, 3, 2010, 'Indiranagar', 'Bangalore', 'Karnataka', '560082');
INSERT INTO ResidentialTable VALUES (3, 4);
INSERT INTO FacilitiesTable VALUES (3, 'Jacuzzi');
INSERT INTO FacilitiesTable VALUES (3, 'Backyard');

INSERT INTO PropertyTable VALUES (4, '130485445943', '30-APR-2023', '01-JUN-2024', 1500.00, 10.00, 2200.00, 1200.00, 2, 2002, 'Sanjay Nagar', 'Bangalore', 'Karnataka', '560092');
INSERT INTO FacilitiesTable VALUES (4, '24x7 Security Cameras');
INSERT INTO CommercialTable VALUES (4);

INSERT INTO PropertyTable VALUES (5, '130485445943', '01-JAN-2023', '31-DEC-2024', 1000.00, 3.00, 1600.00, 600.00, 1, 2001, 'Ameerpet', 'Hyderabad', 'Telangana', '500012');
INSERT INTO CommercialTable VALUES (5);

INSERT INTO UserTable VALUES ('012345678901', 'Emily Chen', 50, 60, 'Fourth Road', 'Miami', 'FL', '331011', 'emilychen@yahoo.com', 'password678');
INSERT INTO PhoneTable VALUES ('012345678901', '6789012345');

INSERT INTO UserTable VALUES ('901234567890', 'David Kim', 45, 50, 'Third Boulevard', 'Boston', 'MA', '021011', 'davidkim@gmail.com', 'password345');
INSERT INTO PhoneTable VALUES ('901234567890', '5678901234');
INSERT INTO TenantTable VALUES ('901234567890');
INSERT INTO HistoryTable VALUES (3, '05-MAY-2023', '05-MAY-2024', '901234567890', 50, 6000.00);
-- INSERT INTO HistoryTable VALUES (3, '2023-07-01', '2024-07-01', '123456789012', 150, 2500.00);
-- INSERT INTO UserTable (AadhaarID, Name, Age, Door_no, Street, City, State, Pincode, Login_email, Login_password)
-- VALUES 
-- ('123456789012', 'John Doe', 25, 10, 'Main Street', 'New York', 'NY', '10001', 'johndoe@example.com', 'password123'),
-- ('234567890123', 'Jane Smith', 32, 20, 'Broadway', 'New York', 'NY', '10002', 'janesmith@example.com', 'password456'),
-- ('345678901234', 'Bob Johnson', 40, 30, 'Madison Avenue', 'Chicago', 'IL', '60601', 'bobjohnson@example.com', 'password789'),
-- ('456789012345', 'Alice Lee', 28, 40, 'Hollywood Boulevard', 'Los Angeles', 'CA', '90001', 'alicelee@example.com', 'passwordabc');
-- INSERT INTO AdminTable (AadhaarID)
-- VALUES 
-- ('123456789012'),
-- ('234567890123');
-- INSERT INTO ManagerTable (AadhaarID)
-- VALUES 
-- ('345678901234');
-- INSERT INTO TenantTable (AadhaarID)
-- VALUES 
-- ('456789012345');
-- INSERT INTO OwnerTable (AadhaarID)
-- VALUES 
-- ('123456789012'),
-- ('234567890123'),
-- ('345678901234');
-- INSERT INTO PhoneTable (AadhaarID, Phone)
-- VALUES 
-- ('123456789012', '1234567890'),
-- ('123456789012', '0987654321'),
-- ('234567890123', '1112223333'),
-- ('345678901234', '4445556666'),
-- ('456789012345', '7778889999');
-- INSERT INTO PropertyTable (PropertyID, OwnerID, Date_available_from, Date_available_till, Rent_per_month, Percent_annual_hike, Total_area, Plinth_area, Floor_no, Construction_year, Locality, City, State, Pincode)
-- VALUES 
-- (1, '123456789012', '2023-05-01', '2024-04-30', 2000, 5, 1000, 800, 2, 2005, 'Central Park', 'New York', 'NY', '10003'),
-- (2, '234567890123', '2023-05-01', '2024-04-30', 3000, 7, 1200, 900, 3, 2010, 'Times Square', 'New York', 'NY', '10004'),
-- (3, '345678901234', '2023-05-01', '2024-04-30', 1500, 3, 800, 600, 1, 1998, 'Magnificent Mile', 'Chicago', 'IL', '60602'),
-- (4, '345678901234', '2023-05-01', '2024-04-30', 2500, 5, 1500, 1200, 2, 2015, 'Wrigleyville', 'Chicago', 'IL', '60603');